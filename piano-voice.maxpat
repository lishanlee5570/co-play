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
                                 80,
                                 80,
                                 720,
                                 500
                             ],
                    "gridsize":  [
                                     15,
                                     15
                                 ],
                    "boxes":  [
                                  {
                                      "box":  {
                                                  "id":  "in",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  0,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        30,
                                                                        20,
                                                                        30,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "in 1"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "unpack",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        30,
                                                                        55,
                                                                        70,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "int",
                                                                     "int"
                                                                 ],
                                                  "text":  "unpack 0 0"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "nz",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        120,
                                                                        55,
                                                                        35,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "int"
                                                                 ],
                                                  "text":  "!= 0"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "gate",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        30,
                                                                        80,
                                                                        45,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "gate 1"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "clip",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  3,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        30,
                                                                        105,
                                                                        70,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "clip 24 96"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "start",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        30,
                                                                        130,
                                                                        120,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "expr ($i1-24)*8000."
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "tff",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        30,
                                                                        165,
                                                                        40,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "float",
                                                                     "float"
                                                                 ],
                                                  "text":  "t f f"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "end",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        80,
                                                                        195,
                                                                        55,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "float"
                                                                 ],
                                                  "text":  "+ 7950."
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "pack",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        30,
                                                                        225,
                                                                        70,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "pack 0. 0."
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "posmsg",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        30,
                                                                        255,
                                                                        90,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "$1, $2 7950"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "pos",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        30,
                                                                        290,
                                                                        40,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal",
                                                                     "bang"
                                                                 ],
                                                  "text":  "line~"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "play",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  3,
                                                  "patching_rect":  [
                                                                        30,
                                                                        325,
                                                                        85,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal",
                                                                     "signal",
                                                                     "bang"
                                                                 ],
                                                  "text":  "play~ piano 2"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "sel",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        260,
                                                                        95,
                                                                        45,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "bang",
                                                                     ""
                                                                 ],
                                                  "text":  "sel 0"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "tlbl",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  3,
                                                  "patching_rect":  [
                                                                        300,
                                                                        130,
                                                                        60,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "",
                                                                     "bang",
                                                                     ""
                                                                 ],
                                                  "text":  "t l b l"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "curve",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        300,
                                                                        165,
                                                                        170,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "expr pow($f1/127.\\, 1.5)*0.45"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "ampmsg",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        300,
                                                                        195,
                                                                        40,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "$1 3"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "offmsg",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        200,
                                                                        195,
                                                                        50,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "0. 250"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "amp",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  2,
                                                  "patching_rect":  [
                                                                        250,
                                                                        290,
                                                                        40,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal",
                                                                     "bang"
                                                                 ],
                                                  "text":  "line~"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "bright",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        480,
                                                                        165,
                                                                        200,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     ""
                                                                 ],
                                                  "text":  "expr 900. + pow($f1/127.\\, 2)*12000."
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "lp",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        30,
                                                                        360,
                                                                        90,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal"
                                                                 ],
                                                  "text":  "onepole~ 8000."
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "mul",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        30,
                                                                        395,
                                                                        35,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal"
                                                                 ],
                                                  "text":  "*~"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "out",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        30,
                                                                        430,
                                                                        45,
                                                                        22
                                                                    ],
                                                  "text":  "out~ 1"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "lpR",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        140,
                                                                        360,
                                                                        90,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal"
                                                                 ],
                                                  "text":  "onepole~ 8000."
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "mulR",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        140,
                                                                        395,
                                                                        35,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "signal"
                                                                 ],
                                                  "text":  "*~"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "outR",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        140,
                                                                        430,
                                                                        45,
                                                                        22
                                                                    ],
                                                  "text":  "out~ 2"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "busy",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        420,
                                                                        165,
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
                                                  "id":  "stop",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        370,
                                                                        165,
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
                                                  "id":  "delay",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        370,
                                                                        225,
                                                                        65,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "bang"
                                                                 ],
                                                  "text":  "delay 270"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "free",
                                                  "maxclass":  "message",
                                                  "numinlets":  2,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        370,
                                                                        255,
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
                                                  "id":  "thispoly",
                                                  "maxclass":  "newobj",
                                                  "numinlets":  1,
                                                  "numoutlets":  1,
                                                  "patching_rect":  [
                                                                        370,
                                                                        290,
                                                                        60,
                                                                        22
                                                                    ],
                                                  "outlettype":  [
                                                                     "int"
                                                                 ],
                                                  "text":  "thispoly~"
                                              }
                                  },
                                  {
                                      "box":  {
                                                  "id":  "note",
                                                  "maxclass":  "comment",
                                                  "numinlets":  1,
                                                  "numoutlets":  0,
                                                  "patching_rect":  [
                                                                        150,
                                                                        20,
                                                                        480,
                                                                        22
                                                                    ],
                                                  "text":  "piano.wav: stereo, MIDI 24-96, 8 s per key (Salamander Grand Piano, CC-BY 3.0)"
                                              }
                                  }
                              ],
                    "lines":  [
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "in",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "unpack",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "unpack",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "nz",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "nz",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "gate",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "unpack",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "gate",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "gate",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "clip",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "clip",
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
                                                                       "start",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "tff",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "tff",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "end",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "end",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "pack",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "tff",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "pack",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pack",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "posmsg",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "posmsg",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "pos",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "pos",
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
                                                                       "play",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "lp",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "lp",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "mul",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "tlbl",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "bright",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "bright",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "lp",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "amp",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "mul",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "mul",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "out",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "play",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "lpR",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "lpR",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "mulR",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "bright",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "lpR",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "amp",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "mulR",
                                                                            1
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "mulR",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "outR",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "unpack",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "sel",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "sel",
                                                                       1
                                                                   ],
                                                        "destination":  [
                                                                            "tlbl",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "tlbl",
                                                                       2
                                                                   ],
                                                        "destination":  [
                                                                            "busy",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "tlbl",
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
                                                                       "tlbl",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "curve",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "curve",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "ampmsg",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "ampmsg",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "amp",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "sel",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "offmsg",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "offmsg",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "amp",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "sel",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "delay",
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
                                                                            "delay",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "delay",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "free",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "free",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "thispoly",
                                                                            0
                                                                        ]
                                                    }
                                  },
                                  {
                                      "patchline":  {
                                                        "source":  [
                                                                       "busy",
                                                                       0
                                                                   ],
                                                        "destination":  [
                                                                            "thispoly",
                                                                            0
                                                                        ]
                                                    }
                                  }
                              ]
                }
}