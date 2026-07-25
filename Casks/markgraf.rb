cask "markgraf" do
  version "0.0.31"
  sha256 "5010cc45f10f1afb4ae913f6caca6f81c34ed789ab53f0938e7b48a3eca4c122"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.0.31/markgraf-darwin-arm64.tar.gz"
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
