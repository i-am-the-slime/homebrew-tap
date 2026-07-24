cask "markgraf" do
  version "0.0.28"
  sha256 "ebf6d2cc4ddbc7b09317a3bfb748273fb2148329a413189d890991d324d79548"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.0.28/markgraf-darwin-arm64.tar.gz"
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
