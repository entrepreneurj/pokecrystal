ScriptCommandTable: ; 0x96cb1
	dw Script_2call
	dw Script_3call
	dw Script_2ptcall
	dw Script_2jump
	dw Script_3jump
	dw Script_2ptjump
	dw Script_if_equal
	dw Script_if_not_equal
	dw Script_iffalse
	dw Script_iftrue
	dw Script_if_greater_than
	dw Script_if_less_than
	dw Script_jumpstd
	dw Script_callstd
	dw Script_3callasm
	dw Script_special
	dw Script_2ptcallasm
	dw Script_checkmaptriggers
	dw Script_domaptrigger
	dw Script_checktriggers
	dw Script_dotrigger
	dw Script_writebyte
	dw Script_addvar
	dw Script_random
	dw Script_checkver
	dw Script_copybytetovar
	dw Script_copyvartobyte
	dw Script_loadvar
	dw Script_checkcode
	dw Script_writevarcode
	dw Script_writecode
	dw Script_giveitem
	dw Script_takeitem
	dw Script_checkitem
	dw Script_givemoney
	dw Script_takemoney
	dw Script_checkmoney
	dw Script_givecoins
	dw Script_takecoins
	dw Script_checkcoins
	dw Script_addcellnum
	dw Script_delcellnum
	dw Script_checkcellnum
	dw Script_checktime
	dw Script_checkpoke
	dw Script_givepoke
	dw Script_giveegg
	dw Script_givepokeitem
	dw Script_checkpokeitem
	dw Script_checkevent
	dw Script_clearevent
	dw Script_setevent
	dw Script_checkflag
	dw Script_clearflag
	dw Script_setflag
	dw Script_wildon
	dw Script_wildoff
	dw Script_xycompare
	dw Script_warpmod
	dw Script_blackoutmod
	dw Script_warp
	dw Script_readmoney
	dw Script_readcoins
	dw Script_RAM2MEM
	dw Script_pokenamemem
	dw Script_itemtotext
	dw Script_mapnametotext
	dw Script_trainertotext
	dw Script_stringtotext
	dw Script_itemnotify
	dw Script_pocketisfull
	dw Script_loadfont
	dw Script_refreshscreen
	dw Script_loadmovesprites
	dw Script_loadbytec1ce
	dw Script_3writetext
	dw Script_2writetext
	dw Script_repeattext
	dw Script_yesorno
	dw Script_loadmenudata
	dw Script_writebackup
	dw Script_jumptextfaceplayer
	dw Script_3jumptext
	dw Script_jumptext
	dw Script_closetext
	dw Script_keeptextopen
	dw Script_pokepic
	dw Script_pokepicyesorno
	dw Script_interpretmenu
	dw Script_interpretmenu2
	dw Script_loadpikachudata
	dw Script_battlecheck
	dw Script_loadtrainerdata
	dw Script_loadpokedata
	dw Script_loadtrainer
	dw Script_startbattle
	dw Script_returnafterbattle
	dw Script_catchtutorial
	dw Script_trainertext
	dw Script_trainerstatus
	dw Script_winlosstext
	dw Script_scripttalkafter
	dw Script_talkaftercancel
	dw Script_talkaftercheck
	dw Script_setlasttalked
	dw Script_applymovement
	dw Script_applymovement2
	dw Script_faceplayer
	dw Script_faceperson
	dw Script_variablesprite
	dw Script_disappear
	dw Script_appear
	dw Script_follow
	dw Script_stopfollow
	dw Script_moveperson
	dw Script_writepersonxy
	dw Script_loademote
	dw Script_showemote
	dw Script_spriteface
	dw Script_follownotexact
	dw Script_earthquake
	dw Script_changemap
	dw Script_changeblock
	dw Script_reloadmap
	dw Script_reloadmappart
	dw Script_writecmdqueue
	dw Script_delcmdqueue
	dw Script_playmusic
	dw Script_playrammusic
	dw Script_musicfadeout
	dw Script_playmapmusic
	dw Script_reloadmapmusic
	dw Script_cry
	dw Script_playsound
	dw Script_waitbutton
	dw Script_warpsound
	dw Script_specialsound
	dw Script_passtoengine
	dw Script_newloadmap
	dw Script_pause
	dw Script_deactivatefacing
	dw Script_priorityjump
	dw Script_warpcheck
	dw Script_ptpriorityjump
	dw Script_return
	dw Script_end
	dw Script_reloadandreturn
	dw Script_resetfuncs
	dw Script_pokemart
	dw Script_elevator
	dw Script_trade
	dw Script_askforphonenumber
	dw Script_phonecall
	dw Script_hangup
	dw Script_describedecoration
	dw Script_fruittree
	dw Script_specialphonecall
	dw Script_checkphonecall
	dw Script_verbosegiveitem
	dw Script_verbosegiveitem2
	dw Script_loadwilddata
	dw Script_halloffame
	dw Script_credits
	dw Script_warpfacing
	dw Script_storetext
	dw Script_displaylocation
	dw Script_trainerclassname
	dw Script_name
	dw Script_wait
	dw Script_unknown0xa9
; 0x96e05

StartScript: ; 0x96e05
	ld hl, ScriptFlags
	set SCRIPT_RUNNING, [hl]
	ret
; 0x96e0b

CheckScript: ; 0x96e0b
	ld hl, ScriptFlags
	bit SCRIPT_RUNNING, [hl]
	ret
; 0x96e11

StopScript: ; 0x96e11
	ld hl, ScriptFlags
	res SCRIPT_RUNNING, [hl]
	ret
; 0x96e17

Script_3callasm: ; 0x96e17
; script command 0xe
; parameters:
;     asm (AsmPointerParam)

	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, b
	rst FarCall
	ret
; 0x96e26

