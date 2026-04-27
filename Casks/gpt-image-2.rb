cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.6"
  sha256 arm:   "fade4ad5f24d94f2c4a79c0990d92fc33654d436b329fbc1356c11884fb09874",
         intel: "7e9e85aad7f6fcd4d664e5d87c867f8707e8c43b1315ed403d5812aa48ad706c"

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
