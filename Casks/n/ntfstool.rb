cask "ntfstool" do
  version "4.6.10"
  sha256 "e29401e17d937c45b5d0778052b8b10f5ba341e4854922a81ea2fac5d984bad9"

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
