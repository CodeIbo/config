function prompt {
  $user = [System.Environment]::UserName
  $path = (Get-Location).Path
  return "[$user][$path] : "
}