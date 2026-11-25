autowatch = 1;
inlets = 1;
outlets = 14;

// outlets: 0 piano notes [pitch vel ms delay], 1 status text, 2 drum notes [note vel ms], 3 big beat display,
// 4 the chord the system is using, e.g. G/B, 5 bass notes [pitch vel ms delay],
// 6 a rotation angle (radians) for one qubit, asking for a measurement that decides the next bar,
// 7 the boldness whenever the system or the keyboard's knob changes it,
// 8 which bass plays the bass notes, on every style change: 0 electric bass (pop styles), 1 double bass (jazz styles),
// 9 "end" when an ending (finish) has played its final chord and the system has stopped,
// 10 the taught keyboard controls in words, 11 the same as numbers "knob finish accept..." (see setcontrols),
// 12 the big display's mood: proposal, accepted, back, none (for its colour),
// 13 the sound recorder (sfrecord~): "open <file>.wav", 1 when a take starts, 0 when it stops.
// delay (ms) lets a note sound a little after its tick, so the parts don't all land on the grid.

// 12 steps per beat, so straight eighths, swung eighths and sixteenths all land on the grid.
var SPB = 12;
var KICK = 36, RIM = 37, SNARE = 38, HAT = 42, PEDAL_HAT = 44, OPEN_HAT = 46, RIDE = 51;

function B(t, k, d) { return { t: t, k: k, d: d }; }
function C(t, d) { return { t: t, d: d }; }
function D(t, n, v) { return { t: t, n: n, v: v }; }
function every(step, beats, n, v) {
	var out = [];
	for (var t = 0; t < beats - 1e-6; t += step) out.push(D(t, n, v));
	return out;
}
function join() {
	var out = [];
	for (var i = 0; i < arguments.length; i++) out = out.concat(arguments[i]);
	return out;
}

var SW = 2 / 3;
function SWING_RIDE(v) {
	return [D(0, RIDE, v), D(1, RIDE, v + 8), D(1 + SW, RIDE, v - 12), D(2, RIDE, v), D(3, RIDE, v + 8), D(3 + SW, RIDE, v - 12)];
}

// each style: patterns for three density levels [sparse, medium, full]
var STYLES = [
	{
		name: "流行 8 Beat", en: "Pop 8 Beat", beats: 4, voicing: "triad", swing: false,
		bass: [
			[B(0, "r", 4)],
			[B(0, "r", 2), B(2, "r", 2)],
			[B(0, "r", 1), B(1.5, "r", 0.5), B(2, "f", 1), B(3, "r", 0.5), B(3.5, "o", 0.5)]
		],
		comp: [
			[C(0, 4)],
			[C(0, 2), C(2, 2)],
			[C(0, 1), C(1, 0.5), C(1.5, 1), C(2.5, 0.5), C(3, 1)]
		],
		drums: [
			join([D(0, KICK, 90)], every(1, 4, HAT, 40)),
			join([D(0, KICK, 95), D(2, KICK, 85), D(1, SNARE, 80), D(3, SNARE, 80)], every(0.5, 4, HAT, 50)),
			join([D(0, KICK, 100), D(2, KICK, 90), D(2.5, KICK, 75), D(1, SNARE, 90), D(3, SNARE, 90), D(3.5, OPEN_HAT, 55)],
				every(0.5, 3.5, HAT, 58))
		]
	},
	{
		name: "流行抒情", en: "Pop Ballad", beats: 4, voicing: "triad", swing: false,
		bass: [
			[B(0, "r", 4)],
			[B(0, "r", 2), B(2, "f", 2)],
			[B(0, "r", 2), B(2, "f", 1.5), B(3.5, "r", 0.5)]
		],
		comp: [
			[C(0, 4)],
			{ arp: 1, d: 1.6 },
			{ arp: 0.5, d: 1.2 }
		],
		drums: [
			every(1, 4, HAT, 35),
			join([D(0, KICK, 80), D(2, RIM, 55)], every(1, 4, HAT, 42)),
			join([D(0, KICK, 85), D(2.5, KICK, 70), D(1, SNARE, 70), D(3, SNARE, 70)], every(0.5, 4, HAT, 45))
		]
	},
	{
		name: "摇滚", en: "Rock", beats: 4, voicing: "power", swing: false,
		bass: [
			[B(0, "r", 2), B(2, "r", 2)],
			[B(0, "r", 1), B(1, "r", 1), B(2, "r", 1), B(3, "r", 1)],
			[B(0, "r", 0.5), B(0.5, "r", 0.5), B(1, "r", 0.5), B(1.5, "r", 0.5),
				B(2, "r", 0.5), B(2.5, "r", 0.5), B(3, "f", 0.5), B(3.5, "o", 0.5)]
		],
		comp: [
			[C(0, 4)],
			[C(0, 2), C(2, 1.5), C(3.5, 0.5)],
			[C(0, 0.5), C(0.5, 0.5), C(1, 0.5), C(1.5, 0.5), C(2, 0.5), C(2.5, 0.5), C(3, 0.5), C(3.5, 0.5)]
		],
		drums: [
			join([D(0, KICK, 95), D(2, KICK, 90), D(1, SNARE, 85), D(3, SNARE, 85)], every(1, 4, HAT, 50)),
			join([D(0, KICK, 100), D(2, KICK, 95), D(1, SNARE, 95), D(3, SNARE, 95)], every(0.5, 4, HAT, 60)),
			join([D(0, OPEN_HAT, 70), D(0, KICK, 105), D(2, KICK, 95), D(2.5, KICK, 85), D(1, SNARE, 100), D(3, SNARE, 100)],
				every(0.5, 4, HAT, 65).slice(1))
		]
	},
	{
		name: "16 Beat", beats: 4, voicing: "triad", swing: false,
		bass: [
			[B(0, "r", 2), B(2, "r", 2)],
			[B(0, "r", 0.75), B(1.5, "r", 0.5), B(2, "f", 0.75), B(2.75, "f", 0.25), B(3.5, "r", 0.5)],
			[B(0, "r", 0.75), B(0.75, "r", 0.25), B(1.5, "r", 0.5), B(2, "f", 0.75), B(2.75, "f", 0.25), B(3.5, "r", 0.25), B(3.75, "o", 0.25)]
		],
		comp: [
			[C(0, 2), C(2, 2)],
			[C(0, 0.5), C(0.75, 0.5), C(1.5, 0.5), C(2.5, 0.5), C(3.25, 0.5)],
			[C(0, 0.25), C(0.75, 0.25), C(1.5, 0.25), C(2, 0.25), C(2.75, 0.25), C(3.5, 0.25)]
		],
		drums: [
			join([D(0, KICK, 90), D(2, KICK, 85), D(1, SNARE, 80), D(3, SNARE, 80)], every(0.5, 4, HAT, 45)),
			join([D(0, KICK, 95), D(1.75, KICK, 75), D(2, KICK, 85), D(1, SNARE, 85), D(3, SNARE, 85)], every(0.25, 4, HAT, 42)),
			join([D(0, KICK, 100), D(1.75, KICK, 80), D(2, KICK, 90), D(2.75, KICK, 75), D(1, SNARE, 95), D(3, SNARE, 95),
				D(3.5, OPEN_HAT, 55)], every(0.25, 3.5, HAT, 48))
		]
	},
	{
		name: "华尔兹 3/4", en: "Waltz 3/4", beats: 3, voicing: "triad", swing: false,
		bass: [
			[B(0, "r", 3)],
			[B(0, "r", 1)],
			[B(0, "r", 1), B(2, "f", 1)]
		],
		comp: [
			[C(0, 3)],
			[C(1, 0.8), C(2, 0.8)],
			{ arp: 0.5, d: 1 }
		],
		drums: [
			[D(0, KICK, 80), D(1, HAT, 40), D(2, HAT, 40)],
			[D(0, KICK, 85), D(1, RIM, 50), D(2, RIM, 50), D(1, HAT, 45), D(2, HAT, 45)],
			join([D(0, KICK, 90), D(1, RIM, 55), D(2, RIM, 55)], every(0.5, 3, HAT, 45))
		]
	},
	{
		// jazz comping: short stabs, the Charleston (1, and of 2), anticipations on the and of 4
		name: "爵士 Swing", en: "Jazz Swing", beats: 4, voicing: "rootless", swing: true, jazz: true,
		bass: [
			[B(0, "r", 2), B(2, "f", 2)],
			"walk",
			"walk"
		],
		// the chords hold on, so the harmony keeps sounding under the melody: under a busy melody
		// two long chords, otherwise the Charleston and anticipations, still held into the next hit
		comp: [
			[C(0, 1.8), C(2 + SW, 1.2)],
			[C(0, 1.4), C(1 + SW, 2.2)],
			[C(0, 1.4), C(1 + SW, 1.0), C(2 + SW, 0.8), C(3 + SW, 0.4)]
		],
		// the ride's "ding, ding-a, ding, ding-a" (1, 2, and of 2, 3, 4, and of 4) in every level,
		// 2 and 4 a little louder, the hi-hat pedal on 2 and 4; busier levels add a feathered
		// kick on every beat and snare comping
		drums: [
			join(SWING_RIDE(42), [D(1, PEDAL_HAT, 40), D(3, PEDAL_HAT, 40)]),
			join(SWING_RIDE(50), [D(1, PEDAL_HAT, 48), D(3, PEDAL_HAT, 48)], every(1, 4, KICK, 28)),
			join(SWING_RIDE(58), [D(1, PEDAL_HAT, 54), D(3, PEDAL_HAT, 54)], every(1, 4, KICK, 34), [D(1 + SW, SNARE, 34), D(3 + SW, SNARE, 40)])
		]
	},
	{
		name: "爵士抒情", en: "Jazz Ballad", beats: 4, voicing: "rootless", swing: true, jazz: true,
		bass: [
			[B(0, "r", 4)],
			[B(0, "r", 2), B(2, "f", 2)],
			[B(0, "r", 2), B(2, "f", 1), B(3, "t", 1)]
		],
		comp: [
			[C(0, 4)],
			[C(0, 2), C(2, 2)],
			[C(0, 1.5), C(1 + SW, 1.2), C(3, 1)]
		],
		drums: [
			every(1, 4, HAT, 30),
			join(every(1, 4, HAT, 38), [D(0, KICK, 50)]),
			join(every(1, 4, RIDE, 42), [D(1, HAT, 40), D(3, HAT, 40), D(0, KICK, 50)])
		]
	},
	{
		name: "Bossa Nova", beats: 4, voicing: "rootless", swing: false, jazz: true,
		bass: [
			[B(0, "r", 2), B(2, "f", 2)],
			[B(0, "r", 1.5), B(1.5, "f", 0.5), B(2, "f", 1.5), B(3.5, "r", 0.5)],
			[B(0, "r", 1.5), B(1.5, "f", 0.5), B(2, "f", 1.5), B(3.5, "r", 0.5)]
		],
		comp: [
			[C(0, 1), C(2, 1)],
			[C(0, 0.5), C(1.5, 0.5), C(2.5, 0.5)],
			[C(0, 0.5), C(1, 0.5), C(1.5, 0.5), C(2.5, 0.5), C(3.5, 0.5)]
		],
		drums: [
			join([D(0, KICK, 70), D(2, KICK, 65)], every(0.5, 4, HAT, 35)),
			join([D(0, KICK, 75), D(1.5, KICK, 60), D(2, KICK, 70), D(3.5, KICK, 60), D(0, RIM, 55), D(1.5, RIM, 55), D(3, RIM, 55)],
				every(0.5, 4, HAT, 40)),
			join([D(0, KICK, 80), D(1.5, KICK, 65), D(2, KICK, 75), D(3.5, KICK, 65), D(0, RIM, 60), D(1.5, RIM, 60), D(3, RIM, 60),
				D(2.5, RIM, 50)], every(0.5, 4, HAT, 45))
		]
	}
];

// level: how much room the bass and chords leave (0 sparse, 2 full) — goes down as the melody gets busier
// drumLevel: drum energy (0 light, 2 busy) — goes up with the melody
// display language: "en" in Max (the panel is in English for readers outside China), "zh" in the
// web shell (it sends "lang zh"). L(chinese, english) picks the text to show.
var LANG = "en";
function L(zh, en) { return LANG === "zh" ? zh : en; }
function lang(x) { LANG = String(x) === "zh" ? "zh" : "en"; }
function styleName(s) { return LANG === "zh" ? s.name : (s.en || s.name); }
function levelText(i) {
	return [L("你弹得密：鼓和贝斯加快，和弦让开", "Busy melody: drums and bass push, chords give way"),
		L("系统陪着你", "The band is with you"),
		L("你弹得少：鼓和贝斯放轻，和弦铺满", "Sparse melody: drums and bass ease off, chords fill in")][i];
}
var NAMES = ["C", "Db", "D", "Eb", "E", "F", "F#", "G", "Ab", "A", "Bb", "B"];

var styleIndex = 0;
var bpm = 90;
var running = false;
var countIn = 0;
var useDrums = true, usePiano = true, useBass = true;

