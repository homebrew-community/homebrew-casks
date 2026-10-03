cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-10-02"
  sha256 arm:   "ce1f4e3db499eff41f945e01028d2ea9f8febfd108d1dfe2404147ef1fb4f84d",
         intel: "72a0414158e2b27a00f2479be92fe56b3cdc48aa201bb47093fc788f7e78c6b0"

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
