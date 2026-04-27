cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "55c09c2aad9c68f88bfb0c3432d3c0a6a1623358e68f90935d511724812a7b6f",
         intel: "29295be5151c88d83efb897b58ffd1c0f5aafa6568eb058102435ef4eb199a63"

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
