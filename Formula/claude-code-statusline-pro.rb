class ClaudeCodeStatuslinePro < Formula
  desc "Enhanced statusline for Claude Code with 10x performance"
  homepage "https://github.com/Wangnov/claude-code-statusline-pro"
  version "4.0.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.0.1/claude-code-statusline-pro-aarch64-apple-darwin.tar.xz"
      sha256 "a8c62d7cffba9477e8bc293e5f90de4b9e9ea60c62edb10114e32701eefda4e7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.0.1/claude-code-statusline-pro-x86_64-apple-darwin.tar.xz"
      sha256 "e5af4a84e2b6ca6f2b4f97b5a9cdc6908af851b2adee6c719f552f8332c0c0c1"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.0.1/claude-code-statusline-pro-aarch64-unknown-linux-musl.tar.xz"
      sha256 "1fb6bdbd34492ec501e46d1ff9faeb19e1eeba54f42d833dbc2dfdd4935543b4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.0.1/claude-code-statusline-pro-x86_64-unknown-linux-musl.tar.xz"
      sha256 "3b4a996ee3ceb366ff665781229d94831c7e2fab11ed4545caa64ff02dc05dcf"
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
