cask "chromedriver@beta" do
  arch arm: "arm64", intel: "x64"

  version "156.0.8078.4"
  sha256 arm:   "979e8b931c87894c5fed0e708f481666a30950531115c261b80bd906fcab7397",
         intel: "c20a872f83c9dba838607a1665abeae1e9e9b6c25419048bb0297e098dc8539a"

  url "https://storage.googleapis.com/chrome-for-testing-public/#{version}/mac-#{arch}/chromedriver-mac-#{arch}.zip"
  name "ChromeDriver"
  desc "Automated testing of webapps for Google Chrome"
  homepage "https://chromedriver.chromium.org/"

  livecheck do
    url "https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions.json"
    strategy :json do |json|
      json.dig("channels", "Beta", "version")
    end
  end

  conflicts_with cask: "chromedriver"
  depends_on :macos

  binary "chromedriver-mac-#{arch}/chromedriver"

  # No zap stanza required

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end
end
