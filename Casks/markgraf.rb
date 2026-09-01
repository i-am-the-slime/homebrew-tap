cask "markgraf" do
  version "0.1.6"
  sha256 "43fb7986e8bb1d04ec66c823b158533da1f8f705d17edf95093f6e9225e8ca0b"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.1.6/markgraf-darwin-arm64.tar.gz"
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
