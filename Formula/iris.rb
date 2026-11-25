class Iris < Formula
  desc "PureScript compiler with a Go backend"
  homepage "https://github.com/i-am-the-slime/iris-go-backend"
  version "0.1.18-go.2"
  license "BSD-3-Clause"

  on_macos do
    url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/iris-universal-apple-darwin.tar.gz"
    sha256 "eeb3927cc2edb35c8a00ac8450bad642370d34964577dec5b6867d7a8fee77e1"
  end

  on_linux do
    on_arm do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/iris-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e33e9b02c16ad4c2e73f78bcb81aa02ea37f7f6f19416c9d52de0f1448c1f9de"
    end
    on_intel do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/iris-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2d775f4847919ea7e64b38754b163226e5c548dd79e9605eebc9d0fef0f09d0c"
    end
  end

  depends_on "go"

  def install
    bin.install "iris"
  end

  def caveats
    <<~EOS
      Iris uses Spago to fetch your packages, so you need that too:
        brew install spago
      or, if you already have Node:
        npm install -g spago

      Then start a project and run it with the Go backend:
        mkdir my-app && cd my-app
        iris new
        iris run --go
    EOS
  end

  test do
    assert_equal "iris #{version}", shell_output("#{bin}/iris --version").strip
  end
end
