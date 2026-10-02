cask "uvtools" do
  arch arm: "arm64", intel: "x64"

  version "7.0.1"
  sha256 arm:   "d36c820062b85846b50afdac64db00c2e9693000b42e3f80f7ae532ca2adcee1",
         intel: "7309869c5c4a1f0ddaa055561fd0ef23f9cbf90121830aa75cba1a781b044de1"

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
