cask "gpt-image-2" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.6"
  sha256 arm:   "68065c7ff47e644dd81f895877486f1ab4516f4647ce39cd5b69f9794ea1dacf",
         intel: "cadf8f80ea88874a1d577635f1dc0cb9b9eeae2bc57fe4720501e05aba1ca16d"

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
