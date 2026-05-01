cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.7"
  sha256 arm:   "c80c47a46d6a4a70a6ddba8b1dc25a9127fd257c2b2dbb06e245a101ff6bd10e",
         intel: "ad9cde4797b037f04d3bb863591b40ba0faf77f629a52e306743ed293003e8cf"

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
