cask "dev-pilot-board" do
  version "0.3.1"
  sha256 "597026dc941c80e2806bcf72f0fadf887e5caa5a3d92362e734ed59b9fb17b72"

  url "https://github.com/imyuvii/dev-pilot-board/releases/download/v#{version}/dev-pilot-board-#{version}.zip"
  name "Dev Pilot Board"
  desc "Menu-bar status board for Claude Code and GitHub Copilot CLI sessions"
  homepage "https://github.com/imyuvii/dev-pilot-board"

  app "dev-pilot-board-#{version}/Dev Pilot Board.app"

  # Unsigned test build: clear the quarantine flag at install time so
  # Gatekeeper's "could not verify" dialog never appears.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Dev Pilot Board.app"],
                   sudo: false
  end

  caveats <<~EOS
    On first launch, click "Set up hooks" in the app to connect
    Claude Code and Copilot CLI, then restart any running agent sessions.
  EOS
end
