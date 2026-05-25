cask "markgraf" do
  version "0.0.18"
  sha256 "772c2539b1f0bf0905ea4eeb1a966a610b687ec0ee26906659fa3863b999e4d1"

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
