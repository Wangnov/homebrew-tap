class Shnote < Formula
  desc "A lightweight command wrapper that enforces WHAT/WHY documentation"
  homepage "https://github.com/wangnov/shnote"
  version "0.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/wangnov/shnote/releases/download/v0.3.0/shnote-aarch64-apple-darwin.tar.xz"
      sha256 "5d78781ecb1ed5ad99ac3e32cefbc776b363615402f71ba4e7c6ba20b3d9e28e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/wangnov/shnote/releases/download/v0.3.0/shnote-x86_64-apple-darwin.tar.xz"
      sha256 "83dd0b2686c14ae04f385cc63f1ce10c4d279ac3aa0eda2c3ec417011726e99b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/wangnov/shnote/releases/download/v0.3.0/shnote-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3660bd2ae0c15dc937bbcd525e83c04eeac1dc885938a648e2cbe5c6756a7027"
    end
    if Hardware::CPU.intel?
      url "https://github.com/wangnov/shnote/releases/download/v0.3.0/shnote-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c0e515e57ee4e340ac7a181d71f20366d8867769e3ade7b7c4697bf93c962341"
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