// proposals: now and then the system offers another harmony for a bar. The player accepts it with
// the sustain pedal (it stays, and that kind of change becomes more likely); otherwise it goes back
// to the player's harmony halfway through the bar and that kind becomes less likely.
var boldness = 30;          // 0..100: how often, and how far from the original, the system proposes
var proposalArmed = false;  // decided at the barline, applied once the bar's chord is known
var proposal = null;        // { fromRoot, fromTones, kind, accepted }
var kept = null;            // an accepted change stays while the player's chord stays the same
var taste = {};             // kind -> weight learned from accepting / not accepting
var qbit = -1;              // the quantum measurement for the coming bar, -1 when none arrived
var lastDecision = "";      // how the last bar was decided, for the status line
var splitPoint = 60;

var step = 0;          // position inside the bar
var lastStep = 0;
var clock = 0;         // steps since start, never wraps
var root = -1;
var tones = [];
var pending = null;
var level = 2;
var drumLevel = 1;
var filling = false;
var fillQueue = [];
var restAnswered = false;

var userTimes = [];
// right-hand notes struck together (within a tick) mean the player is playing chords up there
var rhPressClock = -1e9, rhTogether = 0, lastRhChordClock = -1e9, rhChordHigh = -1;
var heldMelody = {};          // melody keys currently down
var lastMelodyClock = -1e9;   // last melody key press or release
var lastUserPitch = 72;
var userDirection = 1;

// auto harmony: when no real chord (3+ notes) has come from the left hand for a bar, chords
// come from what is played. Each bar is one chord segment in 3/4 and two (beats 1–2, 3–4) in 4/4.
// Single notes below the split count as bass notes: a strong hint for the chord root.
var keyRoot = 0;
// the left hand's chord is followed while it is held, or in the segment where it was pressed;
// a later single bass note hands the choice back to the harmoniser
var leftChordNow = false;      // the latest left-hand press formed a chord (3+ notes)
var lastLeftChordClock = -1e9;
var lastChordSeg = -1;
var seg = { index: 0, notes: [], bass: -1, bassPitch: 999, chosen: false };
// segments counted from the start (the count-in is a whole bar, so they line up with the bars)
var onsetSegs = {};        // segments that began with a key press (within 2 ticks of their start)
var lastInputSeg = -1;     // last segment with any key press
var holdStep = -1;         // segment start whose bass/chord waits for the player (at most one tick)
var holdTask = null;       // plays the held parts shortly after the player's notes arrive
var HOLD_GATHER_MS = 20;   // long enough for the notes of one struck chord to arrive

// what the left hand is doing decides which parts the system plays, so it never doubles it
var leftHeld = {};
var lastLeftLow = -1;          // lowest note of the latest left-hand press
var lastLeftHigh = -1;         // highest note of the latest left-hand press
var lastLeftNoteClock = -1e9;  // any key below the split
var earlyQueue = [];     // notes played just before the barline belong to the next bar

// diatonic chords of the major key: degree, tones, how readily a beginner's ear accepts it
var AUTO_CHORDS = [
	{ deg: 0, tones: [0, 4, 7], w: 1.0 },
	{ deg: 2, tones: [0, 3, 7], w: 0.55 },
	{ deg: 4, tones: [0, 3, 7], w: 0.25 },
	{ deg: 5, tones: [0, 4, 7], w: 0.9 },
	{ deg: 7, tones: [0, 4, 7], w: 0.9 },
	{ deg: 7, tones: [0, 4, 7, 10], w: 0.75 },
	{ deg: 9, tones: [0, 3, 7], w: 0.7 }
];

// the jazz styles harmonise with seventh chords, the 9ths, 11ths and 13ths (ext) of a melody
// fitting too; a secondary dominant or a borrowed chord comes in only on a note outside the key
var JAZZ_CHORDS = [
	{ deg: 0, tones: [0, 4, 7, 11], w: 1.0, ext: [2, 9] },
	{ deg: 2, tones: [0, 3, 7, 10], w: 0.85, ext: [2, 5] },
	{ deg: 4, tones: [0, 3, 7, 10], w: 0.4, ext: [5] },
	{ deg: 5, tones: [0, 4, 7, 11], w: 0.85, ext: [2, 6, 9] },
	{ deg: 7, tones: [0, 4, 7, 10], w: 0.95, ext: [2, 9] },
	{ deg: 9, tones: [0, 3, 7, 10], w: 0.85, ext: [2, 5] },
	{ deg: 11, tones: [0, 3, 6, 10], w: 0.45, ext: [5] },
	// needs: the tone outside the key (from the chord's root) that must be in the melody
	{ deg: 9, tones: [0, 4, 7, 10], w: 0.35, ext: [1, 8], needs: 4 },    // VI7 -> ii
	{ deg: 4, tones: [0, 4, 7, 10], w: 0.35, ext: [1, 8], needs: 4 },    // III7 -> vi
	{ deg: 2, tones: [0, 4, 7, 10], w: 0.35, ext: [2, 9], needs: 4 },    // II7 -> V
	{ deg: 11, tones: [0, 4, 7, 10], w: 0.3, ext: [1, 8], needs: 4 },    // VII7 -> iii
	{ deg: 0, tones: [0, 4, 7, 10], w: 0.3, ext: [2, 9], needs: 10 },    // I7 -> IV
	{ deg: 10, tones: [0, 4, 7, 10], w: 0.25, ext: [2, 9], needs: 0 },   // bVII7
	{ deg: 5, tones: [0, 3, 7, 10], w: 0.25, ext: [2], needs: 3 }        // iv m7
];
function autoTable() { return cur().jazz ? JAZZ_CHORDS : AUTO_CHORDS; }

// feel: dynamics follow the player, each bar varies a little, every 4 bars is a phrase
var barCount = -1;          // bars since the count-in ended
var playerVel = 85;         // running average of the player's key velocity
var PHRASE_ARC = [0.97, 1.0, 1.04, 1.0];
var MAJOR = [0, 2, 4, 5, 7, 9, 11];
var variant = { skipComp: -1, extraComp: -1, bassSwap: -1, passing: false, arpMode: 0 };

var lastBass = 43;
var voiceCenter = 55;
var approachUp = false;
var arpNotes = [];
var arpIndex = 0;

function cur() { return STYLES[styleIndex]; }
function barSteps() { return cur().beats * SPB; }

function tempo(n) { if (n > 0) bpm = n; }
function split(n) { splitPoint = n; }
function drums(n) { useDrums = n !== 0; }
function playpiano(n) { usePiano = n !== 0; }
function playbass(n) { useBass = n !== 0; }
function key(n) { keyRoot = ((n % 12) + 12) % 12; }
function bold(n) { boldness = Math.max(0, Math.min(100, n)); }

// boldness follows the player's answers: each accepted proposal makes the system a little bolder,
// each one left to go back makes it more careful. It drifts only between BOLD_FLOOR and BOLD_CEIL
// (a setting outside that range is left alone in that direction); outlet 7 reports the new value.
var autoBold = true;
var BOLD_STEP = 5, BOLD_FLOOR = 10, BOLD_CEIL = 90;
function autobold(n) { autoBold = n !== 0; }
function nudgeBold(dir) {
	if (!autoBold) return;
	if (dir > 0) boldness = Math.max(boldness, Math.min(BOLD_CEIL, boldness + BOLD_STEP));
	else boldness = Math.min(boldness, Math.max(BOLD_FLOOR, boldness - BOLD_STEP));
	outlet(7, boldness);
}

// the keyboard's controls ("cc value controller"), each taught once by moving or pressing it:
// - the boldness knob (the mod wheel, CC 1, until learnknob)
// - the finish knob (learnfinish): turned right down it ends the piece, back up it carries on;
//   until one is taught, the boldness knob turned right down does this
// - accept buttons (learnaccept, once per button; as many as she likes): pressing one accepts a proposal
var knobCC = 1, finishCC = -1, acceptCCs = {}, buttonDown = {};
var learning = "";   // "knob", "finish", "accept" or ""
function learnknob() { learning = "knob"; }
function learnfinish() { learning = "finish"; }
function learnaccept() { learning = "accept"; }

function cc(value, num) {
	if (num === 64) return;   // the sustain pedal accepts proposals (ctlin 64 in the patch)
	// the other pedal controllers: her M32 sends its pedal as CC 65
	if (num >= 65 && num <= 67 && !acceptCCs[num] && num !== knobCC && num !== finishCC) { pedal(value); return; }
	// a button sends 127 when pressed; a knob being turned sends the values in between. In Max her
	// boldness knob (CC 22) got taught as an accept button and stopped changing the boldness
	if (learning === "accept" && (num === knobCC || num === finishCC)) {
		say(L("这是" + (num === knobCC ? "大胆度" : "结束") + "旋钮，不能当接受按钮：请按一个按钮",
			"That is the " + (num === knobCC ? "boldness" : "finish") + " knob, not a button: press a button"), 2);
		return;
	}
	if (learning === "accept" && value === 127) {
		acceptCCs[num] = true;
		buttonDown[num] = true;
		learning = "";
		outlet(3, L("接受按钮：CC ", "Accept button: CC ") + num);
		controlsChanged();
		return;
	}
	if (learning === "knob" || learning === "finish") {
		delete acceptCCs[num];
		if (learning === "knob") { knobCC = num; if (finishCC === num) finishCC = -1; outlet(3, L("大胆度旋钮：CC ", "Boldness knob: CC ") + num); }
		else { finishCC = num; if (knobCC === num) knobCC = -1; outlet(3, L("结束旋钮：CC ", "Finish knob: CC ") + num); }
		learning = "";
		controlsChanged();
	}
	if (acceptCCs[num] && value > 0 && value < 127) {
		// it turned out to be a knob: not an accept button any more (and the boldness knob, if none is set)
		delete acceptCCs[num];
		delete buttonDown[num];
		if (knobCC < 0 && finishCC !== num) knobCC = num;
		controlsChanged();
		if (num !== knobCC) { say(L("CC " + num + " 是旋钮，不再当接受按钮", "CC " + num + " is a knob: no longer an accept button"), 2); return; }
	}
	if (acceptCCs[num]) {
		if (value > 63 && !buttonDown[num]) accept();
		buttonDown[num] = value > 63;
		return;
	}
	// what the knob did shows in the big text too: in Max she saw the knob in the Max window but
	// not in the boldness box, and couldn't tell which knob she had turned
	if (num === knobCC) {
		boldness = Math.round(value / 127 * 100);
		outlet(7, boldness);
		say(L("大胆度 ", "Boldness ") + boldness, 1);
	} else if (num === finishCC) say(value === 0 ? L("结束旋钮拧到底：4 小节后结束", "Finish knob down: the piece ends in 4 bars")
		: L("结束旋钮（拧到底 = 4 小节后结束）", "Finish knob (turn fully down = end in 4 bars)"), 1);
	else if (num !== 1) say(L("这个旋钮是 CC " + num + "，还没有设：要用它调大胆度，先点 learnknob 再转它",
		"Knob CC " + num + " is not set: for boldness, click learnknob, then turn it"), 2);
	if (num === finishCC || (finishCC < 0 && num === knobCC)) finishKnob(value);
}

// the taught controls are kept, so reopening the patch (or a reload of this script) doesn't forget
// them: outlet 10 shows them in words, outlet 11 sends "knob finish accept..." (the web page keeps
// that in the browser); in Max they are also written to co-play-controls.txt beside the patch
function controlsText() {
	var acc = [];
	for (var k in acceptCCs) acc.push("CC " + k);
	if (LANG !== "zh") return "Boldness knob: " + (knobCC >= 0 ? "CC " + knobCC : "not set") +
		"    Finish knob: " + (finishCC >= 0 ? "CC " + finishCC : "boldness knob turned down") +
		"    Accept buttons: " + (acc.length ? acc.join(", ") : "none (space bar / pedal work)");
	return "大胆度旋钮：" + (knobCC >= 0 ? "CC " + knobCC : "没有设") +
		"    结束旋钮：" + (finishCC >= 0 ? "CC " + finishCC : "用大胆度旋钮拧到底") +
		"    接受按钮：" + (acc.length ? acc.join("、") : "没有设（空格键 / 踏板可用）");
}
function controlsData() {
	var d = [knobCC, finishCC];
	for (var k in acceptCCs) d.push(parseInt(k, 10));
	return d;
}
function controlsChanged() {
	outlet(10, controlsText());
	outlet(11, controlsData());
	saveControls();
}
// restore: setcontrols knob finish accept... (-1 for none)
function setcontrols() {
	var a = arrayfromargs(arguments);
	if (a.length < 2) return;
	knobCC = a[0]; finishCC = a[1]; acceptCCs = {};
	for (var i = 2; i < a.length; i++) acceptCCs[a[i]] = true;
	if (!scriptLoading) outlet(10, controlsText());
}
// while the script itself is still loading its outlets don't exist yet ("bad outlet index 10")
var scriptLoading = false;
function showcontrols() { outlet(10, controlsText()); }

function controlsPath() {
	if (typeof max === "undefined" || !this.patcher || !this.patcher.filepath) return "";
	return String(this.patcher.filepath).replace(/[^\/\\:]*$/, "") + "co-play-controls.txt";
}
function saveControls() {
	try {
		var path = controlsPath();
		if (!path) return;
		var f = new File(path, "write", "TEXT");
		if (!f.isopen) return;
		f.eof = 0;
		f.writeline(controlsData().join(" "));
		f.close();
	} catch (e) {}
}
function loadControls() {
	try {
		var path = controlsPath();
		if (!path) return;
		var f = new File(path, "read", "TEXT");
		if (!f.isopen) return;
		var line = f.readline();
		f.close();
		if (!line) return;
		var parts = String(line).split(" "), nums = [];
		for (var i = 0; i < parts.length; i++) if (parts[i] !== "") nums.push(parseInt(parts[i], 10));
		setcontrols.apply(this, nums);
	} catch (e) {}
}
// Max calls loadbang when the patch opens
function loadbang() { loadControls(); showcontrols(); }

