cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.6"
  sha256 arm:   "12182c6de878c753e72901d5faa052c0b81dbdfbc4f9be63a080422408be08bb",
         intel: "a2b12b19e86e16fb5acb5fe4d91e7079b38c3a32c86ce625e858daf03a23632e"

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
