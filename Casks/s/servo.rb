cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-09-27"
  sha256 arm:   "c50dfa2639f5f5ad026732c2395fa825c200ec5aa5171237ee59732de28458cb",
         intel: "5bd081cb52e37fd77d6ff0373755aea82433c0240a8148041913ce495ba347a8"

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
