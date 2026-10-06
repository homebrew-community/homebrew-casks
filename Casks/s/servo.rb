cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-10-05"
  sha256 arm:   "7dd6544c682a2fcba28bc314c385465d5ee51ec7dbcfe16b1372002dd358f921",
         intel: "3b669ad77addcf279ca318989d375a76486c27e7aebd5fde8c77a50f3615722f"

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
