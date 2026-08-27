cask "markgraf" do
  version "0.1.5"
  sha256 "5e948fe11a742dbb8bd2ae994595631ccca7a0963371295b9cd831b8235cfe77"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.1.5/markgraf-darwin-arm64.tar.gz"
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
