cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.0"
  sha256 arm:   "d26845bf7a1096755bf54336c5ad909c67e440f3898f1a19e99e7bf770bb2901",
         intel: "1b4ddb9256592e18230f77fdeaeba525e3c07178e0c5a3517b07876c7fe8afc3"

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
