<CsoundSynthesizer>

<CsOptions>

; realtime output
-o dac -M0 ;
; -o output.wav -W -3 ;uncomment for writing to test.wav file

</CsOptions>


<CsInstruments>

sr = 44100
ksmps = 32
0dbfs = 1
nchnls = 1

;assign all keys to instrument 1, except drum pads (channel 10)
massign 1, 1

gisine 		ftgen 0, 0, 65536, 10, 1

; square formula harmonics : if n is even then 0, else 4/(n*pi)
gisquare 	ftgen 0, 0, 65536, 10, 1, 0, 4/(3*3.14), 0, 4/(5*3.14), 0, 4/(7*3.14), 0, 4/(9*3.14), 0, 4/(11*3.14), 0, 4/(13*3.14), 0, 4/(15*3.14), 0, 4/(17*3.14), 0, 4/(19*3.14), 0, 4/(21*3.14), 0, 4/(23*3.14), 0, 4/(25*3.14), 0, 4/(27*3.14), 0, 4/(29*3.14), 0, 4/(31*3.14), 0, 4/(33*3.14), 0, 4/(35*3.14), 0, 4/(37*3.14), 0, 4/(39*3.14), 0, 4/(42*3.14), 0, 4/(45*3.14), 0, 4/(48*3.14), 0, 4/(51*3.14)

; -1/(n*pi)
gisawtooth	ftgen 0, 0, 65536, 10, -1/(1*3.14), -1/(2*3.14), -1/(3*3.14), -1/(4*3.14), -1/(5*3.14), -1/(6*3.14), -1/(7*3.14), -1/(8*3.14), -1/(9*3.14), -1/(10*3.14), -1/(11*3.14)

; (8/((pi*pi)*(n*n)))*((-1)^((n-1)/2)) for odd harmonics. 0 for even harmonics.
gitriangle ftgen 0, 0, 65536, 10, (8/((3.14*3.14)*(1)))*((-1)^((1-1)/2)), 0, (8/((3.14*3.14)*(3*3)))*((-1)^((3-1)/2)),0, (8/((3.14*3.14)*(5*5)))*((-1)^((5-1)/2)), 0, (8/((3.14*3.14)*(7*7)))*((-1)^((7-1)/2))

initc7 1, 1, 1
initc7 1, 70, 1
initc7 1, 71, 1/127
initc7 1, 72, 0.2
initc7 1, 73, 0.2
initc7 1, 74, 1
initc7 1, 75, 1/127
initc7 1, 76, 0.2
initc7 1, 77, 0.2

instr 1
 iamp ampmidi 1
 kcps cpsmidib


 imodatt midic7 72, 0, 1
 imoddec midic7 73, 0, 1
 amodenv linenr 1, imodatt, imoddec, 0.01


 kmodamp midic7 70, 0, 1
 kmodratio midic7 71, 0, 127
 amod poscil kmodamp * amodenv, kcps * kmodratio, gisine

; display amod, 0.2, 1


 icaratt midic7 76, 0, 1
 icardec midic7 77, 0, 1
 acarenv linenr 1, icaratt, icardec, 0.01

 kcaramp midic7 74, 0, 1
 kndx midic7 1, 0, 4
 kcarratio midic7 75, 0, 127
 aout poscil kcaramp * acarenv, (kcps * kcarratio) + (amod*kcps*kndx), gisine

 out aout
endin


</CsInstruments>


<CsScore>
f 0 1000
e
</CsScore>


</CsoundSynthesizer>