Script_special: ; 0x96e26
; script command 0xf
; parameters:
;     predefined_script (MultiByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	callba Functionc01b
	ret
; 0x96e35

Script_2ptcallasm: ; 0x96e35
; script command 0x10
; parameters:
;     asm (PointerToAsmPointerParam)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	rst FarCall
	ret
; 0x96e45

Script_jumptextfaceplayer: ; 0x96e45
; script command 0x51
; parameters:
;     text_pointer (RawTextPointerLabelParam)

	ld a, [ScriptBank]
	ld [$d44e], a
	call GetScriptByte
	ld [$d44f], a
	call GetScriptByte
	ld [$d450], a
	ld b, BANK(JumpTextFacePlayerScript)
	ld hl, JumpTextFacePlayerScript
	jp ScriptJump
; 0x96e5f

Script_jumptext: ; 0x96e5f
; script command 0x53
; parameters:
;     text_pointer (RawTextPointerLabelParam)

	ld a, [ScriptBank]
	ld [$d44e], a
	call GetScriptByte
	ld [$d44f], a
	call GetScriptByte
	ld [$d450], a
	ld b, BANK(JumpTextScript)
	ld hl, JumpTextScript
	jp ScriptJump
; 0x96e79

JumpTextFacePlayerScript: ; 0x96e79
	faceplayer
JumpTextScript: ; 0x96e7a
	loadfont
	repeattext $ff, $ff
	closetext
	loadmovesprites
	end
; 0x96e81

Script_3jumptext: ; 0x96e81
; script command 0x52
; parameters:
;     text_pointer (PointerLabelBeforeBank)

	call GetScriptByte
	ld [$d44e], a
	call GetScriptByte
	ld [$d44f], a
	call GetScriptByte
	ld [$d450], a
	ld b, BANK(JumpTextScript)
	ld hl, JumpTextScript
	jp ScriptJump
; 0x96e9b

Script_2writetext: ; 0x96e9b
; script command 0x4c
; parameters:
;     text_pointer (RawTextPointerLabelParam)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [ScriptBank]
	ld b, a
	call Function269a
	ret
; 0x96eab

Script_3writetext: ; 0x96eab
; script command 0x4b
; parameters:
;     text_pointer (PointerLabelBeforeBank)

	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	call Function269a
	ret
; 0x96ebb

Script_repeattext: ; 0x96ebb
; script command 0x4d
; parameters:
;     byte (SingleByteParam)
;     byte (SingleByteParam)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	cp $ff
	jr nz, .asm_96ed8 ; 0x96ec5 $11
	ld a, l
	cp $ff
	jr nz, .asm_96ed8 ; 0x96eca $c
	ld hl, $d44e
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function269a
	ret
.asm_96ed8
	ret
; 0x96ed9

Script_closetext: ; 0x96ed9
; script command 0x54

	jp Functiona46
; 0x96edc

Script_keeptextopen: ; 0x96edc
; script command 0x55

	ld a, [$ffd8]
	push af
	ld a, $1
	ld [$ffd8], a
	call WaitBGMap
	call Functionaaf
	pop af
	ld [$ffd8], a
	ret
; 0x96eed

Script_yesorno: ; 0x96eed
; script command 0x4e

	call Function1dcf
	ld a, $0
	jr c, .asm_96ef6 ; 0x96ef2 $2
	ld a, $1
.asm_96ef6
	ld [$c2dd], a
	ret
; 0x96efa

Script_loadmenudata: ; 0x96efa
; script command 0x4f
; parameters:
;     data (MenuDataPointerParam)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld de, $1d35
	ld a, [ScriptBank]
	call Function26b7
	call Function1ad2
	ret
; 0x96f0f

Script_writebackup: ; 0x96f0f
; script command 0x50

	call Function1c17
	call Function1ad2
	ret
; 0x96f16

Script_pokepic: ; 0x96f16
; script command 0x56
; parameters:
;     pokemon (PokemonParam)

	call GetScriptByte
	and a
	jr nz, .asm_96f1f ; 0x96f1a $3
	ld a, [$c2dd]
.asm_96f1f
	ld [$d108], a
	callba Function244e3
	ret
; 0x96f29

Script_pokepicyesorno: ; 0x96f29
; script command 0x57

	callba Function24528
	ret
; 0x96f30

Script_interpretmenu2: ; 0x96f30
; script command 0x59

	ld a, [ScriptBank]
	ld hl, $1d81
	rst FarCall
	ld a, [$cfa9]
	jr nc, .asm_96f3d ; 0x96f3a $1
	xor a
.asm_96f3d
	ld [$c2dd], a
	ret
; 0x96f41

Script_interpretmenu: ; 0x96f41
; script command 0x58

	ld a, [ScriptBank]
	ld hl, $202a
	rst FarCall
	ld a, [$cf88]
	jr nc, .asm_96f4e ; 0x96f4b $1
	xor a
.asm_96f4e
	ld [$c2dd], a
	ret
; 0x96f52

Script_storetext: ; 0x96f52
; script command 0xa4
; parameters:
;     pointer (PointerLabelBeforeBank)
;     memory (SingleByteParam)

	call Function106c
	call GetScriptByte
	ld c, a
	callba Function11c000
	ret
; 0x96f60

Script_verbosegiveitem: ; 0x96f60
; script command 0x9e
; parameters:
;     item (ItemLabelByte)
;     quantity (DecimalParam)

	call Script_giveitem
	call CurItemName
	ld de, StringBuffer1
	ld a, $1
	call Function976c8
	ld b, BANK(GiveItemScript)
	ld de, GiveItemScript
	jp ScriptCall
; 0x96f76


Function96f76: ; 96f76
	ret
; 96f77

GiveItemScript: ; 96f77
	3callasm BANK(Function96f76), Function96f76
	2writetext ReceivedItemText
	iffalse .Full
	waitbutton
	specialsound
	closetext
	itemnotify
	end

.Full
	keeptextopen
	pocketisfull
	end
; 96f89

ReceivedItemText: ; 96f89
	text_jump UnknownText_0x1c4719, BANK(UnknownText_0x1c4719)
	db "@"
; 96f8e


Script_verbosegiveitem2: ; 0x96f8e
; script command 0x9f
; parameters:
;     item (ItemLabelByte)
;     var (SingleByteParam)

	call GetScriptByte
	cp $ff
	jr nz, .asm_96f98 ; 0x96f93 $3
	ld a, [$c2dd]
.asm_96f98
	ld [$d106], a
	call GetScriptByte
	call Unknown_0x9769e
	ld a, [de]
	ld [$d10c], a
	ld hl, $d892
	call ReceiveItem
	ld a, $1
	jr c, .asm_96fb0 ; 0x96fad $1
	xor a
.asm_96fb0
	ld [$c2dd], a
	call CurItemName
	ld de, StringBuffer1
	ld a, $1
	call Function976c8
	ld b, BANK(GiveItemScript)
	ld de, GiveItemScript
	jp ScriptCall
; 0x96fc6

Script_itemnotify: ; 0x96fc6
; script command 0x45

	call GetPocketName
	call CurItemName
	ld b, BANK(PutItemInPocketText)
	ld hl, PutItemInPocketText
	call Function269a
	ret
; 0x96fd5

Script_pocketisfull: ; 0x96fd5
; script command 0x46

	call GetPocketName
	call CurItemName
	ld b, BANK(PocketIsFullText)
	ld hl, PocketIsFullText
	call Function269a
	ret
; 0x96fe4

Script_specialsound: ; 0x96fe4
; script command 0x88

	callba CheckItemPocket
	ld a, [$d142]
	cp TM_HM
	ld de, SFX_GET_TM
	jr z, .play
	ld de, SFX_ITEM
.play
	call PlaySFX
	call WaitSFX
	ret
; 0x96ffe


GetPocketName: ; 96ffe
	callba CheckItemPocket
	ld a, [$d142]
	dec a
	ld hl, .Pockets
	and 3
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, StringBuffer3
	call CopyName2
	ret

.Pockets
	dw .Item
	dw .Key
	dw .Ball
	dw .TM

.Item
	db "ITEM POCKET@"
.Key
	db "KEY POCKET@"
.Ball
	db "BALL POCKET@"
.TM
	db "TM POCKET@"
; 97051

CurItemName: ; 97051
	ld a, [CurItem]
	ld [$d265], a
	call GetItemName
	ret
; 9705b


PutItemInPocketText: ; 9705b
	text_jump UnknownText_0x1c472c, BANK(UnknownText_0x1c472c)
	db "@"
; 97060

PocketIsFullText: ; 97060
	text_jump UnknownText_0x1c474b, BANK(UnknownText_0x1c474b)
	db "@"
; 97065


Script_pokemart: ; 0x97065
; script command 0x94
; parameters:
;     dialog_id (SingleByteParam)
;     mart_id (MultiByteParam)

	call GetScriptByte
	ld c, a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [ScriptBank]
	ld b, a
	callba OpenMartDialog
	ret
; 0x9707c

Script_elevator: ; 0x9707c
; script command 0x95
; parameters:
;     floor_list_pointer (PointerLabelParam)

	xor a
	ld [$c2dd], a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [ScriptBank]
	ld b, a
	callba Function1342d
	ret c
	ld a, $1
	ld [$c2dd], a
	ret
; 0x97099

Script_trade: ; 0x97099
; script command 0x96
; parameters:
;     trade_id (SingleByteParam)

	call GetScriptByte
	ld e, a
	callba Functionfcba8
	ret
; 0x970a4

Script_phonecall: ; 0x970a4
; script command 0x98
; parameters:
;     caller_name (RawTextPointerLabelParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [ScriptBank]
	ld b, a
	callba Function9029a
	ret
; 0x970b7

Script_hangup: ; 0x970b7
; script command 0x99

	callba Function902eb
	ret
; 0x970be

Script_askforphonenumber: ; 0x970be
; script command 0x97
; parameters:
;     number (SingleByteParam)

	call Function1dcf
	jr c, .asm_970d6 ; 0x970c1 $13
	call GetScriptByte
	ld c, a
	callba Function90000
	jr c, .asm_970d2 ; 0x970cd $3
	xor a
	jr .asm_970db ; 0x970d0 $9
.asm_970d2
	ld a, $1
	jr .asm_970db ; 0x970d4 $5
.asm_970d6
	call GetScriptByte
	ld a, $2
.asm_970db
	ld [$c2dd], a
	ret
; 0x970df

Script_describedecoration: ; 0x970df
; script command 0x9a
; parameters:
;     byte (SingleByteParam)

	call GetScriptByte
	ld b, a
	callba Function26f59
	ld h, d
	ld l, e
	jp ScriptJump
; 0x970ee

Script_fruittree: ; 0x970ee
; script command 0x9b
; parameters:
;     tree_id (SingleByteParam)

	call GetScriptByte
	ld [CurFruitTree], a
	ld b, BANK(FruitTreeScript)
	ld hl, FruitTreeScript
	jp ScriptJump
; 0x970fc

Script_loadwilddata: ; 0x970fc
; script command 0xa0
; parameters:
;     map_group (MapGroupParam)
;     map_id (MapIdParam)

	call GetScriptByte
	ld c, a
	call GetScriptByte
	ld d, a
	call GetScriptByte
	ld e, a
	callba Functionc403
	ret
; 0x9710f

Script_trainertext: ; 0x9710f
; script command 0x62
; parameters:
;     which_text (SingleByteParam)

	call GetScriptByte
	ld c, a
	ld b, $0
	ld hl, $d045
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$d03e]
	ld b, a
	call Function269a
	ret
; 0x97125

Script_scripttalkafter: ; 0x97125
; script command 0x65

	ld hl, $d04b
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$d03e]
	ld b, a
	jp ScriptJump
