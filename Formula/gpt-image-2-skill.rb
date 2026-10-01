class GptImage2Skill < Formula
  desc "Agent-first GPT Image 2 CLI and installable skill runtime."
  homepage "https://github.com/Wangnov/gpt-image-2-skill"
  version "0.7.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.7.6/gpt-image-2-skill-aarch64-apple-darwin.tar.xz"
      sha256 "a384adbe7693cf4dcd6968c6260296182ce5af797b2e149ae27412ee7f56bc3a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.7.6/gpt-image-2-skill-x86_64-apple-darwin.tar.xz"
      sha256 "d278da9fe7ea88903990d1f57c6c6cbf7b31d6249896888ef0fde6bb845e7ce5"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.7.6/gpt-image-2-skill-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c5bc0b493a257471d3740787caf60032dea69c950a3e38d293aef20e6e440b78"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.7.6/gpt-image-2-skill-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "66662d5c3831b659c8612a3a769cb94a542b49f769d1109ad3cf0c1ffe0ef016"
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
