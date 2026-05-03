cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.8"
  sha256 arm:   "fd645465a9d81367c3f632a49985b4170f4fd89102fba617f33a1f6e9c87ff08",
         intel: "afd1dac4f886b029b82a407c16c74d5054df0adef21099b1955fc2f1f17de96c"

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
