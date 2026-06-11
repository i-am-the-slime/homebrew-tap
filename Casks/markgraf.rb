cask "markgraf" do
  version "0.0.23"
  sha256 "d45f59d77409a691060c6300174ea66a0b7d5a875a3f572bb0790b3b90f0f7e7"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.0.23/markgraf-darwin-arm64.tar.gz"
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
