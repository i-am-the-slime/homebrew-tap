cask "markgraf" do
  version "0.0.29"
  sha256 "b4b8f8402f5650fb632686f5ec2b9cf4ed2d250949f114542df25eee85d0ece6"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.0.29/markgraf-darwin-arm64.tar.gz"
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
