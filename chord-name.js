autowatch = 1;
inlets = 1;
outlets = 3;

var NAMES = ["C", "Db", "D", "Eb", "E", "F", "F#", "G", "Ab", "A", "Bb", "B"];

// fifth: the tone that may be omitted in a voicing (-1 when it defines the chord)
var CHORDS = [
	{ suffix: "",     tones: [0, 4, 7],      fifth: 7 },
	{ suffix: "m",    tones: [0, 3, 7],      fifth: 7 },
	{ suffix: "7",    tones: [0, 4, 7, 10],  fifth: 7 },
	{ suffix: "maj7", tones: [0, 4, 7, 11],  fifth: 7 },
	{ suffix: "m7",   tones: [0, 3, 7, 10],  fifth: 7 },
	{ suffix: "m7b5", tones: [0, 3, 6, 10],  fifth: -1 },
	{ suffix: "dim",  tones: [0, 3, 6],      fifth: -1 },
	{ suffix: "dim7", tones: [0, 3, 6, 9],   fifth: -1 },
	{ suffix: "aug",  tones: [0, 4, 8],      fifth: -1 },
	{ suffix: "sus4", tones: [0, 5, 7],      fifth: -1 },
	{ suffix: "sus2", tones: [0, 2, 7],      fifth: -1 },
	{ suffix: "7sus4", tones: [0, 5, 7, 10], fifth: 7 },
	// without its 5th a 6 chord is just an inverted triad (G B E = Em/G), so the 5th is required
	{ suffix: "6",    tones: [0, 4, 7, 9],   fifth: -1 },
	{ suffix: "m6",   tones: [0, 3, 7, 9],   fifth: -1 },
	{ suffix: "9",    tones: [0, 4, 7, 10, 2],  fifth: 7 },
	{ suffix: "maj9", tones: [0, 4, 7, 11, 2],  fifth: 7 },
	{ suffix: "m9",   tones: [0, 3, 7, 10, 2],  fifth: 7 }
];

var held = {};          // pitch -> time it was pressed (ms)
var splitPoint = 128;
var TOGETHER_MS = 80;   // keys pressed this close together are one chord

function now() { return new Date().getTime(); }

function split(n) {
	splitPoint = n;
	report();
}

// only key presses update the chord, so letting go of a chord leaves it standing
function list(pitch, velocity) {
	if (velocity > 0) {
		held[pitch] = now();
		report();
	} else delete held[pitch];
}

function clear() {
	held = {};
	outlet(1, "none");
	outlet(0, "-");
}

function pitchClasses(notes) {
	var pcs = [];
	for (var i = 0; i < notes.length; i++) if (!has(pcs, notes[i] % 12)) pcs.push(notes[i] % 12);
	return pcs.length;
}

// notes below the split are the chord. When they don't make one, three or more keys struck
// together count as a chord wherever they are (7-2-5 as B3 D4 G4 across middle C, or a C chord
// right at middle C); keys of a legato melody overlap but are not struck together
function heldNotes() {
	var notes = [], together = [], latest = 0;
	for (var k in held) if (held[k] > latest) latest = held[k];
	for (k in held) {
		var p = parseInt(k, 10);
		if (p < splitPoint) notes.push(p);
		if (latest - held[k] <= TOGETHER_MS) together.push(p);
	}
	if (pitchClasses(notes) < 2 && together.length >= 3) notes = together;
	notes.sort(function (a, b) { return a - b; });
	return notes;
}

function has(arr, x) {
	for (var i = 0; i < arr.length; i++) if (arr[i] === x) return true;
	return false;
}

function scoreChord(pcs, root, chord, bass) {
	var rel = [];
	for (var i = 0; i < pcs.length; i++) rel.push((pcs[i] - root + 12) % 12);
	var matched = 0, extra = 0, missing = 0;
	for (i = 0; i < rel.length; i++) {
		if (has(chord.tones, rel[i])) matched++;
		else extra++;
	}
	for (i = 0; i < chord.tones.length; i++) {
		var t = chord.tones[i];
		if (!has(rel, t) && t !== chord.fifth) missing++;
	}
	var score = matched * 2 - extra * 3 - missing * 2 - chord.tones.length * 0.1;
	if (root === bass) score += 1;
	return score;
}

// returns { label, root, tones }; root is -1 when the notes don't form a usable chord
function analyze(notes) {
	if (notes.length === 0) return { label: "-", root: -1, tones: [] };
	var bass = notes[0] % 12;
	var pcs = [];
	for (var i = 0; i < notes.length; i++) {
		var pc = notes[i] % 12;
		if (!has(pcs, pc)) pcs.push(pc);
	}
	if (pcs.length === 1) return { label: NAMES[bass], root: -1, tones: [] };
	if (pcs.length === 2) {
		var gap = (pcs[1] - pcs[0] + 12) % 12;
		if (gap !== 7 && gap !== 5) return { label: NAMES[pcs[0]] + " + " + NAMES[pcs[1]], root: -1, tones: [] };
		var r = gap === 7 ? pcs[0] : pcs[1];
		return { label: NAMES[r] + "5", root: r, tones: [0, 7] };
	}
	var best = null, bestScore = -1e9;
	for (i = 0; i < pcs.length; i++) {
		for (var c = 0; c < CHORDS.length; c++) {
			var s = scoreChord(pcs, pcs[i], CHORDS[c], bass);
			if (s > bestScore) { bestScore = s; best = { root: pcs[i], chord: CHORDS[c] }; }
		}
	}
	// a bare diminished triad (7-2-4, B D F) is played as a rootless V7 (G7), so give it that root
	if (best.chord.suffix === "dim" && pcs.length === 3) {
		best = { root: (best.root + 8) % 12, chord: { suffix: "7", tones: [0, 4, 7, 10] } };
	}
	var label = NAMES[best.root] + best.chord.suffix;
	if (best.root !== bass) label += "/" + NAMES[bass];
	return { label: label, root: best.root, tones: best.chord.tones };
}

function report() {
	var notes = heldNotes();
	if (notes.length === 0) return;
	var a = analyze(notes);
	outlet(1, notes.length ? notes : "none");
	outlet(0, a.label);
	if (a.root >= 0) outlet(2, [a.root].concat(a.tones));
}
