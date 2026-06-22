class GptImage2Skill < Formula
  desc "Agent-first GPT Image 2 CLI and installable skill runtime."
  homepage "https://github.com/Wangnov/gpt-image-2-skill"
  version "0.7.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.7.0/gpt-image-2-skill-aarch64-apple-darwin.tar.xz"
      sha256 "2a7809ca5118c0b31be81ee9180f5d14479589db3c3af0ed8a0172854f6ed262"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.7.0/gpt-image-2-skill-x86_64-apple-darwin.tar.xz"
      sha256 "8191f6bf0ba49bf452da2f340d5e00f4d4473706f7595b673636e3a65a71b8df"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.7.0/gpt-image-2-skill-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1f2390f80ba63fcbda3a68dc1524dbe90f50ab9a47679e689ad11d6b5256089b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.7.0/gpt-image-2-skill-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0fbfaed55c01d16a00b5f0f45093ed75681f599baebcae901920343a49a07141"
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
    bin.install "gpt-image-2-skill" if OS.mac? && Hardware::CPU.arm?
    bin.install "gpt-image-2-skill" if OS.mac? && Hardware::CPU.intel?
    bin.install "gpt-image-2-skill" if OS.linux? && Hardware::CPU.arm?
    bin.install "gpt-image-2-skill" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
