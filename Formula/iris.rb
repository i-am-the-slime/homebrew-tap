class Iris < Formula
  desc "PureScript compiler with a Go backend"
  homepage "https://github.com/i-am-the-slime/iris-go-backend"
  version "0.1.17-go.3"
  license "BSD-3-Clause"

  on_macos do
    url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/iris-universal-apple-darwin.tar.gz"
    sha256 "f3eba95314536c83e7933ee58c289324dab75f02c59a5701da017e4094cc6ea3"
  end

  on_linux do
    on_arm do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/iris-aarch64-unknown-linux-musl.tar.gz"
      sha256 "82572b94f826123f00fd11c2a40a23daee21cd7bc974470b217161b40c676954"
    end
    on_intel do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/iris-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b03732c0cb7cb646ca1c757b8bf3f1145bfa8723d16034e35fbfa39549337011"
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
