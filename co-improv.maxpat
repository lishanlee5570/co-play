{
    "patcher":  {
                    "fileversion":  1,
                    "appversion":  {
                                       "major":  9,
                                       "minor":  1,
                                       "revision":  3,
                                       "architecture":  "x64",
                                       "modernui":  1
                                   },
                    "classnamespace":  "box",
                    "rect":  [
                                 40.0,
                                 40.0,
                                 1000.0,
                                 720.0
                             ],
                    "gridsize":  [
                                     15.0,
                                     15.0
                                 ],
                    "boxes":  [
                                  { "box": { "id": "reject-big", "maxclass": "button", "numinlets": 1, "numoutlets": 1, "outlettype": [ "bang" ], "patching_rect": [ 1750, 960, 24, 24 ], "bgcolor": [ 0.78, 0.22, 0.2, 1.0 ], "presentation": 1, "presentation_rect": [ 130, 42, 24, 24 ] } },
{ "box": { "id": "p-reject", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 1780, 962, 280, 20 ], "text": "Reject this chord (x key, or pitch bend down)", "presentation": 1, "presentation_rect": [ 158, 44, 300, 20 ] } },
{
                                      "box":  {
                                                  "id":  "c-title",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        30,
                                                                        12,
                                                                        820,
                                                                        34
                                                                    ],
                                                  "text":  "co-play: an improvising band. Left hand (below the split): chords, a bass line or nothing; right hand: the melody. After Start there is one count-in bar, then the band follows your harmony with bass, chords and drums. A busy melody makes the band give way; a pause makes it answer."
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "notein",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  3,
                                                  "patching_rect":  [
                                                                        30,
                                                                        60,
                                                                        90,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "int",
                                                                     "int",
                                                                     "int"
                                                                 ],
                                                  "text":  "notein"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "pack-in",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        30,
                                                                        92,
                                                                        60,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "pack 0 0"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "keys",
                                                  "maxclass":  "kslider",
                                                  "numinlets":  2,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        30,
                                                                        125,
                                                                        672,
                                                                        53
                                                                    ],
                                                  "outlettype":  [
                                                                     "int",
                                                                     "int"
                                                                 ],
                                                  "mode":  1,
                                                  "parameter_enable":  0,
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            672,
                                                                            672,
                                                                            53
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "chordjs",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  3,
                                                  "patching_rect":  [
                                                                        30,
                                                                        200,
                                                                        110,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "",
                                                                     "",
                                                                     ""
                                                                 ],
                                                  "text":  "js chord-name.js",
                                                  "saved_object_attributes":  {
                                                                                  "filename":  "chord-name.js",
                                                                                  "parameter_enable":  0
                                                                              }
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "clear",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        150,
                                                                        200,
                                                                        40,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "clear"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "set-name",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        30,
                                                                        232,
                                                                        70,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "prepend set"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "name",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        30,
                                                                        262,
                                                                        220,
                                                                        56
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "-",
                                                  "fontsize":  40.0,
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            505,
                                                                            66,
                                                                            220,
                                                                            46
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-name",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        30,
                                                                        320,
                                                                        120,
                                                                        20
                                                                    ],
                                                  "text":  "Current chord",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            505,
                                                                            46,
                                                                            100,
                                                                            20
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "prep-chord",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        270,
                                                                        232,
                                                                        85,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "prepend chord"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "prep-played",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        420,
                                                                        92,
                                                                        90,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "prepend played"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-play",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        280,
                                                                        270,
                                                                        90,
                                                                        20
                                                                    ],
                                                  "text":  "Start / stop",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            70,
                                                                            84,
                                                                            90,
                                                                            20
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "play",
                                                  "maxclass":  "toggle",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        280,
                                                                        292,
                                                                        40,
                                                                        40
                                                                    ],
                                                  "outlettype":  [
                                                                     "int"
                                                                 ],
                                                  "parameter_enable":  0,
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            72,
                                                                            44,
                                                                            44
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "t-play",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        280,
                                                                        340,
                                                                        40,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "int",
                                                                     "int"
                                                                 ],
                                                  "text":  "t i i"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "sel-play",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  3,
                                                  "patching_rect":  [
                                                                        330,
                                                                        370,
                                                                        50,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "bang",
                                                                     "bang",
                                                                     ""
                                                                 ],
                                                  "text":  "sel 1 0"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "start",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        330,
                                                                        400,
                                                                        40,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "start"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "stop",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        380,
                                                                        400,
                                                                        35,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "stop"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "metro",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        280,
                                                                        440,
                                                                        60,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "bang"
                                                                 ],
                                                  "text":  "metro 50"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-bpm",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        400,
                                                                        270,
                                                                        80,
                                                                        20
                                                                    ],
                                                  "text":  "Tempo BPM",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            248,
                                                                            70,
                                                                            20
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "bpm",
                                                  "maxclass":  "number",
                                                  "numinlets":  1,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        400,
                                                                        292,
                                                                        50,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "",
                                                                     "bang"
                                                                 ],
                                                  "minimum":  40,
                                                  "maximum":  220,
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            90,
                                                                            246,
                                                                            50,
                                                                            22
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "tick-ms",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        400,
                                                                        325,
                                                                        55,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "float"
                                                                 ],
                                                  "text":  "!/ 5000."
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "prep-tempo",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        465,
                                                                        325,
                                                                        85,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "prepend tempo"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-style",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        570,
                                                                        270,
                                                                        60,
                                                                        20
                                                                    ],
                                                  "text":  "Style",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            320,
                                                                            248,
                                                                            40,
                                                                            20
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "style",
                                                  "maxclass":  "umenu",
                                                  "numinlets":  1,
                                                  "numoutlets":  3,
                                                  "patching_rect":  [
                                                                        570,
                                                                        292,
                                                                        130,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "int",
                                                                     "",
                                                                     ""
                                                                 ],
                                                  "items":  [ "Pop 8 Beat", ",", "Pop Ballad", ",", "Rock", ",", "16 Beat", ",", "Waltz 3/4", ",", "Jazz Swing", ",", "Jazz Ballad", ",", "Bossa Nova" ],
                                                  "parameter_enable":  0,
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            360,
                                                                            246,
                                                                            140,
                                                                            22
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "prep-style",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        570,
                                                                        325,
                                                                        80,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "prepend style"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-key",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        570,
                                                                        365,
                                                                        200,
                                                                        20
                                                                    ],
                                                  "text":  "Key (the band harmonises in this key when the left hand plays no chord)"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "key",
                                                  "maxclass":  "umenu",
                                                  "numinlets":  1,
                                                  "numoutlets":  3,
                                                  "patching_rect":  [
                                                                        570,
                                                                        387,
                                                                        100,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "int",
                                                                     "",
                                                                     ""
                                                                 ],
                                                  "items":  [ "C", ",", "Db", ",", "D", ",", "Eb", ",", "E", ",", "F", ",", "F#", ",", "G", ",", "Ab", ",", "A", ",", "Bb", ",", "B" ],
                                                  "parameter_enable":  0,
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            545,
                                                                            246,
                                                                            100,
                                                                            22
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "prep-key",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        570,
                                                                        418,
                                                                        70,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "prepend key"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "piano-buf",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        560,
                                                                        675,
                                                                        160,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "float",
                                                                     "bang"
                                                                 ],
                                                  "text":  "buffer~ piano piano.wav"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "pipe-comp",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  4,
                                                  "numoutlets":  3,
                                                  "patching_rect":  [
                                                                        490,
                                                                        492,
                                                                        90,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "",
                                                                     "",
                                                                     ""
                                                                 ],
                                                  "text":  "pipe 0 0 0 0"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "pipe-bass",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  4,
                                                  "numoutlets":  3,
                                                  "patching_rect":  [
                                                                        760,
                                                                        505,
                                                                        90,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "",
                                                                     "",
                                                                     ""
                                                                 ],
                                                  "text":  "pipe 0 0 0 0"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "mk-bass",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  3,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        760,
                                                                        535,
                                                                        80,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "float",
                                                                     "float"
                                                                 ],
                                                  "text":  "makenote 0 0"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "pk-bass",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        760,
                                                                        565,
                                                                        60,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "pack 0 0"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "pr-bass",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        760,
                                                                        595,
                                                                        100,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "prepend midinote"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "poly-bass",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        760,
                                                                        650,
                                                                        145,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal"
                                                                 ],
                                                  "text":  "poly~ bass-voice 8 @steal 1"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "bass-buf",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        760,
                                                                        675,
                                                                        150,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "float",
                                                                     "bang"
                                                                 ],
                                                  "text":  "buffer~ bass bass.wav"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-bass",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        760,
                                                                        480,
                                                                        220,
                                                                        20
                                                                    ],
                                                  "text":  "Bass (bass.wav must be in the same folder)"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-bass-on",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        780,
                                                                        270,
                                                                        40,
                                                                        20
                                                                    ],
                                                  "text":  "Bass",
                                                  "presentation":  1,
                                                  "presentation_rect":  [ 96, 318, 32, 20 ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "bass-on",
                                                  "maxclass":  "toggle",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     "int"
                                                                 ],
                                                  "parameter_enable":  0,
                                                  "patching_rect":  [
                                                                        780,
                                                                        292,
                                                                        24,
                                                                        24
                                                                    ],
                                                  "presentation":  1,
                                                  "presentation_rect":  [ 130, 316, 24, 24 ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "prep-bass-on",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        780,
                                                                        325,
                                                                        105,
                                                                        22
                                                                    ],
                                                  "text":  "prepend playbass"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-piano-on",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        900,
                                                                        270,
                                                                        40,
                                                                        20
                                                                    ],
                                                  "text":  "Piano",
                                                  "presentation":  1,
                                                  "presentation_rect":  [ 166, 318, 36, 20 ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "piano-on",
                                                  "maxclass":  "toggle",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     "int"
                                                                 ],
                                                  "parameter_enable":  0,
                                                  "patching_rect":  [
                                                                        900,
                                                                        292,
                                                                        24,
                                                                        24
                                                                    ],
                                                  "presentation":  1,
                                                  "presentation_rect":  [ 204, 316, 24, 24 ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "prep-piano-on",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        900,
                                                                        325,
                                                                        110,
                                                                        22
                                                                    ],
                                                  "text":  "prepend playpiano"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-bold",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        690,
                                                                        365,
                                                                        90,
                                                                        20
                                                                    ],
                                                  "text":  "Boldness 0-100",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            422,
                                                                            90,
                                                                            20
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "bold",
                                                  "maxclass":  "number",
                                                  "numinlets":  1,
                                                  "numoutlets":  2,
                                                  "outlettype":  [
                                                                     "",
                                                                     "bang"
                                                                 ],
                                                  "parameter_enable":  0,
                                                  "minimum":  0,
                                                  "maximum":  100,
                                                  "patching_rect":  [
                                                                        690,
                                                                        387,
                                                                        50,
                                                                        22
                                                                    ],
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            110,
                                                                            420,
                                                                            50,
                                                                            22
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "prep-bold",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        690,
                                                                        418,
                                                                        75,
                                                                        22
                                                                    ],
                                                  "text":  "prepend bold"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-accept",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        790,
                                                                        365,
                                                                        220,
                                                                        20
                                                                    ],
                                                  "text":  "Accept a proposal: sustain pedal, or click accept"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "accept-btn",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        790,
                                                                        387,
                                                                        50,
                                                                        22
                                                                    ],
                                                  "text":  "accept",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            456,
                                                                            60,
                                                                            22
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "pedal-in",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  2,
                                                  "outlettype":  [
                                                                     "int",
                                                                     "int"
                                                                 ],
                                                  "patching_rect":  [
                                                                        900,
                                                                        387,
                                                                        60,
                                                                        22
                                                                    ],
                                                  "text":  "ctlin 64"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-quantum",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1000,
                                                                        480,
                                                                        420,
                                                                        20
                                                                    ],
                                                  "text":  "Quantum measurement: once per bar, decides whether the next bar gets a proposal (needs The QAC Toolkit)"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "q-circuit",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1000,
                                                                        505,
                                                                        420,
                                                                        22
                                                                    ],
                                                  "text":  "QuantumCircuit qc 1 1, qc rx $1 0, qc m 0 0, Simulator sim qc 1, sim get_counts"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "q-sim",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1000,
                                                                        540,
                                                                        100,
                                                                        22
                                                                    ],
                                                  "text":  "och.microqiskit"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "q-print",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1120,
                                                                        570,
                                                                        95,
                                                                        22
                                                                    ],
                                                  "text":  "print quantum-result"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "q-route",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  2,
                                                  "outlettype":  [
                                                                     "",
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1000,
                                                                        570,
                                                                        85,
                                                                        22
                                                                    ],
                                                  "text":  "route counts"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "q-result",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1080,
                                                                        597,
                                                                        100,
                                                                        22
                                                                    ],
                                                  "text":  "prepend qresult"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "drums-buf",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  2,
                                                  "outlettype":  [
                                                                     "float",
                                                                     "bang"
                                                                 ],
                                                  "patching_rect":  [
                                                                        960,
                                                                        675,
                                                                        160,
                                                                        22
                                                                    ],
                                                  "text":  "buffer~ drums drums.wav"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-drums-buf",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        960,
                                                                        700,
                                                                        260,
                                                                        20
                                                                    ],
                                                  "text":  "Drum recordings (drums.wav must be in the same folder)"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "init-bass-on",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1030,
                                                                        125,
                                                                        25,
                                                                        22
                                                                    ],
                                                  "text":  "1"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "init-piano-on",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1060,
                                                                        125,
                                                                        25,
                                                                        22
                                                                    ],
                                                  "text":  "1"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "init-bold",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1090,
                                                                        125,
                                                                        30,
                                                                        22
                                                                    ],
                                                  "text":  "30"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "set-bold",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1270,
                                                                        338,
                                                                        75,
                                                                        22
                                                                    ],
                                                  "text":  "prepend set"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-autobold",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1000,
                                                                        300,
                                                                        300,
                                                                        34
                                                                    ],
                                                  "text":  "Auto boldness: +5 per accepted proposal, -5 per one that went back (only between 10 and 90)"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "autobold",
                                                  "maxclass":  "toggle",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     "int"
                                                                 ],
                                                  "parameter_enable":  0,
                                                  "patching_rect":  [
                                                                        1000,
                                                                        338,
                                                                        24,
                                                                        24
                                                                    ],
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            190,
                                                                            420,
                                                                            24,
                                                                            24
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "prep-autobold",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1030,
                                                                        338,
                                                                        110,
                                                                        22
                                                                    ],
                                                  "text":  "prepend autobold"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "init-autobold",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1125,
                                                                        125,
                                                                        25,
                                                                        22
                                                                    ],
                                                  "text":  "1"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-knob",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1020,
                                                                        362,
                                                                        400,
                                                                        34
                                                                    ],
                                                  "text":  "Keyboard controls: click learnknob, then turn a knob = boldness knob; click learnfinish, then turn a knob = finish knob (turn fully down to end)"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "knob-in",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  3,
                                                  "outlettype":  [
                                                                     "int",
                                                                     "int",
                                                                     "int"
                                                                 ],
                                                  "patching_rect":  [
                                                                        1000,
                                                                        425,
                                                                        50,
                                                                        22
                                                                    ],
                                                  "text":  "ctlin"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "knob-pack",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1000,
                                                                        452,
                                                                        60,
                                                                        22
                                                                    ],
                                                  "text":  "pack 0 0"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "prep-cc",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1070,
                                                                        452,
                                                                        70,
                                                                        22
                                                                    ],
                                                  "text":  "prepend cc"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "learnknob",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1160,
                                                                        452,
                                                                        70,
                                                                        22
                                                                    ],
                                                  "text":  "learnknob",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            528,
                                                                            90,
                                                                            22
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-piano",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        560,
                                                                        700,
                                                                        330,
                                                                        20
                                                                    ],
                                                  "text":  "Piano recordings (piano.wav must be in the same folder)"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "init-key",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        1000,
                                                                        125,
                                                                        25,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "0"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-split",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        720,
                                                                        200,
                                                                        150,
                                                                        20
                                                                    ],
                                                  "text":  "Split (60 = middle C)",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            320,
                                                                            282,
                                                                            140,
                                                                            20
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "split",
                                                  "maxclass":  "number",
                                                  "numinlets":  1,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        720,
                                                                        222,
                                                                        50,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "",
                                                                     "bang"
                                                                 ],
                                                  "minimum":  36,
                                                  "maximum":  96,
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            462,
                                                                            280,
                                                                            50,
                                                                            22
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "prep-split",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        720,
                                                                        252,
                                                                        80,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "prepend split"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-drums",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        720,
                                                                        270,
                                                                        40,
                                                                        20
                                                                    ],
                                                  "text":  "Drums",
                                                  "presentation":  1,
                                                  "presentation_rect":  [ 20, 318, 40, 20 ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "drums",
                                                  "maxclass":  "toggle",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        720,
                                                                        292,
                                                                        24,
                                                                        24
                                                                    ],
                                                  "outlettype":  [
                                                                     "int"
                                                                 ],
                                                  "parameter_enable":  0,
                                                  "presentation":  1,
                                                  "presentation_rect":  [ 62, 316, 24, 24 ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "prep-drums",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        720,
                                                                        325,
                                                                        85,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "prepend drums"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "compjs",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  14,
                                                  "patching_rect":  [
                                                                        400,
                                                                        470,
                                                                        75,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "",
                                                                     "",
                                                                     "",
                                                                     "",
                                                                     "",
                                                                     "",
                                                                     "",
                                                                     "",
                                                                     "",
                                                                     "",
                                                                     "",
                                                                     "",
                                                                     "",
                                                                     ""
                                                                 ],
                                                  "text":  "js comp.js",
                                                  "saved_object_attributes":  {
                                                                                  "filename":  "comp.js",
                                                                                  "parameter_enable":  0
                                                                              }
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "set-beat",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        560,
                                                                        505,
                                                                        70,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "prepend set"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "beat",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        560,
                                                                        535,
                                                                        330,
                                                                        46
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "Stopped",
                                                  "fontsize":  26.0,
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            126,
                                                                            828,
                                                                            46
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "set-status",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        560,
                                                                        590,
                                                                        70,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "prepend set"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "status",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        560,
                                                                        618,
                                                                        260,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "-",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            180,
                                                                            705,
                                                                            22
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-status",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        560,
                                                                        643,
                                                                        190,
                                                                        20
                                                                    ],
                                                  "text":  "Style / the chord the band is following"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "mk-comp",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  3,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        400,
                                                                        505,
                                                                        80,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "float",
                                                                     "float"
                                                                 ],
                                                  "text":  "makenote 0 0"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "pk-comp",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        400,
                                                                        535,
                                                                        60,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "pack 0 0"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "pr-comp",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        400,
                                                                        565,
                                                                        100,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "prepend midinote"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "poly-comp",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        400,
                                                                        595,
                                                                        155,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal",
                                                                     "signal"
                                                                 ],
                                                  "text":  "poly~ piano-voice 32 @steal 1"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "mk-drum",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  3,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        230,
                                                                        505,
                                                                        80,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "float",
                                                                     "float"
                                                                 ],
                                                  "text":  "makenote 0 0"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "pk-drum",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        230,
                                                                        535,
                                                                        60,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "pack 0 0"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "pr-drum",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        230,
                                                                        565,
                                                                        100,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "prepend midinote"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "poly-drum",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        230,
                                                                        595,
                                                                        165,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal"
                                                                 ],
                                                  "text":  "poly~ drum-voice 48 @steal 1"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "prep-mine",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        30,
                                                                        470,
                                                                        100,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "prepend midinote"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "poly-mine",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        30,
                                                                        500,
                                                                        175,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal",
                                                                     "signal"
                                                                 ],
                                                  "text":  "poly~ piano-voice 24 @steal 1"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "gain-mineR",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        80,
                                                                        535,
                                                                        40,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal"
                                                                 ],
                                                  "text":  "*~ 1"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "gain-mine",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        30,
                                                                        535,
                                                                        40,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal"
                                                                 ],
                                                  "text":  "*~ 1"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "mine",
                                                  "maxclass":  "toggle",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        30,
                                                                        405,
                                                                        24,
                                                                        24
                                                                    ],
                                                  "outlettype":  [
                                                                     "int"
                                                                 ],
                                                  "parameter_enable":  0,
                                                  "presentation":  1,
                                                  "presentation_rect":  [ 240, 316, 24, 24 ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-mine",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        60,
                                                                        407,
                                                                        210,
                                                                        20
                                                                    ],
                                                  "text":  "My piano sound (off if the keyboard makes its own sound)"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "dac",
                                                  "maxclass":  "ezdac~",
                                                  "numinlets":  2,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        30,
                                                                        640,
                                                                        48,
                                                                        48
                                                                    ],
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            800,
                                                                            68,
                                                                            48,
                                                                            48
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-dac",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        90,
                                                                        655,
                                                                        380,
                                                                        20
                                                                    ],
                                                  "text":  "No sound? Options > Audio Status: choose the right Output Device"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "loadbang",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  0,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        900,
                                                                        60,
                                                                        65,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "bang"
                                                                 ],
                                                  "text":  "loadbang"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "t-load",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  5,
                                                  "patching_rect":  [
                                                                        900,
                                                                        90,
                                                                        80,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "bang",
                                                                     "bang",
                                                                     "bang",
                                                                     "bang",
                                                                     "bang"
                                                                 ],
                                                  "text":  "t b b b b b"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "init-bpm",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        840,
                                                                        125,
                                                                        30,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "90"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "init-split",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        875,
                                                                        125,
                                                                        30,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "60"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "init-mine",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        910,
                                                                        125,
                                                                        25,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "1"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "init-style",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        940,
                                                                        125,
                                                                        25,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "0"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "init-drums",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        970,
                                                                        125,
                                                                        25,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "1"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "dsp",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        900,
                                                                        160,
                                                                        75,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "; dsp start"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "bass-pick",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        890,
                                                                        570,
                                                                        35,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "int"
                                                                 ],
                                                  "text":  "+ 1"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "bass-gate",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        890,
                                                                        597,
                                                                        45,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "",
                                                                     ""
                                                                 ],
                                                  "text":  "gate 2"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "poly-upright",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        910,
                                                                        650,
                                                                        165,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal"
                                                                 ],
                                                  "text":  "poly~ upright-voice 8 @steal 1"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "upright-buf",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        1250,
                                                                        675,
                                                                        170,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "float",
                                                                     "bang"
                                                                 ],
                                                  "text":  "buffer~ upright upright.wav"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-upright",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1250,
                                                                        700,
                                                                        260,
                                                                        22
                                                                    ],
                                                  "text":  "Double bass (jazz styles; upright.wav must be in the same folder)"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "vol-mine",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        30,
                                                                        565,
                                                                        45,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal"
                                                                 ],
                                                  "text":  "*~ 1.6"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "vol-mineR",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        80,
                                                                        565,
                                                                        45,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal"
                                                                 ],
                                                  "text":  "*~ 1.6"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "band-L",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        160,
                                                                        620,
                                                                        45,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal"
                                                                 ],
                                                  "text":  "*~ 0.8"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "band-R",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        210,
                                                                        620,
                                                                        45,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal"
                                                                 ],
                                                  "text":  "*~ 0.8"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-myvol",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        30,
                                                                        760,
                                                                        170,
                                                                        22
                                                                    ],
                                                  "text":  "My volume (1 = as loud as the band)"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "myvol",
                                                  "maxclass":  "flonum",
                                                  "numinlets":  1,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        30,
                                                                        782,
                                                                        55,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "",
                                                                     "bang"
                                                                 ],
                                                  "parameter_enable":  0,
                                                  "format":  6,
                                                  "maximum":  4,
                                                  "minimum":  0,
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            90,
                                                                            352,
                                                                            55,
                                                                            22
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-bandvol",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        220,
                                                                        760,
                                                                        80,
                                                                        22
                                                                    ],
                                                  "text":  "Band volume"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "bandvol",
                                                  "maxclass":  "flonum",
                                                  "numinlets":  1,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        220,
                                                                        782,
                                                                        55,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "",
                                                                     "bang"
                                                                 ],
                                                  "parameter_enable":  0,
                                                  "format":  6,
                                                  "maximum":  2,
                                                  "minimum":  0,
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            240,
                                                                            352,
                                                                            55,
                                                                            22
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "init-myvol",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        1160,
                                                                        125,
                                                                        30,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "1.6"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "init-bandvol",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        1195,
                                                                        125,
                                                                        30,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "0.8"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-finish",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        485,
                                                                        395,
                                                                        80,
                                                                        62
                                                                    ],
                                                  "text":  "End: click finish (or turn the boldness knob fully down): final chord in 4 bars, then stop"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "finish",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        430,
                                                                        400,
                                                                        50,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "finish",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            170,
                                                                            82,
                                                                            60,
                                                                            22
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "end-off",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        430,
                                                                        430,
                                                                        25,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "0"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "q-split",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1000,
                                                                        597,
                                                                        70,
                                                                        22
                                                                    ],
                                                  "text":  "fromsymbol"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "bpm-slider",
                                                  "maxclass":  "slider",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        455,
                                                                        292,
                                                                        105,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "parameter_enable":  0,
                                                  "min":  40,
                                                  "orientation":  1,
                                                  "size":  161,
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            146,
                                                                            246,
                                                                            150,
                                                                            22
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-accept2",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1000,
                                                                        160,
                                                                        420,
                                                                        34
                                                                    ],
                                                  "text":  "Without a pedal: press the space bar in this window, or click learnaccept and press a button on the keyboard (once per button; several allowed)"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "space-key",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  0,
                                                  "numoutlets":  4,
                                                  "patching_rect":  [
                                                                        1000,
                                                                        200,
                                                                        40,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "int",
                                                                     "int",
                                                                     "int",
                                                                     "int"
                                                                 ],
                                                  "text":  "key"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "space-sel",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  3,
                                                  "numoutlets":  3,
                                                  "patching_rect":  [
                                                                        1000,
                                                                        228,
                                                                        70,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "bang",
                                                                     "bang",
                                                                     ""
                                                                 ],
                                                  "text":  "sel 32 120"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "learnaccept",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        1080,
                                                                        200,
                                                                        80,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "learnaccept",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            588,
                                                                            90,
                                                                            22
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "knob-print",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1240,
                                                                        452,
                                                                        70,
                                                                        22
                                                                    ],
                                                  "text":  "print knob"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-respond",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1450,
                                                                        160,
                                                                        240,
                                                                        20
                                                                    ],
                                                  "text":  "Piano comping (pop styles; the jazz styles keep their own)"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "respond-menu",
                                                  "maxclass":  "umenu",
                                                  "numinlets":  1,
                                                  "numoutlets":  3,
                                                  "patching_rect":  [
                                                                        1450,
                                                                        182,
                                                                        170,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "int",
                                                                     "",
                                                                     ""
                                                                 ],
                                                  "items":  [ "0 Fixed pattern", ",", "1 Fill the gaps", ",", "2 Complementary rhythm", ",", "3 Second voice", ",", "4 Echo my rhythm", ",", "5 Mix (2+3+1)" ],
                                                  "parameter_enable":  0,
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            90,
                                                                            280,
                                                                            210,
                                                                            22
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "prep-respond",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        1450,
                                                                        212,
                                                                        100,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "prepend respond"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "learnfinish",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1080,
                                                                        425,
                                                                        75,
                                                                        22
                                                                    ],
                                                  "text":  "learnfinish",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            558,
                                                                            90,
                                                                            22
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-title",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        40,
                                                                        400,
                                                                        20
                                                                    ],
                                                  "text":  "co-play: an improvising band",
                                                  "presentation":  1,
                                                  "presentation_rect":  [ 20, 8, 330, 28 ],
                                                  "fontsize":  20
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-hint",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        66,
                                                                        520,
                                                                        20
                                                                    ],
                                                  "text":  "(Performance panel. To see the patch, toggle Presentation Mode, bottom left.)",
                                                  "presentation":  1,
                                                  "presentation_rect":  [ 360, 14, 490, 20 ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-sec1",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        92,
                                                                        100,
                                                                        20
                                                                    ],
                                                  "text":  "Play",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            44,
                                                                            100,
                                                                            24
                                                                        ],
                                                  "fontsize":  16
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-finish",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        118,
                                                                        260,
                                                                        20
                                                                    ],
                                                  "text":  "End: final chord in 4 bars, then stop",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            236,
                                                                            84,
                                                                            260,
                                                                            20
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-dac",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        144,
                                                                        64,
                                                                        20
                                                                    ],
                                                  "text":  "Sound",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            735,
                                                                            84,
                                                                            64,
                                                                            20
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-sec2",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        170,
                                                                        100,
                                                                        20
                                                                    ],
                                                  "text":  "Settings",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            218,
                                                                            100,
                                                                            24
                                                                        ],
                                                  "fontsize":  16
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-key",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        196,
                                                                        30,
                                                                        20
                                                                    ],
                                                  "text":  "Key",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            518,
                                                                            248,
                                                                            24,
                                                                            20
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-respond",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        222,
                                                                        70,
                                                                        20
                                                                    ],
                                                  "text":  "Comping",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            282,
                                                                            70,
                                                                            20
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-mine",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        248,
                                                                        240,
                                                                        20
                                                                    ],
                                                  "text":  "My piano sound (off if the keyboard makes its own)",
                                                  "presentation":  1,
                                                  "presentation_rect":  [ 268, 318, 320, 20 ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-myvol",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        274,
                                                                        70,
                                                                        20
                                                                    ],
                                                  "text":  "My volume",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            354,
                                                                            70,
                                                                            20
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-bandvol",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        300,
                                                                        70,
                                                                        20
                                                                    ],
                                                  "text":  "Band volume",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            170,
                                                                            354,
                                                                            70,
                                                                            20
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-sec3",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        326,
                                                                        120,
                                                                        20
                                                                    ],
                                                  "text":  "Harmony proposals",
                                                  "presentation":  1,
                                                  "presentation_rect":  [ 20, 392, 200, 24 ],
                                                  "fontsize":  16
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-autobold",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        352,
                                                                        280,
                                                                        20
                                                                    ],
                                                  "text":  "Auto boldness (accepted +5, not accepted -5)",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            220,
                                                                            422,
                                                                            280,
                                                                            20
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-accept",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        378,
                                                                        420,
                                                                        20
                                                                    ],
                                                  "text":  "Accept: pitch bend up, space bar, sustain pedal or a learned button. Reject: pitch bend down, x key or the red button. Big text: orange = proposal waiting, green = accepted, blue = went back.",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            150,
                                                                            452,
                                                                            590,
                                                                            34
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-sec4",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        404,
                                                                        600,
                                                                        20
                                                                    ],
                                                  "text":  "Keyboard controls: click a learn button, then move a knob or press a button",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            496,
                                                                            600,
                                                                            24
                                                                        ],
                                                  "fontsize":  16
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-lk",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        430,
                                                                        300,
                                                                        20
                                                                    ],
                                                  "text":  "Set the boldness knob",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            118,
                                                                            530,
                                                                            300,
                                                                            20
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-lf",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        456,
                                                                        400,
                                                                        20
                                                                    ],
                                                  "text":  "Set the finish knob (turn fully down = end in 4 bars; turn back up to cancel)",
                                                  "presentation":  1,
                                                  "presentation_rect":  [ 118, 560, 480, 20 ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-la",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        482,
                                                                        400,
                                                                        20
                                                                    ],
                                                  "text":  "Add an accept button (once per button; you can add several)",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            118,
                                                                            590,
                                                                            400,
                                                                            20
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "set-controls",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1750,
                                                                        700,
                                                                        75,
                                                                        22
                                                                    ],
                                                  "text":  "prepend set"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "controls-show",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1750,
                                                                        730,
                                                                        600,
                                                                        22
                                                                    ],
                                                  "text":  "-",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            638,
                                                                            720,
                                                                            22
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-controls",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        760,
                                                                        300,
                                                                        20
                                                                    ],
                                                  "text":  "Current settings (kept when the patch is reopened)",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            616,
                                                                            300,
                                                                            20
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "mood-route",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  5,
                                                  "outlettype":  [
                                                                     "",
                                                                     "",
                                                                     "",
                                                                     "",
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1750,
                                                                        800,
                                                                        210,
                                                                        22
                                                                    ],
                                                  "text":  "route proposal accepted back none"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "mood-p",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1750,
                                                                        830,
                                                                        150,
                                                                        22
                                                                    ],
                                                  "text":  "textcolor 1. 0.65 0.2 1."
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "mood-a",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1910,
                                                                        830,
                                                                        160,
                                                                        22
                                                                    ],
                                                  "text":  "textcolor 0.35 0.9 0.45 1."
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "mood-b",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        2080,
                                                                        830,
                                                                        150,
                                                                        22
                                                                    ],
                                                  "text":  "textcolor 0.55 0.75 1. 1."
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "mood-n",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        2240,
                                                                        830,
                                                                        160,
                                                                        22
                                                                    ],
                                                  "text":  "textcolor 0.92 0.92 0.92 1."
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "bend-in",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  2,
                                                  "outlettype":  [
                                                                     "int",
                                                                     "int"
                                                                 ],
                                                  "patching_rect":  [
                                                                        1750,
                                                                        870,
                                                                        50,
                                                                        22
                                                                    ],
                                                  "text":  "bendin"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "prep-bend",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1750,
                                                                        898,
                                                                        85,
                                                                        22
                                                                    ],
                                                  "text":  "prepend bend"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "c-bend",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1810,
                                                                        870,
                                                                        330,
                                                                        20
                                                                    ],
                                                  "text":  "Pitch bend: up = accept the proposal, down = reject (goes back at once)"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "reject-btn",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        1750,
                                                                        930,
                                                                        50,
                                                                        22
                                                                    ],
                                                  "text":  "reject",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            86,
                                                                            456,
                                                                            56,
                                                                            22
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "prep-pedal",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "patching_rect":  [
                                                                        900,
                                                                        412,
                                                                        85,
                                                                        22
                                                                    ],
                                                  "text":  "prepend pedal"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "rec",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        960,
                                                                        80,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal"
                                                                 ],
                                                  "text":  "sfrecord~ 2"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "forget",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        990,
                                                                        50,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "forget",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            772,
                                                                            60,
                                                                            22
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-sec5",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        1020,
                                                                        200,
                                                                        24
                                                                    ],
                                                  "text":  "Recording and memory",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            20,
                                                                            740,
                                                                            200,
                                                                            24
                                                                        ],
                                                  "fontsize":  16
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-rec",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        1050,
                                                                        640,
                                                                        34
                                                                    ],
                                                  "text":  "After each stop, three files are saved in D:\\33code\\co-play\\recordings: .wav audio, .mid (opens as a score in MuseScore) and .txt chord chart (\u2713 accepted, \u21ba came back from memory).",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            150,
                                                                            772,
                                                                            600,
                                                                            34
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "p-forget",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        1090,
                                                                        70,
                                                                        20
                                                                    ],
                                                  "text":  "Forget all",
                                                  "presentation":  1,
                                                  "presentation_rect":  [
                                                                            86,
                                                                            774,
                                                                            62,
                                                                            20
                                                                        ]
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "lim",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  4,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        1180,
                                                                        90,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal",
                                                                     "signal",
                                                                     "",
                                                                     ""
                                                                 ],
                                                  "text":  "omx.peaklim~"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "lim-load",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        1750,
                                                                        1150,
                                                                        60,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "bang"
                                                                 ],
                                                  "text":  "loadbang"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "lim-set",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        1820,
                                                                        1150,
                                                                        260,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "mode 1, threshold 48, ingain 50, outgain 50"
                                              }
                                  }
                              ],
                    "lines":  [
                                  { "patchline": { "source": [ "reject-big", 0 ], "destination": [ "reject-btn", 0 ] } },
{ "patchline": { "source": [ "space-sel", 1 ], "destination": [ "reject-btn", 0 ] } },
{
                                      "patchline":  {
                                                        "source":  [
                                                                       "notein",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "pack-in",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "notein",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "pack-in",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pack-in",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "keys",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pack-in",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "chordjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pack-in",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "prep-played",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pack-in",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "prep-mine",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "clear",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "chordjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "compjs",
                                                                       4
                                                                   ],
                                                        "destination":  [
                                                                            "set-name",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "set-name",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "name",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "chordjs",
                                                                       2
                                                                   ],
                                                        "destination":  [
                                                                            "prep-chord",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "prep-chord",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "prep-played",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "play",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "t-play",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "t-play",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "sel-play",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "sel-play",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "start",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "sel-play",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "stop",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "start",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "stop",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "t-play",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "metro",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "metro",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "bpm",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "tick-ms",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "bpm",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "prep-tempo",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "tick-ms",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "metro",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "prep-tempo",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "style",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "prep-style",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "prep-style",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "key",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "prep-key",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "prep-key",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "t-load",
                                                                       2
                                                                   ],
                                                        "destination":  [
                                                                            "init-key",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "init-key",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "key",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "split",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "prep-split",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "prep-split",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "chordjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "prep-split",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "drums",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "prep-drums",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "prep-drums",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "compjs",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "pipe-comp",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pipe-comp",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "mk-comp",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pipe-comp",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "mk-comp",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pipe-comp",
                                                                       2
                                                                   ],
                                                        "destination":  [
                                                                            "mk-comp",
                                                                            2
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "compjs",
                                                                       5
                                                                   ],
                                                        "destination":  [
                                                                            "pipe-bass",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "bass-on",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "prep-bass-on",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "prep-bass-on",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "piano-on",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "prep-piano-on",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "prep-piano-on",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "bold",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "prep-bold",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "prep-bold",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "accept-btn",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "compjs",
                                                                       6
                                                                   ],
                                                        "destination":  [
                                                                            "q-circuit",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "q-circuit",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "q-sim",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "q-sim",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "q-route",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "q-sim",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "q-print",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "q-result",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "t-load",
                                                                       3
                                                                   ],
                                                        "destination":  [
                                                                            "init-bass-on",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "t-load",
                                                                       3
                                                                   ],
                                                        "destination":  [
                                                                            "init-piano-on",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "t-load",
                                                                       3
                                                                   ],
                                                        "destination":  [
                                                                            "init-bold",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "init-bass-on",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "bass-on",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "init-piano-on",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "piano-on",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "init-bold",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "bold",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "compjs",
                                                                       7
                                                                   ],
                                                        "destination":  [
                                                                            "set-bold",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "set-bold",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "bold",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "t-load",
                                                                       3
                                                                   ],
                                                        "destination":  [
                                                                            "init-autobold",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "init-autobold",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "autobold",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "autobold",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "prep-autobold",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "prep-autobold",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "knob-in",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "knob-pack",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "knob-in",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "knob-pack",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "knob-pack",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "prep-cc",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "prep-cc",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "learnknob",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pipe-bass",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "mk-bass",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pipe-bass",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "mk-bass",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pipe-bass",
                                                                       2
                                                                   ],
                                                        "destination":  [
                                                                            "mk-bass",
                                                                            2
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "mk-bass",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "pk-bass",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "mk-bass",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "pk-bass",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pk-bass",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "pr-bass",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "mk-comp",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "pk-comp",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "mk-comp",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "pk-comp",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pk-comp",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "pr-comp",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pr-comp",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "poly-comp",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "compjs",
                                                                       2
                                                                   ],
                                                        "destination":  [
                                                                            "mk-drum",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "mk-drum",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "pk-drum",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "mk-drum",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "pk-drum",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pk-drum",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "pr-drum",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pr-drum",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "poly-drum",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "compjs",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "set-status",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "set-status",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "status",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "compjs",
                                                                       3
                                                                   ],
                                                        "destination":  [
                                                                            "set-beat",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "set-beat",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "beat",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "prep-mine",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "poly-mine",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "poly-mine",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "gain-mine",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "mine",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "gain-mine",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "poly-mine",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "gain-mineR",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "mine",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "gain-mineR",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "loadbang",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "t-load",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "t-load",
                                                                       4
                                                                   ],
                                                        "destination":  [
                                                                            "dsp",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "t-load",
                                                                       3
                                                                   ],
                                                        "destination":  [
                                                                            "init-drums",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "t-load",
                                                                       2
                                                                   ],
                                                        "destination":  [
                                                                            "init-style",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "t-load",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "init-mine",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "t-load",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "init-split",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "t-load",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "init-bpm",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "init-bpm",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "bpm",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "init-split",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "split",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "init-mine",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "mine",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "init-style",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "style",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "init-drums",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "drums",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "compjs",
                                                                       8
                                                                   ],
                                                        "destination":  [
                                                                            "bass-pick",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "bass-pick",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "bass-gate",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pr-bass",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "bass-gate",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "bass-gate",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "poly-bass",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "bass-gate",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "poly-upright",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "gain-mine",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "vol-mine",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "gain-mineR",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "vol-mineR",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "myvol",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "vol-mine",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "myvol",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "vol-mineR",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "poly-comp",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "band-L",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "poly-comp",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "band-R",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "poly-bass",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "band-L",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "poly-bass",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "band-R",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "poly-upright",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "band-L",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "poly-upright",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "band-R",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "poly-drum",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "band-L",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "poly-drum",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "band-R",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "bandvol",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "band-L",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "bandvol",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "band-R",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "t-load",
                                                                       3
                                                                   ],
                                                        "destination":  [
                                                                            "init-myvol",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "t-load",
                                                                       3
                                                                   ],
                                                        "destination":  [
                                                                            "init-bandvol",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "init-myvol",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "myvol",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "init-bandvol",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "bandvol",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "finish",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "compjs",
                                                                       9
                                                                   ],
                                                        "destination":  [
                                                                            "end-off",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "end-off",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "play",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "q-route",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "q-split",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "q-split",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "q-result",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "bpm-slider",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "bpm",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "space-key",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "space-sel",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "space-sel",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "accept-btn",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "learnaccept",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "knob-pack",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "knob-print",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "respond-menu",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "prep-respond",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "prep-respond",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "learnfinish",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "compjs",
                                                                       10
                                                                   ],
                                                        "destination":  [
                                                                            "set-controls",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "set-controls",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "controls-show",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "compjs",
                                                                       12
                                                                   ],
                                                        "destination":  [
                                                                            "mood-route",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "mood-route",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "mood-p",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "mood-route",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "mood-a",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "mood-route",
                                                                       2
                                                                   ],
                                                        "destination":  [
                                                                            "mood-b",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "mood-route",
                                                                       3
                                                                   ],
                                                        "destination":  [
                                                                            "mood-n",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "mood-p",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "beat",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "mood-a",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "beat",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "mood-b",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "beat",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "mood-n",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "beat",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "bend-in",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "prep-bend",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "prep-bend",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "reject-btn",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pedal-in",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "prep-pedal",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "prep-pedal",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "compjs",
                                                                       13
                                                                   ],
                                                        "destination":  [
                                                                            "rec",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "forget",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "compjs",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "lim-load",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "lim-set",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "lim-set",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "lim",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "vol-mine",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "lim",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "band-L",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "lim",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "vol-mineR",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "lim",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "band-R",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "lim",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "lim",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "dac",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "lim",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "dac",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "lim",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "rec",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "lim",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "rec",
                                                                            1
                                                                        ]
                                                    }
                                  }
                              ],
                    "openinpresentation":  1
                }
}