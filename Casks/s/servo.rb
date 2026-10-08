cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-10-07"
  sha256 arm:   "794351888ccc005b0e0e5f0717bc1d0cc7590c9212404f42919392add9f866e7",
         intel: "4782c5638efee8b534e1ab7087f0738f95e5c93379c6547b4e5afc336794bcc3"

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
