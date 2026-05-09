class ClaudeCodeStatuslinePro < Formula
  desc "Enhanced statusline for Claude Code with 10x performance"
  homepage "https://github.com/Wangnov/claude-code-statusline-pro"
  version "4.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.1.0/claude-code-statusline-pro-aarch64-apple-darwin.tar.xz"
      sha256 "172901f8df3b8f014f996e2bdb2a5e26bb62c161d3a9951a0995df621796b3a5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.1.0/claude-code-statusline-pro-x86_64-apple-darwin.tar.xz"
      sha256 "6239c8b4d3f4fc5710476030312fc00a946a3fd28d8612dc139461036b355295"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.1.0/claude-code-statusline-pro-aarch64-unknown-linux-musl.tar.xz"
      sha256 "e9b9c708d7432cb760fdac41cd832c4c6cf878830d29a8e21c88c8276f1ce786"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/claude-code-statusline-pro/releases/download/v4.1.0/claude-code-statusline-pro-x86_64-unknown-linux-musl.tar.xz"
      sha256 "fe392ad5e1c029d63f9b431fbdc3e94bcd6dbbc8304d763deb7177f0d8086380"
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
