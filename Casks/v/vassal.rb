cask "vassal" do
  version "3.7.28"
  sha256 "c8647c311f05e056027973203767869b3a775add1b859323341809406a40195b"

  url "https://github.com/vassalengine/vassal/releases/download/#{version}/VASSAL-#{version}-macos-universal.dmg"
  name "VASSAL"
  desc "Board game engine"
  homepage "https://www.vassalengine.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "VASSAL.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  uninstall quit: "org.vassalengine.vassal"

  zap trash: "~/Library/Application Support/VASSAL"
end
