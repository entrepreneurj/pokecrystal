_CRYSTAL EQU 1

if _CRYSTAL
VERSION EQU 0
else
VERSION EQU 1
endc

; wram constants
; MonType: ; cf5f
PARTYMON   EQU 0
OTPARTYMON EQU 1
BOXMON     EQU 2
WILDMON    EQU 4

; WalkingDirection: ; d043
STANDING EQU -1
DOWN     EQU 0
UP       EQU 1
LEFT     EQU 2
RIGHT    EQU 3

; FacingDirection: ; d044
FACE_CURRENT EQU 0
FACE_DOWN  EQU 8
FACE_UP    EQU 4
FACE_LEFT  EQU 2
FACE_RIGHT EQU 1

; TimeOfDay: ; d269
MORN     EQU 0
DAY      EQU 1
NITE     EQU 2
DARKNESS EQU 3

; ScriptFlags: ; d434
SCRIPT_RUNNING EQU 2

; ScriptMode: ; d437
SCRIPT_OFF EQU 0
SCRIPT_READ EQU 1
SCRIPT_WAIT_MOVEMENT EQU 2
SCRIPT_WAIT EQU 3

; CurDay: ; d4cb
SUNDAY    EQU 0
MONDAY    EQU 1
TUESDAY   EQU 2
WEDNESDAY EQU 3
THURSDAY  EQU 4
FRIDAY    EQU 5
SATURDAY  EQU 6

; MapObjects: ; d71e

PLAYER_OBJECT EQU 0

NUM_OBJECTS   EQU $10
OBJECT_LENGTH EQU $10

; InputType: ; c2c7
AUTO_INPUT EQU $ff

; WhichRegisteredItem: ; d95b
REGISTERED_POCKET EQU %11000000
REGISTERED_NUMBER EQU %00111111

; PlayerState: ; d95d
PLAYER_NORMAL    EQU 0
PLAYER_BIKE      EQU 1
PLAYER_SLIP      EQU 2
PLAYER_SURF      EQU 4
PLAYER_SURF_PIKA EQU 8


INCLUDE "gbhw.asm"
INCLUDE "hram.asm"

INCLUDE "constants/pokemon_constants.asm"
INCLUDE "constants/move_constants.asm"
INCLUDE "constants/battle_constants.asm"
INCLUDE "constants/map_constants.asm"
INCLUDE "constants/item_constants.asm"
INCLUDE "constants/trainer_constants.asm"
INCLUDE "constants/script_constants.asm"
INCLUDE "constants/event_flags.asm"
INCLUDE "constants/engine_flags.asm"
INCLUDE "constants/music_constants.asm"
INCLUDE "constants/sfx_constants.asm"


; macros require rst vectors to be defined
FarCall    EQU $08
Bankswitch EQU $10
JumpTable  EQU $28

INCLUDE "macros.asm"


NONE       EQU 0


; types
NORMAL   EQU $00
FIGHTING EQU $01
FLYING   EQU $02
POISON   EQU $03
GROUND   EQU $04
ROCK     EQU $05
BUG      EQU $07
GHOST    EQU $08
STEEL    EQU $09
CURSE_T  EQU $13
FIRE     EQU $14
WATER    EQU $15
GRASS    EQU $16
ELECTRIC EQU $17
PSYCHIC  EQU $18
ICE      EQU $19
DRAGON   EQU $1A
DARK     EQU $1B

; egg group constants
MONSTER       EQU $01
AMPHIBIAN     EQU $02
INSECT        EQU $03
AVIAN         EQU $04
FIELD         EQU $05
FAIRY         EQU $06
PLANT         EQU $07
HUMANSHAPE    EQU $08
INVERTEBRATE  EQU $09
INANIMATE     EQU $0A
AMORPHOUS     EQU $0B
FISH          EQU $0C
LADIES_MAN    EQU $0D
REPTILE       EQU $0E
NO_EGGS       EQU $0F

