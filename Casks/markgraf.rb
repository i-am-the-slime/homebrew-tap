cask "markgraf" do
  version "0.1.4"
  sha256 "b0d31ce3f08ec526c259834a5ae1e7badb649901d23213d569cb2a8bf79bfac7"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.1.4/markgraf-darwin-arm64.tar.gz"
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
