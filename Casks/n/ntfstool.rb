cask "ntfstool" do
  version "4.6.10"
  sha256 "b061b5821370be9db910f42b5a773f532b82e482b727977ba8275af002c0d3d6"

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
