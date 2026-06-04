cask "markgraf" do
  version "0.0.22"
  sha256 "b1b02b380b8491ee385276562c6885480d3593415804120963ee1a002b5a8b5f"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.0.22/markgraf-darwin-arm64.tar.gz"
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
