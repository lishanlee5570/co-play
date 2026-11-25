# Serves the co-play folder at http://localhost:8765/ (this computer only), for testing the web
# shell in a browser tab. Opening web\index.html straight from disk works too.
# Usage: powershell -File serve.ps1 [port]
param([int]$Port = 8765)

$root = Split-Path $PSScriptRoot -Parent
$types = @{ '.html' = 'text/html; charset=utf-8'; '.js' = 'text/javascript; charset=utf-8'; '.wav' = 'audio/wav'; '.mp3' = 'audio/mpeg'; '.css' = 'text/css' }
$listener = New-Object Net.HttpListener
$listener.Prefixes.Add("http://localhost:$Port/")
$listener.Start()
Write-Host "co-play: http://localhost:$Port/web/index.html"
while ($listener.IsListening) {
	$c = $listener.GetContext()
	$path = [Uri]::UnescapeDataString($c.Request.Url.AbsolutePath).TrimStart('/')
	# the page loads its scripts by relative path, so / sends the browser to the page's own address
	if ($path -eq '') { $c.Response.Redirect('/web/index.html'); $c.Response.Close(); continue }
	$file = [IO.Path]::GetFullPath((Join-Path $root $path))
	if ($file.StartsWith($root) -and (Test-Path $file -PathType Leaf)) {
		$bytes = [IO.File]::ReadAllBytes($file)
		$type = $types[[IO.Path]::GetExtension($file).ToLower()]
		$c.Response.ContentType = $(if ($type) { $type } else { 'application/octet-stream' })
		$c.Response.Headers.Add('Cache-Control', 'no-store')
		$c.Response.OutputStream.Write($bytes, 0, $bytes.Length)
	} else { $c.Response.StatusCode = 404 }
	$c.Response.Close()
}
