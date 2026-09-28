cask "archy" do
  version "2.43.1"
  sha256 "fddba6d0341783a2131304836003ea36dffa271de1e71672de349f844117907c"

  url "https://sdk-cdn.mypurecloud.com/archy/#{version}/archy-macos.zip"
  name "Archy"
  desc "YAML processor"
  homepage "https://developer.genesys.cloud/devapps/archy/"

  livecheck do
    url "https://sdk-cdn.mypurecloud.com/archy/versions.json"
    strategy :json do |json|
      json.map { |item| item["version"] }
    end
  end

  depends_on :macos

  binary "archyBin/archy-macos-#{version}", target: "archy"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  zap trash: "~/.archy_config"

  caveats do
    requires_rosetta
  end
end
