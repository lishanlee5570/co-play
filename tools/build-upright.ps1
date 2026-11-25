# Rebuilds ..\upright.wav (the jazz styles' bass) from the pizzicato double bass of VSCO 2 Community Edition (Versilian Studios, CC0).
# Layout: mono, 44.1 kHz, MIDI 25..64 (C#1..E4), 6000 ms per key — upright-voice.maxpat relies on it.
# Needs ffmpeg on PATH. Usage: powershell -File build-upright.ps1 [download folder]
param([string]$Download = "$env:TEMP\upright-dl")

$out = Join-Path $PSScriptRoot '..\upright.wav'
. (Join-Path $PSScriptRoot 'upright-samples.ps1')
Get-UprightSamples $Download

# each key uses the nearest recording, resampled up or down; every recording is brought to the
# same peak level and starts at its attack
$inputs = @(); $filters = @(); $labels = ''
for ($m = 25; $m -le 64; $m++) {
	$s = Nearest-Upright $m
	$i = $m - 25
	$inputs += '-i'; $inputs += (Join-Path $Download $UPRIGHT[$s])
	$rate = [math]::Round(44100 * [math]::Pow(2, ($m - $s) / 12.0))
	$gain = Upright-Gain (Join-Path $Download $UPRIGHT[$s])
	$filters += "[$i`:a]silenceremove=start_periods=1:start_threshold=-50dB,volume=${gain}dB,asetrate=$rate,aresample=44100,aformat=sample_rates=44100:channel_layouts=mono,apad,atrim=0:6,afade=t=out:st=5.7:d=0.3[a$i]"
	$labels += "[a$i]"
}
$graph = ($filters -join ';') + ";$labels" + "concat=n=40:v=0:a=1[out]"
$gf = Join-Path $env:TEMP 'upright_graph.txt'
[IO.File]::WriteAllText($gf, $graph)
& ffmpeg -hide_banner -loglevel error -y @inputs '-/filter_complex' $gf -map '[out]' -c:a pcm_s16le $out
Remove-Item $gf
