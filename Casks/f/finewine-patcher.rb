cask "finewine-patcher" do
  version "1.1.1"
  sha256 "c3f510868c308711f636057dc92efa1f19d6a0c440faf602e2bdbd1706672519"

  url "https://github.com/stoicswe/Endfield_FineWine/releases/download/#{version}/FineWine.Patcher.app.zip"
  name "FineWine Patcher"
  desc "Patch CrossOver to run Arknights: Endfield"
  homepage "https://github.com/stoicswe/Endfield_FineWine"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "FineWine Patcher.app"

  zap trash: [
    "~/Library/Caches/io.github.stoicswe.FineWinePatcher",
    "~/Library/Preferences/io.github.stoicswe.FineWinePatcher.plist",
    "~/Library/Saved Application State/io.github.stoicswe.FineWinePatcher.savedState",
  ]

  caveats <<~EOS
    Running Arknights: Endfield requires a licensed installation of CrossOver.
    This patcher currently targets CrossOver 26.3.0; other versions may not work.
    Rosetta 2 is required to run the bundled Wine modules.
  EOS
end