; 0x97132

Script_trainerstatus: ; 0x97132
; script command 0x63
; parameters:
;     action (SingleByteParam)

	xor a
	ld [$c2dd], a
	ld hl, $d041
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetScriptByte
	ld b, a
	call EventFlagAction
	ld a, c
	and a
	ret z
	ld a, $1
	ld [$c2dd], a
	ret
; 0x9714c

Script_winlosstext: ; 0x9714c
; script command 0x64
; parameters:
;     win_text_pointer (TextPointerLabelParam)
;     loss_text_pointer (TextPointerLabelParam)

	ld hl, $d047
	call GetScriptByte
	ld [hli], a
	call GetScriptByte
	ld [hli], a
	ld hl, $d049
	call GetScriptByte
	ld [hli], a
	call GetScriptByte
	ld [hli], a
	ret
; 0x97163

Script_talkaftercancel: ; 0x97163
; script command 0x66

	ld a, [$d04d]
	and a
	ret z
	jp Script_end
; 0x9716b

Script_talkaftercheck: ; 0x9716b
; script command 0x67

	ld a, $1
	ld [$c2dd], a
	ld a, [$d04d]
	and a
	ret nz
	xor a
	ld [$c2dd], a
	ret
; 0x9717a

Script_playrammusic: ; 0x9717a
; script command 0x80

	ld a, [$d22f]
	ld e, a
	callba PlayTrainerEncounterMusic
	ret
; 0x97185

Script_playmapmusic: ; 0x97185
; script command 0x82

	call Function3cdf
	ret
; 0x97189

Script_playmusic: ; 0x97189
; script command 0x7f
; parameters:
;     music_pointer (MultiByteParam)

	ld de, $0000
	call PlayMusic
	xor a
	ld [$c2a7], a
	call MaxVolume
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	call PlayMusic
	ret
; 0x971a2

Script_musicfadeout: ; 0x971a2
; script command 0x81
; parameters:
;     music (MultiByteParam)
;     fadetime (SingleByteParam)

	call GetScriptByte
	ld [$c2a9], a
	call GetScriptByte
	ld [$c2aa], a
	call GetScriptByte
	and $7f
	ld [$c2a7], a
	ret
; 0x971b7

