<CsoundSynthesizer>
<CsOptions>
; big thanks to this guy i found on youtube : https://www.youtube.com/watch?v=Nv3CE5PHLuM
-iadc
-M0
-o follow2.wav -W 
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 1
0dbfs  = 1

massign 1, 1

gisine	ftgen 0, 0, 65536, 10, 1
gisaw   ftgen 3, 0, 16384, 10, 0, .2, 0, .4, 0, .6, 0, .8, 0, 1, 0, .8, 0, .6, 0, .4, 0,.2

instr 1

 iamp ampmidi 1
 kcps cpsmidib
 iwave = gisaw
 acarrier oscil iamp, kcps, iwave

 amic = inch(1)
 aenv follow2 amic, 0.001, 0.01

 ;kq is bandwidth / cutoff for bandpass

 ;filter 1
 ibw1 = 300
 kcf1 = 321
 kq1 = 2.6 ;ibw1 / kcf1
 asiglow1, asighigh1, asigbp1 svfilter acarrier, kcf1, kq1 
 aenvlow1, aenvhigh1, aenvbp1 svfilter amic, kcf1, kq1 

 ;filter 2
 ibw2 = 250
 kcf2 = 518
 kq2 = 2.6 ; ibw2 / kcf2
 asiglow2, asighigh2, asigbp2 svfilter acarrier, kcf2, kq2 
 aenvlow2, aenvhigh2, aenvbp2 svfilter amic, kcf2, kq2 

 ;filter 3
 ibw3 = 400
 kcf3 = 837
 kq3 = 2.6 ;ibw3 / kcf3
 asiglow3, asighigh3, asigbp3 svfilter acarrier, kcf3, kq3 
 aenvlow3, aenvhigh3, aenvbp3 svfilter amic, kcf3, kq3 

 ;filter 4
 ibw4 = 600
 kcf4 = 1308
 kq4 = 2.66 ;ibw4 / kcf4
 asiglow4, asighigh4, asigbp4 svfilter acarrier, kcf4, kq4 
 aenvlow4, aenvhigh4, aenvbp4 svfilter amic, kcf4, kq4 

 ;filter 5
 ibw5 = 1000
 kcf5 = 2027
 kq5 = 2.8 ;ibw5 / kcf5
 asiglow5, asighigh5, asigbp5 svfilter acarrier, kcf5, kq5 
 aenvlow5, aenvhigh5, aenvbp5 svfilter amic, kcf5, kq5 

 ;filter 0 ; low pass
 kcf0 = 180
 kq0 = 0;
 asiglow0, asighigh0, asigbp0 svfilter acarrier, kcf0, kq0 
 aenvlow0, aenvhigh0, aenvbp0 svfilter amic, kcf0, kq0 

 ;filter 6 ; high pass
 kcf6 = 3560
 kq6 = 0;
 asiglow6, asighigh6, asigbp6 svfilter acarrier, kcf6, kq6 
 aenvlow6, aenvhigh6, aenvbp6 svfilter amic, kcf6, kq6 
 

 aMixer = balance(asiglow0, aenvlow0) \
        + balance(asigbp1 , aenvbp1) \
        + balance(asigbp2 , aenvbp2) \
        + balance(asigbp3 , aenvbp3) \
        + balance(asigbp4 , aenvbp4) \
        + balance(asigbp5 , aenvbp5) \
        + balance(asighigh6 , aenvhigh6) 

 out aMixer

endin

</CsInstruments>
<CsScore>

f 0 20
e

</CsScore>
</CsoundSynthesizer>
