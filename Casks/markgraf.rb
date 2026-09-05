cask "markgraf" do
  version "0.0.39"
  sha256 "e794f4f09e50184d2d90c477bc09eb6507f7227c1f5f1d332c7d422500e4b600"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.0.39/markgraf-darwin-arm64.tar.gz"
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
