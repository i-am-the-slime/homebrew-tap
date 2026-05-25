cask "markgraf" do
  version "0.0.19"
  sha256 "86dfbca052c76c51ae3bbe67ca0c194ee9f078a279a0ce518df0b7ede9168567"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.0.19/markgraf-darwin-arm64.tar.gz"
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
