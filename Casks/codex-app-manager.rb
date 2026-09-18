cask "codex-app-manager" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.8"
  sha256 arm:   "d54531ad3f6b0cec132a8c895fc1d5662fc43ad1ec5dde0d4fa5d8b4f2d956a8",
         intel: "a1bc5ba2f737b3d312c1588ee62ddda6e027364c6820e3899e8c5af451d9a074"

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
