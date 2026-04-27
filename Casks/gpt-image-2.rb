cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.6"
  sha256 arm:   "f815dc8f7a6f7a7dfc2fba66816e33c22eaea33a40deec8b007ca1a4ed5286ea",
         intel: "d5a95b8938f468f080a498fc1336979eb0f077a3a58d887055c24387854e5f1a"

  url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v#{version}/GPT.Image.2_#{version}_#{arch}.dmg"
  name "GPT Image 2"
  desc "Desktop image generation and editing for GPT Image 2"
  homepage "https://github.com/Wangnov/gpt-image-2-skill"

  depends_on macos: ">= :big_sur"

  app "GPT Image 2.app"

  zap trash: [
    "~/Library/Application Support/com.wangnov.gpt-image-2",
    "~/Library/Logs/com.wangnov.gpt-image-2",
    "~/Library/Saved Application State/com.wangnov.gpt-image-2.savedState",
  ]
end
