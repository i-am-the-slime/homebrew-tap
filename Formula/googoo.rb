class Googoo < Formula
  desc "PureScript compiler with a Go backend"
  homepage "https://github.com/i-am-the-slime/iris-go-backend"
  version "0.1.18-go.5"
  license "BSD-3-Clause"

  on_macos do
    url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/googoo-universal-apple-darwin.tar.gz"
    sha256 "b43a18fb52502b9c250035ee1036540ed49200eecd06c720ae51cbd528234390"
  end

  on_linux do
    on_arm do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/googoo-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6ebc3e1e8e2077498fc419b65affd9c23525be0ca1c9a032c66d920608f6c6a0"
    end
    on_intel do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/googoo-x86_64-unknown-linux-musl.tar.gz"
      sha256 "341c6fe79bfa44e999b49462a4e81df230e29a5b0bba82b43b40674e36327f14"
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
