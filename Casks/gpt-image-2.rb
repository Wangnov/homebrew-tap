cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.6"
  sha256 arm:   "22c9f378c342a1c9373f0c1ddd3fabe105965c0133587187ce388357f53a1d16",
         intel: "4dde245942afbcf299968c388a9003bc2f08f6aeee7de66a47c5856a76428f8d"

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
