cask "markgraf" do
  version "0.1.0"
  sha256 "46d6d116bb3a006ff1e6774373f6ff9b7864b79a223fb0628600a40579542c7e"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v#{version}/markgraf-darwin-arm64.tar.gz"
  name "markgraf"
  desc "Animated graph diagrams CLI"
  homepage "https://github.com/i-am-the-slime/homebrew-tap"

  binary "markgraf-darwin-arm64", target: "markgraf"
end
