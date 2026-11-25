inlets = 1;
outlets = 2;

var chords = {
	"00": ["C", 60, 64, 67],
	"01": ["F", 65, 69, 72],
	"10": ["G", 67, 71, 74],
	"11": ["Am", 69, 72, 76]
};

function pad(value) {
	var text = String(value);
	if (/^\d+$/.test(text) && text.length < 2) text = ("00" + text).slice(-2);
	return text;
}

function choose(args) {
	var bag = [];
	var index;
	for (index = 0; index + 1 < args.length; index += 2) {
		var state = pad(args[index]);
		var count = Number(args[index + 1]);
		if (!chords[state] || !(count > 0)) continue;
		var copy;
		for (copy = 0; copy < count; copy++) bag.push(state);
	}
	if (!bag.length) {
		post("没有认出测量结果\n");
		return;
	}
	var state = bag[Math.floor(Math.random() * bag.length)];
	var chord = chords[state];
	outlet(0, state, chord[0]);
	outlet(1, chord[1], chord[2], chord[3]);
}

function list() {
	choose(arrayfromargs(arguments));
}

function anything() {
	choose(arrayfromargs(messagename, arguments));
}
