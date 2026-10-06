cask "codex-app-manager" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.12"
  sha256 arm:   "b805f25430a67c492b0aa01bac48562d1f3f13c3489bad0cb6865aa97fc2be67",
         intel: "9f15210d4d8ec09d3b80bb4b2f94eb2180d0efb5a5c70e68683fcf974b3befe3"

  url "https://github.com/Wangnov/Codex-App-Manager/releases/download/v#{version}/CodexAppManager_#{arch}.dmg"
  name "Codex App Manager"
  desc "Installer, updater, and uninstaller for the official Codex desktop app"
  homepage "https://github.com/Wangnov/Codex-App-Manager"

  auto_updates true
  depends_on macos: :big_sur

  app "Codex App Manager.app"

  zap trash: [
    "~/Library/Application Support/io.github.wangnov.codexappmanager",
    "~/Library/Caches/io.github.wangnov.codexappmanager",
    "~/Library/HTTPStorages/io.github.wangnov.codexappmanager",
    "~/Library/Preferences/io.github.wangnov.codexappmanager.plist",
    "~/Library/Saved Application State/io.github.wangnov.codexappmanager.savedState",
    "~/Library/WebKit/io.github.wangnov.codexappmanager",
  ]
end
