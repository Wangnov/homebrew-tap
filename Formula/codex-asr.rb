class CodexAsr < Formula
  desc "Unofficial Codex Desktop ASR CLI and local Whisper-compatible REST shim"
  homepage "https://github.com/Wangnov/codex-asr"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/codex-asr/releases/download/v0.1.1/codex-asr-aarch64-apple-darwin.tar.xz"
      sha256 "4358b987d75995e0187312bf37c46bfad179b658fc42b540c48d317805b1f0ff"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/codex-asr/releases/download/v0.1.1/codex-asr-x86_64-apple-darwin.tar.xz"
      sha256 "1a1d501001846caf6d9ef701a926ffd4ca93c79a8b045407afa85eeae4b1ce1b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/codex-asr/releases/download/v0.1.1/codex-asr-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "68b5bcb4b25f9ff76c0de4d96eca963918fe8a6b4cdab0442571f271bc9f6017"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/codex-asr/releases/download/v0.1.1/codex-asr-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e8b7be7883107cefa9633609a5200706c7a91dc4e788b6ac6633cf3063724fb5"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
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
    bin.install "codex-asr" if OS.mac? && Hardware::CPU.arm?
    bin.install "codex-asr" if OS.mac? && Hardware::CPU.intel?
    bin.install "codex-asr" if OS.linux? && Hardware::CPU.arm?
    bin.install "codex-asr" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end

  test do
    system bin/"codex-asr", "--version"
  end
end
