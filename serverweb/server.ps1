
if (Get-Command "node" -ErrorAction SilentlyContinue) {
    Write-Host "Node.js est déjà installé."
} else {
    Write-Host "Node.js n'est pas installé. Installation en cours..."

    if (-not (Get-Command "choco" -ErrorAction SilentlyContinue)) {
        Set-ExecutionPolicy Bypass -Scope Process -Force;
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));
    }

    choco install nodejs -y
}

node -v
npm -v

npm init -y

npm install express

Start-Process -NoNewWindow node ./server.js

Write-Host "Le serveur est accessible à l'adresse http://localhost"