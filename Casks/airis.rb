cask "airis" do
  version "1.0.2"
  sha256 "280f07ef790893e59c586b68e6b7273f4aa6c0c0330122eb9dca0c04cdcadf20"

  url "https://github.com/Wangnov/Airis/releases/download/v#{version}/Airis-#{version}.zip"
  name "Airis"
  desc "AI-powered image processing CLI tool"
  homepage "https://github.com/Wangnov/Airis"

  depends_on macos: ">= :sonoma"

  app "Airis-Dist.app", target: "Airis.app"
  binary "#{appdir}/Airis.app/Contents/MacOS/Airis", target: "airis"

  zap trash: [
    "~/Library/Application Support/airis",
    "~/.config/airis",
  ]

  caveats <<~EOS
    Airis has been installed as a CLI tool.

    Usage:
      airis --help
      airis analyze info image.jpg
      airis edit resize image.jpg -w 800
      airis gen draw "a cat" -o cat.png

    Note: The 'analyze safe' command is not available in this distribution
    due to Apple's provisioning restrictions.
  EOS
end
