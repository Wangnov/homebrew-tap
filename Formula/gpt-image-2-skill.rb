class GptImage2Skill < Formula
  desc "Agent-first GPT Image 2 CLI and installable skill runtime."
  homepage "https://github.com/Wangnov/gpt-image-2-skill"
  version "0.2.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.2.1/gpt-image-2-skill-aarch64-apple-darwin.tar.xz"
      sha256 "e9a4d3b1ad24816f05fe3a7db8ad6eb9e62ab660320cd639a186bbc5240b38e6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.2.1/gpt-image-2-skill-x86_64-apple-darwin.tar.xz"
      sha256 "1a1fb22cba065d3c9b97285a5e258f1b874528d8408656646e151927f4db2535"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.2.1/gpt-image-2-skill-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "37b8cb250fba0895bd3eaa4aace39ff09f58f3a770cf114451e46813bb2698b6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.2.1/gpt-image-2-skill-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b57e514a9f9f0a1adb441023f98c2ed99087d5a95edc32af9bd5a7168847a536"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "aarch64-pc-windows-gnu":            {},
    "aarch64-unknown-linux-gnu":         {},
    "x86_64-apple-darwin":               {},
    "x86_64-pc-windows-gnu":             {},
    "x86_64-unknown-linux-gnu":          {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static":  {},
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
