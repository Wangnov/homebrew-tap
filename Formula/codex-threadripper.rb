class CodexThreadripper < Formula
  desc "Human-first CLI that keeps Codex thread history aligned to one provider bucket."
  homepage "https://github.com/Wangnov/codex-threadripper"
  version "0.1.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.1.6/codex-threadripper-aarch64-apple-darwin.tar.xz"
      sha256 "d886495c354f457cfd795185c7bd6c2d1d57d7ceba49170ba04806422a7500ee"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.1.6/codex-threadripper-x86_64-apple-darwin.tar.xz"
      sha256 "c0a7386dd4c1379891c753a57a423c3d108aaa091f507bc788e60a16028c779c"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.1.6/codex-threadripper-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8549503623810a46102b0fcf1d7eb1a750c6bb79d95f32996d24a5136dbc2cf2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.1.6/codex-threadripper-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2e87a9865edc60eaf0fe22a4fad2e889e35024dd02f0cf79e8794adcf9a09d23"
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
