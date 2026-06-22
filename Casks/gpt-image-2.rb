cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.1"
  sha256 arm:   "ca16d5773554120faf55af3d118277d5a3596be69e84178e9b1f64a76bbd2104",
         intel: "f4e9e3914da906f46abc207c15b76324135f6b9efb408818857474252c453133"

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
