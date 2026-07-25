cask "markgraf" do
  version "0.0.30"
  sha256 "07c1368670e532ffab321c95777e1a398289476fa709afc1c105d1f404d84b16"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.0.30/markgraf-darwin-arm64.tar.gz"
  name "markgraf"
  desc "Animated graph diagrams CLI"
  homepage "https://github.com/markgrafhq/homebrew-tap"

  binary "markgraf-darwin-arm64", target: "markgraf"

  # Unsigned + un-notarized: strip quarantine so Gatekeeper
  # doesn't block first launch.
  preflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/markgraf-darwin-arm64"],
                   must_succeed: false
  end
end
