# akai_synth
Transform your AKAI MPK MINI PLUS into realtime analog synth!
The akai mini mpk plus thing is a beautiful beast.
Enjoy using the knobs on it like it is 1970.

## Requirements: Csound
Install csound. (instructions on csound.com)

## Run
Plug in your USB midi from your keyboard to your computer.

In terminal window, go into the directory that contains 'synth.csd' and type this simple command:
```
csound synth.csd
```

Now have fun playing with it.

## Synth keyboard layout
- Pitch Wheel: bends the pitch up or down
- Modulation Wheel: vibrato depth
- drum pads: not used yet in this synth
- Knob 70: Cutoff frequency
- Knob 71: Resonance
- Knob 72: Vibrato rate
- Knob 73: not used yet in this synth
- Knob 74: Attack
- Knob 75: Decay
- Knob 76: Sustain
- Knob 77: Release

## Technicalities / Internal patching

This synth runs 3 oscillators internally, all set to the pressed note frequency, one octave down and two octaves down. The output of these oscillators can be pitch bent, and/or obtain vibrato.

The oscillators output are fed to a mixer.

The mixer output is filtered through a resonant low pass filter. An ADSR envelope is also applied.

Then it goes out through the speaker.
Then your ears.
Your brain.






