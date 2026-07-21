class CodexThreadripper < Formula
  desc "Human-first CLI that keeps Codex thread history aligned to one provider bucket."
  homepage "https://github.com/Wangnov/codex-threadripper"
  version "0.3.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.3.6/codex-threadripper-aarch64-apple-darwin.tar.xz"
      sha256 "75e80155f8e5051eb1c032b93e540210f4580ac96a16f4df312182e065732909"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.3.6/codex-threadripper-x86_64-apple-darwin.tar.xz"
      sha256 "9c2e51ec6397d98ffa1269611d5f8713a124f28b19cc19f782d2ff91f914683e"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.3.6/codex-threadripper-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "939b07412db895bbc4552a480b8aad5bf6def0a7af05359907545e45ccd22169"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/codex-threadripper/releases/download/v0.3.6/codex-threadripper-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d55c31f3eb30b639c79242273edcc13abad10f0f3521914b6b04c12289121b80"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "aarch64-unknown-linux-musl-dynamic": {},
    "aarch64-unknown-linux-musl-static": {},
    "x86_64-apple-darwin": {},
    "x86_64-pc-windows-gnu": {},
    "x86_64-unknown-linux-gnu": {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static": {}
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
