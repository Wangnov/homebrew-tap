class GptImage2Skill < Formula
  desc "Agent-first GPT Image 2 CLI and installable skill runtime."
  homepage "https://github.com/Wangnov/gpt-image-2-skill"
  version "0.8.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.8.0/gpt-image-2-skill-aarch64-apple-darwin.tar.xz"
      sha256 "cdfaf7c64d35c91cdaf63d92e9ab01926d85bd5a208359f0f781aa0c8b86b216"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.8.0/gpt-image-2-skill-x86_64-apple-darwin.tar.xz"
      sha256 "3cc9fd69c7158cb216e49ca41fc21e630e04c7f85ae85d5f9e46a1bd0de11c56"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.8.0/gpt-image-2-skill-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b9f140be93c526b081c8cbd5d7694c1da14247925979011df33920c6264f7221"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.8.0/gpt-image-2-skill-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8e72ae202b1d22b78804be26172fb9b012858c511ed9278f16783a14ee482e8a"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":               {},
    "aarch64-pc-windows-gnu":             {},
    "aarch64-unknown-linux-gnu":          {},
    "aarch64-unknown-linux-musl-dynamic": {},
    "aarch64-unknown-linux-musl-static":  {},
    "x86_64-apple-darwin":                {},
    "x86_64-pc-windows-gnu":              {},
    "x86_64-unknown-linux-gnu":           {},
    "x86_64-unknown-linux-musl-dynamic":  {},
    "x86_64-unknown-linux-musl-static":   {},
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
    if OS.mac? && Hardware::CPU.arm?
      bin.install "gpt-image-2-skill"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "gpt-image-2-skill"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "gpt-image-2-skill"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "gpt-image-2-skill"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
