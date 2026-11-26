cask "sift" do
  version "0.1.16"
  sha256 "8b294f506613de34160b6a884a89f3c81f324440d9636972a30d58d8618fb8ea"

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
