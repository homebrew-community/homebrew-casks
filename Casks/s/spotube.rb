cask "spotube" do
  version "5.1.2"
  sha256 "27627dfd44190040af1a6ba6a86cdc4450399296a43a616940a94ae687ac0913"

  url "https://github.com/team-spotube/spotube/releases/download/v#{version}/Spotube-macos-universal.dmg"
  name "Spotube"
  desc "Cross-platform extensible open-source music streaming platform"
  homepage "https://spotube.cc/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Spotube.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  zap trash: [
    "~/Library/Application Scripts/oss.krtirtho.spotube",
    "~/Library/Application Support/oss.krtirtho.spotube",
  ]
end
