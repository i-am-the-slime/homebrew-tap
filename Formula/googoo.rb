class Googoo < Formula
  desc "PureScript compiler with a Go backend"
  homepage "https://github.com/i-am-the-slime/iris-go-backend"
  version "0.1.18-go.4"
  license "BSD-3-Clause"

  on_macos do
    url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/googoo-universal-apple-darwin.tar.gz"
    sha256 "1a9f477198d11cd34663b95eb7dc736d5a5e1992dc9dc3e381dc6de3460aed00"
  end

  on_linux do
    on_arm do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/googoo-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9294b75a734f0de0baa1187088fec0ed46b5a7943e691aae230ded828d6cef85"
    end
    on_intel do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/googoo-x86_64-unknown-linux-musl.tar.gz"
      sha256 "66b794d02f7140fd3e7bc349c6866e1dc0f8df395862aed60ad6b84b47679f27"
    end
  end

  depends_on "go"

  def install
    bin.install "googoo"
    # The old name, for a while: it says googoo is the new one and runs it.
    bin.install "iris"
  end

  def caveats
    <<~EOS
      googoo uses Spago to fetch your packages, so you need that too:
        brew install spago
      or, if you already have Node:
        npm install -g spago

      Then start a project and run it with the Go backend:
        mkdir my-app && cd my-app
        googoo new
        googoo run --go

      googoo used to be called iris. `iris` still works for now, and tells you so.
    EOS
  end

  test do
    assert_equal "googoo #{version}", shell_output("#{bin}/googoo --version").strip
    assert_match "iris is now called googoo", shell_output("#{bin}/iris --version 2>&1")
  end
end
