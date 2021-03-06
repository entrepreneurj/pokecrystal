Music_Clair: ; 1fa8d
	dbw $c0, Music_Clair_Ch1
	dbw $01, Music_Clair_Ch2
	dbw $02, Music_Clair_Ch3
	dbw $03, Music_Clair_Ch4
; 1fa99


Music_Clair_Ch1: ; 1fa99
	tempo 136
	volume $77
	tone $0001
	vibrato $12, $34
	stereopanning $f
	notetype $c, $93
	dutycycle $3

Music_Clair_branch_1faab: ; 1faab
	octave 4
	note F_, 0
	note F#, 0
	note F_, 0
	note __, 0
	note C#, 0
	note __, 0
	loopchannel 2, Music_Clair_branch_1faab
	octave 3
	note B_, 0
	note __, 0
	note G#, 0
	dutycycle $2
	intensity $92
	octave 5
	note F_, 0
	note G_, 3
	intensity $a7
	dutycycle $3
	octave 3
	note D#, 3
	note F_, 3
	note G_, 3

Music_Clair_branch_1fac9: ; 1fac9
	intensity $93
	callchannel Music_Clair_branch_1fb12
	octave 2
	note B_, 0
	octave 3
	note C#, 0
	note D#, 1
	octave 2
	note G_, 0
	note A#, 0
	octave 3
	note C#, 1
	octave 2
	note A#, 0
	note G_, 0
	callchannel Music_Clair_branch_1fb12
	note D#, 0
	note C#, 0
	note D#, 1
	octave 4
	note A#, 0
	note G#, 0
	note G_, 0
	note G#, 0
	note A#, 0
	octave 5
	note D#, 0
	callchannel Music_Clair_branch_1fb2e
	dutycycle $3
	note G#, 2
	note F_, 1
	note __, 0
	note A#, 3
	dutycycle $2
	note D#, 0
	note C#, 0
	note D#, 0
	note G_, 0
	note A#, 0
	octave 5
	note D#, 0
	callchannel Music_Clair_branch_1fb2e
	dutycycle $3
	note D#, 2
	note C#, 1
	note __, 0
	octave 3
	note B_, 3
	dutycycle $2
	note G#, 0
	note C#, 0
	note D#, 0
	note G#, 0
	note B_, 0
	octave 4
	note D#, 0
	loopchannel 0, Music_Clair_branch_1fac9
; 1fb12

Music_Clair_branch_1fb12: ; 1fb12
	dutycycle $3
	stereopanning $ff
	octave 3
	note B_, 0
	note __, 1
	note G#, 4
	dutycycle $2
	stereopanning $f
	octave 2
	note B_, 1
	note G#, 0
	note B_, 0
	octave 3
	note D#, 0
	note __, 0
	note D#, 0
	note F#, 0
	note F_, 0
	note C#, 0
	note __, 0
	note F_, 0
	note C#, 0
	note __, 0
	endchannel
; 1fb2e

Music_Clair_branch_1fb2e: ; 1fb2e
	octave 4
	note F#, 0
	note D#, 0
	note __, 0
	note F#, 0
	note D#, 0
	note __, 0
	octave 3
	note D#, 0
	note G#, 0
	note B_, 1
	note G#, 0
	note B_, 0
	octave 4
	note D#, 0
	note __, 0
	note D#, 0
	note F#, 0
	endchannel

Music_Clair_Ch2: ; 1fb41
	dutycycle $3
	vibrato $12, $34
	notetype $6, $b7

Music_Clair_branch_1fb49: ; 1fb49
	octave 3
	note A#, 1
	note B_, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	loopchannel 2, Music_Clair_branch_1fb49
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	intensity $82
	note D#, 1
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A#, 1
	intensity $92
	note G_, 1
	octave 4
	note C#, 1
	note D#, 1
	octave 3
	note A#, 1
	intensity $b2
	octave 4
	note C#, 1
	note D#, 1
	note G_, 1
	note D#, 1
	intensity $c2
	note C#, 1
	note D#, 1
	note G_, 1
	note A#, 1
	intensity $b7

Music_Clair_branch_1fb77: ; 1fb77
	callchannel Music_Clair_branch_1fba6
	note F#, 1
	note __, 3
	note D#, 11
	note __, 1
	note D#, 3
	note C#, 3
	octave 3
	note B_, 2
	note A#, 0
	note B_, 5
	octave 4
	note C#, 3
	note __, 1
	octave 3
	note A#, 15
	note __, 3
	forceoctave $c
	callchannel Music_Clair_branch_1fba6
	forceoctave $0
	octave 5
	note F#, 1
	note __, 3
	note D#, 11
	note __, 1
	octave 4
	note G#, 3
	note A#, 3
	note B_, 2
	octave 5
	note C_, 0
	note C#, 5
	octave 4
	note A#, 3
	note __, 1
	note G#, 15
	note __, 3
	loopchannel 0, Music_Clair_branch_1fb77
