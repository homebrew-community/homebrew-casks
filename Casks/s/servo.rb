cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-10-03"
  sha256 arm:   "731c954527334f4a6502fc616bb367a6d7117016a49ebc0d8791a687dc654255",
         intel: "335704d26aeb39cf554cfe8d70447a6b0430787b932f7a0f2c2fa61345f6acfe"

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
