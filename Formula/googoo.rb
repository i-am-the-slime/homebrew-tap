class Googoo < Formula
  desc "PureScript compiler with a Go backend"
  homepage "https://github.com/i-am-the-slime/iris-go-backend"
  version "0.1.18-go.3"
  license "BSD-3-Clause"

  on_macos do
    url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/googoo-universal-apple-darwin.tar.gz"
    sha256 "0471b522f68777b840de1b7089917e80d7b551da463787472d06a900ec8731cb"
  end

  on_linux do
    on_arm do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/googoo-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b3a2d41a7ca46cf5142ff72e80918a1d91157869e6701622387f1b0d8b16f41c"
    end
    on_intel do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/googoo-x86_64-unknown-linux-musl.tar.gz"
      sha256 "47918291613dde74920e97dd101ec65730a69eaf8a28bb26c62ccdf1a64e26a1"
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
