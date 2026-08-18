cask "markgraf" do
  version "0.0.35"
  sha256 "27dabd80315c7ee01fc77041ed516d6eed79251278451b11e46a7e2e10dd7a35"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.0.35/markgraf-darwin-arm64.tar.gz"
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
