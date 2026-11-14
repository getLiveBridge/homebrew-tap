cask "livebridge" do
  version "0.6.0"
  sha256 "a912d7419ada9ba84690453aa5b17b76fa05dd4c34e27653d96d27b002617b9c"

  url "https://github.com/getLiveBridge/LiveBridge/releases/download/v#{version}/LiveBridge.dmg"
  name "LiveBridge"
  desc "Talk to an open Claude Code session by voice"
  homepage "https://getlivebridge.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "LiveBridge.app"

  uninstall quit:       "com.getlivebridge.livebridge",
            login_item: "LiveBridge"

  zap trash: [
    "~/Library/Application Support/LiveBridge",
    "~/Library/Caches/com.getlivebridge.livebridge",
    "~/Library/HTTPStorages/com.getlivebridge.livebridge",
    "~/Library/HTTPStorages/com.getlivebridge.livebridge.binarycookies",
    "~/Library/Preferences/com.getlivebridge.livebridge.plist",
    "~/Library/WebKit/com.getlivebridge.livebridge",
  ]

  caveats <<~EOS
    LiveBridge needs its Claude Code mod and the Codex CLI:
      https://github.com/getLiveBridge/LiveBridge#install
  EOS
end
