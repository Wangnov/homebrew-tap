cask "codex-app-manager" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.3"
  sha256 arm:   "23b9d298ef160f617765a7456293522f85b574e86869d2285e915f5e29c6a4a7",
         intel: "1d3df2147c612acd75568a74b77f3570725f3e35991a2e202b9f4dd4691a5b85"

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
