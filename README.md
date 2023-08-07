# akai_synth
Transform your AKAI MPK MINI PLUS into realtime analog synth!
The akai mini mpk plus thing is a beautiful beast.
Enjoy using the knobs on it like it is 1970.

## Requirements: Csound
Install csound. (instructions on csound.com)

## Synth.csd
### Run
Plug in your USB midi from your keyboard to your computer.

In terminal window, go into the directory that contains 'synth.csd' and type this simple command:
```
csound synth.csd
```

Now have fun playing with it.

### Synth keyboard layout
Here I used the same factory settings of the Akai Mini plus with cc messages spaning from 70 to 77:
- Pitch Wheel: bends the pitch up or down
- Modulation Wheel: vibrato depth
- drum pads: not used yet in this synth
- Knob 70: Filter cutoff frequency
- Knob 71: Filter resonance
- Knob 72: Vibrato rate
- Knob 73: Filter Contour (ADSR envelope boost to the cutoff frequency)
- Knob 74: Attack
- Knob 75: Decay
- Knob 76: Sustain
- Knob 77: Release

### Technicalities / Internal patching

This synth runs 3 oscillators internally, all set to the pressed note frequency, one octave down and two octaves down. The output of these oscillators can be pitch bent, and/or obtain vibrato.

The oscillators output are fed to a mixer.

The mixer output is filtered through a resonant low pass filter. An ADSR envelope is also applied to the cutoff frequency (adjusted with contour 73).

After the filter, the signal output goes through an amplitude envelope (with same settings as the filter contour ADSR).

Then it goes out through the speaker.
Then your ears.
Your brain.

## Fm.csd

### Run
Plug in your USB midi from your keyboard to your computer.

In terminal window, go into the directory that contains 'fm.csd' and type this simple command:
```
csound fm.csd
```

### Synth keyboard layout
Here I used the same factory settings of the Akai Mini plus with cc messages spaning from 70 to 77:
- Pitch Wheel: Bends the pitch up or down
- Modulation Wheel: Frequency modulation depth
- drum pads: not used yet in this synth
- Knob 70: Modulator amplitude
- Knob 71: Modulator ratio to the pressed note frequency
- Knob 72: Modulator attack
- Knob 73: Modulator decay
- Knob 74: Carrier amplitude
- Knob 75: Carrier ratio to the pressed note frequency
- Knob 76: Carrier attack
- Knob 77: Carrier decay

### Technicalities about fm.csd
This is a basic 2 operators fm synth. Both operators have controllable amplitude, frequency ratio, attack and decay controls.

The depth of the modulation can be adjusted with the modulation wheel, up to 4 octaves shift.
