cask "codex-app-manager" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.17"
  sha256 arm:   "cd5b50498c2b76589e250be834a16ded50b67455e8ecf12e6792ff93a015a782",
         intel: "f2e25e3abf08f0d32bda460d1014e57d00f509a7f19489ebe7dd5fb28bf05633"

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
