# Builds ..\drums.wav for drum-voice.maxpat from the VCSL one-shots (CC0, see drum-samples.ps1).
# Layout: mono, 44.1 kHz, MIDI 36..51, 3000 ms per note; notes without a recording are silent.
# Needs ffmpeg on PATH. Usage: powershell -File build-drums.ps1 [download folder]
param([string]$Download = "$env:TEMP\drums-dl")

$out = Join-Path $PSScriptRoot '..\drums.wav'
. (Join-Path $PSScriptRoot 'drum-samples.ps1')
Get-DrumSamples $Download

$inputs = @('-f', 'lavfi', '-i', 'anullsrc=r=44100:cl=mono'); $filters = @(); $labels = ''; $n = 1
for ($m = 36; $m -le 51; $m++) {
	$i = $m - 36
	if ($DRUMS.ContainsKey($m)) {
		$inputs += '-i'; $inputs += (Join-Path $Download $DRUMS[$m][0])
		$filters += "[$n`:a]" + (Drum-Filter (Join-Path $Download $DRUMS[$m][0]) $DRUMS[$m][2]) + ",apad,atrim=0:3[a$i]"
		$n++
	} else {
		$filters += "[0:a]atrim=0:3,asetpts=N/SR/TB[a$i]"
	}
	$labels += "[a$i]"
}
# the silent source feeds several slots
$silent = 16 - $DRUMS.Count
$split = "[0:a]asplit=$silent" + ((0..($silent - 1) | ForEach-Object { "[s$_]" }) -join '')
$k = 0
for ($j = 0; $j -lt $filters.Count; $j++) { if ($filters[$j].StartsWith('[0:a]')) { $filters[$j] = $filters[$j].Replace('[0:a]', "[s$k]"); $k++ } }
$graph = $split + ';' + ($filters -join ';') + ";$labels" + "concat=n=16:v=0:a=1[out]"
$gf = Join-Path $env:TEMP 'drums_graph.txt'
[IO.File]::WriteAllText($gf, $graph)
& ffmpeg -hide_banner -loglevel error -y @inputs '-/filter_complex' $gf -map '[out]' -c:a pcm_s16le $out
Remove-Item $gf
