class CodexThreadripper < Formula
  desc "Human-first CLI that keeps Codex thread history aligned to one provider bucket."
  homepage "https://github.com/Wangnov/codex-threadripper"
  version "0.3.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.3.1/codex-threadripper-aarch64-apple-darwin.tar.xz"
      sha256 "6a774bf80ead7854acebd5863ba1ec677afd05b126ff0f1a94ce9825ffea4dc7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.3.1/codex-threadripper-x86_64-apple-darwin.tar.xz"
      sha256 "1e334bcc038a83e1ff19a77463ec9d0df1cc8b739944a9ce0ddf32ec2d3cbf14"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.3.1/codex-threadripper-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b6f111dbb55003ad6548cadf197813227be2ffc5945de2ecb1bbc7e4d1455f48"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.3.1/codex-threadripper-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "81fcf57f3cbb0e2828fc41bfe2245b2c583a8ddd5744a3f1be8cd46d8aca3985"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin": {},
    "x86_64-pc-windows-gnu": {},
    "x86_64-unknown-linux-gnu": {}
  }

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
      bin.install "codex-threadripper"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "codex-threadripper"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "codex-threadripper"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "codex-threadripper"
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