// right down: end the piece; back up again before the final chord: carry on
function finishKnob(value) {
	if (value === 0 && running && endAtBar < 0) { finish(); endByKnob = true; }
	else if (value > 12 && endByKnob && endAtBar >= 0 && !finalBar) { endAtBar = -1; endByKnob = false; showBeat(); }
}

// the result of the measurement requested on outlet 6: och.microqiskit outputs counts "1 1"
// (bitstring, then how often: one symbol, as in the QAC Toolkit's sample shuffler), which the
// patch splits with fromsymbol; either way the first character is the measured bit
function qresult() {
	var a = arrayfromargs(arguments);
	qbit = String(a[0]).charAt(0) === "1" ? 1 : 0;
}

function proposeChance() { return boldness / 100 * 0.6; }

// one qubit rotated so that it measures 1 with the proposal chance: P(1) = sin²(θ/2)
function requestMeasure() { outlet(6, 2 * Math.asin(Math.sqrt(proposeChance()))); }

function sameList(a, b) {
	if (a.length !== b.length) return false;
	for (var i = 0; i < a.length; i++) if (a[i] !== b[i]) return false;
	return true;
}

// the player's chord that a proposal (or an accepted change) replaced
function isReplaced(r, t) {
	return (proposal && r === proposal.fromRoot && sameList(t, proposal.fromTones)) ||
		(kept && r === kept.fromRoot && sameList(t, kept.fromTones));
}

// a harmony the player brings themselves ends any proposal
function endProposal() { proposal = null; kept = null; withdrawn = null; }

// changes by scale degree of the current chord: [new degree, tones, kind, tier]. Tier 1 is
// mild (relative chords, added 7ths), 2 further, 3 colourful (borrowed and dominant chords).
var SUBS = {
	0: [[9, [0, 3, 7], "I-vi", 1], [4, [0, 3, 7], "I-iii", 2], [0, [0, 4, 7, 10], "I-I7", 3]],
	2: [[2, [0, 3, 7, 10], "ii-ii7", 1], [5, [0, 4, 7], "ii-IV", 2]],
	4: [[0, [0, 4, 7], "iii-I", 1], [7, [0, 4, 7], "iii-V", 2]],
	5: [[2, [0, 3, 7], "IV-ii", 1], [5, [0, 4, 7, 11], "IV-IVmaj7", 2], [5, [0, 3, 7], "IV-iv", 3]],
	7: [[7, [0, 4, 7, 10], "V-V7", 1], [4, [0, 3, 7], "V-iii", 2], [2, [0, 3, 7, 10], "V-ii7", 3]],
	9: [[5, [0, 4, 7], "vi-IV", 1], [0, [0, 4, 7], "vi-I", 2], [4, [0, 4, 7, 10], "vi-III7", 3]]
};

// jazz only: the tritone substitute for V7
var JAZZ_SUBS = { 7: [[1, [0, 4, 7, 10], "V-bII7", 2]] };

// in jazz a proposed triad becomes a seventh chord: maj7 on I and IV, m7 on minor chords, 7 otherwise
function jazzTones(deg, t) {
	if (!cur().jazz || t.length !== 3) return t;
	if (t[1] === 3) return [0, 3, 7, 10];
	return deg === 0 || deg === 5 ? [0, 4, 7, 11] : [0, 4, 7, 10];
}

// the melody notes now sounding must be chord tones of the new chord, or its 9th or 13th
function melodyNow() {
	var notes = [];
	for (var k in heldMelody) notes.push(parseInt(k, 10));
	if (clock - lastMelodyClock < SPB) notes.push(lastUserPitch);
	// when the melody leads, the notes on the beat so far in this half bar count too
	if (autoMode() && seg) for (var i = 0; i < seg.notes.length; i++) if (seg.notes[i].strong) notes.push(seg.notes[i].pc);
	return notes;
}
// the harsh kind of wrong note: not in the chord and a semitone above one of its tones
// (C over Em, C over G7, F over Am)
function avoidNote(pitch, r, t) {
	var rel = ((pitch - r) % 12 + 12) % 12;
	return !contains(t, rel) && contains(t, (rel + 11) % 12);
}
function melodyClashes(r, t) {
	var notes = melodyNow();
	for (var i = 0; i < notes.length; i++) if (avoidNote(notes[i], r, t)) return true;
	return false;
}
function melodyFits(r, t) {
	var notes = melodyNow();
	for (var i = 0; i < notes.length; i++) {
		var rel = ((notes[i] - r) % 12 + 12) % 12, ok = rel === 2 || rel === 9;
		for (var j = 0; j < t.length; j++) if (t[j] === rel) ok = true;
		if (!ok) return false;
	}
	return true;
}

function startProposal() {
	proposalArmed = false;
	if (root < 0 || kept || proposal) return;
	var deg = (root - keyRoot + 12) % 12;
	var opts = (SUBS[deg] || []).concat(cur().jazz && JAZZ_SUBS[deg] ? JAZZ_SUBS[deg] : []);
	if (!opts.length) return;
	var maxTier = boldness < 34 ? 1 : boldness < 67 ? 2 : 3;
	var cands = [], total = 0;
	for (var i = 0; i < opts.length; i++) {
		var r = (keyRoot + opts[i][0]) % 12, t = jazzTones(opts[i][0], opts[i][1]);
		if (opts[i][3] > maxTier || !melodyFits(r, t)) continue;
		var w = taste[opts[i][2]] || 1;
		cands.push({ root: r, tones: t, kind: opts[i][2], w: w });
		total += w;
	}
	if (!cands.length) return;
	var pick = Math.random() * total, c = cands[0];
	for (i = 0; i < cands.length; i++) { pick -= cands[i].w; if (pick <= 0) { c = cands[i]; break; } }
	// until: the end of this bar (clock - step is the bar's first tick), less the 2 early ticks
	proposal = { fromRoot: root, fromTones: tones, kind: c.kind, accepted: false, until: clock - step + barSteps() - 2 };
	applyChord(c.root, c.tones);
	showBeat();
}

// feedback she can hear and see (she said accepting gave her no feedback she could notice):
// - accepting: the band confirms the new chord at once (the piano strikes it again, fuller and
//   rolled, the bass plays its root, a cymbal and the kick) and the big display turns green
// - a proposal that went back at beat 3 can still be accepted for one bar: it comes back
// - pressing accept with nothing to accept says so
// outlet 12 is the display's mood: "proposal" (orange), "accepted" (green), "back", "none"
var withdrawn = null, notice = "", noticeUntil = -1, mood = "", accepts = 0, declines = 0;
function say(text, beats) { notice = text; noticeUntil = clock + beats * SPB; showBeat(); }
function setMood(m) { if (m !== mood) { mood = m; outlet(12, m); } }

// the sustain pedal (or the accept button): keep the proposal
function accept() {
	if (proposal && proposal.accepted) { say(L("已经接受了：", "Already accepted: ") + chordLabel(root, tones), 1); return; }
	if (!proposal && withdrawn && clock < withdrawn.until) {
		// changed her mind after it went back: bring it back
		proposal = withdrawn.proposal;
		proposal.until = clock - step + barSteps() - 2;
		applyChord(withdrawn.root, withdrawn.tones);
		taste[proposal.kind] = Math.min(4, (taste[proposal.kind] || 1) / 0.85);
		declines--;
		withdrawn = null;
	}
	if (!proposal) { say(L("现在没有提议可以接受", "No proposal to accept right now"), 1); return; }
	proposal.accepted = true;
	accepts++;
	taste[proposal.kind] = Math.min(4, (taste[proposal.kind] || 1) * 1.4);
	nudgeBold(1);
	confirmDue = true;
	remember(proposal);
	chartMark("✓");
	var change = chordLabel(proposal.fromRoot, proposal.fromTones) + " → " + chordLabel(root, tones);
	say(L("✓ 接受了：" + change + "（记住了：这里以后会自动这样换）",
		"✓ Accepted: " + change + " (remembered for this spot)"), barSteps() / SPB);
}

// "no" right away (the reject button, the x key, or the pitch-bend strip pushed down), 2026-11-19:
// - a proposal: back to the harmony it replaced, now rather than at beat 3 (she can still change
//   her mind within the bar)
// - a change from memory, or one she accepted in this bar: undone and forgotten
// - nothing proposed, the system's own chord for the melody: another chord at once, and this
//   chord is used less in this place from now on
// Her own left-hand chord stays hers.
var rejectedHere = {};   // roots turned down in this bar
var disliked = {};       // "previous chord>root" turned down; lasts as long as the memory
function backTo(r, t) {
	pending = [r, t];
	proposal = null;
	kept = null;
	withdrawn = null;
	confirmDue = true;
	chartMark("✗");
}
function rejectChord() {
	if (!running || countIn > 0 || listening() || finalBar || root < 0) { say(L("现在没有和弦可以拒绝", "No chord to reject right now"), 1); return; }
	if (!autoMode()) { say(L("这是你左手弹的和弦，系统不改", "That is your left-hand chord: the band keeps it"), 1); return; }
	var was = chordLabel(root, tones);
	rejectedHere[root] = true;
	disliked[barPrevious() + ">" + root] = true;
	var b = bestAuto(seg.notes, seg.bass);
	pending = [b.root, b.tones];
	confirmDue = true;
	declines++;
	chartMark("✗");
	say(L("✗ 不要 " + was + "：换成 " + chordLabel(b.root, b.tones) + "（这里以后少用它）",
		"✗ Not " + was + ": now " + chordLabel(b.root, b.tones) + " (used less here from now on)"), barSteps() / SPB);
}
var barRejected = false;   // she said no in this bar: nothing new is offered until the next one
function forgetChange(fromLabel) {
	for (var k in memory) {
		var end = ">" + fromLabel;
		if (k.slice(-end.length) === end && memory[k].root === root && sameList(memory[k].tones, tones)) delete memory[k];
	}
}
function reject() {
	var was = root >= 0 ? chordLabel(root, tones) : "";
	armedBar = -1;
	barRejected = true;
	if (proposal && proposal.remembered) {
		delete memory[proposal.key];
		backTo(proposal.fromRoot, proposal.fromTones);
		say(L("✗ 忘掉了：这里不再换成 ", "✗ Forgotten: this spot no longer changes to ") + was, barSteps() / SPB);
		return;
	}
	if (proposal && proposal.accepted) {
		delete memory[placeKey(proposal.fromRoot, proposal.fromTones)];
		taste[proposal.kind] = Math.max(0.3, (taste[proposal.kind] || 1) * 0.85);
		accepts = Math.max(0, accepts - 1);
		declines++;
		backTo(proposal.fromRoot, proposal.fromTones);
		say(L("✗ 取消接受：这里不再换成 ", "✗ Acceptance undone: this spot no longer changes to ") + was, barSteps() / SPB);
		return;
	}
	if (!proposal && kept) {
		var fromChord = chordLabel(kept.fromRoot, kept.fromTones);
		forgetChange(fromChord);
		backTo(kept.fromRoot, kept.fromTones);
		say(L("✗ 不要 " + was + "：回到 " + fromChord, "✗ Not " + was + ": back to " + fromChord), barSteps() / SPB);
		return;
	}
	if (!proposal) { rejectChord(); return; }
	var from = chordLabel(proposal.fromRoot, proposal.fromTones);
	withdrawProposal();
	say(L("✗ 不要：回到 " + from + "（这种换法以后会少出现）", "✗ No: back to " + from + " (this change will come less often)"), barSteps() / SPB);
}

// the sustain pedal (CC 64) accepts when pressed. Some pedals are wired the other way round
// (0 when pressed), so the first value it sends - which is a press - tells which way is down.
var pedalDownHigh = -1, pedalState = -1;
function pedal(v) {
	var high = v >= 64 ? 1 : 0;
	if (pedalDownHigh < 0) pedalDownHigh = high;
	if (high === pedalState) return;
	pedalState = high;
	if (high === pedalDownHigh) accept();
}

// the pitch-bend strip (7-bit, 64 in the middle; it springs back when let go): pushed up = accept,
// pushed down = reject; it answers once per push and again after coming back to the middle
var bendArmed = true;
function bend(v) {
	if (v > 40 && v < 88) { bendArmed = true; return; }
	if (!bendArmed) return;
	bendArmed = false;
	if (v >= 88) accept();
	else reject();
}

// the band takes the accepted chord on together - on the next eighth note, not the moment she
// presses (a hit between the beats sounded like the band stumbling, 2026-11-03 recording);
// the kick only on a beat
var confirmDue = false;
function onEighth(s) { return s % SPB === 0 || s % SPB === (cur().swing ? 8 : 6); }
function confirmChord() {
	if (!running) return;
	var g = dyn(), v = voicing();
	if (usePiano && v.length) {
		if (v.length >= 2 && v[v.length - 2] + 12 <= lastUserPitch - 3) v.push(v[v.length - 2] + 12);
		for (var n = 0; n < v.length; n++) send(v[n], jitter(80 * g, 3), 2, 4 + n * 12);
	}
	if (playsBass(leftRole())) sendBass(place(root, bassBottom(), bassTop(), lastBass), jitter((bassBase() + 6) * g, 3), 2);
	hit(RIDE, jitter(72 * g, 3));
	if (step % SPB === 0) hit(KICK, jitter(66 * g, 3));
}

