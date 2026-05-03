class GptImage2Skill < Formula
  desc "Agent-first GPT Image 2 CLI and installable skill runtime."
  homepage "https://github.com/Wangnov/gpt-image-2-skill"
  version "0.3.8"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.3.8/gpt-image-2-skill-aarch64-apple-darwin.tar.xz"
      sha256 "f32a4390556b69eddb71a8ef27406f0038ed2ac44dfda597214d1ac9ffcf6860"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.3.8/gpt-image-2-skill-x86_64-apple-darwin.tar.xz"
      sha256 "41d0ec625ee1fa33989a980ed54699e9b0bc470927ccb2cbafeb67b234bcc95a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.3.8/gpt-image-2-skill-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "775f7b66d7d95dcb56a72eb4008ec2e226d0651d1df45a8bfff85d565930439a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.3.8/gpt-image-2-skill-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ab4c6897abb6a15519f595f100e78e04e6c5388be8c7bfcb5ce0435a1f51f6ab"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-pc-windows-gnu":    {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "gpt-image-2-skill" if OS.mac? && Hardware::CPU.arm?
    bin.install "gpt-image-2-skill" if OS.mac? && Hardware::CPU.intel?
    bin.install "gpt-image-2-skill" if OS.linux? && Hardware::CPU.arm?
    bin.install "gpt-image-2-skill" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
