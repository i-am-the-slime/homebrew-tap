cask "markgraf" do
  version "0.1.3"
  sha256 "65f600c1e565a1a5d46c109587bb89d07d83b7abed9cb591c4427d9234276ecd"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.1.3/markgraf-darwin-arm64.tar.gz"
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
