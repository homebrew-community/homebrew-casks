cask "assinador-serpro" do
  arch arm: "arm64", intel: "x86_64"

  on_arm do
    version "4.5.7"
    sha256 "a7db35a43a448b2bb9cfca1c0cba540a5d6ae9e5ec0015d97f3411b283e89f89"
  end
  on_intel do
    version "4.4.0"
    sha256 "29dface119b5974b2f47ca365371d78d0c1988f4dedf489bb711cd0faaf7e1f9"
  end

  url "https://artefatos-assinador.serpro.gov.br/downloads/#{version}/Assinador-Serpro-#{version}-macOS-#{arch}.pkg"
  name "Assinador Serpro"
  desc "Validate and sign documents using digital certificates"
  homepage "https://artefatos-assinador.serpro.gov.br/downloads"

  livecheck do
    url :homepage
    regex(/href=.*Assinador[._-]?Serpro[._-]v?(\d+(?:\.\d+)+)-macOS-#{arch}\.m?pkg/i)
  end

  depends_on :macos

  pkg "Assinador-Serpro-#{version}-macOS-#{arch}.pkg"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  uninstall pkgutil: "br.gov.serpro.desktop.assinador"

  zap trash: "~/Library/Preferences/org.demoiselle.signer.serpro.desktop.Main.plist"
end
