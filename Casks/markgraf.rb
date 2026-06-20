cask "markgraf" do
  version "0.0.24"
  sha256 "9292b28495269c6f0bb982e47c1aa4003ce86f52bc46acb5e3faf1ed70d25d52"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.0.24/markgraf-darwin-arm64.tar.gz"
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
