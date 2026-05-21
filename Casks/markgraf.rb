cask "markgraf" do
  version "0.0.10"
  sha256 "7b54faffd7bcdd77d5e5155972e69cf69dd61b7c9a053829a3d43a5879b8cb0a"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.0.10/markgraf-darwin-arm64.tar.gz"
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
