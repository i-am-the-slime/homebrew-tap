cask "markgraf" do
  version "0.1.0"
  sha256 "46d6d116bb3a006ff1e6774373f6ff9b7864b79a223fb0628600a40579542c7e"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v#{version}/markgraf-darwin-arm64.tar.gz"
  name "markgraf"
  desc "Animated graph diagrams CLI"
  homepage "https://github.com/i-am-the-slime/homebrew-tap"

  binary "markgraf-darwin-arm64", target: "markgraf"

  # Unsigned + un-notarized binary: Gatekeeper would block first launch
  # unless the quarantine xattr is removed. Stripping the staged file
  # before linking keeps the brew-managed symlink clean.
  preflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/markgraf-darwin-arm64"],
                   must_succeed: false
  end
end
