cask "markgraf" do
  version "0.0.21"
  sha256 "0d166cc82861b8d68402a69fea9890ec379f717b752211d92995142b18260d9a"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.0.21/markgraf-darwin-arm64.tar.gz"
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
