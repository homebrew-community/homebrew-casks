cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-09-26"
  sha256 arm:   "f1f76b22308c1a857d9210461a56e470c2cae49389e5524437e517180bf2efa8",
         intel: "ac791f3e68dd6044312b72b0f9e2696e278b075f4be71cea3b5c2079fe0c3cdb"

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
