WHAT: 创建shnote公式
WHY:  为homebrew提供mac二进制安装
class Shnote < Formula
  desc "Shell command wrapper with WHAT/WHY"
  homepage "https://github.com/Wangnov/shnote"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Wangnov/shnote/releases/download/v0.2.6/shnote-aarch64-apple-darwin"
      sha256 "8f9f2290a38e82e4c328edc57fc9c715400bc449154cdec7836ce8d60b6742c5"
    else
      url "https://github.com/Wangnov/shnote/releases/download/v0.2.6/shnote-x86_64-apple-darwin"
      sha256 "caa2de4b76b212e9a8eab16f52cc724ac57116a3577b278b8233461eaeaf94c5"
    end
  end

  def install
    binary = Dir["shnote-*"][0]
    chmod "+x", binary
    bin.install binary => "shnote"
  end

  test do
    system "#{bin}/shnote", "--help"
  end
end
