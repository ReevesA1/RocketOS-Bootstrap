$processes = Get-Process conky -ErrorAction SilentlyContinue
if ($processes.Count -gt 1) {
  $processes | Select-Object -Skip 1 | Stop-Process
  Write-Host "conky-stop-multiple.ps1 `u{1F44D}" -ForegroundColor Green
}

