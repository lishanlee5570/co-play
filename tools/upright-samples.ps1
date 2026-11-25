# Shared by build-bass.ps1 and build-web.ps1: the pizzicato double bass of VSCO 2 Community Edition
# (Versilian Studios, CC0, github.com/sgossner/VSCO-2-CE, Strings/Solo Contrabass/Pizz).
# Its file names are an octave below standard MIDI names (BKCtbss_Pizz_E0 sounds E1 = 41 Hz;
# "B2" sounds B2): checked by measuring each recording. Key = the standard MIDI note it sounds.
$UPRIGHT = @{
	28 = 'BKCtbss_Pizz_E0_v1_rr1.wav';  30 = 'BKCtbss_Pizz_F#0_v1_rr1.wav'; 31 = 'BKCtbss_Pizz_G0_v1_rr1.wav'
	34 = 'BKCtbss_Pizz_A#0_v1_rr1.wav'; 36 = 'BKCtbss_Pizz_C1_v1_rr1.wav';  38 = 'BKCtbss_Pizz_D1_v1_rr1.wav'
	40 = 'BKCtbss_Pizz_E1_v1_rr1.wav';  42 = 'BKCtbss_Pizz_F#1_v1_rr1.wav'; 44 = 'BKCtbss_Pizz_G#1_v1_rr1.wav'
	45 = 'BKCtbss_Pizz_A1_v1_rr1.wav';  47 = 'BKCtbss_Pizz_B2_v1_rr1.wav';  49 = 'BKCtbss_Pizz_C#2_v1_rr1.wav'
	52 = 'BKCtbss_Pizz_E2_v1_rr1.wav';  56 = 'BKCtbss_Pizz_G#2_v1_rr1.wav'
}

function Get-UprightSamples($dir) {
	New-Item -ItemType Directory -Force $dir | Out-Null
	$ProgressPreference = 'SilentlyContinue'
	foreach ($f in $UPRIGHT.Values) {
		$p = Join-Path $dir $f
		if (-not (Test-Path $p)) {
			Invoke-WebRequest -Uri ("https://raw.githubusercontent.com/sgossner/VSCO-2-CE/master/Strings/Solo%20Contrabass/Pizz/" + $f.Replace('#', '%23')) -OutFile $p -UseBasicParsing
		}
	}
}

# the recording nearest to a MIDI note (the lower one on a tie, so shifts go up)
function Nearest-Upright($m) {
	$best = $null
	foreach ($k in ($UPRIGHT.Keys | Sort-Object)) { if ($best -eq $null -or [math]::Abs($k - $m) -lt [math]::Abs($best - $m)) { $best = $k } }
	return $best
}

# dB that brings a recording's peak to -1 dBFS
function Upright-Gain($file) {
	$log = & ffmpeg -hide_banner -i $file -af volumedetect -f null NUL 2>&1 | Out-String
	if ($log -match 'max_volume: (-?[\d.]+) dB') { return [math]::Round(-1 - [double]$Matches[1], 1) }
	return 0
}
