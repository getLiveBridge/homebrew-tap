# LiveBridge's Homebrew tap

```sh
brew install --cask getlivebridge/tap/livebridge
```

[LiveBridge](https://github.com/getLiveBridge/LiveBridge) lets you talk to an open Claude Code
session by voice. This tap is not part of Homebrew's own casks: the app is signed ad hoc and not
notarized, so macOS blocks its first launch until you allow it under System Settings > Privacy &
Security > **Open Anyway**. Homebrew may also ask you to trust this tap first.

The app updates itself, so `brew upgrade` leaves it alone. The app also needs its Claude Code mod
and the Codex CLI: see [Install](https://github.com/getLiveBridge/LiveBridge#install).

A workflow moves the cask to each new release, once its disk image passes
[the attestation check](https://github.com/getLiveBridge/LiveBridge#from-the-disk-image).
