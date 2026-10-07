cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-10-06"
  sha256 arm:   "04477e32c69a9bbdddf3e6d7c91482cb15415c893378d23ffb19893c7e7fe346",
         intel: "a43bcda4d4dce5b27ff7863980fdf4bcc744f6eefcf95c8b35f57fab6af40cce"

  url "https://github.com/servo/servo-nightly-builds/releases/download/#{version}/servo-#{arch}-apple-darwin.dmg"
  name "Servo"
  desc "Parallel browser engine"
  homepage "https://servo.org/"

  livecheck do
    url :url
    regex(/^v?(\d+(?:[.-]\d+)+)$/i)
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Servo.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  zap trash: "~/Library/Application Support/Servo"
end
