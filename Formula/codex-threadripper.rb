class CodexThreadripper < Formula
  desc "Human-first CLI that keeps Codex thread history aligned to one provider bucket."
  homepage "https://github.com/Wangnov/codex-threadripper"
  version "0.3.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.3.3/codex-threadripper-aarch64-apple-darwin.tar.xz"
      sha256 "25141ff736fe822d7b9e1882ae6671e12b3eec4ce2e874bde222757388d7c6bf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.3.3/codex-threadripper-x86_64-apple-darwin.tar.xz"
      sha256 "a75a4ef53420e4e80610fe8d2d04ccb3ba7279efffb85ca23ab22d5b91e45f72"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.3.3/codex-threadripper-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d9b897692523eadaa4ed5d3b7a9b6dc729a0878c4d885d7b20eadbe876360a43"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.3.3/codex-threadripper-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1754e11c05923717784afbdf7758f3f6001caf08b386115df6422fbf5b710530"
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