// not accepted by the middle of the bar: back to the player's harmony
function withdrawProposal() {
	if (!proposal || proposal.accepted) return;
	taste[proposal.kind] = Math.max(0.3, (taste[proposal.kind] || 1) * 0.85);
	withdrawn = { proposal: proposal, root: root, tones: tones, until: clock + barSteps() };
	declines++;
	chartMark("✗");
	pending = [proposal.fromRoot, proposal.fromTones];
	var back = chordLabel(proposal.fromRoot, proposal.fromTones);
	say(L("没接受，回到 " + back + "（一小节内按接受，还能换回来）",
		"Not accepted: back to " + back + " (accept within a bar to bring it back)"), barSteps() / SPB);
	proposal = null;
	nudgeBold(-1);
}

// at each barline: an accepted change carries on; then measure (or roll) whether to propose
function decideProposal() {
	// under her left-hand chord an accepted change stays while she holds that chord; when the melody
	// leads, each bar chooses again (a kept Em had stayed five bars under a melody on C and B)
	if (proposal) {
		if (proposal.accepted && !autoMode()) kept = { fromRoot: proposal.fromRoot, fromTones: proposal.fromTones };
		proposal = null;
	}
	if (kept && autoMode()) kept = null;
	var bit;
	if (qbit >= 0) { bit = qbit; lastDecision = "quantum"; }
	else { bit = Math.random() < proposeChance() ? 1 : 0; lastDecision = "chance"; }
	qbit = -1;
	proposalArmed = bit === 1 && boldness > 0 && barCount >= 2 && !kept && endAtBar < 0;
	armedBar = proposalArmed ? barCount : -1;
}
// the bar a proposal was decided for: when her chord for the bar arrives a moment after the
// barline, the proposal made on the old chord ended, so one is made again on hers
var armedBar = -1;

// ---------- the song's memory: accepted changes come back by themselves ----------
// Where she accepted a change, the same place in the music gets it again without asking: the
// place is the chord the previous bar started on and the chord this bar would start on (her
// harmony), e.g. "G7>C". So a tune played twice gets her changes the second time round, and the
// harmony grows out of her decisions. "No" (strip down / reject) on such a change forgets it.
var memory = {}, remembered = 0, prevBarChord = "", barChord = "";
function placeKey(fromRoot, fromTones) { return prevBarChord + ">" + chordLabel(fromRoot, fromTones); }
function remember(p) {
	if (p.remembered) return;
	memory[placeKey(p.fromRoot, p.fromTones)] = { root: root, tones: tones, kind: p.kind };
}
function forget() {
	memory = {};
	disliked = {};
	say(L("记忆清空了：之前接受的换法不会再自动出现", "Memory cleared: earlier choices will not come back"), 2);
}
function memorySize() { var n = 0; for (var k in memory) n++; return n; }

// at the start of each bar (before any new proposal): note the bar's own chord, and put back a
// change she accepted here before
var barOpen = false;      // this bar's start has been handled
var barWaiting = false;   // the melody leads and this bar's first note has not come yet
function barStart() {
	prevBarChord = barChord;
	barOpen = true;
	barWaiting = autoMode() && !seg.chosen;
	noteBarChord();
}
// the chord before this bar, also while the notes of a new bar arrive just ahead of its first tick
function barPrevious() { return barOpen ? prevBarChord : barChord; }
// the melody's first note of the bar (or beat 2 without one): now the bar's chord is known, so
// memory and a proposal can act on it
function melodyArrived() {
	barWaiting = false;
	if (listening() || finalBar || root < 0) return;
	noteBarChord();
	if (!proposal && !kept && armedBar === barCount) { armedBar = -1; startProposal(); }
}
// also when her chord for this bar arrives a moment late (within half a beat of the barline)
function noteBarChord() {
	var fromRoot = kept ? kept.fromRoot : root, fromTones = kept ? kept.fromTones : tones;
	barChord = chordLabel(fromRoot, fromTones);
	if (kept || proposal || endAtBar >= 0 || barWaiting || barRejected) return;
	var key = prevBarChord + ">" + barChord, m = memory[key];
	if (!m) return;
	// a change she kept comes back only if it does not fight what the melody is playing now
	if (autoMode() && melodyClashes(m.root, m.tones)) return;
	proposal = { fromRoot: root, fromTones: tones, kind: m.kind, accepted: true, remembered: true, key: key,
		until: clock - step + barSteps() - 2 };
	applyChord(m.root, m.tones);
	proposalArmed = false;
	remembered++;
	chartMark("↺");
	var again = barChord + " → " + chordLabel(root, tones);
	say(L("↺ 按你之前的选择：" + again + "（不要了就往下推弯音条）",
		"↺ Your earlier choice: " + again + " (reject to undo)"), barSteps() / SPB);
}

// ---------- the chord chart of this take ----------
// bar by bar, the chords the band played, with ✓ where she accepted a change, ↺ where the system
// put one back from memory and ✗ where a proposal went back (or she said no)
var chart = [];
function chartBar() {
	if (!running || countIn > 0 || barCount < 0) return null;
	if (!chart[barCount]) chart[barCount] = { chords: [], marks: [] };
	return chart[barCount];
}
function chartChord(label) {
	var b = chartBar();
	if (!b || b.chords[b.chords.length - 1] === label) return;
	// a change made right at the barline (a proposal, or one put back from memory) replaces the
	// chord shown a moment before: that one wasn't played
	if (b.chords.length === 1 && step <= 2) b.chords[0] = label;
	else b.chords.push(label);
}
function chartMark(m) {
	var b = chartBar();
	if (b && !contains(b.marks, m)) b.marks.push(m);
}
function stamp(d, sep) {
	function two(n) { return (n < 10 ? "0" : "") + n; }
	return d.getFullYear() + two(d.getMonth() + 1) + two(d.getDate()) + sep + two(d.getHours()) + two(d.getMinutes()) + two(d.getSeconds());
}
function charttext() {
	var lines = LANG === "zh"
		? ["co-play 共同即兴　" + take.when + "　风格：" + take.styleName + "　调：1 = " + NAMES[take.key] + "　速度：" + take.bpm,
			"接受 " + accepts + " 次 · 没接受 " + declines + " 次 · 按记忆自动换 " + remembered + " 次", ""]
		: ["co-play take  " + take.when + "  Style: " + take.styleName + "  Key: " + NAMES[take.key] + "  Tempo: " + take.bpm,
			"Accepted " + accepts + " · Not accepted / rejected " + declines + " · Came back from memory " + remembered, ""];
	var row = [];
	for (var i = 0; i < chart.length; i++) {
		var b = chart[i] || { chords: [], marks: [] };
		row.push((i + 1) + ". " + (b.chords.length ? b.chords.join(" ") : "-") + (b.marks.length ? " " + b.marks.join("") : ""));
		if (row.length === 4 || i === chart.length - 1) { lines.push("| " + row.join(" | ") + " |"); row = []; }
	}
	lines.push("", L("✓ 你接受的换法　↺ 按你之前的选择自动换　✗ 没接受 / 你说不要（第 1 小节只有鼓）",
		"✓ change I accepted   ↺ came back from memory   ✗ not accepted / rejected   (bar 1 is drums only)"));
	return lines.join("\n");
}

// ---------- the recording of this take: every note, hers and the band's, as a MIDI file ----------
// Track 1 her playing, 2 the band's piano, 3 bass, 4 drums (channel 10). The tempo is the one at
// the start; bar 1 of the file is the count-in. In MuseScore (free) the file opens as a score.
// Times are kept in steps of the band's own clock, not milliseconds: the band's notes sit on the
// step they were played on (without the small human delays and rolled chords), hers between the
// steps, and the file puts everything on 16ths (triplet 8ths in the jazz styles). With
// milliseconds the score came out as 32nds, tuplets and tiny rests ("like garbage", she said).
var take = { t0: 0, bpm: 90, beats: 4, events: [], when: "", file: "", styleName: "", key: 0, jazz: false };
function msNow() { return new Date().getTime(); }
function takename() { return take.file; }
var tickClock = 0, tickMs = 0;   // the step being played and when it started (set in bang)
function stepNow() {
	return tickClock + Math.max(0, Math.min(SPB, (msNow() - tickMs) / (60000 / bpm / SPB)));
}
function recNote(track, ch, pitch, vel, steps) {
	if (!running) return;
	var at = stepNow();
	take.events.push({ s: at, track: track, ch: ch, p: pitch, v: vel });
	if (steps > 0) take.events.push({ s: at + steps, track: track, ch: ch, p: pitch, v: 0 });
}
// the score's grid within a beat (in steps of 1/12 beat)
function gridStep(s) {
	var grid = take.jazz ? [0, 4, 6, 8, 12] : [0, 3, 6, 9, 12];
	var beat = Math.floor(s / SPB), r = s - beat * SPB, best = 0;
	for (var i = 1; i < grid.length; i++) if (Math.abs(grid[i] - r) < Math.abs(grid[best] - r)) best = i;
	return beat * SPB + grid[best];
}
function newTake() {
	var d = new Date();
	take = { t0: msNow(), bpm: bpm, beats: cur().beats, events: [], when: stamp(d, " ").replace(/^(\d{4})(\d{2})(\d{2}) (\d{2})(\d{2})(\d{2})$/, "$1-$2-$3 $4:$5"),
		file: "co-play-take-" + stamp(d, "-"), styleName: styleName(cur()), key: keyRoot, jazz: cur().jazz === true };
	tickClock = 0;
	tickMs = take.t0;
	chart = [];
	remembered = 0;
	barChord = "";
	prevBarChord = "";
}
function vlq(n, out) {
	var b = [n & 0x7f];
	while ((n >>= 7) > 0) b.unshift((n & 0x7f) | 0x80);
	for (var i = 0; i < b.length; i++) out.push(b[i]);
}
function chunk(type, data, out) {
	for (var i = 0; i < 4; i++) out.push(type.charCodeAt(i));
	var n = data.length;
	out.push((n >>> 24) & 255, (n >>> 16) & 255, (n >>> 8) & 255, n & 255);
	for (i = 0; i < data.length; i++) out.push(data[i]);
}
function metaText(type, text, out) {
	out.push(0, 0xff, type, text.length);
	for (var i = 0; i < text.length; i++) out.push(text.charCodeAt(i) & 0x7f);
}
function midibytes() {
	var PPQ = 480, out = [], i;
	out.push(0x4d, 0x54, 0x68, 0x64, 0, 0, 0, 6, 0, 1, 0, 5, PPQ >> 8, PPQ & 255);
	var t0 = [], us = Math.round(60000000 / take.bpm);
	metaText(3, "co-play " + take.when, t0);
	t0.push(0, 0xff, 0x51, 3, (us >> 16) & 255, (us >> 8) & 255, us & 255);
	t0.push(0, 0xff, 0x58, 4, take.beats, 2, 24, 8);
	t0.push(0, 0xff, 0x2f, 0);
	chunk("MTrk", t0, out);
	var names = ["", "Player", "Piano", "Bass", "Drums"], programs = [0, 0, 0, take.jazz ? 32 : 33, -1];
	for (var tr = 1; tr <= 4; tr++) {
		var evs = [];
		for (i = 0; i < take.events.length; i++) if (take.events[i].track === tr) evs.push(take.events[i]);
		evs.sort(function (a, b) { return a.s - b.s || a.v - b.v; });   // a note's end before a new start
		// onto the grid: every note at least one grid space long, a key struck again ends the one before
		var unit = take.jazz ? 4 : 3, onAt = {}, offAt = {}, notes = [];
		for (i = 0; i < evs.length; i++) {
			var q = gridStep(evs[i].s), p = evs[i].p;
			if (evs[i].v > 0) {
				if (offAt[p] !== undefined) q = Math.max(q, offAt[p]);
				if (onAt[p] !== undefined) {
					if (q <= onAt[p]) continue;   // struck twice in one grid space: one note
					notes.push({ q: q, p: p, v: 0 });
				}
				onAt[p] = q;
				notes.push({ q: q, p: p, v: evs[i].v });
			} else if (onAt[p] !== undefined) {
				offAt[p] = Math.max(q, onAt[p] + unit);
				notes.push({ q: offAt[p], p: p, v: 0 });
				delete onAt[p];
			}
		}
		for (var k in onAt) notes.push({ q: onAt[k] + unit, p: parseInt(k, 10), v: 0 });
		notes.sort(function (a, b) { return a.q - b.q || a.v - b.v; });
		var data = [], last = 0, ch = tr === 4 ? 9 : tr - 1;
		metaText(3, names[tr], data);
		if (programs[tr] >= 0) data.push(0, 0xc0 | ch, programs[tr]);
		for (i = 0; i < notes.length; i++) {
			var tick = Math.max(0, Math.round(notes[i].q * PPQ / SPB));
			vlq(Math.max(0, tick - last), data);
			last = Math.max(last, tick);
			data.push((notes[i].v > 0 ? 0x90 : 0x80) | ch, notes[i].p & 127, notes[i].v > 0 ? Math.min(127, notes[i].v) : 64);
		}
		data.push(0, 0xff, 0x2f, 0);
		chunk("MTrk", data, out);
	}
	return out;
}

