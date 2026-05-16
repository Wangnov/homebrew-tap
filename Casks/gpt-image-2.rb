cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.1"
  sha256 arm:   "d39aa8b5bfc25865ef48b859b1836b3381ca07bccb6a22f1b9134b10f3094270",
         intel: "88d7e9c5a3b07561440ef52f1cff674ff2bdd431994c185e2ea42c883cace652"

  url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v#{version}/GPT.Image.2_#{version}_#{arch}.dmg"
  name "GPT Image 2"
  desc "Desktop image generation and editing for GPT Image 2"
  homepage "https://github.com/Wangnov/gpt-image-2-skill"

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "GPT Image 2.app"

  zap trash: [
    "~/Library/Application Support/com.wangnov.gpt-image-2",
    "~/Library/Logs/com.wangnov.gpt-image-2",
    "~/Library/Saved Application State/com.wangnov.gpt-image-2.savedState",
  ]
end
