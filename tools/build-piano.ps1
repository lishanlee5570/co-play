# Rebuilds ..\piano.wav from the Salamander Grand Piano mp3s hosted by Tone.js (CC BY 3.0).
# Layout: stereo, 44.1 kHz, MIDI 24..96 (C1..C7), 8000 ms per key — piano-voice.maxpat relies on it.
# Needs ffmpeg on PATH. Usage: powershell -File build-piano.ps1 [download folder]
param([string]$Download = "$env:TEMP\salamander-dl")

$out = Join-Path $PSScriptRoot '..\piano.wav'
New-Item -ItemType Directory -Force $Download | Out-Null

# recordings exist every minor third: A0, C1, Ds1, Fs1, A1, ... C8
$names = @('A0')
for ($o = 1; $o -le 7; $o++) { $names += "C$o", "Ds$o", "Fs$o", "A$o" }
$names += 'C8'
$ProgressPreference = 'SilentlyContinue'
foreach ($n in $names) {
	$f = Join-Path $Download "$n.mp3"
	if (-not (Test-Path $f)) { Invoke-WebRequest -Uri "https://tonejs.github.io/audio/salamander/$n.mp3" -OutFile $f -UseBasicParsing }
}

# each key uses the nearest recording, resampled up or down by at most one semitone
$pcName = @{ 0 = 'C'; 3 = 'Ds'; 6 = 'Fs'; 9 = 'A' }
$inputs = @(); $filters = @(); $labels = ''
for ($m = 24; $m -le 96; $m++) {
	$s = [int]([math]::Round(($m - 21) / 3.0) * 3 + 21)
	$name = $pcName[$s % 12] + ([math]::Floor($s / 12) - 1)
	$i = $m - 24
	$inputs += '-i'; $inputs += (Join-Path $Download "$name.mp3")
	$rate = [math]::Round(44100 * [math]::Pow(2, ($m - $s) / 12.0))
	$filters += "[$i`:a]asetrate=$rate,aresample=44100,aformat=sample_rates=44100:channel_layouts=stereo,apad,atrim=0:8,afade=t=out:st=7.7:d=0.3[a$i]"
	$labels += "[a$i]"
}
$graph = ($filters -join ';') + ";$labels" + "concat=n=73:v=0:a=1,volume=5dB[out]"
$gf = Join-Path $env:TEMP 'piano_graph.txt'
[IO.File]::WriteAllText($gf, $graph)
& ffmpeg -hide_banner -loglevel error -y @inputs '-/filter_complex' $gf -map '[out]' -c:a pcm_s16le $out
Remove-Item $gf
