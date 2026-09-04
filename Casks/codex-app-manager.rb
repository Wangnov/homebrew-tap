cask "codex-app-manager" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.6"
  sha256 arm:   "fdadf8bf33ac56723f8735fb941200227ce79eec351be461a00c700467bd1caa",
         intel: "e08ce04e5c7006398549db0b4ed875018eb015ce85586bb2bc934addca1dcada"

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
