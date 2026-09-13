cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.4"
  sha256 arm:   "ac4151bcb20e34dd629f6157c2abbf973f7fddfb878759991516087222833f6b",
         intel: "faa7359ed69d597f595a1dea00575a0bceb3b45bebf18aed290d6f28bbeaeb80"

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
