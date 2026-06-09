class ClaudeCodeStatuslinePro < Formula
  desc "Enhanced statusline for Claude Code with 10x performance"
  homepage "https://github.com/Wangnov/claude-code-statusline-pro"
  version "4.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.1.1/claude-code-statusline-pro-aarch64-apple-darwin.tar.xz"
      sha256 "a6ca6ce80bb84bed727275682ce981f00767f3a57c9ac2b78fec1ccac359d60e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.1.1/claude-code-statusline-pro-x86_64-apple-darwin.tar.xz"
      sha256 "256418f236b8672a882ef8860721539bb6883c3f83793354367c364a6a1bb821"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.1.1/claude-code-statusline-pro-aarch64-unknown-linux-musl.tar.xz"
      sha256 "33f1279d8d7076b84aaff51a5dbe97ffa79b88a6478ca6cc8caa08041fae282d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.1.1/claude-code-statusline-pro-x86_64-unknown-linux-musl.tar.xz"
      sha256 "380d60464dbd7c1056cf4b77a5b2704bb240aa525bb1a768166816f6c4f1db79"
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
