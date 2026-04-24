cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.5"
  sha256 arm:   "5c01955174ee90a8d3419ce1fe1193b3973f058f77bcc1230bc48baa1a9b66ea",
         intel: "1dc7d44863a8cf11a1e1f483cc8120cdd977b9b892f1ae07177044a8a80a98e8"

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
