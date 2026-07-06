cask "markgraf" do
  version "0.0.27"
  sha256 "13498c890b190744d8ab69961a544f28b9558b54f5449056ad745321b2019e86"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.0.27/markgraf-darwin-arm64.tar.gz"
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
