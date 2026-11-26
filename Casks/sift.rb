cask "sift" do
  version "0.1.15"
  sha256 "142d1ce522b6f3f7adbe7070ad9dfb0b404bff34871216a1837cb1322cdc9cdb"

  url "https://github.com/dominik-bura/sift/releases/download/v#{version}/Sift-#{version}.dmg"
  name "Sift"
  desc "Safely reclaim developer storage from your menu bar"
  homepage "https://github.com/dominik-bura/sift"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Sift.app"

  caveats <<~EOS
    Sift isn't notarized by Apple. After trying to open it, approve it in
    System Settings → Privacy & Security → Open Anyway.
  EOS

  uninstall quit: "com.dominikbura.sift"

  zap trash: [
    "~/Library/Application Support/com.dominikbura.sift",
    "~/Library/Preferences/com.dominikbura.sift.plist",
  ]
end
