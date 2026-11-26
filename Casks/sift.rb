cask "sift" do
  version "0.1.18"
  sha256 "6198ec8d9a1499a07958095e8b9acaad2e0e8cdb19ae698dee2ff77818fd07e1"

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
