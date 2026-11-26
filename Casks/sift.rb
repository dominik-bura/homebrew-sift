cask "sift" do
  version "0.1.19"
  sha256 "7f3d45227aaa3af7b74f80f94ed3dddd0ff32155f5bd843f87b34c9d4c0ef1d3"

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
