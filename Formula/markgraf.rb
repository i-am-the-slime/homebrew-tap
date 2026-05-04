class Markgraf < Formula
  desc "Animated graph diagrams CLI"
  homepage "https://github.com/i-am-the-slime/homebrew-tap"
  version "0.1.0"
  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.1.0/markgraf-darwin-arm64.tar.gz"
  sha256 "46d6d116bb3a006ff1e6774373f6ff9b7864b79a223fb0628600a40579542c7e"
  license "MIT"

  def install
    bin.install "markgraf-darwin-arm64" => "markgraf"
  end

  test do
    system "#{bin}/markgraf", "--help"
  end
end
