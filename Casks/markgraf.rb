cask "markgraf" do
  version "0.0.9"
  sha256 "f9ec5826b3bd784141ed7be3422767e446c5cc6c9d2a91046fa60e85754bb8ed"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.0.9/markgraf-darwin-arm64.tar.gz"
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
