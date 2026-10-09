cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-10-08"
  sha256 arm:   "5a978b5ec556de077a11c58c6ec45784316c0f8d72c21fb1255a4d89d5170029",
         intel: "ded49f45ddc7f86e03afbc9af167bbeead5600fa7a09a71b234f7208d83081e6"

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
