cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.3"
  sha256 arm:   "ca8bd21632dd8cf427787afde4b55a6c30502bd5c880cd60029de663ebd4e07e",
         intel: "b45946b688fd7b5f6d61444cc65905f87e6aa68bf9ac351c7b7b6c28f616c9f1"

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
