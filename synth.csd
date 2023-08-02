<CsoundSynthesizer>

<CsOptions>

; realtime output
-o dac -M0 ;
; -o output.wav -W -3 ;uncomment for writing to output.wav file

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

instr 1
 kvibf midic7 72, 0, 10
 kvibamp midic7 1, 0, 10
 kvib oscil kvibamp, kvibf, gisine

 iamp1 ampmidi 1
 kcps1 cpsmidib
 iwave1 = gitriangle
 asig1 oscil iamp1, kcps1+kvib, iwave1

 iamp2 = iamp1
 kcps2 = kcps1 / 2
 iwave2 = gisawtooth
 asig2 oscil iamp2, kcps2+kvib, iwave2

 iamp3 = iamp1
 kcps3 = kcps2 / 2
 iwave3 = gisquare
 asig3 oscil iamp3, kcps3+kvib, iwave3

 iatt midic7 74, 0, 1
 idec midic7 75, 0, 1
 islev midic7 76, 0, 1
 irel midic7 77, 0, 1
 kenv madsr iatt, idec, islev, irel

 aMixer = (asig1+asig2)

 kcutoff midic7 70, 0, 1000
 kres midic7 71, 0, 1
 aOut moogladder2 aMixer, kcutoff, kres

 out aOut*kenv
endin


</CsInstruments>


<CsScore>
f 0 1000
e
</CsScore>


</CsoundSynthesizer>


