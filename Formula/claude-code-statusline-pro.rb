class ClaudeCodeStatuslinePro < Formula
  desc "Enhanced statusline for Claude Code with 10x performance"
  homepage "https://github.com/Wangnov/claude-code-statusline-pro"
  version "4.0.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.0.2/claude-code-statusline-pro-aarch64-apple-darwin.tar.xz"
      sha256 "63b5d8c1337704fcbf6f0d3a72587417043064bbc67cf497cc2401a5c61d3c57"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.0.2/claude-code-statusline-pro-x86_64-apple-darwin.tar.xz"
      sha256 "b81340cba2f85aabf2cbe73dc53b0800da15ff95fcfeb7549e8cc53a2ced2cbe"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.0.2/claude-code-statusline-pro-aarch64-unknown-linux-musl.tar.xz"
      sha256 "dafff457459527451fad2088322db4a860d049f61aa7f6aad35e33a1f7b0a75a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.0.2/claude-code-statusline-pro-x86_64-unknown-linux-musl.tar.xz"
      sha256 "232c234702a42350922a599b04b15f996c0bce44f645f7027b5ced7767c35a1e"
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
