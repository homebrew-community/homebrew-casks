cask "ntfstool" do
  version "4.6.11"
  sha256 "0ff72d720506d7809fbf5931531aab1a3116154348b24963e62f57b4a1db5cd3"

  url "https://github.com/ntfstool/ntfstool/releases/download/#{version}/Ntfstool_#{version}_release.pkg"
  name "NTFSTool"
  desc "Utility that provides NTFS read and write support"
  homepage "https://github.com/ntfstool/ntfstool"

  auto_updates true
  depends_on :macos

  pkg "Ntfstool_#{version}_release.pkg"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  uninstall quit:    "com.ntfstool.aile",
            pkgutil: "com.ntfstool.Ntfstool.pkg"

  zap trash: "~/.ntfstool"
end
