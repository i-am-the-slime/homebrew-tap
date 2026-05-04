cask "markgraf" do
  version "0.1.1"
  sha256 "35b43b556464727bc49149197dcad43466f02d9198424fe5fcdbf82273a4cdc7"

  url "https://github.com/i-am-the-slime/homebrew-tap/releases/download/v0.1.1/markgraf-darwin-arm64.tar.gz"
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
