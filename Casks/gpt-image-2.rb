cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.8.0"
  sha256 arm:   "e364de6cc01943f64ed0639cbcbd486c501118ce9612d67f650801008706d58e",
         intel: "5d3b6b1ad26584d64c695e3f68400c3bfd3198903d64a4de3350d1d2d5427f50"

  url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v#{version}/GPT.Image.2_#{version}_#{arch}.dmg"
  name "GPT Image 2"
  desc "Desktop image generation and editing for GPT Image 2"
  homepage "https://github.com/Wangnov/gpt-image-2-skill"

  auto_updates true
  depends_on macos: ">= 13.3"

  app "GPT Image 2.app"

  zap trash: [
    "~/Library/Application Support/com.wangnov.gpt-image-2",
    "~/Library/Logs/com.wangnov.gpt-image-2",
    "~/Library/Saved Application State/com.wangnov.gpt-image-2.savedState",
  ]
end
