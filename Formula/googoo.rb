class Googoo < Formula
  desc "PureScript compiler with a Go backend"
  homepage "https://github.com/i-am-the-slime/iris-go-backend"
  version "0.1.18-go.6"
  license "BSD-3-Clause"

  on_macos do
    url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/googoo-universal-apple-darwin.tar.gz"
    sha256 "09f16760c168bda475a66287e88001c670d83f4d0ffd0b727b9177b5250114d0"
  end

  on_linux do
    on_arm do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/googoo-aarch64-unknown-linux-musl.tar.gz"
      sha256 "702a0b1dfacf0be8943a555193bd353c2ca67939d2579f3677668222c9ef007a"
    end
    on_intel do
      url "https://github.com/i-am-the-slime/iris-go-backend/releases/download/v#{version}/googoo-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e1390dbd3f215ab1e6d05eddfe15bb0581be53ca9d5558efe6d74ab28ab593d1"
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