; menu sprites
ICON_POLIWAG       EQU $01
ICON_JIGGLYPUFF    EQU $02
ICON_DIGLETT       EQU $03
ICON_PIKACHU       EQU $04
ICON_STARYU        EQU $05
ICON_FISH          EQU $06
ICON_BIRD          EQU $07
ICON_MONSTER       EQU $08
ICON_CLEFAIRY      EQU $09
ICON_ODDISH        EQU $0a
ICON_BUG           EQU $0b
ICON_GHOST         EQU $0c
ICON_LAPRAS        EQU $0d
ICON_HUMANSHAPE    EQU $0e
ICON_FOX           EQU $0f
ICON_EQUINE        EQU $10
ICON_SHELL         EQU $11
ICON_BLOB          EQU $12
ICON_SERPENT       EQU $13
ICON_VOLTORB       EQU $14
ICON_SQUIRTLE      EQU $15
ICON_BULBASAUR     EQU $16
ICON_CHARMANDER    EQU $17
ICON_CATERPILLAR   EQU $18
ICON_UNOWN         EQU $19
ICON_GEODUDE       EQU $1a
ICON_FIGHTER       EQU $1b
ICON_EGG           EQU $1c
ICON_JELLYFISH     EQU $1d
ICON_MOTH          EQU $1e
ICON_BAT           EQU $1f
ICON_SNORLAX       EQU $20
ICON_HO_OH         EQU $21
ICON_LUGIA         EQU $22
ICON_GYARADOS      EQU $23
ICON_SLOWPOKE      EQU $24
ICON_SUDOWOODO     EQU $25
ICON_BIGMON        EQU $26


; evolution types
EVOLVE_LEVEL     EQU 1
EVOLVE_ITEM      EQU 2
EVOLVE_TRADE     EQU 3
EVOLVE_HAPPINESS EQU 4
EVOLVE_STAT      EQU 5

BASE_HAPPINESS   EQU 70
; happiness evolution triggers
HAPPINESS_TO_EVOLVE EQU 220
TR_ANYTIME EQU 1
TR_MORNDAY EQU 2
TR_NITE    EQU 3

; stat evolution triggers
ATK_GT_DEF EQU 1
ATK_LT_DEF EQU 2
ATK_EQ_DEF EQU 3


; name length
PLAYER_NAME_LENGTH EQU 8
PKMN_NAME_LENGTH EQU 11


; predefs
PREDEF_FLAG EQU $03
PREDEF_FILLPP EQU $05
PREDEF_ADDPARTYMON EQU $06
PREDEF_FILLSTATS EQU $0C
PREDEF_PRINT_MOVE_DESCRIPTION EQU $11
PREDEF_UPDATE_PLAYER_HUD EQU $12
PREDEF_FILL_BOX EQU $13
PREDEF_UPDATE_ENEMY_HUD EQU $15
PREDEF_START_BATTLE EQU $16
PREDEF_FILL_IN_EXP_BAR EQU $17
PREDEF_FILLMOVES EQU $1B
PREDEF_GET_GENDER EQU $24
PREDEF_STATS_SCREEN EQU $25
PREDEF_DRAW_PLAYER_HP EQU $26
PREDEF_DRAW_ENEMY_HP EQU $27
PREDEF_GET_TYPE_NAME EQU $29
PREDEF_PRINT_MOVE_TYPE EQU $2A
PREDEF_PRINT_TYPE EQU $2B
PREDEF_GET_UNOWN_LETTER EQU $2D
PREDEF_LOAD_SGB_LAYOUT EQU $31
PREDEF_CHECK_CONTEST_MON EQU $33
PREDEF_BATTLE_TRANSITION EQU $34
PREDEF_PARTYMON_ITEM_NAME EQU $3B
PREDEF_DECOMPRESS EQU $40


; flag manipulation
RESET_FLAG EQU 0
SET_FLAG   EQU 1
CHECK_FLAG EQU 2


; joypad
BUTTONS    EQU %00010000
D_PAD      EQU %00100000

NO_INPUT   EQU %00000000
A_BUTTON   EQU %00000001
B_BUTTON   EQU %00000010
SELECT     EQU %00000100
START      EQU %00001000
D_RIGHT    EQU %00010000
D_LEFT     EQU %00100000
D_UP       EQU %01000000
D_DOWN     EQU %10000000


; screen
HP_BAR_LENGTH EQU 6
HP_BAR_LENGTH_PX EQU 48
EXP_BAR_LENGTH EQU 8
EXP_BAR_LENGTH_PX EQU 64

SCREEN_WIDTH EQU 20
SCREEN_HEIGHT EQU 18
SCREEN_WIDTH_PX EQU 160
SCREEN_HEIGHT_PX EQU 144

BG_MAP_WIDTH  EQU 32
BG_MAP_HEIGHT EQU 32

TILE_WIDTH EQU 8


; movement
STEP_SLOW EQU 0
STEP_WALK EQU 1
STEP_BIKE EQU 2
STEP_LEDGE EQU 3
STEP_ICE EQU 4
STEP_TURN EQU 5
STEP_BACK_LEDGE EQU 6
STEP_WALK_IN_PLACE EQU 7


