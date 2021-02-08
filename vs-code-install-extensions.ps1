$extensions =
    "vspacecode.vspacecode",
    "vspacecode.whichkey",
    "exodiusstudios.comment-anchors", # Comment Anchors
    "ms-azuretools.vscode-docker", # Docker
    "kahole.magit", # edamagit
    "bodil.file-browser", # File Browser
    "eamodio.gitlens", # Git Lens
    "ms-vscode.powershell", # PowerShell
    "rebornix.ruby", # Ruby
    "castwide.solargraph", # Solargraph for Ruby
    "connorshea.vscode-ruby-test-adapter", # Ruby Test Adapter
    "misogi.ruby-rubocop", # Rubocop support
    "gencer.html-slim-scss-css-class-completion", # SCSS Everywhere
    "aliariff.slim-lint", # Slim Lint
    "hbenl.vscode-test-explorer", # Test Explorer UI
    "pavlitsky.yard", # YARD Documenter
    "aaron-bond.better-comments", # Better Comments
    "craigmaslowski.erb", # support of erb
    "jacobdufault.fuzzy-search", # fuzzy search
    "azemoh.one-monokai", # One Monokai
    "ms-vscode-remote.remote-wsl", # WSL
    "vayan.haml",
    "sianglim.slim",
    "vscodevim.vim", # Vim emulation
    "emmanuelbeziat.vscode-great-icons"

$cmd = "code --list-extensions"
Invoke-Expression $cmd -OutVariable output | Out-Null
$installed = $output -split "\s"

foreach ($ext in $extensions) {
    if ($installed.Contains($ext)) {
        Write-Host $ext "already installed." -ForegroundColor Gray
    } else {
        Write-Host "Installing" $ext "..." -ForegroundColor White
        code --install-extension $ext
    }
}
