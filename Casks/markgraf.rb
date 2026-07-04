cask "markgraf" do
  version "0.0.26"
  sha256 "f935dd1eec2de708494599e8c80fd86bf9662abd22b06bf5a56d83288b7462f3"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.0.26/markgraf-darwin-arm64.tar.gz"
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
