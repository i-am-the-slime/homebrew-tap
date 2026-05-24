cask "markgraf" do
  version "0.0.15"
  sha256 "29e6ea36c944a04023879d9c4019b4a93cbe7a68aa6d4bd372f3a7c011eb9e37"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.0.15/markgraf-darwin-arm64.tar.gz"
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
