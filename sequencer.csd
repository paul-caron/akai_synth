<CsoundSynthesizer>
<CsOptions>
-odac -Q0
</CsOptions>
<CsInstruments>
ksmps = 32

  instr 1
istatus   init      p4
ichan     init      1
idata1    init      p5
ivel      init      127
          midiout   istatus, ichan, idata1, ivel; send raw midi data
          turnoff   ; turn instrument off to prevent reiterations of midiout
  endin

</CsInstruments>
<CsScore>

#define NOTEON # 144 #
#define NOTEOFF # 128 #

#define PLAY(START'DURATION'NOTE) #
i 1 [$START] [$DURATION] [$NOTEON]  [$NOTE] ;
i 1 [$START + $DURATION] 0.01 [$NOTEOFF] [$NOTE] ;
#

#define TIMEUNIT # 0.3 #

r100 REPS

$PLAY(0 ' [2 * $TIMEUNIT] ' 60)
$PLAY([2 * $TIMEUNIT] ' [$TIMEUNIT] ' 48)
$PLAY([3 * $TIMEUNIT] ' [$TIMEUNIT] ' 51)
$PLAY([4 * $TIMEUNIT] ' [$TIMEUNIT] ' 48)
$PLAY([5 * $TIMEUNIT] ' [$TIMEUNIT] ' 58)
$PLAY([6 * $TIMEUNIT] ' [$TIMEUNIT] ' 56)
$PLAY([7 * $TIMEUNIT] ' [$TIMEUNIT] ' 55)

s


e

</CsScore>
</CsoundSynthesizer>
