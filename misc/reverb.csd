<CsoundSynthesizer>
<CsOptions>
-odac   -iadc1
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2 ; 2 channels out, 2 channels in
0dbfs  = 1

ga1 init 0 



	instr 1 

ain1, ain2 inch 1, 2
asig = ain1 + ain2
     outs asig, asig

ga1 += asig

endin


	instr 99

krvt init 10 ; time in seconds for signal to decay by 60db

arev reverb ga1, krvt
     outs arev, arev 
  
ga1  = 0
endin


</CsInstruments>
<CsScore>

i 1 0 1000
i 99 0 1000
e

</CsScore>
</CsoundSynthesizer>
