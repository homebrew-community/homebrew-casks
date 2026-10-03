cask "lumen" do
  version "1.3.1"
  sha256 "32f7a616f25e568738547a6763ea14cb0b8d1cfa0936584fd1ec0e947cec9d2d"

  url "https://github.com/anishathalye/lumen/releases/download/v#{version}/Lumen.zip"
  name "Lumen"
  desc "Magic auto brightness based on screen contents"
  homepage "https://github.com/anishathalye/lumen"

  depends_on macos: :sonoma

  app "Lumen.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  zap trash: [
    "~/Library/Caches/com.anishathalye.Lumen",
    "~/Library/Preferences/com.anishathalye.Lumen.plist",
  ]
end
