cask "markgraf" do
  version "0.0.34"
  sha256 "e39e5151c6891e531df161fc37268d2428f256142863caaa95128fb963c8a88b"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.0.34/markgraf-darwin-arm64.tar.gz"
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
