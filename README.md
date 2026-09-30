# Homebrew Cask — Community Tap

This repository is a **community-driven tap** built on top of [Homebrew Cask](https://github.com/Homebrew/homebrew-cask). It has one clear mission: to keep software installable when the official tap can't.

> Maintaining this tap takes ongoing effort. A ⭐️ helps motivate us and makes the tap more discoverable to others
> -- Thank You! ☺️

## Why This Tap Exists

There are two kinds of casks that end up here:

### **1. Casks disabled by the official tap.**

When Gatekeeper checks cause a cask to be removed from `homebrew/cask`, it would normally be lost — no more installs, no more version bumps. This tap catches those casks and keeps them alive. They are still monitored for new releases, so you stay up to date even after the official tap moves on.

### **2. Unsigned apps from the community.**

Independent developers and community members often ship great software that isn't signed or notarized. The official tap won't take it. This tap will. It's an open space for those apps to be published, installed, and maintained through Homebrew.

In short: if it works, and you want to install it with `brew`, this tap is for you.

# Why Use This Tap

### **1. It manages all future upgrades of the casks.**

Many taps such as `thedavidweng/unsigned-tap` and `SoftwareRat/homebrew-unsigned-tap` have issues with cask auto-bumping. The casks they hold haven't been upgraded for a long time. This tap, however, actively maintains all future upgrades of the casks, so you can feel safe to use it.

### **2. It actively solves PRs and Issues every day.**

Please look at the closed issue count and closed PR count of this repo — we solve all the bugs and conflicts, and we approve version upgrade PRs every day. We also carefully review each upgrade and test it ourselves, so you can safely install and upgrade without errors.

## Getting Started

First, add the tap:

```console
% brew tap homebrew-community/cask
```

Then install any cask from it:

```console
% brew install --cask homebrew-community/cask/appium-inspector
==> Fetching downloads for: appium-inspector
✔︎ Cask appium-inspector (1.0.0)                                           Verified      5.6MB/  5.6MB
==> Installing Cask appium-inspector
==> Moving App 'Appium Inspector.app' to '/Applications/Appium Inspector.app'
🍺  appium-inspector was successfully installed!
```

One tap, one command, no dialogs. No dragging icons into folders.

## Something Broke?

Start here: run `brew update-reset && brew update`, then try again. This resets all your taps to a clean state and fixes most problems caused by stale local data.

If that doesn't help:

- **Search first.** Your issue may already exist [here](https://github.com/homebrew-community/homebrew-cask/search?type=Issues). Add a comment if you have new details. If it's closed, check whether the solution applies to you.
- **Still stuck?** Walk through the [common error examples](doc/reporting_bugs/error_examples.md) — they cover `curl` failures, permission errors, checksum mismatches, missing sources, and bad arguments.
- **Other known cases:**
  - [Why an app might be missing from `brew upgrade`](https://docs.brew.sh/FAQ#why-arent-some-apps-included-during-brew-upgrade)
  - [Why macOS blocks an app from an unidentified developer](https://docs.brew.sh/FAQ#why-cant-i-open-a-mac-app-from-an-unidentified-developer)
- **None of the above?** [Open a bug report](https://github.com/homebrew-community/homebrew-cask/issues/new?template=01_bug_report.yml) — but please read [this note](doc/faq/closing_issues_without_review.md) first, or your issue may be closed without review.

## Want to Add Something?

New casks are added through **pull requests**, not issues. Requests opened as issues will be closed. See [CONTRIBUTING.md](CONTRIBUTING.md) for the full process and the [cask submission guide](https://github.com/homebrew-community/homebrew-cask/blob/HEAD/CONTRIBUTING.md#adding-a-cask).

For feature requests, use [this template](https://github.com/Homebrew/brew/issues/new?assignees=&labels=features&projects=&template=feature.yml).

## Talk to Us

- [Open an issue](https://github.com/homebrew-community/homebrew-cask/issues/new/choose)

## Going Deeper

- [USAGE.md](USAGE.md) — day-to-day usage of Homebrew Cask
- [Homebrew Cask documentation](https://docs.brew.sh/Adding-Software-to-Homebrew#casks) — background and project details

## License

Released under the [BSD 2 Clause (NetBSD) license](LICENSE).
