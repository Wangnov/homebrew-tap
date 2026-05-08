cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.2"
  sha256 arm:   "c4c7f3085e948abf5d8c68f4f7a37df2e25846a35068b2ec7e2fb4fb599fe389",
         intel: "d541d4409079c01a460c27371c9c17d682e68365aeaa32a345cc5d5c6085d7a2"

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
