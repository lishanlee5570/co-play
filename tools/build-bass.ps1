# Rebuilds ..\bass.wav (the pop styles' bass) from the electric bass mp3s of tonejs-instruments (CC BY 3.0).
# Layout: mono, 44.1 kHz, MIDI 25..64 (C#1..E4), 6000 ms per key — bass-voice.maxpat relies on it.
# Needs ffmpeg on PATH. Usage: powershell -File build-bass.ps1 [download folder]
param([string]$Download = "$env:TEMP\bass-dl")

$out = Join-Path $PSScriptRoot '..\bass.wav'
New-Item -ItemType Directory -Force $Download | Out-Null

# recordings exist every minor third: C#1, E1, G1, A#1, C#2 ... C#5 (named Cs, E, G, As)
$pcName = @{ 1 = 'Cs'; 4 = 'E'; 7 = 'G'; 10 = 'As' }
$ProgressPreference = 'SilentlyContinue'
for ($m = 25; $m -le 73; $m += 3) {
	$n = $pcName[$m % 12] + ([math]::Floor($m / 12) - 1)
	$f = Join-Path $Download "$n.mp3"
	if (-not (Test-Path $f)) { Invoke-WebRequest -Uri "https://raw.githubusercontent.com/nbrosowsky/tonejs-instruments/master/samples/bass-electric/$n.mp3" -OutFile $f -UseBasicParsing }
}

# each key uses the nearest recording, resampled up or down by at most one semitone
$inputs = @(); $filters = @(); $labels = ''
for ($m = 25; $m -le 64; $m++) {
	$s = [int]([math]::Round(($m - 25) / 3.0) * 3 + 25)
	$name = $pcName[$s % 12] + ([math]::Floor($s / 12) - 1)
	$i = $m - 25
	$inputs += '-i'; $inputs += (Join-Path $Download "$name.mp3")
	$rate = [math]::Round(44100 * [math]::Pow(2, ($m - $s) / 12.0))
	$filters += "[$i`:a]asetrate=$rate,aresample=44100,aformat=sample_rates=44100:channel_layouts=mono,apad,atrim=0:6,afade=t=out:st=5.7:d=0.3[a$i]"
	$labels += "[a$i]"
}
$graph = ($filters -join ';') + ";$labels" + "concat=n=40:v=0:a=1[out]"
$gf = Join-Path $env:TEMP 'bass_graph.txt'
[IO.File]::WriteAllText($gf, $graph)
& ffmpeg -hide_banner -loglevel error -y @inputs '-/filter_complex' $gf -map '[out]' -c:a pcm_s16le $out
Remove-Item $gf