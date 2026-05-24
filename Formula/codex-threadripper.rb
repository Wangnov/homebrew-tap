class CodexThreadripper < Formula
  desc "Human-first CLI that keeps Codex thread history aligned to one provider bucket."
  homepage "https://github.com/Wangnov/codex-threadripper"
  version "0.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.3.0/codex-threadripper-aarch64-apple-darwin.tar.xz"
      sha256 "ddd914446973f5c87419f475397a53041d5c100f7991f914327ff4a0dcf155b5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.3.0/codex-threadripper-x86_64-apple-darwin.tar.xz"
      sha256 "3944bcafdfabedb9599fd524f03cda8fac10621d5c2d7f251863dd5ddeb0f318"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.3.0/codex-threadripper-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3e444f0be446d5be51b1c2b3ad2a872da3d24e6606a9334293e206d5f8d1c065"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.3.0/codex-threadripper-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4a74597aeed6c70c1df71581007c2a1d290f353a172348b99d4dec04cf83ea54"
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