Script_playsound: ; 0x971b7
; script command 0x85
; parameters:
;     sound_pointer (MultiByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	call PlaySFX
	ret
; 0x971c3

Script_waitbutton: ; 0x971c3
; script command 0x86

	call WaitSFX
	ret
; 0x971c7

Script_warpsound: ; 0x971c7
; script command 0x87

	callba Function14a07
	call PlaySFX
	ret
; 0x971d1

Script_cry: ; 0x971d1
; script command 0x84
; parameters:
;     cry_id (MultiByteParam)

	call GetScriptByte
	push af
	call GetScriptByte
	pop af
	and a
	jr nz, .asm_971df ; 0x971da $3
	ld a, [$c2dd]
.asm_971df
	call Function37ce
	ret
; 0x971e3

Unknown_0x971e3: ; 0x971e3
	and a
	ret z
	cp $fe
	ret z
	dec a
	ret
; 0x971ea

Script_setlasttalked: ; 0x971ea
; script command 0x68
; parameters:
;     person (SingleByteParam)

	call GetScriptByte
	call Unknown_0x971e3
	ld [$ffe0], a
	ret
; 0x971f3

Script_applymovement: ; 0x971f3
; script command 0x69
; parameters:
;     person (SingleByteParam)
;     data (MovementPointerLabelParam)

	call GetScriptByte
	call Unknown_0x971e3
	ld c, a
; 971fa

Function971fa: ; 971fa
	push bc
	ld a, c
	callba Function585c
	pop bc
	push bc
	call Unknown_0x97221
	pop bc
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [ScriptBank]
	ld b, a
	call Function26c7
	ret c
	ld a, SCRIPT_WAIT_MOVEMENT
	ld [ScriptMode], a
	call StopScript
	ret
; 0x97221

Unknown_0x97221: ; 0x97221
	callba Function5897
	ret
; 0x97228

Script_applymovement2: ; 0x97228
; script command 0x6a
; parameters:
;     data (MovementPointerLabelParam)

	ld a, [$ffe0]
	ld c, a
	jp Function971fa
; 0x9722e

Script_faceplayer: ; 0x9722e
; script command 0x6b

	ld a, [$ffe0]
	and a
	ret z
	ld d, $0
	ld a, [$ffe0]
	ld e, a
	callba Function8417
	ld a, d
	add a
	add a
	ld e, a
	ld a, [$ffe0]
	ld d, a
	call Unknown_0x9728b
	ret
; 0x97248

Script_faceperson: ; 0x97248
; script command 0x6c
; parameters:
;     person1 (SingleByteParam)
;     person2 (SingleByteParam)

	call GetScriptByte
	call Unknown_0x971e3
	cp $fe
	jr c, .asm_97254 ; 0x97250 $2
	ld a, [$ffe0]
.asm_97254
	ld e, a
	call GetScriptByte
	call Unknown_0x971e3
	cp $fe
	jr nz, .asm_97261 ; 0x9725d $2
	ld a, [$ffe0]
.asm_97261
	ld d, a
	push de
	callba Function8417
	pop bc
	ret c
	ld a, d
	add a
	add a
	ld e, a
	ld d, c
	call Unknown_0x9728b
	ret
; 0x97274

Script_spriteface: ; 0x97274
; script command 0x76
; parameters:
;     person (SingleByteParam)
;     facing (SingleByteParam)

	call GetScriptByte
	call Unknown_0x971e3
	cp $fe
	jr nz, .asm_97280 ; 0x9727c $2
	ld a, [$ffe0]
.asm_97280
	ld d, a
	call GetScriptByte
	add a
	add a
	ld e, a
	call Unknown_0x9728b
	ret
; 0x9728b

Unknown_0x9728b: ; 0x9728b
	ld a, d
	push de
	call Function18de
	jr c, .asm_972b9 ; 0x97290 $27
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	push bc
	call Function1836
	pop bc
	jr c, .asm_972b9 ; 0x9729c $1b
	ld hl, $0004
	add hl, bc
	bit 2, [hl]
	jr nz, .asm_972b9 ; 0x972a4 $13
	pop de
	ld a, e
	call Function1af8
	ld hl, $d0ed
	bit 6, [hl]
	jr nz, .asm_972b5 ; 0x972b0 $3
	call Unknown_0x972bc
.asm_972b5
	call Function1ad2
	ret
.asm_972b9
	pop de
	scf
	ret
; 0x972bc

Unknown_0x972bc: ; 0x972bc
	call Function217a
	ld hl, TileMap
	ld bc, $0168
.asm_972c5
	res 7, [hl]
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .asm_972c5 ; 0x972cb $f8
	ret
; 0x972ce

Script_variablesprite: ; 0x972ce
; script command 0x6d
; parameters:
;     byte (SingleByteParam)
;     sprite (SingleByteParam)

	call GetScriptByte
	ld e, a
	ld d, $0
	ld hl, $d82e
	add hl, de
	call GetScriptByte
	ld [hl], a
	ret
; 0x972dd

Script_appear: ; 0x972dd
; script command 0x6f
; parameters:
;     person (SingleByteParam)

	call GetScriptByte
	call Unknown_0x971e3
	call Function1956
	ld a, [$ffaf]
	ld b, $0
	call Unknown_0x9730b
	ret
; 0x972ee

Script_disappear: ; 0x972ee
; script command 0x6e
; parameters:
;     person (SingleByteParam)

	call GetScriptByte
	call Unknown_0x971e3
	cp $fe
	jr nz, .asm_972fa ; 0x972f6 $2
	ld a, [$ffe0]
.asm_972fa
	call Function199f
	ld a, [$ffaf]
	ld b, $1
	call Unknown_0x9730b
	callba Function5920
	ret
; 0x9730b

Unknown_0x9730b: ; 0x9730b
	push bc
	call GetMapObject
	ld hl, $000c
	add hl, bc
	pop bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, $ff
	cp e
	jr nz, .asm_97321 ; 0x9731a $5
	cp d
	jr nz, .asm_97321 ; 0x9731d $2
	xor a
	ret
.asm_97321
	call EventFlagAction
	ret
; 0x97325

Script_follow: ; 0x97325
; script command 0x70
; parameters:
;     person2 (SingleByteParam)
;     person1 (SingleByteParam)

	call GetScriptByte
	call Unknown_0x971e3
	ld b, a
	call GetScriptByte
	call Unknown_0x971e3
	ld c, a
	callba Function5803
	ret
; 0x9733a

Script_stopfollow: ; 0x9733a
; script command 0x71

	callba Function581f
	ret
; 0x97341

Script_moveperson: ; 0x97341
; script command 0x72
; parameters:
;     person (SingleByteParam)
;     x (SingleByteParam)
;     y (SingleByteParam)

	call GetScriptByte
	call Unknown_0x971e3
	ld b, a
	call GetScriptByte
	add $4
	ld d, a
	call GetScriptByte
	add $4
	ld e, a
	callba Function807e
	ret
; 0x9735b

Script_writepersonxy: ; 0x9735b
; script command 0x73
; parameters:
;     person (SingleByteParam)

	call GetScriptByte
	call Unknown_0x971e3
	cp $fe
	jr nz, .asm_97367 ; 0x97363 $2
	ld a, [$ffe0]
.asm_97367
	ld b, a
	callba Function80a1
	ret
; 0x9736f

Script_follownotexact: ; 0x9736f
; script command 0x77
; parameters:
;     person2 (SingleByteParam)
;     person1 (SingleByteParam)

	call GetScriptByte
	call Unknown_0x971e3
	ld b, a
	call GetScriptByte
	call Unknown_0x971e3
	ld c, a
	callba Function839e
	ret
; 0x97384

Script_loademote: ; 0x97384
; script command 0x74
; parameters:
;     bubble (SingleByteParam)

	call GetScriptByte
	cp $ff
	jr nz, .asm_9738e ; 0x97389 $3
	ld a, [$c2dd]
.asm_9738e
	ld c, a
	callba Function1442f
	ret
; 0x97396

Script_showemote: ; 0x97396
; script command 0x75
; parameters:
;     bubble (SingleByteParam)
;     person (SingleByteParam)
;     time (DecimalParam)

	call GetScriptByte
	ld [$c2dd], a
	call GetScriptByte
	call Unknown_0x971e3
	cp $fe
	jr z, .asm_973a8 ; 0x973a4 $2
	ld [$ffe0], a
.asm_973a8
	call GetScriptByte
	ld [ScriptDelay], a
	ld b, BANK(ShowEmoteScript)
	ld de, ShowEmoteScript
	jp ScriptCall
; 0x973b6

ShowEmoteScript: ; 973b6
	loademote $ff
	applymovement2 .Show
	pause 0
	applymovement2 .Hide
	end

.Show
	show_emote
	show_person
	step_end

.Hide
	hide_emote
	show_person
	step_end
; 973c7


Script_earthquake: ; 0x973c7
; script command 0x78
; parameters:
;     param (DecimalParam)

	ld hl, EarthquakeMovement
	ld de, $d002
	ld bc, EarthquakeMovementEnd - EarthquakeMovement
	call CopyBytes
	call GetScriptByte
	ld [$d003], a
	and $3f
	ld [$d005], a
	ld b, BANK(UnknownScript_0x973e6)
	ld de, UnknownScript_0x973e6
	jp ScriptCall
; 0x973e6

UnknownScript_0x973e6: ; 973e6
	applymovement $0, $d002
	end
; 973eb

EarthquakeMovement: ; 973eb
	step_shake 16
	step_sleep 16
	step_end
EarthquakeMovementEnd
; 973f0


Script_loadpikachudata: ; 0x973f0
; script command 0x5a

	ld a, $19
	ld [$d22e], a
	ld a, $5
	ld [$d143], a
	ret
; 0x973fb

Script_battlecheck: ; 0x973fb
; script command 0x5b

	xor a
	ld [$d459], a
	ret
; 0x97400

Script_loadtrainerdata: ; 0x97400
; script command 0x5c

	ld a, $81
	ld [$d459], a
	ld a, [$d043]
	ld [$d22f], a
	ld a, [$d044]
	ld [$d231], a
	ret
; 0x97412

Script_loadpokedata: ; 0x97412
; script command 0x5d
; parameters:
;     pokemon (PokemonParam)
;     level (DecimalParam)

	ld a, $80
	ld [$d459], a
	call GetScriptByte
	ld [$d22e], a
	call GetScriptByte
	ld [$d143], a
	ret
; 0x97424

Script_loadtrainer: ; 0x97424
; script command 0x5e
; parameters:
;     trainer_group (TrainerGroupParam)
;     trainer_id (TrainerIdParam)

	ld a, $81
	ld [$d459], a
	call GetScriptByte
	ld [$d22f], a
	call GetScriptByte
	ld [$d231], a
	ret
; 0x97436

Script_startbattle: ; 0x97436
; script command 0x5f

	call Function2879
	ld a, PREDEF_START_BATTLE
	call Predef
	ld a, [$d0ee]
	and $3f
	ld [$c2dd], a
	ret
; 0x97447

Script_catchtutorial: ; 0x97447
; script command 0x61
; parameters:
;     byte (SingleByteParam)

	call GetScriptByte
	ld [$d230], a
	call Function2879
	callba Function4e554
	jp Script_reloadmap
; 0x97459

Script_returnafterbattle: ; 0x97459
; script command 0x60

	ld hl, $d459
	ld d, [hl]
	ld [hl], $0
	ld a, [$d0ee]
	and $3f
	cp $1
	jr nz, .asm_97470 ; 0x97466 $8
	ld b, $4
	ld hl, $64c1
	jp ScriptJump
.asm_97470
	bit 0, d
	jr z, .asm_9747c ; 0x97472 $8
	callba Functionfcfec
	jr .asm_9748e ; 0x9747a $12
.asm_9747c
	ld a, [$d0ee]
	bit 7, a
	jr z, .asm_9748e ; 0x97481 $b
	ld b, $24
	ld de, $4255
	callba Function97c4f
.asm_9748e
	jp Script_reloadmap
; 0x97491

Script_reloadmap: ; 0x97491
; script command 0x7b

	xor a
	ld [$d459], a
	ld a, $f3
	ld [$ff9f], a
	ld a, $1
	call Function261b
	call StopScript
	ret
; 0x974a2

Script_2call: ; 0x974a2
; script command 0x0
; parameters:
;     pointer (ScriptPointerLabelParam)

	ld a, [ScriptBank]
	ld b, a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	jr ScriptCall
; 0x974b0

Script_3call: ; 0x974b0
; script command 0x1
; parameters:
;     pointer (ScriptPointerLabelBeforeBank)

	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	jr ScriptCall
; 0x974be

Script_2ptcall: ; 0x974be
; script command 0x2
; parameters:
;     pointer (PointerLabelToScriptPointer)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	; fallthrough

ScriptCall: ; 0x974cb
	push de
	ld hl, $d43c
	ld e, [hl]
	inc [hl]
	ld d, $0
	ld hl, $d43d
	add hl, de
	add hl, de
	add hl, de
	pop de
	ld a, [ScriptBank]
	ld [hli], a
	ld a, [ScriptPos]
	ld [hli], a
	ld a, [ScriptPos + 1]
	ld [hl], a
	ld a, b
	ld [ScriptBank], a
	ld a, e
	ld [ScriptPos], a
	ld a, d
	ld [ScriptPos + 1], a
	ret
; 0x974f3

Unknown_0x974f3: ; 0x974f3
	ld a, [ScriptBank]
	or $80
	ld [ScriptBank], a
	jp ScriptCall
; 0x974fe

Script_2jump: ; 0x974fe
; script command 0x3
; parameters:
;     pointer (ScriptPointerLabelParam)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [ScriptBank]
	ld b, a
	jp ScriptJump
; 0x9750d

Script_3jump: ; 0x9750d
; script command 0x4
; parameters:
;     pointer (ScriptPointerLabelBeforeBank)

	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	jp ScriptJump
; 0x9751c

Script_2ptjump: ; 0x9751c
; script command 0x5
; parameters:
;     pointer (PointerLabelToScriptPointer)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp ScriptJump
; 0x9752c

Script_iffalse: ; 0x9752c
; script command 0x8
; parameters:
;     pointer (ScriptPointerLabelParam)

	ld a, [$c2dd]
	and a
	jp nz, SkipTwoScriptBytes
	jp Script_2jump
; 0x97536

Script_iftrue: ; 0x97536
; script command 0x9
; parameters:
;     pointer (ScriptPointerLabelParam)

	ld a, [$c2dd]
	and a
	jp nz, Script_2jump
	jp SkipTwoScriptBytes
; 0x97540

Script_if_equal: ; 0x97540
; script command 0x6
; parameters:
;     byte (SingleByteParam)
;     pointer (ScriptPointerLabelParam)

	call GetScriptByte
	ld hl, $c2dd
	cp [hl]
	jr z, Script_2jump ; 0x97547 $b5
	jr SkipTwoScriptBytes ; 0x97549 $4b
; 0x9754b

Script_if_not_equal: ; 0x9754b
; script command 0x7
; parameters:
;     byte (SingleByteParam)
;     pointer (ScriptPointerLabelParam)

	call GetScriptByte
	ld hl, $c2dd
	cp [hl]
	jr nz, Script_2jump ; 0x97552 $aa
	jr SkipTwoScriptBytes ; 0x97554 $40
; 0x97556

Script_if_greater_than: ; 0x97556
; script command 0xa
; parameters:
;     byte (SingleByteParam)
;     pointer (ScriptPointerLabelParam)

	ld a, [$c2dd]
	ld b, a
	call GetScriptByte
	cp b
	jr c, Script_2jump ; 0x9755e $9e
	jr SkipTwoScriptBytes ; 0x97560 $34
; 0x97562

Script_if_less_than: ; 0x97562
; script command 0xb
; parameters:
;     byte (SingleByteParam)
;     pointer (ScriptPointerLabelParam)

	call GetScriptByte
	ld b, a
	ld a, [$c2dd]
	cp b
	jr c, Script_2jump ; 0x9756a $92
	jr SkipTwoScriptBytes ; 0x9756c $28
; 0x9756e

Script_jumpstd: ; 0x9756e
; script command 0xc
; parameters:
;     predefined_script (MultiByteParam)

	call StdScript
	jr ScriptJump ; 0x97571 $2a
; 0x97573

Script_callstd: ; 0x97573
; script command 0xd
; parameters:
;     predefined_script (MultiByteParam)

	call StdScript
	ld d, h
	ld e, l
	jp ScriptCall
; 0x9757b

StdScript: ; 0x9757b
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld hl, StdScripts
	add hl, de
	add hl, de
	add hl, de
	ld a, BANK(StdScripts)
	call GetFarByte
	ld b, a
	inc hl
	ld a, BANK(StdScripts)
	call GetFarHalfword
	ret
; 0x97596

SkipTwoScriptBytes: ; 0x97596
	call GetScriptByte
	call GetScriptByte
	ret
; 0x9759d

ScriptJump: ; 0x9759d
	ld a, b
	ld [ScriptBank], a
	ld a, l
	ld [ScriptPos], a
	ld a, h
	ld [ScriptPos + 1], a
	ret
; 0x975aa

Script_priorityjump: ; 0x975aa
; script command 0x8d
; parameters:
;     pointer (ScriptPointerLabelParam)

	ld a, [ScriptBank]
	ld [$d44e], a
	call GetScriptByte
	ld [$d44f], a
	call GetScriptByte
	ld [$d450], a
	ld hl, ScriptFlags
	set 3, [hl]
	ret
; 0x975c2

Script_checktriggers: ; 0x975c2
; script command 0x13

	call Function211b
	jr z, .asm_975cb ; 0x975c5 $4
	ld [$c2dd], a
	ret
.asm_975cb
	ld a, $ff
	ld [$c2dd], a
	ret
; 0x975d1

Script_checkmaptriggers: ; 0x975d1
; script command 0x11
; parameters:
;     map_group (SingleByteParam)
;     map_id (SingleByteParam)

	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld c, a
	call Function2147
	ld a, d
	or e
	jr z, .asm_975e5 ; 0x975de $5
	ld a, [de]
	ld [$c2dd], a
	ret
.asm_975e5
	ld a, $ff
	ld [$c2dd], a
	ret
; 0x975eb

Script_dotrigger: ; 0x975eb
; script command 0x14
; parameters:
;     trigger_id (SingleByteParam)

	ld a, [$dcb5]
	ld b, a
	ld a, [$dcb6]
	ld c, a
	jr Unknown_975fd ; 0x975f3 $8
; 0x975f5

Script_domaptrigger: ; 0x975f5
; script command 0x12
; parameters:
;     map_group (MapGroupParam)
;     map_id (MapIdParam)
;     trigger_id (SingleByteParam)

	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld c, a
	; fallthrough

Unknown_975fd: ; 0x975fd
	call Function2147
	ld a, d
	or e
	jr z, .asm_97608 ; 0x97602 $4
	call GetScriptByte
	ld [de], a
.asm_97608
	ret
; 0x97609

Script_copybytetovar: ; 0x97609
; script command 0x19
; parameters:
;     address (RAMAddressParam)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [hl]
	ld [$c2dd], a
	ret
; 0x97616

Script_copyvartobyte: ; 0x97616
; script command 0x1a
; parameters:
;     address (RAMAddressParam)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [$c2dd]
	ld [hl], a
	ret
; 0x97623

Script_loadvar: ; 0x97623
; script command 0x1b
; parameters:
;     address (RAMAddressParam)
;     value (SingleByteParam)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	call GetScriptByte
	ld [hl], a
	ret
; 0x97630

Script_writebyte: ; 0x97630
; script command 0x15
; parameters:
;     value (SingleByteParam)

	call GetScriptByte
	ld [$c2dd], a
	ret
; 0x97637

Script_addvar: ; 0x97637
; script command 0x16
; parameters:
;     value (SingleByteParam)

	call GetScriptByte
	ld hl, $c2dd
	add [hl]
	ld [hl], a
	ret
; 0x97640

Script_random: ; 0x97640
; script command 0x17
; parameters:
;     input (SingleByteParam)

	call GetScriptByte
	ld [$c2dd], a
	and a
	ret z
	ld c, a
	call Unknown_0x97673
	and a
	jr z, .asm_9765f ; 0x9764d $10
	ld b, a
	xor a
	sub b
	ld b, a
.asm_97653
	push bc
	call Random
	pop bc
	ld a, [$ffe1]
	cp b
	jr nc, .asm_97653 ; 0x9765b $f6
	jr .asm_97666 ; 0x9765d $7
.asm_9765f
	push bc
	call Random
	pop bc
	ld a, [$ffe1]
.asm_97666
	push af
	ld a, [$c2dd]
	ld c, a
	pop af
	call SimpleDivide
	ld [$c2dd], a
	ret
; 0x97673

Unknown_0x97673: ; 0x97673
	xor a
	ld b, a
	sub c
.asm_97676
	inc b
	sub c
	jr nc, .asm_97676 ; 0x97678 $fc
	dec b
	add c
	ret
; 0x9767d

Script_checkcode: ; 0x9767d
; script command 0x1c
; parameters:
;     variable_id (SingleByteParam)

	call GetScriptByte
	call Unknown_0x9769e
	ld a, [de]
	ld [$c2dd], a
	ret
; 0x97688

Script_writevarcode: ; 0x97688
; script command 0x1d
; parameters:
;     variable_id (SingleByteParam)

	call GetScriptByte
	call Unknown_0x9769e
	ld a, [$c2dd]
	ld [de], a
	ret
; 0x97693

Script_writecode: ; 0x97693
; script command 0x1e
; parameters:
;     variable_id (SingleByteParam)
;     value (SingleByteParam)

	call GetScriptByte
	call Unknown_0x9769e
	call GetScriptByte
	ld [de], a
	ret
; 0x9769e

Unknown_0x9769e: ; 0x9769e
	ld c, a
	callba Function80648
	ret
; 0x976a6

Script_checkver: ; 0x976a6
; script command 0x18

	ld a, [Version]
	ld [$c2dd], a
	ret
; 0x976ad

Version: ; 976ad
	db VERSION
; 976ae

Script_pokenamemem: ; 0x976ae
; script command 0x40
; parameters:
;     pokemon (PokemonParam)
;     memory (SingleByteParam)

	call GetScriptByte
	and a
	jr nz, .asm_976b7 ; 0x976b2 $3
	ld a, [$c2dd]
.asm_976b7
	ld [$d265], a
	call GetPokemonName
	ld de, StringBuffer1

Unknown_976c0: ; 0x976c0
	call GetScriptByte
	cp $3
	jr c, .asm_976c8
	xor a
.asm_976c8
; 976c8

Function976c8: ; 976c8
	ld hl, StringBuffer3
	ld bc, 19
	call AddNTimes
	call CopyName2
	ret
; 0x976d5

Script_itemtotext: ; 0x976d5
; script command 0x41
; parameters:
;     item (ItemLabelByte)
;     memory (SingleByteParam)

	call GetScriptByte
	and a
	jr nz, .asm_976de ; 0x976d9 $3
	ld a, [$c2dd]
.asm_976de
	ld [$d265], a
	call GetItemName
	ld de, StringBuffer1
	jr Unknown_976c0 ; 0x976e7 $d7
; 0x976e9

Script_mapnametotext: ; 0x976e9
; script command 0x42
; parameters:
;     memory (SingleByteParam)

	ld a, [$dcb5]
	ld b, a
	ld a, [$dcb6]
	ld c, a
	call GetWorldMapLocation

Unknown_976f4: ; 0x976f4
	ld e, a
	callba GetLandmarkName
	ld de, StringBuffer1
	jp Unknown_976c0
; 0x97701

Script_displaylocation: ; 0x97701
; script command 0xa5
; parameters:
;     id (SingleByteParam)
;     memory (SingleByteParam)

	call GetScriptByte
	jr Unknown_976f4 ; 0x97704 $ee
; 0x97706

Script_trainertotext: ; 0x97706
; script command 0x43
; parameters:
;     trainer_id (TrainerGroupParam)
;     trainer_group (TrainerIdParam)
;     memory (SingleByteParam)

	call GetScriptByte
	ld c, a
	call GetScriptByte
	ld b, a
	callba Function3994c
	jr Unknown_976c0 ; 0x97714 $aa
; 0x97716

Script_name: ; 0x97716
; script command 0xa7
; parameters:
;     type (SingleByteParam)
;     id (SingleByteParam)

	call GetScriptByte
	ld [$cf61], a

Unknown_9771c: ; 0x9771c
	call GetScriptByte
	ld [$cf60], a
	call GetName
	ld de, StringBuffer1
	jp Unknown_976c0
; 0x9772b

Script_trainerclassname: ; 0x9772b
; script command 0xa6

	ld a, $7
	ld [$cf61], a
	jr Unknown_9771c ; 0x97730 $ea
; 0x97732

Script_readmoney: ; 0x97732
; script command 0x3d
; parameters:
;     account (SingleByteParam)
;     memory (SingleByteParam)

	call Unknown_0x97771
	call Unknown_0x97861
	ld hl, StringBuffer1
	ld bc, $4306
	call PrintNum
	ld de, StringBuffer1
	jp Unknown_976c0
; 0x97747

Script_readcoins: ; 0x97747
; script command 0x3e
; parameters:
;     memory (SingleByteParam)

	call Unknown_0x97771
	ld hl, StringBuffer1
	ld de, Coins
	ld bc, $4206
	call PrintNum
	ld de, StringBuffer1
	jp Unknown_976c0
; 0x9775c

Script_RAM2MEM: ; 0x9775c
; script command 0x3f
; parameters:
;     memory (SingleByteParam)

	call Unknown_0x97771
	ld de, $c2dd
	ld hl, StringBuffer1
	ld bc, $4103
	call PrintNum
	ld de, StringBuffer1
	jp Unknown_976c0
; 0x97771

Unknown_0x97771: ; 0x97771
	ld hl, StringBuffer1
	ld bc, $000b
	ld a, "@"
	call ByteFill
	ret
; 0x9777d

Script_stringtotext: ; 0x9777d
; script command 0x44
; parameters:
;     text_pointer (EncodedTextLabelParam)
;     memory (SingleByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [ScriptBank]
	ld hl, $30d6
	rst FarCall
	ld de, StringBuffer2
	jp Unknown_976c0
; 0x97792

Script_givepokeitem: ; 0x97792
; script command 0x2f
; parameters:
;     pointer (PointerParamToItemAndLetter)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [ScriptBank]
	call GetFarByte
	ld b, a
	push bc
	inc hl
	ld bc, $0020
	ld de, $d002
	ld a, [ScriptBank]
	call FarCopyBytes
	pop bc
	callba Function446cc
	ret
; 0x977b7

Script_checkpokeitem: ; 0x977b7
; script command 0x30
; parameters:
;     pointer (PointerParamToItemAndLetter)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [ScriptBank]
	ld b, a
	callba Function44654
	ret
; 0x977ca

Script_giveitem: ; 0x977ca
; script command 0x1f
; parameters:
;     item (ItemLabelByte)
;     quantity (SingleByteParam)

	call GetScriptByte
	cp $ff
	jr nz, .asm_977d4 ; 0x977cf $3
	ld a, [$c2dd]
.asm_977d4
	ld [$d106], a
	call GetScriptByte
	ld [$d10c], a
	ld hl, $d892
	call ReceiveItem
	jr nc, .asm_977eb ; 0x977e3 $6
	ld a, $1
	ld [$c2dd], a
	ret
.asm_977eb
	xor a
	ld [$c2dd], a
	ret
; 0x977f0

Script_takeitem: ; 0x977f0
; script command 0x20
; parameters:
;     item (ItemLabelByte)
;     quantity (DecimalParam)

	xor a
	ld [$c2dd], a
	call GetScriptByte
	ld [$d106], a
	call GetScriptByte
	ld [$d10c], a
	ld a, $ff
	ld [$d107], a
	ld hl, $d892
	call TossItem
	ret nc
	ld a, $1
	ld [$c2dd], a
	ret
; 0x97812

Script_checkitem: ; 0x97812
; script command 0x21
; parameters:
;     item (ItemLabelByte)

	xor a
	ld [$c2dd], a
	call GetScriptByte
	ld [$d106], a
	ld hl, $d892
	call CheckItem
	ret nc
	ld a, $1
	ld [$c2dd], a
	ret
; 0x97829

Script_givemoney: ; 0x97829
; script command 0x22
; parameters:
;     account (SingleByteParam)
;     money (MoneyByteParam)

	call Unknown_0x97861
	call Unknown_0x9786d
	callba Function15fd7
	ret
; 0x97836

Script_takemoney: ; 0x97836
; script command 0x23
; parameters:
;     account (SingleByteParam)
;     money (MoneyByteParam)

	call Unknown_0x97861
	call Unknown_0x9786d
	callba Function15ffa
	ret
; 0x97843

Script_checkmoney: ; 0x97843
; script command 0x24
; parameters:
;     account (SingleByteParam)
;     money (MoneyByteParam)

	call Unknown_0x97861
	call Unknown_0x9786d
	callba Function1600b
; 0x9784f

Unknown_9784f: ; 0x9784f
	jr c, .asm_9785b ; 0x9784f $a
	jr z, .asm_97857 ; 0x97851 $4
	ld a, $0
	jr .asm_9785d ; 0x97855 $6
.asm_97857
	ld a, $1
	jr .asm_9785d ; 0x97859 $2
.asm_9785b
	ld a, $2
.asm_9785d
	ld [$c2dd], a
	ret
; 0x97861

Unknown_0x97861: ; 0x97861
	call GetScriptByte
	and a
	ld de, $d84e
	ret z
	ld de, $d851
	ret
; 0x9786d

Unknown_0x9786d: ; 0x9786d
	ld bc, $ffc3
	push bc
	call GetScriptByte
	ld [bc], a
	inc bc
	call GetScriptByte
	ld [bc], a
	inc bc
	call GetScriptByte
	ld [bc], a
	pop bc
	ret
; 0x97881

Script_givecoins: ; 0x97881
; script command 0x25
; parameters:
;     coins (CoinByteParam)

	call Function978a0
	callba Function1606f
	ret
; 0x9788b

Script_takecoins: ; 0x9788b
; script command 0x26
; parameters:
;     coins (CoinByteParam)

	call Function978a0
	callba Function1608f
	ret
; 0x97895

Script_checkcoins: ; 0x97895
; script command 0x27
; parameters:
;     coins (CoinByteParam)

	call Function978a0
	callba Function160a1
	jr Unknown_9784f
; 978a0

Function978a0: ; 978a0
	call GetScriptByte
	ld [$ffc4], a
	call GetScriptByte
	ld [$ffc3], a
	ld bc, $ffc3
	ret
; 0x978ae

Script_checktime: ; 0x978ae
; script command 0x2b
; parameters:
;     time (SingleByteParam)

	xor a
	ld [$c2dd], a
	callba Functionc000
	call GetScriptByte
	and c
	ret z
	ld a, $1
	ld [$c2dd], a
	ret
; 0x978c3

Script_checkpoke: ; 0x978c3
; script command 0x2c
; parameters:
;     pkmn (PokemonParam)

	xor a
	ld [$c2dd], a
	call GetScriptByte
	ld hl, $dcd8
	ld de, $0001
	call IsInArray
	ret nc
	ld a, $1
	ld [$c2dd], a
	ret
; 0x978da

Script_addcellnum: ; 0x978da
; script command 0x28
; parameters:
;     person (SingleByteParam)

	xor a
	ld [$c2dd], a
	call GetScriptByte
	ld c, a
	callba Function90000
	ret nc
	ld a, $1
	ld [$c2dd], a
	ret
; 0x978ef

Script_delcellnum: ; 0x978ef
; script command 0x29
; parameters:
;     person (SingleByteParam)

	xor a
	ld [$c2dd], a
	call GetScriptByte
	ld c, a
	callba Function9000f
	ret nc
	ld a, $1
	ld [$c2dd], a
	ret
; 0x97904

Script_checkcellnum: ; 0x97904
; script command 0x2a
; parameters:
;     person (SingleByteParam)

	xor a
	ld [$c2dd], a
	call GetScriptByte
	ld c, a
	callba Function90019
	ret nc
	ld a, $1
	ld [$c2dd], a
	ret
; 0x97919

Script_specialphonecall: ; 0x97919
; script command 0x9c
; parameters:
;     call_id (MultiByteParam)

	call GetScriptByte
	ld [$dc31], a
	call GetScriptByte
	ld [$dc32], a
	ret
; 0x97926

Script_checkphonecall: ; 0x97926
; script command 0x9d

	ld a, [$dc31]
	and a
	jr z, .asm_9792e ; 0x9792a $2
	ld a, $1
.asm_9792e
	ld [$c2dd], a
	ret
; 0x97932

Script_givepoke: ; 0x97932
; script command 0x2d
; parameters:
;     pokemon (PokemonParam)
;     level (DecimalParam)
;     item (ItemLabelByte)
;     trainer (DecimalParam)
;     trainer_name_pointer (MultiByteParam)
;     pkmn_nickname (MultiByteParam)

	call GetScriptByte
	ld [$d108], a
	call GetScriptByte
	ld [$d143], a
	call GetScriptByte
	ld [$d106], a
	call GetScriptByte
	and a
	ld b, a
	jr z, .asm_9795d ; 0x97949 $12
	ld hl, ScriptPos
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
.asm_9795d
	callba Functione277
	ld a, b
	ld [$c2dd], a
	ret
; 0x97968

Script_giveegg: ; 0x97968
; script command 0x2e
; parameters:
;     pkmn (PokemonParam)
;     level (DecimalParam)

	xor a
	ld [$c2dd], a
	ld [$cf5f], a
	call GetScriptByte
	ld [$d108], a
	call GetScriptByte
	ld [$d143], a
	callba Functiondf8c
	ret nc
	ld a, $2
	ld [$c2dd], a
	ret
; 0x97988

Script_setevent: ; 0x97988
; script command 0x33
; parameters:
;     bit_number (MultiByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, $1
	call EventFlagAction
	ret
; 0x97996

Script_clearevent: ; 0x97996
; script command 0x32
; parameters:
;     bit_number (MultiByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, $0
	call EventFlagAction
	ret
; 0x979a4

Script_checkevent: ; 0x979a4
; script command 0x31
; parameters:
;     bit_number (MultiByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, $2
	call EventFlagAction
	ld a, c
	and a
	jr z, .asm_979b7 ; 0x979b3 $2
	ld a, $1
.asm_979b7
	ld [$c2dd], a
	ret
; 0x979bb

Script_setflag: ; 0x979bb
; script command 0x36
; parameters:
;     bit_number (MultiByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, $1
	call Unknown_0x979ee
	ret
; 0x979c9

Script_clearflag: ; 0x979c9
; script command 0x35
; parameters:
;     bit_number (MultiByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, $0
	call Unknown_0x979ee
	ret
; 0x979d7

Script_checkflag: ; 0x979d7
; script command 0x34
; parameters:
;     bit_number (MultiByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, $2
	call Unknown_0x979ee
	ld a, c
	and a
	jr z, .asm_979ea ; 0x979e6 $2
	ld a, $1
.asm_979ea
	ld [$c2dd], a
	ret
; 0x979ee

Unknown_0x979ee: ; 0x979ee
	callba EngineFlagAction
	ret
; 0x979f5

Script_wildoff: ; 0x979f5
; script command 0x38

	ld hl, StatusFlags
	set 5, [hl]
	ret
; 0x979fb

Script_wildon: ; 0x979fb
; script command 0x37

	ld hl, StatusFlags
	res 5, [hl]
	ret
; 0x97a01

Script_xycompare: ; 0x97a01
; script command 0x39
; parameters:
;     pointer (MultiByteParam)

	call GetScriptByte
	ld [$d453], a
	call GetScriptByte
	ld [$d454], a
	ret
; 0x97a0e

Script_warpfacing: ; 0x97a0e
; script command 0xa3
; parameters:
;     facing (SingleByteParam)
;     map_group (MapGroupParam)
;     map_id (MapIdParam)
;     x (SingleByteParam)
;     y (SingleByteParam)

	call GetScriptByte
	and $3
	ld c, a
	ld a, [$d45b]
	set 5, a
	or c
	ld [$d45b], a
; 0x97a1d

Script_warp: ; 0x97a1d
; script command 0x3c
; parameters:
;     map_group (MapGroupParam)
;     map_id (MapIdParam)
;     x (SingleByteParam)
;     y (SingleByteParam)

	call GetScriptByte
	and a
	jr z, .asm_97a4a ; 0x97a21 $27
	ld [$dcb5], a
	call GetScriptByte
	ld [$dcb6], a
	call GetScriptByte
	ld [$dcb8], a
	call GetScriptByte
	ld [$dcb7], a
	ld a, $ff
	ld [$d001], a
	ld a, $f1
	ld [$ff9f], a
	ld a, $1
	call Function261b
	call StopScript
	ret
.asm_97a4a
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	ld a, $ff
	ld [$d001], a
	ld a, $fb
	ld [$ff9f], a
	ld a, $1
	call Function261b
	call StopScript
	ret
; 0x97a65

Script_warpmod: ; 0x97a65
; script command 0x3a
; parameters:
;     warp_id (SingleByteParam)
;     map_group (MapGroupParam)
;     map_id (MapIdParam)

	call GetScriptByte
	ld [$dcac], a
	call GetScriptByte
	ld [$dcad], a
	call GetScriptByte
	ld [$dcae], a
	ret
; 0x97a78

Script_blackoutmod: ; 0x97a78
; script command 0x3b
; parameters:
;     map_group (MapGroupParam)
;     map_id (MapIdParam)

	call GetScriptByte
	ld [$dcb2], a
	call GetScriptByte
	ld [$dcb3], a
	ret
; 0x97a85

Script_reloadmapmusic: ; 0x97a85
; script command 0x83

	ld a, $1
	ld [$c2c1], a
	ret
; 0x97a8b

Script_writecmdqueue: ; 0x97a8b
; script command 0x7d
; parameters:
;     queue_pointer (MultiByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [ScriptBank]
	ld b, a
	callba Function97e31
	ret
; 0x97a9e

Script_delcmdqueue: ; 0x97a9e
; script command 0x7e
; parameters:
;     byte (SingleByteParam)

	xor a
	ld [$c2dd], a
	call GetScriptByte
	ld b, a
	callba Function97e5c
	ret c
	ld a, $1
	ld [$c2dd], a
	ret
; 0x97ab3

Script_changemap: ; 0x97ab3
; script command 0x79
; parameters:
;     map_data_pointer (MapDataPointerParam)

	call GetScriptByte
	ld [$d1a0], a
	call GetScriptByte
	ld [$d1a1], a
	call GetScriptByte
	ld [$d1a2], a
	call Function24e4
	call Function2879
	ret
; 0x97acc

Script_changeblock: ; 0x97acc
; script command 0x7a
; parameters:
;     x (SingleByteParam)
;     y (SingleByteParam)
;     block (SingleByteParam)

	call GetScriptByte
	add $4
	ld d, a
	call GetScriptByte
	add $4
	ld e, a
	call Function2a66
	call GetScriptByte
	ld [hl], a
	call Function2879
	ret
; 0x97ae3

Script_reloadmappart: ; 0x97ae3
; script command 0x7c

	xor a
	ld [$ffd4], a
	call Function2173
	call Function2914
	callba Function104061
	call Function1ad2
	ret
; 0x97af6

Script_warpcheck: ; 0x97af6
; script command 0x8e

	call Function224a
	ret nc
	callba Function966d0
	ret
; 0x97b01

Unknown_0x97b01: ; 0x97b01
	callba Function966d0
	ret
; 0x97b08

Script_newloadmap: ; 0x97b08
; script command 0x8a
; parameters:
;     which_method (SingleByteParam)

	call GetScriptByte
	ld [$ff9f], a
	ld a, $1
	call Function261b
	call StopScript
	ret
; 0x97b16

Script_reloadandreturn: ; 0x97b16
; script command 0x92

	call Script_newloadmap
	jp Script_end
; 0x97b1c

Script_loadfont: ; 0x97b1c
; script command 0x47

	call Function2e08
	ret
; 0x97b20

Script_refreshscreen: ; 0x97b20
; script command 0x48
; parameters:
;     dummy (SingleByteParam)

	call ResetWindow
	call GetScriptByte
	ret
; 0x97b27

Script_loadbytec1ce: ; 0x97b27
; script command 0x4a
; parameters:
;     byte (SingleByteParam)

	call GetScriptByte
	ld [$c2cf], a
	ret
; 0x97b2e


LoadMoveSpritesScript: ; 97b2e
	loadmovesprites
; 97b2f

Script_loadmovesprites: ; 0x97b2f
; script command 0x49

	call Function2e20
	call Function2dcf
	ret
; 0x97b36


Script_passtoengine: ; 0x97b36
; script command 0x89
; parameters:
;     data_pointer (PointerLabelBeforeBank)

	call GetScriptByte
	push af
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	pop af
	call StartAutoInput
	ret
; 0x97b47

Script_pause: ; 0x97b47
; script command 0x8b
; parameters:
;     length (DecimalParam)

	call GetScriptByte
	and a
	jr z, .asm_97b50 ; 0x97b4b $3
	ld [ScriptDelay], a
.asm_97b50
	ld c, 2
	call DelayFrames
	ld hl, ScriptDelay
	dec [hl]
	jr nz, .asm_97b50 ; 0x97b59 $f5
	ret
; 0x97b5c

Script_deactivatefacing: ; 0x97b5c
; script command 0x8c
; parameters:
;     time (SingleByteParam)

	call GetScriptByte
	and a
	jr z, .asm_97b65 ; 0x97b60 $3
	ld [ScriptDelay], a
.asm_97b65
	ld a, SCRIPT_WAIT
	ld [ScriptMode], a
	call StopScript
	ret
; 0x97b6e

Script_ptpriorityjump: ; 0x97b6e
; script command 0x8f
; parameters:
;     pointer (ScriptPointerLabelParam)

	call StopScript
	jp Script_2jump
; 0x97b74

Script_end: ; 0x97b74
; script command 0x91

	call ExitScriptSubroutine
	jr c, .asm_97b7a
	ret
.asm_97b7a
	xor a
	ld [ScriptRunning], a
	ld a, SCRIPT_OFF
	ld [ScriptMode], a
	ld hl, ScriptFlags
	res 0, [hl]
	call StopScript
	ret
; 0x97b8c

Script_return: ; 0x97b8c
; script command 0x90

	call ExitScriptSubroutine
	jr c, .asm_97b91
.asm_97b91
	ld hl, ScriptFlags
	res 0, [hl]
	call StopScript
	ret
; 0x97b9a

ExitScriptSubroutine: ; 0x97b9a
; Return carry if there's no parent to return to.

	ld hl, $d43c
	ld a, [hl]
	and a
	jr z, .asm_97bbe ; 0x97b9f $1d
	dec [hl]
	ld e, [hl]
	ld d, $0
	ld hl, $d43d
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld b, a
	and $7f
	ld [ScriptBank], a
	ld a, [hli]
	ld e, a
	ld [ScriptPos], a
	ld a, [hl]
	ld d, a
	ld [ScriptPos + 1], a
	and a
	ret
.asm_97bbe
	scf
	ret
; 0x97bc0

Script_resetfuncs: ; 0x97bc0
; script command 0x93

	xor a
	ld [$d43c], a
	ld [ScriptRunning], a
	ld a, SCRIPT_OFF
	ld [ScriptMode], a
	ld hl, ScriptFlags
	res 0, [hl]
	call StopScript
	ret
; 0x97bd5

Script_halloffame: ; 0x97bd5
; script command 0xa1

	ld hl, $cfbc
	res 0, [hl]
	callba Mobile_HallOfFame
	callba Mobile_HallOfFame2
	callba HallOfFame
	ld hl, $cfbc
	set 0, [hl]
	jr DisplayCredits
; 0x97bf3

Script_credits: ; 0x97bf3
; script command 0xa2

	callba Function86455
	; fallthrough

DisplayCredits:
	call Script_resetfuncs
	ld a, $3
	call Function261b
	call StopScript
	ret
; 0x97c05

Script_wait: ; 0x97c05
; script command 0xa8
; parameters:
;     unknown (SingleByteParam)

	push bc
	call GetScriptByte
.asm_97c09
	push af
	ld c, 6
	call DelayFrames
	pop af
	dec a
	jr nz, .asm_97c09 ; 0x97c11 $f6
	pop bc
	ret
; 0x97c15

Script_unknown0xa9: ; 0x97c15
; script command 0xa9

	callba Function4cffe
	ld a, c
	ld [$c2dd], a
	ret
; 0x97c20

