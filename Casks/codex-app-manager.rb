cask "codex-app-manager" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.4"
  sha256 arm:   "7b94cd709b5a0fca7a1fc177dd5d1b28e1b3abce7d9e1cc4f218cdea84d243b7",
         intel: "a93841f3e7f88263f8ad92d91a674d036fdcde08de5d51ddf944a3d6fd5a9104"

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
