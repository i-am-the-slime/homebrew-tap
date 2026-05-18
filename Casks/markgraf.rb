cask "markgraf" do
  version "0.1.6"
  sha256 "ccb25abab21423b4f5fe294a69c926213200f29dcc6fba25e5c6ea9af39bdd1e"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.1.6/markgraf-darwin-arm64.tar.gz"
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
