class Shnote < Formula
  desc "A lightweight command wrapper that enforces WHAT/WHY documentation"
  homepage "https://github.com/wangnov/shnote"
  version "0.3.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/wangnov/shnote/releases/download/v0.3.2/shnote-aarch64-apple-darwin.tar.xz"
      sha256 "2f1e65281d631379398df457923a25df2e2df447a753231f249e126a5ed3f576"
    end
    if Hardware::CPU.intel?
      url "https://github.com/wangnov/shnote/releases/download/v0.3.2/shnote-x86_64-apple-darwin.tar.xz"
      sha256 "a9497040bd0213a033fd980c1169158e491f8aaa211372abc00cdafed83311dd"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/wangnov/shnote/releases/download/v0.3.2/shnote-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "2bc0bddac392aa16e95cac1b038444993dac8f8f49bf4389790786916476197b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/wangnov/shnote/releases/download/v0.3.2/shnote-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c2b94327c98b05aa79910bcc6822bbd2e2862acb53c23dd882cc250a4d8b8ead"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":               {},
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
    bin.install "shnote" if OS.mac? && Hardware::CPU.arm?
    bin.install "shnote" if OS.mac? && Hardware::CPU.intel?
    bin.install "shnote" if OS.linux? && Hardware::CPU.arm?
    bin.install "shnote" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
