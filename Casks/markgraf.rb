cask "markgraf" do
  version "0.0.38"
  sha256 "c23b44d87f63176c55af44f6cc6087ba1d6206a3264ee0941e19e9c4755e23a2"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.0.38/markgraf-darwin-arm64.tar.gz"
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
