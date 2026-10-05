cask "tic80" do
  # NOTE: "80" is not a version number, but an intrinsic part of the product name
  on_sonoma :or_older do
    version "1.1.2837"
    sha256 "324e91d08fb5dcfaf2f41dc846b89465074b5db3b5aa63befc3fdb664493c1b9"

    livecheck do
      skip "Legacy version"
    end

    app "tic80.app"
  end
  on_sequoia :or_newer do
    version "1.3.1"
    sha256 "58902d9b51eb068081a5e0bbf45d49e1c8de0263135b5cba96fbc3e1039c55e2"

    app "TIC-80.app"
  end

  url "https://github.com/nesbox/TIC-80/releases/download/v#{version}/tic80-v#{version.major_minor}-mac.dmg"
  name "TIC-80"
  desc "Fantasy computer for making, playing and sharing tiny games"
  homepage "https://tic80.com/"

  depends_on :macos

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  uninstall quit: "com.nesbox.tic"

  zap trash: [
    "~/Library/Application Support/com.nesbox.tic",
    "~/Library/Saved Application State/com.nesbox.tic.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
