cask "markgraf" do
  version "0.0.8"
  sha256 "b562eeb1c2206d69a19f42f7cca08a2955bc4e80e79a335f252bf306a5b4a3d0"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.0.8/markgraf-darwin-arm64.tar.gz"
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
