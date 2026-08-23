cask "markgraf" do
  version "0.0.36"
  sha256 "31a7041e429c4286890ba3573c76da4bae9904e239e2d1cbfd7a68925dff8223"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.0.36/markgraf-darwin-arm64.tar.gz"
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
