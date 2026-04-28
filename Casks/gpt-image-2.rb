cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.2"
  sha256 arm:   "37226ffb0aa7f1f9c43bb288b8f17f822dc113ec6e362b5f6262bb132c77df6c",
         intel: "df5d7a694c20ca7e06b84bd1d05102cbf2ffa3150606ef19880ee494d0d7a864"

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
