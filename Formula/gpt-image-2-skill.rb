class GptImage2Skill < Formula
  desc "Agent-first GPT Image 2 CLI and installable skill runtime."
  homepage "https://github.com/Wangnov/gpt-image-2-skill"
  version "0.7.5"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.7.5/gpt-image-2-skill-aarch64-apple-darwin.tar.xz"
      sha256 "bb51cfd231aa3c9ed2fc95b753dda4d4c11423c9c25169e8e206a56dc8179539"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.7.5/gpt-image-2-skill-x86_64-apple-darwin.tar.xz"
      sha256 "b1cdea1b9022b63d2a4c36d1fd2efa634abb2b6216caff18ef2fd281ea9f454d"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.7.5/gpt-image-2-skill-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8907a02eddcf622879ac955618b79fec26ea4259910a4fa3ffa80ca7ed76af31"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Wangnov/gpt-image-2-skill/releases/download/v0.7.5/gpt-image-2-skill-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a421141a43b252f2fae39cf9bd22d920e5edc12b358bd4ccfb9dc430a3282af6"
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
