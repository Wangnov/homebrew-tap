cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.2"
  sha256 arm:   "95cd8463e34a060b98330ccce195225881d3d28b5eb902be12e1092495ca3837",
         intel: "accccdee18b62de1047a9a5248cfb2bb85ad5d7a1733315828a0b3fee60b59f2"

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
