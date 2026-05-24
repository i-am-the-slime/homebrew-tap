cask "markgraf" do
  version "0.0.13"
  sha256 "e2921ba85746746535dd62062ad3d5c546a18aabe448ce8796e32755c427e7ba"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.0.13/markgraf-darwin-arm64.tar.gz"
  name "markgraf"
  desc "Animated graph diagrams CLI"
  homepage "https://github.com/i-am-the-slime/homebrew-tap"

  binary "markgraf-darwin-arm64", target: "markgraf"

  # Unsigned + un-notarized: strip quarantine so Gatekeeper
  # doesn't block first launch.
  preflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/markgraf-darwin-arm64"],
                   must_succeed: false
  end
end
