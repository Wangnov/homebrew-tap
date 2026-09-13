class GptImage2Skill < Formula
  desc "Agent-first GPT Image 2 CLI and installable skill runtime."
  homepage "https://github.com/Wangnov/gpt-image-2-skill"
  version "0.7.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.7.4/gpt-image-2-skill-aarch64-apple-darwin.tar.xz"
      sha256 "330a7104e0d1cd855413232511831378f14460b66cf33e3a9a9711f60674b5f3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.7.4/gpt-image-2-skill-x86_64-apple-darwin.tar.xz"
      sha256 "8f69c3951dd8ef3a8bda70c011095404969d6025ed424e42c9fe5bfea09a3887"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.7.4/gpt-image-2-skill-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1fb2292db4241861147a06d32c44e5a5ee78b74e6e80a06a0f69758712438f03"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.7.4/gpt-image-2-skill-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "200109f77c0e245bf46e9177d0ca0a7d07c61f948f59837751136ddf0988b850"
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
    if OS.mac? && Hardware::CPU.arm?
      bin.install "gpt-image-2-skill"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "gpt-image-2-skill"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "gpt-image-2-skill"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "gpt-image-2-skill"
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
