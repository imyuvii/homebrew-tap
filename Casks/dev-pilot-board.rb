cask "dev-pilot-board" do
  version "0.2.0"
  sha256 "7c15e992b531d4cbceb171aad6637155a3828990d6f845099ad2268cae210407"

  url "https://github.com/imyuvii/dev-pilot-board/releases/download/v#{version}/dev-pilot-board-#{version}.zip"
  name "Dev Pilot Board"
  desc "Menu-bar status board for Claude Code and GitHub Copilot CLI sessions"
  homepage "https://github.com/imyuvii/dev-pilot-board"

  app "dev-pilot-board-#{version}/Dev Pilot Board.app"

  caveats <<~EOS
    This is an unsigned test build. If macOS blocks the app on first open,
    clear the quarantine flag once:
      xattr -dr com.apple.quarantine "/Applications/Dev Pilot Board.app"

    On first launch, click "Set up hooks" in the app to connect
    Claude Code and Copilot CLI, then restart any running agent sessions.
  EOS
end
