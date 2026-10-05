cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-10-04"
  sha256 arm:   "4e057e336760e1855272dd22dfc39399fdf2b2495451a5efe236d23236033c11",
         intel: "40ce946b25c9d62fac0ada5891b4e85cb790603f202b0f2a61b36730473a8bcf"

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
