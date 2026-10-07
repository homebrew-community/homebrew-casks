cask "uvtools" do
  arch arm: "arm64", intel: "x64"

  version "7.0.2"
  sha256 arm:   "f014280c8c3b87b969a41485d46e1543356d9da18a9fdeeba22fce4ede6c38e1",
         intel: "84a68a6489439ccc2e42efd7dc23a9b5000be1afb3a9bf99b7ce88331ba3b3bf"

  url "https://github.com/sn4k3/UVtools/releases/download/v#{version}/UVtools_osx-#{arch}_v#{version}.zip"
  name "UVtools"
  desc "MSLA/DLP, file analysis, calibration, repair, conversion and manipulation"
  homepage "https://github.com/sn4k3/UVtools"

  auto_updates true
  depends_on macos: :ventura

  app "UVtools.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  zap trash: [
    "~/Library/Preferences/com.UVtools.plist",
    "~/Library/Saved Application State/com.UVtools.savedState",
  ]
end
