class Iris < Formula
  desc "PureScript compiler with a Go backend"
  homepage "https://github.com/i-am-the-slime/iris-go-backend"
  version "0.1.17-go.1"
  license "BSD-3-Clause"

  on_macos do
    url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/iris-universal-apple-darwin.tar.gz"
    sha256 "ddd097f4fa636073a7d3781889ac6ae95afd875e0f9cdfa6da0c6e64cb8b0bde"
  end

  on_linux do
    on_arm do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/iris-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f83582a479ab2b267d494e1b020af42d8403c7cf8c25116ab941916acb46a321"
    end
    on_intel do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/iris-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1c3ea3b06748b12c5d50df89b944e2e18dfd65a5c7279f789472a8f9dcc3d9a7"
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