// in Max each take is saved in the recordings folder beside the patch when it stops: the MIDI file,
// the chord chart, and (from the patch's sfrecord~, started on outlet 13) the sound. Max's js can't
// make a folder, so the folder comes with the project; without it the MIDI and chart go beside the patch
function patchFolder() {
	var path = controlsPath();
	return path ? path.replace(/[^\/\\:]*$/, "") : "";
}
function takeFolder() {
	var dir = patchFolder();
	return dir ? dir + "recordings/" : "";
}
var lastSaved = "";
function saveTake() {
	lastSaved = "";
	if (!take.events.length) return;
	var dir = takeFolder();
	if (!dir) return;
	try {
		var f = new File(dir + take.file + ".mid", "write", "Midi");
		if (!f.isopen) { dir = patchFolder(); f = new File(dir + take.file + ".mid", "write", "Midi"); }
		if (f.isopen) {
			// Max's File writes at most 16384 bytes per call (the first saved take was cut off there)
			var bytes = midibytes();
			f.eof = 0;
			for (var i = 0; i < bytes.length; i += 4096) f.writebytes(bytes.slice(i, i + 4096));
			f.close();
		}
		var c = new File(dir + take.file + ".txt", "write", "TEXT");
		if (c.isopen) { c.eof = 0; c.writestring(charttext()); c.close(); }
		lastSaved = L("　已保存 ✓", "   saved ✓");
		// the big text is too narrow for the path, so it goes on the status line under it
		var folder = dir.replace(/\//g, "\\");
		outlet(1, LANG === "zh"
			? ["已保存", "文件夹 " + folder + "　文件名 " + take.file + "（.wav 录音 / .mid 谱，用 MuseScore 打开 / .txt 和弦谱）"]
			: ["Saved", "folder " + folder + "   file " + take.file + " (.wav audio / .mid score, opens in MuseScore / .txt chord chart)"]);
		post(L("co-play 保存了这次演奏：", "co-play saved this take: ") + dir + take.file + "\n");
		post(charttext() + "\n");
	} catch (e) { lastSaved = L("　保存失败：", "   could not save: ") + e; }
}

// ending: "finish" (the button, or the boldness knob turned right down) ends the piece 4 bars
// later. The bars before go on as usual, the last of them with a drum fill; on the downbeat of
// the 4th bar the whole band plays one long final chord (the key's tonic, or the player's own
// left-hand chord), and when that bar is over the system stops and outlet 9 says "end".
// Turning the knob back up before the final chord cancels an ending the knob started.
var endAtBar = -1, finalBar = false, endByKnob = false;
function finish() {
	if (!running || endAtBar >= 0) return;
	endAtBar = Math.max(barCount, 0) + 4;
	endByKnob = false;
	showBeat();
}
function endingFill() { return endAtBar >= 0 && barCount === endAtBar - 1; }

function finalChord() {
	finalBar = true;
	fillQueue = [];
	filling = false;
	drumFillQueue = [];
	endProposal();
	if (leftRole() !== "chord") applyChord(keyRoot, cur().jazz ? [0, 4, 7, 11] : [0, 4, 7]);
	var beats = cur().beats, g = dyn();
	strike(voicing(), jitter(88 * g, 3), beats);
	if (playsBass(leftRole())) sendBass(place(root, bassBottom(), bassTop(), lastBass), jitter((bassBase() + 8) * g, 3), beats);
	hit(KICK, jitter(95 * g, 3));
	hit(OPEN_HAT, jitter(100 * g, 3));
	if (cur().jazz) hit(RIDE, jitter(90 * g, 3));
}

function style(n) {
	styleIndex = Math.max(0, Math.min(STYLES.length - 1, n));
	if (step >= barSteps()) step = 0;
	arpNotes = [];
	outlet(8, cur().jazz ? 1 : 0);
}

function start() {
	running = true;
	step = 0;
	clock = 0;
	rejectedHere = {};
	barOpen = false;
	barWaiting = false;
	barRejected = false;
	countIn = cur().beats;
	confirmDue = false;
	withdrawn = null;
	notice = "";
	accepts = 0;
	declines = 0;
	endAtBar = -1;
	finalBar = false;
	userTimes = [];
	drumFillQueue = [];
	gapFilled = true;
	heldMelody = {};
	lastMelodyClock = -1e9;
	barCount = -1;
	variant = { skipComp: -1, extraComp: -1, bassSwap: -1, passing: false, arpMode: 0 };
	level = 2;
	drumLevel = 0;
	fillQueue = [];
	filling = false;
	restAnswered = false;
	// a chord pressed before start counts as left-hand playing until the count-in ends
	leftChordNow = root >= 0;
	lastLeftChordClock = root >= 0 ? barSteps() : -1e9;
	lastChordSeg = root >= 0 ? barSteps() / segLength() : -1;
	newSegment(0);
	onsetSegs = {};
	lastInputSeg = -1;
	holdStep = -1;
	earlyQueue = [];
	proposalArmed = false;
	proposal = null;
	kept = null;
	qbit = -1;
	lastDecision = "";
	newTake();
	var dir = takeFolder();
	if (dir) { outlet(13, ["open", dir + take.file + ".wav"]); outlet(13, 1); }
}

function stop() {
	var wasRunning = running;
	outlet(13, 0);
	running = false;
	fillQueue = [];
	endAtBar = -1;
	finalBar = false;
	// after an ending the patch stops once more (outlet 9 "end" turns the play toggle off): the
	// message about the saved take stays
	if (wasRunning) saveTake();
	outlet(3, L("停止", "Stopped") + lastSaved);
}

function sameChord(r, t) {
	if (r !== root || t.length !== tones.length) return false;
	for (var i = 0; i < t.length; i++) if (t[i] !== tones[i]) return false;
	return true;
}

function applyChord(r, t) {
	root = r;
	tones = t;
	arpNotes = [];
	pending = null;
}

// a new chord takes effect on the next tick (about 1/12 beat), so a rolled chord
// that arrives note by note counts as one change instead of several
function chord() {
	var a = arrayfromargs(arguments);
	var r = a[0], t = a.slice(1);
	// two overlapping bass notes look like a power chord; while harmonising automatically
	// they are treated as bass notes (through played) rather than as a left-hand chord
	if (t.length < 3 && autoMode() && running) return;
	leftChordNow = true;
	lastLeftChordClock = clock;
	lastChordSeg = curSeg();
	// chord-name repeats the held chord on every melody note: that doesn't undo a proposal
	if (isReplaced(r, t)) { pending = null; return; }
	if (sameChord(r, t)) { pending = null; return; }
	endProposal();
	if (!running || countIn > 0 || root < 0) { applyChord(r, t); return; }
	pending = [r, t];
}

function anyLeftHeld() {
	for (var k in leftHeld) return true;
	return false;
}

// "chord": the left hand plays chords, so the system adds no chords and only a bass below them;
// "bass": the left hand plays single bass notes, so the system adds chords above them, no bass;
// "none": the system plays both
function leftRole() {
	if (root >= 0 && leftChordNow && clock - lastLeftChordClock <= barSteps()) return "chord";
	if (clock - lastLeftNoteClock <= barSteps()) return "bass";
	return "none";
}

// a key a little under the split that carries on the melody (a step or a leap up to a fifth from the last
// melody note, while the melody is going and no left-hand key is down) is melody, not a bass note:
// a C-major tune dipping to B3 under middle C had made every chord "/B" (2026-11-03 chart)
var dipKeys = {};
function melodyDip(p) {
	return !anyLeftHeld() && p >= splitPoint - 8 && Math.abs(p - lastUserPitch) <= 7 &&
		(anyHeld() || clock - lastMelodyClock <= 2 * SPB);
}

function played(pitch, velocity) {
	var low = pitch < splitPoint;
	if (low && velocity > 0 && melodyDip(pitch)) { dipKeys[pitch] = true; low = false; }
	else if (low && velocity <= 0 && dipKeys[pitch]) { delete dipKeys[pitch]; low = false; }
	recNote(1, 0, pitch, Math.max(0, velocity), 0);
	if (velocity <= 0) {
		if (low) delete leftHeld[pitch];
		else if (heldMelody[pitch]) { delete heldMelody[pitch]; lastMelodyClock = clock; }
		return;
	}
	var accent = velocity >= playerVel + 10;
	playerVel = playerVel * 0.75 + velocity * 0.25;
	if (running && countIn === 0) {
		var at2 = clock + 2;   // up to 2 ticks early counts as on time
		var id = Math.floor(at2 / segLength());
		lastInputSeg = id;
		if (at2 % segLength() <= 4) {
			onsetSegs[id] = true;
			delete onsetSegs[id - 8];
		}
		// the parts held at this segment start sound once the chord's notes have all arrived
		if (holdStep >= 0 && holdStep === step - 1 && typeof Task !== "undefined") {
			if (!holdTask) holdTask = new Task(releaseHold);
			holdTask.cancel();
			holdTask.schedule(HOLD_GATHER_MS);
		}
	}
	if (low) {
		lastLeftLow = anyLeftHeld() ? Math.min(lastLeftLow, pitch) : pitch;
		lastLeftHigh = anyLeftHeld() ? Math.max(lastLeftHigh, pitch) : pitch;
		leftHeld[pitch] = 1;
		lastLeftNoteClock = clock;
		// chord-name reports right after this if the keys now form a chord
		leftChordNow = false;
	} else {
		heldMelody[pitch] = 1;
		lastMelodyClock = clock;
		if (clock - rhPressClock <= 1) {
			rhTogether++;
			rhChordHigh = Math.max(rhChordHigh, pitch);
		} else {
			rhTogether = 1;
			rhChordHigh = pitch;
		}
		rhPressClock = clock;
		if (rhTogether >= 2) lastRhChordClock = clock;
		var gapBefore = userTimes.length ? clock - userTimes[userTimes.length - 1] : 1e9;
		userTimes.push(clock);
		gapFilled = false;
		shortFilled = false;
		if (running && countIn === 0) noteOnset();
		drummerReacts(pitch, velocity, accent, gapBefore);
		userDirection = pitch >= lastUserPitch ? 1 : -1;
		lastUserPitch = pitch;
		fillQueue = [];
		filling = false;
		restAnswered = false;
	}
	if (running && countIn === 0 && autoMode()) autoInput(pitch, low);
}

function releaseHold() {
	if (holdStep < 0 || !running) return;
	if (pending) applyChord(pending[0], pending[1]);
	if (root >= 0) playParts(holdStep, level === 0 ? 0.8 : 1);
	holdStep = -1;
	showBeat();
}

// the player is expected at a segment start if they played at the previous one,
// or at the same place in the previous bar (one chord per bar)
function expectsPlayer(segId) {
	var perBar = barSteps() / segLength();
	return onsetSegs[segId - 1] === true || onsetSegs[segId - perBar] === true;
}

function curSeg() { return Math.floor((clock + 2) / segLength()); }

function autoMode() { return root < 0 || !(leftChordNow && (anyLeftHeld() || lastChordSeg === curSeg())); }

function chordLabel(r, t) {
	var tone = {};
	for (var i = 0; i < t.length; i++) tone[t[i]] = true;
	if (tone[3] && tone[6]) return NAMES[r] + (tone[10] ? "m7b5" : "dim");
	var name = NAMES[r] + (tone[3] ? "m" : "");
	if (tone[10]) name += "7";
	else if (tone[11]) name += "maj7";
	else if (tone[9]) name += "6";
	return name;
}

function contains(list, x) {
	for (var j = 0; j < list.length; j++) if (list[j] === x) return true;
	return false;
}
function inTones(c, rel) { return contains(c.tones, rel); }
function isDominant() { return has(4) && has(10); }

// fit of a chord to the notes: chord tones help, extensions a little, other notes hurt, more so
// on the beat; a bass note on the root fits best, on another chord tone it is an inversion.
// In jazz a new bar likes to move round the circle of fifths (A-D-G-C-F-B-E), above all from a dominant.
function autoScore(c, notes, bass) {
	var r = (keyRoot + c.deg) % 12;
	var s = c.w * 1.5;
	for (var i = 0; i < notes.length; i++) {
		var rel = (notes[i].pc - r + 12) % 12;
		s += inTones(c, rel) ? (notes[i].strong ? 2 : 1.2)
			: c.ext && contains(c.ext, rel) ? (notes[i].strong ? 1 : 0.6)
			: (notes[i].strong ? (cur().jazz ? -3 : -1.5) : -0.5);
	}
	if (cur().jazz && root >= 0 && seg.index === 0 && r === (root + 5) % 12) s += isDominant() ? 2 : 0.3;
	if (bass >= 0) {
		var b = (bass - r + 12) % 12;
		s += b === 0 ? 2 : inTones(c, b) ? 1 : -2.5;
	}
	if (root >= 0) {
		var curDeg = (root - keyRoot + 12) % 12;
		if (curDeg === c.deg) s += 0.4;                       // staying put is easy on the ear
		if (curDeg === 7 && c.deg === 0) s += 0.6;            // V -> I
	}
	return s;
}

// a chord from outside the key comes in only when its outside tone is played (or it is already sounding)
function heard(c, notes) {
	if (c.needs === undefined) return true;
	var r = (keyRoot + c.deg) % 12;
	if (r === root && sameList(c.tones, tones)) return true;
	for (var i = 0; i < notes.length; i++) if ((notes[i].pc - r + 12) % 12 === c.needs) return true;
	return false;
}

function bestAuto(notes, bass) {
	var table = autoTable(), best = null, bestScore = -1e9, before = barPrevious();
	for (var i = 0; i < table.length; i++) {
		var r = (keyRoot + table[i].deg) % 12;
		if (rejectedHere[r] || !heard(table[i], notes)) continue;
		var s = autoScore(table[i], notes, bass);
		if (disliked[before + ">" + r]) s -= 3;
		if (s > bestScore) { bestScore = s; best = table[i]; }
	}
	if (!best) {
		// she has turned down every chord there is: start the choice over
		rejectedHere = {};
		return bestAuto(notes, bass);
	}
	return { root: (keyRoot + best.deg) % 12, tones: best.tones, score: bestScore };
}

function currentAutoScore(notes, bass) {
	if (root < 0) return -1e9;
	var table = autoTable();
	for (var i = 0; i < table.length; i++) {
		var c = table[i];
		if ((keyRoot + c.deg) % 12 === root && sameList(c.tones, tones)) return autoScore(c, notes, bass);
	}
	return -1e9;
}

function setAuto(r, t) {
	// within its own bar an accepted proposal isn't overridden by the harmoniser's second half
	if (isReplaced(r, t) || (proposal && proposal.accepted && clock < proposal.until)) { pending = null; return; }
	if (sameChord(r, t)) { pending = null; return; }
	endProposal();
	pending = [r, t];
}

function segLength() { return cur().beats === 4 ? 2 * SPB : barSteps(); }

function newSegment(index) {
	seg = { index: index, notes: [], bass: -1, bassPitch: 999, chosen: false };
}

// notes in the first beat of a segment (re)choose its chord, so a bass note that comes a moment
// after the melody note still counts; later notes only decide if the segment began with a rest.
// The first segment of a bar always takes the best chord; the second changes it only when
// another chord clearly fits better.
function autoInput(pitch, low) {
	var pos = step + 2;   // notes up to 2 ticks early belong to the coming beat
	if (pos >= barSteps()) { earlyQueue.push([pitch, low]); return; }
	var index = Math.floor(pos / segLength());
	if (index !== seg.index) newSegment(index);
	var inSeg = pos - index * segLength();
	var strong = pos % SPB <= 4;
	seg.notes.push({ pc: pitch % 12, strong: strong });
	if (low && pitch < seg.bassPitch) { seg.bassPitch = pitch; seg.bass = pitch % 12; }
	// a proposal, or a change from memory, gives way when the melody lands hard against it; a change
	// she accepted in this very bar stays, that was her decision
	var gaveWay = !low && strong && proposal && (!proposal.accepted || proposal.remembered) && avoidNote(pitch, root, tones);
	if (gaveWay) proposal = null;
	if (inSeg >= SPB && seg.chosen && !gaveWay) return;
	var b = bestAuto(seg.notes, seg.bass);
	if (index === 0 || root < 0 || gaveWay || b.score - currentAutoScore(seg.notes, seg.bass) >= 1) setAuto(b.root, b.tones);
	seg.chosen = true;
}

// called at every barline, before the next bar's first tick
function autoBarline() {
	newSegment(0);
	barOpen = false;
	barWaiting = false;
	barRejected = false;
	rejectedHere = {};
	var queue = earlyQueue;
	earlyQueue = [];
	if (!autoMode()) return;
	proposal = null;   // the melody chooses each new bar afresh, also for notes played just ahead of it
	var s = step;
	step = 0;
	for (var i = 0; i < queue.length; i++) autoInput(queue[i][0], queue[i][1]);
	step = s;
}

function has(x) {
	for (var i = 0; i < tones.length; i++) if (tones[i] === x) return true;
	return false;
}
function firstOf(order, fallback) {
	for (var i = 0; i < order.length; i++) if (has(order[i])) return order[i];
	return fallback;
}
function third() { return firstOf([4, 3, 5, 2], -1); }
function fifth() { return firstOf([7, 6, 8], 7); }
function seventh() { return firstOf([10, 11, 9], -1); }

function place(pc, lo, hi, near) {
	pc = ((pc % 12) + 12) % 12;
	var best = -1;
	for (var p = lo; p <= hi; p++) {
		if (p % 12 !== pc) continue;
		if (best < 0 || Math.abs(p - near) < Math.abs(best - near)) best = p;
	}
	return best;
}

// a scale step next to the root (the key's major scale), on the side nearer the last bass note,
// so the line walks into the root instead of jumping
function passingNote() {
	var rel = (root - keyRoot + 12) % 12, idx = -1;
	for (var i = 0; i < MAJOR.length; i++) if (MAJOR[i] === rel) idx = i;
	var target = place(root, bassBottom(), bassTop(), lastBass);
	if (idx < 0) return lastBass > target ? target + 1 : target - 1;
	var up = target + ((MAJOR[(idx + 1) % 7] - rel + 12) % 12);
	var down = target - ((rel - MAJOR[(idx + 6) % 7] + 12) % 12);
	return Math.abs(up - lastBass) <= Math.abs(down - lastBass) ? up : down;
}

function bassNote(kind) {
	var p;
	if (kind === "p") p = passingNote();
	else if (kind === "f") p = place(root + fifth(), bassBottom(), bassTop(), lastBass);
	else if (kind === "t") p = place(root + (third() < 0 ? fifth() : third()), bassBottom(), bassTop(), lastBass);
	else if (kind === "o") {
		// the octave jump only goes up while it stays in the bass register
		p = place(root, bassBottom(), bassTop(), lastBass);
		if (p + 12 <= BASS_HIGHEST) p += 12;
	}
	else if (kind === "a") {
		var target = place(root, bassBottom(), bassTop(), lastBass);
		p = approachUp ? target + 1 : target - 1;
		approachUp = !approachUp;
	} else p = place(root, bassBottom(), bassTop(), lastBass);
	if (kind !== "o") lastBass = p;
	return p;
}

// The bass is an electric bass (lowest recording C#1 = 25; E1 = 28 is its open low string) and
// stays low in a bass player's register: the line up to E2, octave jumps up to G2.
// Under left-hand chords it stays at least 3 semitones below their lowest note; around a
// left-hand bass note it may move up to a fifth above it. The span is 15 semitones, so every
// pitch class fits.
var BASS_TOP = 40, BASS_HIGHEST = 43;
function bassTop() {
	var role = leftRole();
	if (role === "none") return BASS_TOP;
	if (role === "bass") return Math.max(25 + 14, Math.min(BASS_TOP, lastLeftLow + 7));
	return Math.min(BASS_TOP, lastLeftLow - 3);
}
function bassBottom() { return Math.max(25, bassTop() - 14) + (leftRole() === "none" ? 1 : 0); }

// under left-hand chords the bass needs a full octave of room below them
function playsBass(role) { return role !== "chord" || lastLeftLow - 3 - 11 >= 25; }

// room for the system's chord between the left-hand chord and the melody
function compFits(role) { return role !== "chord" || (lastUserPitch - 3) - (lastLeftHigh + 2) >= 5; }

function voicingIntervals() {
	var t3 = third(), t5 = fifth(), t7 = seventh();
	var kind = cur().voicing;
	if (kind === "power") return [0, 7, 12];
	// jazz piano's rootless voicings (the bass has the root): 3-5-7-9 and 7-9-3-5 are inversions
	// of one another, and voicing() picks whichever lies nearer. Dominants: 3-13-7-9; those
	// leading to a minor chord (III7, VI7, VII7) take b13 and b9, so they stay in the key.
	if (kind === "rootless") {
		var rel = (root - keyRoot + 12) % 12;
		if (t3 === 3 && t5 === 6) return [3, 6, t7 >= 0 ? t7 : 9, 12];
		if (t7 === 10 && t3 === 4) return t5 === 8 || rel === 4 || rel === 9 || rel === 11 ? [4, 8, 10, 13] : [4, 9, 10, 14];
		if (t7 === 10 && t3 === 3) return rel === 4 ? [3, 7, 10, 12] : [3, 7, 10, 14];
		if (t7 === 10) return [t3 < 0 ? 5 : t3, 7, 10, 14];
		if (t7 === 11) return [t3 < 0 ? 5 : t3, 7, 11, 14];
		if (t3 >= 0) return [t3, 7, 9, 14];
		return [0, t5, 14];
	}
	var triad = [0, t3 < 0 ? t5 : t3, t5];
	if (t7 >= 0) triad.push(t7);
	return triad;
}

// stack the intervals upward, trying every inversion, and keep the one nearest the last voicing
// when no voicing puts its top note under the melody as a second voice, the usual one
var plainVoicing = false;
function voicingPlain() {
	plainVoicing = true;
	var v = voicing();
	plainVoicing = false;
	return v;
}

function voicing() {
	var ints = voicingIntervals();
	var power = cur().voicing === "power";
	var lo = power ? 40 : 48, hi = power ? 52 : 58;
	var center = power ? 45 : voiceCenter;
	// above the player's bass notes, or above the left-hand chord
	var role = leftRole();
	var floor = role === "bass" ? lastLeftLow + 3 : role === "chord" ? lastLeftHigh + 2 : 45;
	if (lo < floor) {
		lo = floor;
		hi = Math.max(hi, lo + 11);
		center = Math.max(center, lo + 4);
	}
	var best = null, bestDist = 1e9;
	var rotations = power ? 1 : ints.length;
	// second voice: the chord's top note a third (or a sixth) under the melody, so it moves with her
	var follow = !power && !plainVoicing && respondsWith("voice");
	for (var r = 0; r < rotations; r++) {
		var notes = [];
		for (var i = 0; i < ints.length; i++) {
			var pc = ((root + ints[(r + i) % ints.length]) % 12 + 12) % 12;
			if (notes.length === 0) notes.push(place(pc, lo, hi, center));
			else {
				var p = notes[notes.length - 1] + 1;
				while (p % 12 !== pc) p++;
				notes.push(p);
			}
		}
		var sum = 0;
		for (i = 0; i < notes.length; i++) sum += notes[i];
		if (!follow) {
			var dist = Math.abs(sum / notes.length - center);
			if (dist < bestDist) { bestDist = dist; best = notes; }
			continue;
		}
		for (var shift = -12; shift <= 12; shift += 12) {
			var top = notes[notes.length - 1] + shift;
			if (top > lastUserPitch - 3 || notes[0] + shift < floor) continue;
			var d = Math.min(Math.abs(top - (lastUserPitch - 4)), Math.abs(top - (lastUserPitch - 9)) + 0.5)
				+ Math.abs(sum / notes.length + shift - center) / 6;
			if (d < bestDist) {
				bestDist = d;
				best = [];
				for (i = 0; i < notes.length; i++) best.push(notes[i] + shift);
			}
		}
	}
	if (!best) return voicingPlain();
	if (!power) {
		var total = 0;
		for (var j = 0; j < best.length; j++) total += best[j];
		voiceCenter = Math.max(52, Math.min(59, total / best.length));
	}
	// keep the chord under the melody: its top note stays at least 3 semitones below
	var under = [];
	for (j = 0; j < best.length; j++) under.push(best[j]);
	while (under[under.length - 1] > lastUserPitch - 3 && under[0] - 12 >= floor) {
		for (j = 0; j < under.length; j++) under[j] -= 12;
	}
	// squeezed between the left hand and the melody: leave out the notes that would cross it
	var fit = [];
	for (j = 0; j < under.length; j++) if (under[j] <= lastUserPitch - 3) fit.push(under[j]);
	return fit.length >= 2 ? fit : (power ? under : []);
}

function jitter(v, amount) {
	return Math.max(1, Math.min(127, Math.round(v + (Math.random() * 2 - 1) * amount)));
}

function msFor(beats) { return Math.max(30, Math.round(beats * 60000 / bpm * 0.94)); }

// loudness follows how hard the player plays, with a small rise and fall over each 4-bar phrase
// (she asked for the band to follow her clearly: softer playing, the whole band softer; harder, louder)
function dyn() { return Math.max(0.4, Math.min(1.5, Math.pow(playerVel / 80, 1.5))) * PHRASE_ARC[(barCount % 4 + 4) % 4]; }
// strong beats stronger: beat 1, then beat 3 (in 4/4), then the other beats, then off-beats
function beatAccent(s) {
	if (s % SPB !== 0) return 0.84;
	var b = s / SPB;
	return b === 0 ? 1 : (cur().beats === 4 && b === 2) ? 0.93 : 0.88;
}
function vel(base, s, gain) { return jitter(base * gain * dyn() * beatAccent(s), 4); }
// piano and bass sit a few milliseconds behind the drums, never exactly the same
function behind() { return 4 + Math.round(Math.random() * 10); }
function phraseEnd() { return barCount % 4 === 3 || endingFill(); }
function softStyle() { return styleIndex === 1 || styleIndex === 6; }

// notes outside the instruments (a voicing that found no room) are dropped
function send(pitch, velocity, beats, delay) {
	if (!usePiano || pitch < 21 || pitch > 108) return;
	outlet(0, [pitch, velocity, msFor(beats), delay || 0]);
	recNote(2, 1, pitch, velocity, beats * SPB);
}
function sendBass(pitch, velocity, beats) {
	if (!useBass || pitch < 25 || pitch > BASS_HIGHEST) return;
	var delay = behind();
	outlet(5, [pitch, velocity, msFor(beats), delay]);
	recNote(3, 2, pitch, velocity, beats * SPB);
}
function hit(note, velocity) {
	if (!useDrums) return;
	outlet(2, [note, velocity, 60]);
	recNote(4, 9, note, velocity, 1);
}

function at(t) { return Math.round(t * SPB); }

// each bar: maybe leave out one chord hit, add one off-beat hit, give the bass a different
// middle note, walk into the root at the end; arpeggios change their order every other bar
function chooseVariant() {
	var comp = cur().comp[level], bass = cur().bass[drumLevel];
	variant = { skipComp: -1, extraComp: -1, bassSwap: -1, passing: false, arpMode: barCount % 2 };
	if (!comp.arp && comp.length >= 3 && Math.random() < 0.4) variant.skipComp = 1 + Math.floor(Math.random() * (comp.length - 1));
	if (!comp.arp && Math.random() < 0.35) {
		var t = comp[Math.floor(Math.random() * comp.length)].t + (cur().swing ? SW : 0.5), taken = false;
		for (var i = 0; i < comp.length; i++) if (Math.abs(comp[i].t - t) < 0.01) taken = true;
		if (!taken && t < cur().beats - 1) variant.extraComp = t;
	}
	if (bass !== "walk" && bass.length >= 3 && barCount % 2 === 1) variant.bassSwap = 1 + Math.floor(Math.random() * (bass.length - 1));
	variant.passing = barCount % 2 === 1 || phraseEnd();
}

function playBass(s, gain) {
	var pattern = cur().bass[drumLevel];
	if (pattern === "walk") {
		if (s % SPB !== 0) return;
		var beat = s / SPB;
		var kind = beat === 0 ? "r" : beat === cur().beats - 1 ? "a" : (Math.random() < 0.5 ? "t" : "f");
		sendBass(bassNote(kind), vel(bassBase(), s, gain), 0.9);
		return;
	}
	for (var i = 0; i < pattern.length; i++) {
		if (at(pattern[i].t) !== s) continue;
		var kind = pattern[i].k;
		if (i === variant.bassSwap && kind === "r") kind = Math.random() < 0.5 ? "t" : "o";
		// the last note of the bar, from beat 4 on, walks into the root of the next bar
		if (variant.passing && i === pattern.length - 1 && i > 0 && pattern[i].t >= cur().beats - 1) kind = "p";
		sendBass(bassNote(kind), vel(bassBase(), s, gain), pattern[i].d * 0.95);
	}
}

// a jazz bass sits under the band (a walking line plays every beat); pop basses push more
function bassBase() { return cur().jazz ? 60 : 84; }

// block chords roll upward a little, more slowly in the soft styles
function strike(notes, velocity, beats) {
	var start = behind(), spread = softStyle() ? 14 : 5;
	for (var n = 0; n < notes.length; n++) send(notes[n], velocity, beats, start + n * spread);
}

// how the pop piano answers the melody (the menu "钢琴呼应"; the jazz styles keep their comping):
// 0 the style's pattern, 1 fill (a short figure in her long notes and rests), 2 complement (chords
// in the gaps of her last bar's rhythm), 3 second voice (top note a third or sixth under the melody),
// 4 imitate (chords on her last bar's rhythm), 5 mix (complement + second voice + fill)
var respondMode = 0;
var RESPOND = [[], ["fill"], ["complement"], ["voice"], ["imitate"], ["complement", "voice", "fill"]];
function respond(n) { respondMode = Math.max(0, Math.min(RESPOND.length - 1, n)); }
function respondsWith(kind) { return !cur().jazz && contains(RESPOND[respondMode], kind); }

// her melody onsets in this bar and the last, on the eighth grid (swung eighths in swing)
var barOnsets = [], lastBarOnsets = [], earlyOnsets = [], rhythmPlan = null, shortFilled = true;
function noteOnset() {
	var pos = step + 2;   // as autoInput: up to 2 ticks early counts as on time
	var off = cur().swing ? 8 : 6, inBeat = pos % SPB, q = 0;
	if (Math.abs(inBeat - off) < Math.abs(inBeat - q)) q = off;
	if (SPB - inBeat < Math.abs(inBeat - q)) q = SPB;
	pos = pos - inBeat + q;
	if (pos >= barSteps()) earlyOnsets.push(pos - barSteps());
	else barOnsets.push(pos);
}

// at the barline: the piano's rhythm for this bar, from her rhythm in the last one
function makeRhythm() {
	lastBarOnsets = barOnsets;
	barOnsets = earlyOnsets;
	earlyOnsets = [];
	rhythmPlan = null;
	var imitate = respondsWith("imitate");
	if (!imitate && !respondsWith("complement")) return;
	var her = {}, hits = [], i;
	for (i = 0; i < lastBarOnsets.length; i++) her[lastBarOnsets[i]] = true;
	var off = cur().swing ? 8 : 6;
	if (imitate) {
		for (var k in her) hits.push(parseInt(k, 10));
		if (!hits.length) return;   // she didn't play: the style's own pattern
		hits.sort(function (a, b) { return a - b; });
		while (hits.length > 6) hits.splice(1 + Math.floor(Math.random() * (hits.length - 1)), 1);
	} else {
		// the places she left empty; the first of them (the harmony's arrival), off-beats and the
		// place just after one of her notes first; at least 3 chords a bar, so the harmony carries on
		var cands = [];
		for (var b = 0; b < cur().beats; b++) {
			var spots = [b * SPB, b * SPB + off];
			for (var j = 0; j < 2; j++) {
				var t = spots[j];
				if (her[t]) continue;
				var after = her[j === 0 ? t - (SPB - off) : t - off] ? 0.7 : 0;
				cands.push({ t: t, score: (cands.length === 0 ? 3 : 0) + (j === 1 ? 1 : 0) + after + Math.random() * 0.8 });
			}
		}
		cands.sort(function (a, b) { return b.score - a.score; });
		for (i = 0; i < cands.length && i < [3, 4, 5][level]; i++) hits.push(cands[i].t);
		hits.sort(function (a, b) { return a - b; });
	}
	rhythmPlan = hits;
}

// fill: once she has held a note or rested for a beat (and less than a bar), three notes of the
// chord answer in the space under her note, moving against her last direction; she plays, it stops
function shortFill() {
	shortFilled = true;
	var top = lastUserPitch + 4;
	for (var k in heldMelody) top = Math.min(top, parseInt(k, 10) - 3);
	var lo = Math.max(55, leftRole() === "chord" ? lastLeftHigh + 2 : 55), pool = [];
	for (var p = lo; p <= top; p++) {
		for (var i = 0; i < tones.length; i++) if (p % 12 === (root + tones[i]) % 12) { pool.push(p); break; }
	}
	if (pool.length < 3) return;
	// start a little under her last note
	var dir = -userDirection, idx = 0;
	for (i = 1; i < pool.length; i++) if (Math.abs(pool[i] - (lastUserPitch - 5)) < Math.abs(pool[idx] - (lastUserPitch - 5))) idx = i;
	var rhythm = cur().swing ? [0, SW, 1] : [0, 0.5, 1];
	fillQueue = [];
	for (var n = 0; n < rhythm.length; n++) {
		fillQueue.push({ at: clock + at(rhythm[n]), pitch: pool[idx], vel: jitter(68 - n * 2, 3), d: n === rhythm.length - 1 ? 1 : 0.45 });
		idx = Math.max(0, Math.min(pool.length - 1, idx + dir * (Math.random() < 0.3 ? 2 : 1)));
	}
	filling = true;
}

function playComp(s, gain) {
	var pattern = cur().comp[level];
	// at the end of a phrase the chords leave the last beat to the drums
	if (phraseEnd() && s > (cur().beats - 1) * SPB) return;
	if (rhythmPlan) {
		for (var h = 0; h < rhythmPlan.length; h++) {
			if (rhythmPlan[h] !== s) continue;
			var next = h + 1 < rhythmPlan.length ? rhythmPlan[h + 1] : barSteps();
			strike(voicing(), vel(80, s, gain), Math.max(0.5, (next - s) / SPB * 0.95));
		}
		return;
	}
	if (pattern.arp) {
		var stepLen = at(pattern.arp);
		if (s % stepLen !== 0) return;
		if (s === 0 || arpNotes.length === 0) {
			var v = voicing();
			if (variant.arpMode === 1 && v.length >= 3) arpNotes = [v[0], v[2], v[1], v[2]];
			else {
				arpNotes = v.concat([v[0] + 12]);
				for (var k = v.length - 1; k > 0; k--) arpNotes.push(v[k]);
			}
			arpIndex = 0;
		}
		send(arpNotes[arpIndex % arpNotes.length], vel(78, s, gain), pattern.d, behind());
		arpIndex++;
		return;
	}
	for (var i = 0; i < pattern.length; i++) {
		if (at(pattern[i].t) !== s || i === variant.skipComp) continue;
		strike(voicing(), vel(82, s, gain), pattern[i].d);
	}
	if (variant.extraComp >= 0 && at(variant.extraComp) === s) strike(voicing(), vel(72, s, gain), 0.4);
}

// a phrase ends with a short snare fill on the last beat; the next phrase opens with a crash
function playDrums(s, gain) {
	var beats = cur().beats, g = gain * dyn();
	if (phraseEnd() && s >= (beats - 1) * SPB) {
		var into = s - (beats - 1) * SPB;
		// sixteenths, or triplets in the swing styles
		if (into % (cur().swing ? 4 : 3) === 0) hit(SNARE, jitter((62 + into * 3) * g, 4));
		if (into === 0) hit(KICK, jitter(90 * g, 4));
		return;
	}
	if (s === 0 && barCount > 0 && barCount % 4 === 0) hit(OPEN_HAT, jitter(100 * g, 4));
	var pattern = cur().drums[drumLevel];
	for (var i = 0; i < pattern.length; i++) {
		if (at(pattern[i].t) === s) hit(pattern[i].n, jitter(pattern[i].v * g, 4));
	}
	// her last bar's rhythm, quietly on the snare
	if (drummerListens() && contains(drumEcho, s)) hit(SNARE, jitter(34 * g, 3));
}

// answer phrase: chord tones in the melody register, moving against the direction of the player's last phrase
function startFill() {
	var pcs = [];
	for (var i = 0; i < tones.length; i++) pcs.push((root + tones[i]) % 12);
	var pool = [];
	for (var p = 62; p <= 84; p++) {
		for (var j = 0; j < pcs.length; j++) if (p % 12 === pcs[j]) { pool.push(p); break; }
	}
	if (pool.length < 2) return;
	var dir = -userDirection;
	var idx = 0;
	for (i = 1; i < pool.length; i++) {
		if (Math.abs(pool[i] - (lastUserPitch + dir * 2)) < Math.abs(pool[idx] - (lastUserPitch + dir * 2))) idx = i;
	}
	var rhythm = cur().swing ? [0, SW, 1, 1 + SW, 2] : [0, 0.5, 1, 1.5, 2];
	fillQueue = [];
	for (var n = 0; n < rhythm.length; n++) {
		var last = n === rhythm.length - 1;
		fillQueue.push({ at: clock + at(rhythm[n]), pitch: pool[idx], vel: jitter(74 - n * 3, 4), d: last ? 1 : 0.45 });
		var move = Math.random() < 0.3 ? 2 : 1;
		idx += dir * move;
		if (idx < 0 || idx >= pool.length) { dir = -dir; idx = Math.max(0, Math.min(pool.length - 1, idx + dir * 2)); }
	}
	filling = true;
	restAnswered = true;
}

function playFill() {
	var keep = [];
	for (var i = 0; i < fillQueue.length; i++) {
		var e = fillQueue[i];
		if (e.at === clock) send(e.pitch, jitter(e.vel * dyn(), 2), e.d, behind());
		else if (e.at > clock) keep.push(e);
	}
	fillQueue = keep;
	if (fillQueue.length === 0) filling = false;
}

// the drummer listens to the melody (every style), on top of the style's pattern:
// - coming back in after a rest of a bar or more: a cymbal crash and the kick on her first note
// - a note clearly harder than usual: the snare (and the kick, on a beat); harder and up high
//   (5 semitones over her usual register): a cymbal crash with the kick
// - a note between the beats (a syncopation): now and then a soft kick with it
// - her rhythm comes back in the next bar as quiet ghost notes on the snare (her off-beats, up to 3)
// - she stops for a beat after at least 3 notes in the 2 beats before: a short fill in the gap
// At most two of these reactions a beat.
var lastCatchClock = -1e9, gapFilled = true, drumFillQueue = [], avgPitch = 72, drumEcho = [];
function drummerListens() { return running && countIn === 0 && !listening() && !finalBar && endAtBar < 0; }

function drummerReacts(pitch, velocity, accent, gapBefore) {
	var high = pitch >= avgPitch + 5;
	avgPitch = avgPitch * 0.9 + pitch * 0.1;
	if (!drummerListens()) return;
	var g = dyn(), onBeat = step % SPB <= 2 || step % SPB >= SPB - 2;
	if (gapBefore >= barSteps()) {
		hit(RIDE, jitter(105 * g, 3));
		hit(KICK, jitter(85 * g, 3));
		lastCatchClock = clock;
		return;
	}
	if (clock - lastCatchClock < SPB / 2) return;
	if (accent && high) {
		hit(RIDE, jitter(100 * g, 3));
		hit(KICK, jitter(80 * g, 3));
	} else if (accent) {
		hit(SNARE, jitter(66 * g, 4));
		if (onBeat) hit(KICK, jitter(60 * g, 4));
	} else if (!onBeat && velocity >= playerVel - 5 && Math.random() < 0.5) {
		hit(KICK, jitter(52 * g, 4));
	} else return;
	lastCatchClock = clock;
}

// at the barline: her off-beats of the last bar, for the snare's ghost notes
function makeEcho() {
	drumEcho = [];
	for (var i = 0; i < lastBarOnsets.length && drumEcho.length < 3; i++) {
		if (lastBarOnsets[i] % SPB !== 0 && !contains(drumEcho, lastBarOnsets[i])) drumEcho.push(lastBarOnsets[i]);
	}
}

// at a beat start: the player stopped a beat ago after at least 3 notes in the 2 beats before;
// one of three fills (triplets in swing)
function answerGap() {
	if (gapFilled || !drummerListens() || step % SPB !== 0 || !userTimes.length) return;
	if (phraseEnd() && step >= (cur().beats - 1) * SPB) return;
	var last = userTimes[userTimes.length - 1];
	if (clock - last < SPB) return;
	gapFilled = true;
	if (clock - last >= 2 * SPB) return;
	var busy = 0;
	for (var i = 0; i < userTimes.length; i++) if (last - userTimes[i] < 2 * SPB) busy++;
	if (busy < 3) return;
	var g = dyn(), pick = Math.floor(Math.random() * 3);
	var fills = cur().swing ? [
		[[0, SNARE, 40], [4, SNARE, 46], [8, SNARE, 54], [8, KICK, 50]],
		[[0, KICK, 50], [4, SNARE, 48], [8, KICK, 52], [8, SNARE, 56]],
		[[4, SNARE, 44], [8, SNARE, 58], [8, RIDE, 70]]
	] : [
		[[0, SNARE, 44], [3, SNARE, 48], [6, SNARE, 54], [9, SNARE, 62], [9, KICK, 58]],
		[[0, KICK, 56], [3, SNARE, 50], [6, KICK, 56], [9, SNARE, 62]],
		[[0, SNARE, 48], [6, KICK, 56], [9, SNARE, 60], [9, OPEN_HAT, 60]]
	];
	drumFillQueue = [];
	for (i = 0; i < fills[pick].length; i++) drumFillQueue.push({ at: clock + fills[pick][i][0], n: fills[pick][i][1], v: fills[pick][i][2] * g });
}

function playDrumFill() {
	var keep = [];
	for (var i = 0; i < drumFillQueue.length; i++) {
		var e = drumFillQueue[i];
		if (e.at === clock) hit(e.n, jitter(e.v, 3));
		else if (e.at > clock) keep.push(e);
	}
	drumFillQueue = keep;
}

function countRecent(windowSteps) {
	var keep = [], n = 0;
	for (var i = 0; i < userTimes.length; i++) {
		if (clock - userTimes[i] <= SPB * 8) keep.push(userTimes[i]);
		if (clock - userTimes[i] < windowSteps) n++;
	}
	userTimes = keep;
	return n;
}

function anyHeld() {
	for (var k in heldMelody) return true;
	return false;
}

// density follows the whole previous bar and moves one step at a time,
// so each bar keeps one pattern instead of switching beat by beat
function onBarline() {
	var perBeat = countRecent(barSteps()) / cur().beats;
	var target = perBeat >= 1.5 ? 0 : perBeat >= 0.75 ? 1 : 2;
	if (target < level) level--;
	else if (target > level) level++;
	drumLevel = 2 - level;
	barCount++;
	chooseVariant();
	makeRhythm();
	makeEcho();
	decideProposal();
}

// answer only after a real rest: no melody key down and nothing new for a whole bar
function onBeat() {
	if (!restAnswered && root >= 0 && !anyHeld() && lastMelodyClock > 0 && clock - lastMelodyClock >= barSteps()) startFill();
	else if (respondsWith("fill") && !filling && !shortFilled && root >= 0 && !listening() && endAtBar < 0 && userTimes.length) {
		var age = clock - userTimes[userTimes.length - 1];
		if (age >= SPB && age < barSteps() - SPB) shortFill();
	}
}

// the first bar after the count-in is drums only: the system listens to what the player plays
// and the piano and bass come in on bar 2 with a chord they already know
function listening() { return barCount < 1; }

// the player is playing the chords (left-hand chords, or right-hand notes struck together)
function playerChords() { return leftRole() === "chord" || clock - lastRhChordClock <= barSteps(); }

// while the player plays block chords, the piano answers with broken chords instead: single
// chord tones flowing up and down in the middle of the keyboard (from G3, above a left-hand chord,
// below the melody), in eighths (sixteenths when it's busy); keys the player is holding are skipped
var brokenNotes = [], brokenIndex = 0, brokenKey = "";
function brokenLine() {
	var top = clock - lastRhChordClock <= barSteps() ? Math.max(lastUserPitch, rhChordHigh) : lastUserPitch;
	var lo = 55;
	if (leftRole() === "chord") lo = Math.max(lo, lastLeftHigh + 2);
	var hi = Math.min(lo + 14, top - 2);
	if (hi < lo + 7) hi = lo + 7;
	var pcs = [root, root + (third() < 0 ? fifth() : third()), root + fifth()];
	if (seventh() >= 0) pcs.push(root + seventh());
	var up = [];
	for (var p = lo; p <= hi; p++) {
		if (heldMelody[p] || leftHeld[p]) continue;
		for (var i = 0; i < pcs.length; i++) if (p % 12 === ((pcs[i] % 12) + 12) % 12) { up.push(p); break; }
	}
	if (up.length < 2) return [];
	var line = up.slice();
	for (var k = up.length - 2; k > 0; k--) line.push(up[k]);
	return line;
}

function playBroken(s, gain) {
	var stepLen = drumLevel === 2 ? SPB / 4 : SPB / 2;
	if (s % stepLen !== 0) return;
	var keyNow = root + ":" + tones.join(",");
	// a new line at every chord change and every chord segment, so it follows the melody's height
	if (keyNow !== brokenKey || s % segLength() === 0) {
		brokenNotes = brokenLine();
		brokenIndex = 0;
		brokenKey = keyNow;
	}
	if (!brokenNotes.length) return;
	send(brokenNotes[brokenIndex % brokenNotes.length], vel(64, s, gain), stepLen / SPB * 1.6, behind());
	brokenIndex++;
}

function playParts(s, gain) {
	if (listening() || finalBar) return;
	if (s === 0) barStart();
	if (s === 0 && proposalArmed && !barWaiting) startProposal();
	var role = leftRole();
	if (playsBass(role)) playBass(s, gain);
	if (filling) return;
	// in jazz the player is the trio's pianist: while they play chords the system is bass and drums
	if (playerChords()) { if (!cur().jazz) playBroken(s, gain); }
	else if (compFits(role)) playComp(s, gain);
}

function showBeat() {
	var beat = Math.floor(step / SPB) + 1;
	var noticeOn = notice !== "" && clock < noticeUntil;
	var left = 2 - Math.floor(step / SPB);   // a proposal goes back at beat 3
	var offer = proposal ? chordLabel(proposal.fromRoot, proposal.fromTones) + " → " + chordLabel(root, tones) : "";
	var barsLeft = endAtBar - barCount;
	var text = finalBar ? L("结束", "End")
		: endAtBar >= 0 ? L("还有 " + barsLeft + " 小节结束", "Ending in " + barsLeft + (barsLeft === 1 ? " bar" : " bars"))
		: listening() && !noticeOn ? L("第一小节只有鼓：系统在听你弹", "Bar 1 is drums only: the band is listening")
		: proposal && proposal.accepted ? (noticeOn ? notice : L("✓ 你接受了：", "✓ You accepted: ") + chordLabel(root, tones))
		: proposal ? L("系统提议：" + offer + "　按接受保留" + (left > 0 ? "（还有 " + left + " 拍）" : ""),
			"The band proposes: " + offer + (left > 0 ? "   accept within " + left + (left === 1 ? " beat" : " beats") : ""))
		: noticeOn ? notice
		: root < 0 ? L("左手按和弦，或直接弹旋律", "Play a left-hand chord, or just a melody")
		: filling ? L("你停了，系统接一句", "You paused: the band answers") : levelText(level);
	outlet(3, beat + "   " + text);
	setMood(finalBar || endAtBar >= 0 ? "none" : proposal && proposal.accepted ? "accepted" : proposal ? "proposal"
		: noticeOn && withdrawn && clock < withdrawn.until ? "back" : "none");
	var role = leftRole();
	var who = role === "chord" ? L("跟着你的左手和弦：", "Following your left-hand chord: ")
		: role === "bass" ? L("按你的低音和旋律配：", "From your bass and melody: ")
		: L("系统按旋律配：", "Harmonising your melody: ");
	var label = root >= 0 ? chordLabel(root, tones) : "";
	// the player's bass under another chord tone reads as an inversion, e.g. G/B
	if (root >= 0 && role !== "none" && lastLeftLow >= 0 && lastLeftLow % 12 !== root) label += "/" + NAMES[lastLeftLow % 12];
	var how = lastDecision === "quantum" ? L("量子测量", "a qubit measurement") : L("随机", "chance");
	var decided = boldness > 0 && lastDecision ? L("  提议由" + how + "决定（大胆度 " + boldness + "）",
		"   proposals decided by " + how + " (boldness " + boldness + ")") : "";
	if (accepts + declines > 0) decided += L("  接受 " + accepts + " 次 · 没接受 " + declines + " 次",
		"   accepted " + accepts + " · not accepted " + declines);
	outlet(1, [styleName(cur()), (root >= 0 ? who + label : L("等你按和弦或弹旋律", "Waiting for a chord or a melody")) + decided]);
	outlet(4, root >= 0 ? label : "-");
	if (root >= 0 && !listening() && !finalBar) chartChord(label);
}

function bang() {
	if (!running) return;
	tickClock = clock;
	tickMs = msNow();
	lastStep = step;
	if (countIn > 0) {
		if (step % SPB === 0) {
			var beat = step / SPB + 1;
			outlet(2, [RIM, beat === 1 ? 110 : 80, 60]);
			outlet(3, L("预备 ", "Count-in ") + beat);
		}
	} else {
		if (!autoMode()) earlyQueue = [];
		else if (step % segLength() === 0 && step > 0 && seg.index !== step / segLength()) newSegment(step / segLength());
		if (step === 2 * SPB) withdrawProposal();
		// ask for the measurement that decides the coming bar, a beat ahead
		if (step === barSteps() - SPB) requestMeasure();
		var changed = false;
		if (pending) {
			applyChord(pending[0], pending[1]);
			changed = true;
			if (step > 0 && step <= SPB / 2 && !listening() && !finalBar && root >= 0 && !barWaiting) {
				noteBarChord();
				if (!proposal && !kept && armedBar === barCount) { armedBar = -1; startProposal(); }
			}
		}
		if (barWaiting && (seg.chosen || step >= SPB)) melodyArrived();
		if (step % SPB === 0) {
			if (step === 0) onBarline();
			if (step === 0 && endAtBar >= 0 && barCount === endAtBar) finalChord();
			if (!finalBar) onBeat();
			showBeat();
		} else if (changed) showBeat();
		// at a segment start where the player has been landing new notes or chords, the bass and
		// chord wait one tick for this one, so they sound the new chord instead of the previous one
		if (step % segLength() === 0) {
			var segId = clock / segLength();
			if (expectsPlayer(segId) && lastInputSeg !== segId) holdStep = step;
		}
		var gain = level === 0 ? 0.8 : 1;
		if (root >= 0 && holdStep !== step) {
			if (holdStep === step - 1) playParts(holdStep, gain);
			playParts(step, gain);
		}
		if (holdStep !== step) holdStep = -1;
		if (!finalBar) {
			if (confirmDue && onEighth(step)) { confirmDue = false; confirmChord(); }
			playDrums(step, drumLevel === 0 ? 0.85 : drumLevel === 2 ? 1.1 : 1);
			answerGap();
			playDrumFill();
			playFill();
		}
	}
	step++;
	clock++;
	if (step >= barSteps()) {
		step = 0;
		if (finalBar) { stop(); outlet(3, L("结束", "End") + lastSaved); outlet(9, "end"); return; }
		if (countIn > 0) countIn = 0;
		else autoBarline();
	}
}

// a reload of this script (Max's autowatch) keeps the taught controls too
// (shown a moment later, once the outlets are there)
if (typeof max !== "undefined") {
	scriptLoading = true;
	loadControls();
	scriptLoading = false;
	var showTask = new Task(showcontrols);
	showTask.schedule(0);
}
