cask "markgraf" do
  version "0.0.18"
  sha256 "5c8bc46203d2f38d48c5fdc14db1df8f3afa204d69ffb9b7bfa44e0cfedb6da4"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.0.18/markgraf-darwin-arm64.tar.gz"
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
