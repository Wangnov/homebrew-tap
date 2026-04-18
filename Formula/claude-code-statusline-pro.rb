class ClaudeCodeStatuslinePro < Formula
  desc "Enhanced statusline for Claude Code with 10x performance"
  homepage "https://github.com/Wangnov/claude-code-statusline-pro"
  version "4.0.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.0.0/claude-code-statusline-pro-aarch64-apple-darwin.tar.xz"
      sha256 "561599ecb2aa3ac07ee2d4373ef1a9a1b2a57dee470b2f439973f4b926968e4b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.0.0/claude-code-statusline-pro-x86_64-apple-darwin.tar.xz"
      sha256 "8527cbad602a61b503374db772c0d8c7b796254879da616a538bed0c5ae56f14"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.0.0/claude-code-statusline-pro-aarch64-unknown-linux-musl.tar.xz"
      sha256 "fc3c073a1f15a3c3ae0fdc883db019e53660bfdccf1c55e885d5a0d3a6e4feb1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.0.0/claude-code-statusline-pro-x86_64-unknown-linux-musl.tar.xz"
      sha256 "937a441ec8f4549dbbcaac85696cc854629f9555bbec070e7c86f3ba095a788b"
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
    bin.install "claude-code-statusline-pro" if OS.mac? && Hardware::CPU.arm?
    bin.install "claude-code-statusline-pro" if OS.mac? && Hardware::CPU.intel?
    bin.install "claude-code-statusline-pro" if OS.linux? && Hardware::CPU.arm?
    bin.install "claude-code-statusline-pro" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
