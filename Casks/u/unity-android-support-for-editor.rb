cask "unity-android-support-for-editor" do
  version "6000.6.4f1,12bfff696524"
  sha256 "d8cda9b216ab3bbca53d9d2503ee0169798922723c4193ab5194efacc1a5fbb2"

  url "https://download.unity3d.com/download_unity/#{version.csv.second}/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-#{version.csv.first}.pkg"
  name "Unity Android Build Support"
  desc "Android target support for Unity"
  homepage "https://unity.com/products"

  livecheck do
    cask "unity"
  end

  depends_on cask: "unity"
  depends_on :macos

  pkg "UnitySetup-Android-Support-for-Editor-#{version.csv.first}.pkg"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  uninstall pkgutil: "com.unity3d.AndroidPlayer-#{version.csv.first}"
end
