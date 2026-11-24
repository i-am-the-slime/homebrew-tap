class Iris < Formula
  desc "PureScript compiler with a Go backend"
  homepage "https://github.com/i-am-the-slime/iris-go-backend"
  version "0.1.18-go.1"
  license "BSD-3-Clause"

  on_macos do
    url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/iris-universal-apple-darwin.tar.gz"
    sha256 "5d4e4cf26d29e4916161517941c0d61b6702d16df5d388849f885d302f889d47"
  end

  on_linux do
    on_arm do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/iris-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a4b7dc77c9d77c87e7db599bf1d20c1ed017bb56ecf6607043936593a66959e5"
    end
    on_intel do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/iris-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b938c44aae37b8f037fd7998fa9895571e811c7c0babf8ee5ccd1f04a2c5fb84"
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
