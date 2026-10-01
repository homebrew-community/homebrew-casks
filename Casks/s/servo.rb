cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-09-30"
  sha256 arm:   "d15c346a6f1c568deb52fd9bc7898b52fd1212c2bea34552aa1b99e1bd3c98d4",
         intel: "4a934c57c1e80a4cd06eb1f736b0ebcad4bfc7d5b84ecfcb6ab2e1f377b2244a"

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
