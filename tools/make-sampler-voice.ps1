# Writes a poly~ voice that plays one key's slot of a sample buffer: <Buffer>.wav holds MIDI <Low>..<High>,
# <SlotMs> per key, mono or stereo. Used for piano-voice.maxpat and bass-voice.maxpat:
#   make-sampler-voice.ps1 -Out ..\piano-voice.maxpat -Buffer piano -Low 24 -High 96 -SlotMs 8000 -Stereo -ReleaseMs 250 -Gain 0.45 -Note "..."
#   make-sampler-voice.ps1 -Out ..\bass-voice.maxpat  -Buffer bass  -Low 25 -High 64 -SlotMs 6000 -ReleaseMs 120 -Gain 0.6 -BrightBase 350 -BrightRange 1200 -Note "..."
#   drum-voice.maxpat: -Buffer drums -Low 36 -High 51 -SlotMs 3000 -ReleaseMs 2500 -Gain 0.5 (was 1: far too loud in the recordings)
# The tone filter opens from BrightBase Hz (soft notes) to BrightBase + BrightRange Hz (hardest notes).
param([string]$Out, [string]$Buffer, [int]$Low, [int]$High, [int]$SlotMs, [switch]$Stereo,
	[int]$ReleaseMs = 250, [double]$Gain = 0.45, [int]$BrightBase = 900, [int]$BrightRange = 12000, [string]$Note = '')

$boxes = New-Object System.Collections.ArrayList
$lines = New-Object System.Collections.ArrayList
function Box($id, $class, $text, $x, $y, $w, $ins, $outs, $types) {
	$b = [ordered]@{ id = $id; maxclass = $class; numinlets = $ins; numoutlets = $outs
		patching_rect = @([double]$x, [double]$y, [double]$w, 22.0) }
	if ($outs -gt 0) { $b.outlettype = @($types) }
	if ($text -ne $null) { $b.text = $text }
	[void]$boxes.Add(@{ box = $b })
}
function Line($from, $outlet, $to, $inlet) {
	[void]$lines.Add(@{ patchline = [ordered]@{ source = @($from, $outlet); destination = @($to, $inlet) } })
}
$inv = [Globalization.CultureInfo]::InvariantCulture
$len = $SlotMs - 50

Box 'in'       newobj  'in 1'                       30  20  30 0 1 @('')
Box 'unpack'   newobj  'unpack 0 0'                 30  55  70 1 2 @('int','int')
# a release arrives as "pitch 0": the velocity (sent first by unpack) closes the gate,
# so only key presses restart the recording
Box 'nz'       newobj  '!= 0'                      120  55  35 2 1 @('int')
Box 'gate'     newobj  'gate 1'                     30  80  45 2 1 @('')
# pitch -> slot start and end in ms -> position ramp at normal speed
Box 'clip'     newobj  "clip $Low $High"            30 105  70 3 1 @('')
Box 'start'    newobj  "expr (`$i1-$Low)*$SlotMs."  30 130 120 1 1 @('')
Box 'tff'      newobj  't f f'                      30 165  40 1 2 @('float','float')
Box 'end'      newobj  "+ $len."                    80 195  55 2 1 @('float')
Box 'pack'     newobj  'pack 0. 0.'                 30 225  70 2 1 @('')
Box 'posmsg'   message "`$1, `$2 $len"              30 255  90 2 1 @('')
Box 'pos'      newobj  'line~'                      30 290  40 2 2 @('signal','bang')
if ($Stereo) { Box 'play' newobj "play~ $Buffer 2"  30 325  85 2 3 @('signal','signal','bang') }
else         { Box 'play' newobj "play~ $Buffer 1"  30 325  85 2 2 @('signal','bang') }
# velocity -> loudness; 0 means key released
Box 'sel'      newobj  'sel 0'                     260  95  45 2 2 @('bang','')
Box 'tlbl'     newobj  't l b l'                   300 130  60 1 3 @('','bang','')
Box 'curve'    newobj  ('expr pow($f1/127.\, 1.5)*' + $Gain.ToString($inv)) 300 165 170 1 1 @('')
Box 'ampmsg'   message '$1 3'                      300 195  40 2 1 @('')
Box 'offmsg'   message "0. $ReleaseMs"             200 195  50 2 1 @('')
Box 'amp'      newobj  'line~'                     250 290  40 2 2 @('signal','bang')
# soft notes darker, hard notes brighter
Box 'bright'   newobj  ("expr $BrightBase. + pow(`$f1/127.\, 2)*$BrightRange.") 480 165 200 1 1 @('')
Box 'lp'       newobj  'onepole~ 8000.'             30 360  90 2 1 @('signal')
Box 'mul'      newobj  '*~'                         30 395  35 2 1 @('signal')
Box 'out'      newobj  'out~ 1'                     30 430  45 1 0 @()
if ($Stereo) {
	Box 'lpR'  newobj  'onepole~ 8000.'            140 360  90 2 1 @('signal')
	Box 'mulR' newobj  '*~'                        140 395  35 2 1 @('signal')
	Box 'outR' newobj  'out~ 2'                    140 430  45 1 0 @()
}
# voice bookkeeping for poly~
Box 'busy'     message '1'                         420 165  25 2 1 @('')
Box 'stop'     message 'stop'                      370 165  35 2 1 @('')
Box 'delay'    newobj  "delay $($ReleaseMs + 20)"  370 225  65 2 1 @('bang')
Box 'free'     message '0'                         370 255  25 2 1 @('')
Box 'thispoly' newobj  'thispoly~'                 370 290  60 1 1 @('int')
Box 'note'     comment $Note                       150  20 480 1 0 @()

