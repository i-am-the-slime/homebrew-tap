class Iris < Formula
  desc "PureScript compiler with a Go backend"
  homepage "https://github.com/i-am-the-slime/iris-go-backend"
  version "0.1.17-go.2"
  license "BSD-3-Clause"

  on_macos do
    url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/iris-universal-apple-darwin.tar.gz"
    sha256 "4aaa0aff3694f8b63b2056de2c7ae0e372d7aa5a8e58f4603ea51c56f62676ff"
  end

  on_linux do
    on_arm do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/iris-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9b5eda1404b055fc888df27534182bc74daa0bb7d496eb7466710041b54d1665"
    end
    on_intel do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/iris-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5b8c8012f0632e418cf91b1f3a1a71a263b86ad1ae41d7202c69ce0147036b8d"
    end
  end

  depends_on "go"

  def install
    bin.install "iris"
  end

  test do
    assert_equal "iris #{version}", shell_output("#{bin}/iris --version").strip
  end
end
