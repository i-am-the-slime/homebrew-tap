cask "markgraf" do
  version "0.0.7"
  sha256 "a3c0f8ceb453ec808a6463528b1522cb577ea63a359e20e243e260904a2b6974"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.0.7/markgraf-darwin-arm64.tar.gz"
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
