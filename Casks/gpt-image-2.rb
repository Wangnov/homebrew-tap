cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.3"
  sha256 arm:   "e558fb956a0b8be4246b15adbc6e6d11d299a896606f7399542d8d36bacf3966",
         intel: "cbdfe2d61344101169f89f9314c60869c3ed79c4b39c141c4547aa7bd923a259"

  url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v#{version}/GPT.Image.2_#{version}_#{arch}.dmg"
  name "GPT Image 2"
  desc "Desktop image generation and editing for GPT Image 2"
  homepage "https://github.com/Wangnov/gpt-image-2-skill"

  auto_updates true
  depends_on macos: :big_sur

  app "GPT Image 2.app"

  zap trash: [
    "~/Library/Application Support/com.wangnov.gpt-image-2",
    "~/Library/Logs/com.wangnov.gpt-image-2",
    "~/Library/Saved Application State/com.wangnov.gpt-image-2.savedState",
  ]
end
