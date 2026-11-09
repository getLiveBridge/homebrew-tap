cask "livebridge" do
  version "0.5.0"
  sha256 "fed6d04cb122add257b785b695bddfacf7c868046818a07e82a078d1a392d4a8"

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
    LiveBridge is signed ad hoc and not notarized. On first launch, allow it under
    System Settings > Privacy & Security > Open Anyway.

    It also needs its Claude Code mod and the Codex CLI:
      https://github.com/getLiveBridge/LiveBridge#install
  EOS
end
