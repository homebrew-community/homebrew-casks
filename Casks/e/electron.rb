cask "electron" do
  arch arm: "arm64", intel: "x64"

  version "44.5.0"
  sha256 arm:   "2a1d54d0c4c5fd0b16c9627e8d6cd5730ae564f0f3a0bdda7c7f97391069e552",
         intel: "a7c09e80e349ac9efc452c1cf6ae481eae22c3cc0421795a7f520c6086ffc0fb"

  url "https://github.com/electron/electron/releases/download/v#{version}/electron-v#{version}-darwin-#{arch}.zip"
  name "Electron"
  desc "Build desktop apps with JavaScript, HTML, and CSS"
  homepage "https://electronjs.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Electron.app"
  binary "#{appdir}/Electron.app/Contents/MacOS/Electron", target: "electron"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.github.electron.sfl*",
    "~/Library/Application Support/Electron",
    "~/Library/Caches/Electron",
    "~/Library/Preferences/com.github.electron.helper.plist",
    "~/Library/Preferences/com.github.electron.plist",
    "~/Library/Saved Application State/com.github.Electron.savedState",
  ]
end
