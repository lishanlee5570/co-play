# co-play: an improvising band in Max

co-play is a band of piano, bass and drums, built in Max 9, that improvises with a pianist on a MIDI keyboard. Nothing is prepared in advance. You play a line or some chords; the band listens, fills in harmony, texture and rhythm, and now and then proposes a different harmony. You decide, by ear and in real time, which proposals stay. The choices you keep are remembered, so one performance grows into a piece, and every take is saved as audio, a score and a chord chart.

Performance video: *(link to be added)*

## What it does

- **It listens before it plays.** After a one-bar count-in, the first bar is drums only. Bass and piano come in once the band has heard your harmony.
- **It divides the roles by what your hands are doing.** Left-hand chords: the band plays a bass line under them and broken chords between your hands. A left-hand bass line: it adds chords above. Melody only: it harmonises the melody itself.
- **It follows your energy and leaves you space.** A busier melody makes drums and bass more active (walking bass in swing) and the piano sparser. The drummer answers your accents and fills your pauses.
- **It proposes, and you decide.** Now and then the band offers another chord for a bar (Am for C, Dm7 for G7). Push the pitch-bend wheel up, press the sustain pedal or the space bar to keep it, and the whole band restates the new chord. Do nothing and it returns to your harmony on beat 3. Push the pitch bend down, press **x** or the red button to reject a chord at once.
- **Your decisions stay.** An accepted change comes back by itself the next time the same progression arrives. Every take leaves a recording, a chord chart marking what you accepted (✓), what came back from memory (↺) and what you rejected (✗), and a MIDI score.
- **A qubit decides when to propose.** With The QAC Toolkit installed, each bar one qubit is rotated so that its chance of measuring 1 equals the proposal chance, and measured with `och.microqiskit`. The measurement decides whether to offer; the performer decides whether to keep. Without the toolkit, an ordinary random number is used instead.
- **A boldness control** (0–100, also on a keyboard knob) sets how often and how far the band proposes. It rises a little each time you accept and falls each time you let a proposal go. Turning it right down ends the piece four bars later with a final chord.

## What you need

- **Max 9** (the free version can open and run the patch).
- **A MIDI keyboard**, ideally with a sustain pedal and a pitch-bend wheel. The on-screen keyboard only shows what you play; it cannot be clicked to play.
- *Optional:* **The QAC Toolkit**, from Max's Package Manager, for the quantum measurement.
- Headphones or speakers on a low-latency audio driver.

## Quick start

1. Download this repository (green **Code** button → **Download ZIP**) and unzip it. Keep all the files together in one folder: the patch finds its sounds and scripts by file name.
2. Open **`co-improv.maxpat`** in Max. It opens on the performance panel.
3. In Max, choose your audio output (**Options → Audio Status → Output Device**) and turn the sound on with the speaker button on the panel.
4. Make sure your MIDI keyboard is connected (**Options → MIDI Setup**).
5. Choose a style and key, then click **Start / stop**. After the count-in, play.

Settings worth knowing:

| Control | What it does |
| --- | --- |
| Split (60 = middle C) | Keys below it are your left hand (chords or bass). Set it to 36 to play melody only with the band harmonising. |
| Style | Pop 8 Beat, Pop Ballad, Rock, 16 Beat, Waltz 3/4, Jazz Swing, Jazz Ballad, Bossa Nova. |
| Boldness 0–100 | How often and how far the band proposes. Around 40–60 is a good start. |
| Comping | How the pop piano answers your melody (fixed pattern, fill the gaps, complementary rhythm, second voice, echo, mix). |
| learnknob / learnfinish / learnaccept | Click, then move a knob or press a button on your keyboard, to use it for boldness, ending, or accepting. The choice is kept in `co-play-controls.txt`. |
| forget | Clears what the band has remembered of your choices. |

## Recordings

Each time you stop, three files are saved in the **`recordings`** folder next to the patch (keep that folder; Max cannot create it):

- `.wav`: the audio of you and the band
- `.mid`: four tracks (you, piano, bass, drums) that open as a score in MuseScore or any notation program
- `.txt`: the chord chart of the take, with ✓ ↺ ✗ marks

## Files

| File | Role |
| --- | --- |
| `co-improv.maxpat` | The main patch and performance panel |
| `comp.js` | The band's musical decisions: harmony, proposals, memory, accompaniment, drums, recording |
| `chord-name.js` | Reads the chord you play |
| `piano-voice.maxpat`, `bass-voice.maxpat`, `upright-voice.maxpat`, `drum-voice.maxpat` | Sample players used inside the main patch |
| `piano.wav`, `bass.wav`, `upright.wav`, `drums.wav` | The instrument recordings (see Credits) |
| `four-results.maxpat`, `pick-chord.js` | An earlier two-qubit prototype that picks one of four chords |
| `chord-listen.maxpat`, `keyboard-check.maxpat`, `kb-voice.maxpat` | Small test patches (chord reading, MIDI keyboard check) |
| `web/` | A browser version sharing the same `comp.js`, used during development (its interface is in Chinese; open `web/index.html` in Chrome or Edge) |
| `tools/` | PowerShell scripts that built the sample files and the web version |

## How it was made

co-play was designed and tested by Lishan Li, a jazz pianist who teaches improvised accompaniment. The musical rules come from her practice and from 36 rounds of playing, listening and revising between October and November 2026. The code was developed with AI-assisted coding.

## Credits and licence

The code (`.js`, `.maxpat`, `tools/`, `web/index.html`) is released under the MIT Licence; see [LICENSE](LICENSE).

The instrument recordings keep their own licences; see [CREDITS.txt](CREDITS.txt):

- Piano: Salamander Grand Piano V3 by Alexander Holm, CC BY 3.0
- Electric bass: tonejs-instruments by Nicholaus Brosowsky, CC BY 3.0
- Double bass: VSCO 2 Community Edition by Versilian Studios, CC0
- Drums: VCSL, the Versilian Community Sample Library, CC0
- Quantum measurement: The QAC Toolkit by Omar Costa Hamido (installed separately)
