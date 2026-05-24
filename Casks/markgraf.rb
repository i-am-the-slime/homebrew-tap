cask "markgraf" do
  version "0.0.14"
  sha256 "16c46a1ac3879c6a1bfc5ec6001b01b139ac4b576cd74d403bf8a93157814383"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.0.14/markgraf-darwin-arm64.tar.gz"
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
