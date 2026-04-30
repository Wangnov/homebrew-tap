class GptImage2Skill < Formula
  desc "Agent-first GPT Image 2 CLI and installable skill runtime."
  homepage "https://github.com/Wangnov/gpt-image-2-skill"
  version "0.3.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.3.6/gpt-image-2-skill-aarch64-apple-darwin.tar.xz"
      sha256 "dba511658a041eaa4706d9c2bc12bde10d15dc6c4a081dee7a67ac009a4f20a7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.3.6/gpt-image-2-skill-x86_64-apple-darwin.tar.xz"
      sha256 "073e2ace574253e630e5bf236537f8956ac11e47b06b73f4db491147062c73aa"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.3.6/gpt-image-2-skill-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "7375f5a259ef32b490ac41a3c296615c9f2d94a75c26abe71a708810a4f1c47d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.3.6/gpt-image-2-skill-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "404838e25ada806f71d8cf07672a1e666e52d7c39001a633b6d57a1746fc8464"
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
