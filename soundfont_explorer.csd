<CsoundSynthesizer>
<CsOptions>
-M0
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

giEngine     fluidEngine
giSfNum1     fluidLoad "soundfont.sf2", giEngine, 1; 

massign 1, 1

  instr 1
iPreset      midic7 70, 0, 127
             fluidProgramSelect giEngine, 1, giSfNum1, 0, iPreset

iKey         notnum; read in midi note number
iVel         ampmidi            127; read in key velocity
             fluidNote          giEngine, 1, iKey, iVel
  endin

  instr 99
aSigL, aSigR fluidOut           giEngine
             outs               aSigL, aSigR
  endin
</CsInstruments>
<CsScore>
i 99 0 3600; audio output instrument also keeps performance going
e
</CsScore>
<CsoundSynthesizer>
