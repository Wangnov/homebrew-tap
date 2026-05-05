class CodexAsr < Formula
  desc "Unofficial Codex Desktop ASR CLI and local Whisper-compatible REST shim"
  homepage "https://github.com/Wangnov/codex-asr"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/codex-asr/releases/download/v0.1.2/codex-asr-aarch64-apple-darwin.tar.xz"
      sha256 "22e7b6243ded5d6394d72a2b397422cfefb874430b5933462df6c765782adf03"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/codex-asr/releases/download/v0.1.2/codex-asr-x86_64-apple-darwin.tar.xz"
      sha256 "6acb2171e8ad373eb73d649c10b2401ed6f8c1b4191d3d9cfcc0f3dad962e05e"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/codex-asr/releases/download/v0.1.2/codex-asr-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "58eb101d29454924b4e395a49d7d040bd95b9ae2d37ea8a75d8890aea1d70b13"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/codex-asr/releases/download/v0.1.2/codex-asr-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "16a27b87d45f91caaf9f0803cc4674a05f1f2bb5251b129426e7e502eba24f33"
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
