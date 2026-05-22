cask "markgraf" do
  version "0.0.12"
  sha256 "174fa4ddc930cbcafec3e9f5289fae91d2810fea5a9ab88f1bd52eb821a1888a"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.0.12/markgraf-darwin-arm64.tar.gz"
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
