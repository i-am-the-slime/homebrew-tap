cask "markgraf" do
  version "0.0.25"
  sha256 "d9720f665244d222e6dba581814c33cddbd561905ac907416931d93cf6e5613c"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.0.25/markgraf-darwin-arm64.tar.gz"
  name "markgraf"
  desc "Animated graph diagrams CLI"
  homepage "https://github.com/i-am-the-slime/homebrew-tap"

  binary "markgraf-darwin-arm64", target: "markgraf"

  # Unsigned + un-notarized: strip quarantine so Gatekeeper
  # doesn't block first launch.
  preflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/markgraf-darwin-arm64"],
                   must_succeed: false
  end
end