; 1fba6

Music_Clair_branch_1fba6: ; 1fba6
	octave 4
	note F#, 1
	note __, 3
	note D#, 11
	note __, 1
	octave 3
	note G#, 3
	note A#, 3
	note B_, 2
	octave 4
	note C_, 0
	note C#, 5
	octave 3
	note B_, 3
	note __, 1
	octave 4
	note D#, 15
	note __, 3
	endchannel

Music_Clair_Ch3: ; 1fbb9
	notetype $c, $14
	forceoctave $c
	octave 3
	note C#, 1
	note __, 3
	octave 2
	note G#, 0
	note B_, 0
	octave 3
	note C#, 1
	note __, 3
	octave 2
	note G#, 0
	note B_, 0
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note A#, 3
	note G#, 3
	note G_, 3

Music_Clair_branch_1fbd1: ; 1fbd1
	callchannel Music_Clair_branch_1fc3c
	octave 2
	note C#, 1
	note __, 0
	note G#, 1
	note __, 0
	note C#, 1
	note __, 1
	note D#, 1
	note A#, 1
	note D#, 1
	callchannel Music_Clair_branch_1fc3c
	octave 2
	note G#, 1
	note __, 0
	note C#, 1
	note __, 0
	note D#, 1
	note __, 1
	note D#, 0
	note C#, 0
	note D#, 0
	note F_, 0
	note G_, 0
	note A#, 0
	octave 1
	note G#, 1
	note __, 0
	octave 2
	note D#, 1
	note __, 0
	octave 1
	note G#, 1
	octave 3
	note F#, 0
	note __, 0
	octave 1
	note G#, 0
	octave 3
	note D#, 0
	octave 2
	note D#, 1
	octave 1
	note G#, 1
	octave 2
	note C#, 1
	note __, 0
	note G#, 1
	note __, 0
	note C#, 1
	octave 3
	note D#, 0
	note __, 0
	octave 2
	note D#, 0
	octave 3
	note A#, 0
	octave 2
	note A#, 1
	octave 3
	note G_, 0
	octave 2
	note D#, 0
	octave 1
	note G#, 1
	note __, 0
	octave 2
	note D#, 1
	note __, 0
	octave 1
	note G#, 1
	octave 3
	note F#, 0
	note __, 0
	octave 1
	note G#, 0
	octave 3
	note D#, 0
	octave 2
	note D#, 1
	octave 1
	note G#, 1
	octave 2
	note D#, 1
	note __, 0
	note G_, 1
	note __, 0
	note G#, 1
	octave 2
	note B_, 0
	note __, 0
	octave 1
	note G#, 0
	octave 2
	note A#, 0
	note D#, 1
	note G#, 0
	octave 1
	note G#, 0
	loopchannel 0, Music_Clair_branch_1fbd1
; 1fc3c

Music_Clair_branch_1fc3c: ; 1fc3c
	octave 1
	note G#, 1
	note __, 0
	octave 2
	note D#, 1
	note __, 0
	octave 1
	note G#, 1
	note __, 1
	note G#, 1
	octave 2
	note D#, 1
	octave 1
	note G#, 1
	endchannel

Music_Clair_Ch4: ; 1fc4b
	togglenoise $3
	notetype $c
	stereopanning $f0
	note B_, 7
	note B_, 7
	note B_, 5
	stereopanning $ff
	note D#, 0
	note D#, 0
	note D_, 1
	note D#, 0
	note D#, 0
	note D_, 1
	note D_, 0
	note D_, 0

Music_Clair_branch_1fc5e: ; 1fc5e
	stereopanning $ff
	callchannel Music_Clair_branch_1fc6e
	note G_, 0
	stereopanning $ff
	callchannel Music_Clair_branch_1fc6e
	note F#, 0
	loopchannel 0, Music_Clair_branch_1fc5e
; 1fc6e

Music_Clair_branch_1fc6e: ; 1fc6e
	note D#, 1
	stereopanning $f0
	note G_, 1
	stereopanning $ff
	note D_, 1
	stereopanning $f0
	note G_, 0
	note G_, 0
	note G_, 1
	stereopanning $ff
	note D#, 0
	stereopanning $f0
	note G_, 0
	stereopanning $ff
	note D_, 1
	stereopanning $f0
	note G_, 0
	endchannel
; 1fc87
