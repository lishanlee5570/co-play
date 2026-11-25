# Shared by build-drums.ps1 and build-web.ps1: drum one-shots from VCSL (Versilian Community Sample
# Library, CC0, github.com/michaelwillis/VCSL). Orchestral percussion standing in for a jazz kit:
# a suspended cymbal hit with a stick is the ride. Key = the drum note comp.js sends.
$DRUMS = @{
	36 = @('kick.wav',    'Membranophones/Struck Membranophones/Bass Drum 1/BDrumNew_hit_v3_rr1_Sum.wav', 0.9)
	37 = @('rim.wav',     'Membranophones/Struck Membranophones/Snare Drum, Modern 1/Snare2_stick_v1_rr1_Mid.wav', 0.5)
	38 = @('snare.wav',   'Membranophones/Struck Membranophones/Snare Drum, Modern 1/Snare2_HitSN_v5_rr1_Mid.wav', 1.0)
	42 = @('hat.wav',     'Idiophones/Struck Idiophones/Hi-Hat Cymbal/HiHat_HitC_v2_rr1_Mid.wav', 0.6)
	44 = @('pedal.wav',   'Idiophones/Struck Idiophones/Hi-Hat Cymbal/HiHat_Close_rr1_Mid.wav', 0.5)
	46 = @('openhat.wav', 'Idiophones/Struck Idiophones/Hi-Hat Cymbal/HiHat_HitO_rr1_Mid.wav', 2.0)
	51 = @('ride.wav',    'Idiophones/Struck Idiophones/Suspended Cymbal 1/susCymb1_hit_stick_mp1.wav', 2.8)
}
# [2] is how many seconds of each recording are kept (the end fades out)

function Get-DrumSamples($dir) {
	New-Item -ItemType Directory -Force $dir | Out-Null
	$ProgressPreference = 'SilentlyContinue'
	foreach ($d in $DRUMS.Values) {
		$p = Join-Path $dir $d[0]
		if (-not (Test-Path $p)) {
			Invoke-WebRequest -Uri ("https://raw.githubusercontent.com/michaelwillis/VCSL/master/" + [uri]::EscapeUriString($d[1])) -OutFile $p -UseBasicParsing
		}
	}
}

# ffmpeg filter for one recording: from its attack, peak at -1 dBFS, cut to its length with a fade
function Drum-Filter($file, $seconds) {
	$log = & ffmpeg -hide_banner -i $file -af volumedetect -f null NUL 2>&1 | Out-String
	$gain = 0
	if ($log -match 'max_volume: (-?[\d.]+) dB') { $gain = [math]::Round(-1 - [double]$Matches[1], 1) }
	$fade = [math]::Min(0.3, $seconds / 3)
	$inv = [Globalization.CultureInfo]::InvariantCulture
	return ("silenceremove=start_periods=1:start_threshold=-50dB,volume={0}dB,aresample=44100,aformat=sample_rates=44100:channel_layouts=mono,atrim=0:{1},afade=t=out:st={2}:d={3}" -f
		$gain.ToString($inv), $seconds.ToString($inv), ($seconds - $fade).ToString($inv), $fade.ToString($inv))
}
