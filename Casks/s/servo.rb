cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-09-28"
  sha256 arm:   "5b4f6ecf3c8e2e2765774313d633c4a3cdd9e5037e87b509cc50742f74e08a6d",
         intel: "f70b8e686381f849d0c87d2349236046f1ea9deef6b1e2ca13cf16a4040681f3"

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
