cask "markgraf" do
  version "0.0.16"
  sha256 "a90483bf270e670e8601064c98c4095c550b8c68f630b2e40745de0df6b1bcda"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.0.16/markgraf-darwin-arm64.tar.gz"
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
