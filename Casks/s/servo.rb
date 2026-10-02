cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-10-01"
  sha256 arm:   "e3dc4da712f54c5f6e82f4d80cc603591c4e6d13bb46a5adf97866e8317042fd",
         intel: "4777f4615a4628cc1b1f117cde81e7199f527c8074ed8bb158bba9122c2443ef"

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
