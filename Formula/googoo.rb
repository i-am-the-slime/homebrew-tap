class Googoo < Formula
  desc "PureScript compiler with a Go backend"
  homepage "https://github.com/i-am-the-slime/iris-go-backend"
  version "0.1.18-go.13"
  license "BSD-3-Clause"

  on_macos do
    url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/googoo-universal-apple-darwin.tar.gz"
    sha256 "11dd4ca7768dc22a33dc93d36b24bf6625539f7089f30d196fce36d589243538"
  end

  on_linux do
    on_arm do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/googoo-aarch64-unknown-linux-musl.tar.gz"
      sha256 "aeea1222301ccfde123e69d3278b9630f686caf3019823ad9520601f117fc1aa"
    end
    on_intel do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/googoo-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cd2ab354bdbd72c5783639513863db826b33fa556dea7e8f9da243c08959d3d8"
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
        googoo run

      googoo used to be called iris. `iris` still works for now, and tells you so.
    EOS
  end

  test do
    assert_equal "googoo #{version}", shell_output("#{bin}/googoo --version").strip
    assert_match "iris is now called googoo", shell_output("#{bin}/iris --version 2>&1")
  end
end