Line 'in' 0 'unpack' 0
Line 'unpack' 1 'nz' 0
Line 'nz' 0 'gate' 0
Line 'unpack' 0 'gate' 1
Line 'gate' 0 'clip' 0
Line 'clip' 0 'start' 0
Line 'start' 0 'tff' 0
Line 'tff' 1 'end' 0
Line 'end' 0 'pack' 1
Line 'tff' 0 'pack' 0
Line 'pack' 0 'posmsg' 0
Line 'posmsg' 0 'pos' 0
Line 'pos' 0 'play' 0
Line 'play' 0 'lp' 0
Line 'lp' 0 'mul' 0
Line 'tlbl' 0 'bright' 0
Line 'bright' 0 'lp' 1
Line 'amp' 0 'mul' 1
Line 'mul' 0 'out' 0
if ($Stereo) {
	Line 'play' 1 'lpR' 0
	Line 'lpR' 0 'mulR' 0
	Line 'bright' 0 'lpR' 1
	Line 'amp' 0 'mulR' 1
	Line 'mulR' 0 'outR' 0
}
Line 'unpack' 1 'sel' 0
Line 'sel' 1 'tlbl' 0
Line 'tlbl' 2 'busy' 0
Line 'tlbl' 1 'stop' 0
Line 'tlbl' 0 'curve' 0
Line 'curve' 0 'ampmsg' 0
Line 'ampmsg' 0 'amp' 0
Line 'sel' 0 'offmsg' 0
Line 'offmsg' 0 'amp' 0
Line 'sel' 0 'delay' 0
Line 'stop' 0 'delay' 0
Line 'delay' 0 'free' 0
Line 'free' 0 'thispoly' 0
Line 'busy' 0 'thispoly' 0

$patch = [ordered]@{ patcher = [ordered]@{
	fileversion = 1
	appversion = [ordered]@{ major = 9; minor = 1; revision = 3; architecture = 'x64'; modernui = 1 }
	classnamespace = 'box'
	rect = @(80.0, 80.0, 720.0, 500.0)
	gridsize = @(15.0, 15.0)
	boxes = $boxes
	lines = $lines
} }
[IO.File]::WriteAllText($Out, ($patch | ConvertTo-Json -Depth 12), (New-Object Text.UTF8Encoding $false))
