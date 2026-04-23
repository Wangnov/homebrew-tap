class GptImage2Skill < Formula
  desc "Agent-first GPT Image 2 CLI and installable skill runtime."
  homepage "https://github.com/Wangnov/gpt-image-2-skill"
  version "0.2.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.2.4/gpt-image-2-skill-aarch64-apple-darwin.tar.xz"
      sha256 "9bff894891e581ccb7b19b017d5a118a8a5012298b650887ce3861d04bfded2b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.2.4/gpt-image-2-skill-x86_64-apple-darwin.tar.xz"
      sha256 "9a61a9a27f551d5c04c398b8bb1256240d6105b5eb29bbab9beba5bf3e999f0d"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.2.4/gpt-image-2-skill-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "81f556026912d446f0f58145ae1d0ca9e4ffb81f51bc7d486d9831d9fa889e61"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.2.4/gpt-image-2-skill-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9ac1d3ba70d6032a2e4e07331254799abe1551ef77b67821609310496398cb15"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "aarch64-pc-windows-gnu":            {},
    "aarch64-unknown-linux-gnu":         {},
    "x86_64-apple-darwin":               {},
    "x86_64-pc-windows-gnu":             {},
    "x86_64-unknown-linux-gnu":          {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static":  {},
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
