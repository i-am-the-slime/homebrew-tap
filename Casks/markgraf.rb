cask "markgraf" do
  version "0.1.5"
  sha256 "a0345b1bea9f2c269b8fa237013df9532bf8f21e850ad2609107f55fc2f750a5"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.1.5/markgraf-darwin-arm64.tar.gz"
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
