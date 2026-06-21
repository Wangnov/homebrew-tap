cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.9"
  sha256 arm:   "5e8391182ac51495cb15f69e1a0ea715b4b28e9a3d782c826e2e6f9c1f16aa3f",
         intel: "2b82125a58cf6dedf36faf520b790be3ef0f425f9548a8f297ca3b571bdafe25"

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
