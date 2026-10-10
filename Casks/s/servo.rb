cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-10-09"
  sha256 arm:   "d348d6a50ed9f0a02fc5535c47b94708b883f425e49d16892d5d4fd55215cf27",
         intel: "a8daba327fb81edf55accfd910c72a103ef1ba79c977e122809983bacda4dfd1"

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
