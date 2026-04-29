cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.4"
  sha256 arm:   "1e651c7646b86e258c4ec40d23735b899a1028580db2bf42e9312ec9d3ec6719",
         intel: "d1eb5d2153f8b47cee4d8d22f3dfc6d19477e544be4ff7cb58319406f0187bdf"

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
