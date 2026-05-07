cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "45d4b3c6a043751e3080715764ea3e286ff6d0e9cd3d54f51945e6131e3ff85c",
         intel: "58537d45eee500775a9a3dba61f97749211967f70357266a57e16a43247c0bdc"

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
