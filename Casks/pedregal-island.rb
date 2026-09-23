cask "pedregal-island" do
  version "0.1.4"
  sha256 "e5b6a52c9370c5b7c6972aecacba816250877311412ff67b5e75f642b08d1404"

  url "https://github.com/i-am-the-slime/pedregal-island-releases/releases/download/v#{version}/Pedregal-Island-Mac-#{version}-arm64.zip"
  name "Pedregal Island"
  desc "Flashcard learning game set on Pedregal Island"
  homepage "https://github.com/i-am-the-slime/pedregal-island-releases"

  depends_on :macos

  app "Pedregal-Island-Mac/Pedregal Island.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine",
      "/Applications/Pedregal Island.app"]
  end
end
