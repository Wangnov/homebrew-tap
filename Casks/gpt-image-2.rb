cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.1"
  sha256 arm:   "6ec9855f0ee5741b23e84174d6d5403ceba1d9b5e033e61cd2f4a02bfbe29b08",
         intel: "c64908e3284b3e06e868a11d3fe0cc6341aacd2de3da44c5ce7f998a1aa5cc9c"

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
