cask "codex-app-manager" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.2"
  sha256 arm:   "cd0d4b8bfb7bbd84af949826741fb14bd30dc98df354878d866fa684773f4b53",
         intel: "3b584223f0cae8dd9d8525736e23aa9ac40937fe0faf7f2ba5b710b238c093c8"

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
