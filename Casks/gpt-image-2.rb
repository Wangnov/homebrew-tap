cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.8"
  sha256 arm:   "df73d5c7a880e62b617a2b9476dd1b6f54b5b96e91e573dc65a7438b86a4ef79",
         intel: "637cfb7a35666fc654a71e69fa52dd6611a1f7ac208b5191e3b71bdc3a6b519b"

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
