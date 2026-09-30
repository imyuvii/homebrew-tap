cask "dev-pilot-board" do
  version "0.3.2"
  sha256 "9ee474538d158ffa007cced02e6fe0e1af83848c0424ff22af80fca5fe910668"

  url "https://github.com/imyuvii/dev-pilot-board/releases/download/v#{version}/dev-pilot-board-#{version}.zip"
  name "Dev Pilot Board"
  desc "Menu-bar status board for Claude Code and GitHub Copilot CLI sessions"
  homepage "https://github.com/imyuvii/dev-pilot-board"

  depends_on :macos

  app "dev-pilot-board-#{version}/Dev Pilot Board.app"

  # Unsigned test build: clear the quarantine flag at install time so
  # Gatekeeper's "could not verify" dialog never appears.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/Dev Pilot Board.app"],
        must_succeed: false
  end

  caveats <<~EOS
    On first launch, click "Set up hooks" in the app to connect
    Claude Code and Copilot CLI, then restart any running agent sessions.
  EOS
end
