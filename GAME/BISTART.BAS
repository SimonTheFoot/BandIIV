DECLARE SUB fpout ()
DECLARE SUB actodpr ()
DECLARE SUB genlist1 (w%)
DECLARE SUB genlist2 (w%)
DECLARE SUB officercheck ()
DECLARE SUB ofiord (ttt%)
DECLARE SUB fastin ()
DECLARE FUNCTION getfilecount% (filespec$)
DECLARE SUB loadem ()
DECLARE SUB makestrings ()
DECLARE SUB ordercase ()
DECLARE SUB orderpr (ff%)
DECLARE SUB repair ()
DECLARE SUB setup ()
DECLARE SUB setupdesktop ()
DECLARE SUB setupmenu ()
DECLARE SUB skill ()
DECLARE SUB uload ()
DECLARE SUB uniord (unit%)
'$INCLUDE: 'C:\bc7\ecw\bandi3\game\bloodiba.bi'

SUB bombard
CALL header
grabstats (1)
PRINT officer$
PRINT
PRINT "How many moves should the bombardment last ";
INPUT tbomb1
IF headcase = 1 THEN
rendom
tbomb1 = INT(tbomb1 * xs) + 1
END IF
CALL header
grabstats (nua + 1)
PRINT officer$
PRINT
PRINT "How many moves should the bombardment last ";
INPUT tbomb2
IF headcase = 2 THEN
rendom
tbomb2 = INT(tbomb2 * xs) + 1
END IF
CALL header
PRINT
IF tbomb1 = tbomb2 THEN
tbomb = tbomb1
PRINT "By mutual decision the bombardment phase will last "; tbomb; " moves"
ELSE
tbomb = MIN(tbomb1, tbomb2)
IF tbomb1 < tbomb2 THEN
grabstats (1)
ELSE
END IF
PRINT "After a lapse of "; tbomb; " moves, the bombardment phase was ended when"
PRINT "the Army of "; officer$; " initiated a significant movement."
END IF
wate
grabstats (target)
END SUB

SUB colordisplay
    displaytype = TRUE
    MouseHide
    setupmenu
   setupdesktop
   MenuShow
   MouseShow
END SUB

SUB eg

CALL header
zero
CALL ccomp
palert
pointshow = Alert(4, "Show Points Values.", 9, 10, 14, 70, " No ", " Yes ", "") - 1
ltype = 0
rub = RND * 10 + 1
countu = 0
header
FOR unit = 1 TO nu
  CALL grabstats(unit)
  m = mr - morlos
  m = max(m, 0)
  morale = INT(m / mo * 100)
  IF btype = 0 THEN
    IF ltype > 0 AND priner = 0 THEN
      countu = 0
      wate
      CALL header
    ELSE
      countu = countu + 1
    END IF
    PRINT #10, ; "_______________________________________________"
    PRINT #10,
    review$ = comand$(oftyp) + officer$
    CALL worp(review$)
    review$ = officer$
    IF ofw > 100 THEN
      IF ofw > 200 THEN
        review$ = review$ + " is dead. "
      ELSE
        review$ = review$ + " has been wounded. "
      END IF
    ELSE
      IF morale = 0 THEN
        review$ = review$ + rubbish$(rub)
        rub = rub + 1
        IF rub = 11 THEN
          rub = 1
        END IF
      ELSE
      review$ = review$ + " is " + moralpr$(wm) + ". "
    END IF
  END IF

ELSE
  IF countu = 2 AND priner = 0 THEN
    countu = 0
    wate
    CALL header
  ELSE
    countu = countu + 1
  END IF
  review$ = "Unit " + STR$(unit) + ":  " + unit$ + "."
  CALL worp(review$)
  IF mf = 0 THEN
    casf = -1
  ELSE
    m = mf - menlos
    casf = omf - m
  END IF
  pc = INT(100 - m / omf * 100)
  gll = 0
  IF btype > 8 THEN
    gll = ogn - gf
    gll = gll - gf2
  END IF

  SELECT CASE casf
  CASE -1
    review$ = "The unit was wiped out to a man "
    IF gll > 0 THEN
      review$ = review$ + "and all " + STR$(ogun) + " guns were lost. "
    ELSE
      review$ = review$ + ". "
    END IF
  CASE 0
    review$ = "They suffered no casualties and remain " + STR$(omf) + " men strong. "
    IF gll > 0 THEN
      IF gll = 1 THEN
        review$ = review$ + "However, a gun was also lost. "
      ELSE
        review$ = review$ + "However, " + STR$(gll) + " guns were also lost. "
      END IF
    END IF
  CASE 1
    review$ = "They suffered a single casualty from " + STR$(omf) + " men, (" + STR$(pc) + "%). "
    IF gll > 0 THEN
      IF gll = 1 THEN
        review$ = review$ + "Albeit, a gun was also lost. "
      ELSE
        review$ = review$ + "Nevertheless, " + STR$(gll) + " guns were also lost. "
      END IF
    END IF
  CASE ELSE
    review$ = "They suffered " + STR$(casf) + " casualties from " + STR$(omf) + " men (" + STR$(pc) + "%). "
    IF gll > 0 THEN
      IF gll = 1 THEN
        review$ = review$ + "Additionally, a gun was lost. "
      ELSE
        review$ = review$ + "Additionally, " + STR$(gll) + " guns were lost. "
      END IF
    END IF
  END SELECT

  SELECT CASE std
  CASE 0
    review$ = review$ + "The unit's Colours were taken by the enemy. "
  CASE 11 TO 99
    guncap = std - 10
    review$ = review$ + "The unit has taken " + STR$(guncap) + " enemy guns. "
  CASE 100 TO 256
    review$ = review$ + "The unit has taken the enemy's colours. "
  END SELECT

  IF casf = -1 THEN
  ELSE
    review$ = review$ + "They are now " + RTRIM$(moralpr$(wm)) + ". "
  END IF
END IF

SELECT CASE btype
CASE 1 TO 5
  men = men + omf
  mecas = mecas + casf
CASE 6 TO 8
  hor = hor + omf
  horcas = horcas + casf
CASE 9 TO 14
  guners = guners + omf
  gunercas = gunercas + casf
  gunlost = gunlost + gll
END SELECT


IF pointshow THEN
  CALL points
END IF
CALL worp(review$)
PRINT #10,

IF unit = nua OR unit = nu THEN
  CALL fpout
  CALL zero
  IF unit = nua THEN
    IF priner = 0 THEN
      wate
    END IF
    PRINT #10, CHR$(12)
    x = Alert(4, "Second Army.", 9, 10, 14, 70, "", "", "")
    header
    btype = 0
  countu = 0
  END IF
END IF
ltype = btype
NEXT unit
IF priner THEN
  PRINT #10, CHR$(12)
END IF
wate
setupdesktop

CALL ccomp
CLS
END SUB

SUB fastin

bat$ = STRING$(500, " ")
oldgame = TRUE
loded = TRUE
leave = FALSE
DO
  CALL uload
  IF INSTR(pat$, ".BIF") OR pat$ = "" THEN leave = TRUE
  IF NOT leave THEN x = Alert(4, "Not a .BIF file.", 9, 10, 14, 70, "", "", "")
LOOP UNTIL leave = TRUE

IF pat$ = "" THEN
  loded = FALSE
ELSE
  OPEN pat$ FOR INPUT AS #1
    bat$ = INPUT$(507, #1)
    bat$ = RIGHT$(bat$, 500)
  CLOSE #1
  nn1$ = LEFT$(bat$, 99)
  nn2$ = MID$(bat$, 100, 99)
  here$ = MID$(bat$, 200, 7)
  gs = CVI(MID$(bat$, 210, 2))
  grs = CVI(MID$(bat$, 220, 2))
  tablz = ASC(MID$(bat$, 225))
  gff = ASC(MID$(bat$, 230)) / 10
  htim = ASC(MID$(bat$, 240))
  mins = ASC(MID$(bat$, 250))
  skil = ASC(MID$(bat$, 251))
  death = ASC(MID$(bat$, 252))
  pen3 = ASC(MID$(bat$, 253))
  sf = ASC(MID$(bat$, 254))
  cshow = ASC(MID$(bat$, 255))
  weath = ASC(MID$(bat$, 260))
  weff = weff(weath, 12)
  windir = ASC(MID$(bat$, 261))
  move = ASC(MID$(bat$, 266))
  vis = CVI(MID$(bat$, 270, 2))
  nn1$ = RTRIM$(nn1$)
  nn2$ = RTRIM$(nn2$)
  OPEN nn1$ FOR INPUT AS #1
    x = LOF(1)
    x$ = STRING$(x, " ")
    DEF SEG = SSEG(x$)
    BLOAD nn1$, SADD(x$)
  CLOSE #1
  DEF SEG
  x$ = LEFT$(x$, LEN(x$) - 7)
  a$ = x$
  lena = LEN(a$)
  nua = lena / 150
  OPEN nn2$ FOR INPUT AS #1
    x = LOF(1)
    x$ = STRING$(x, " ")
    DEF SEG = SSEG(x$)
    BLOAD nn2$, SADD(x$)
  CLOSE #1
  DEF SEG
  x$ = LEFT$(x$, LEN(x$) - 7)
  a$ = a$ + x$
  nu = LEN(a$) / 150
END IF
        oldgame = TRUE
END SUB

FUNCTION getfilecount (filespec$)
    count = 0
    ON LOCAL ERROR GOTO check
    fileName$ = DIR$(filespec$)
    DO WHILE fileName$ <> "" AND count <> -2
        count = count + 1
        fileName$ = DIR$
    LOOP
getfilecount = count
check:
count = -2
RESUME NEXT
END FUNCTION

DEFSNG A-W
SUB handlemenuevent
SELECT CASE kbd$
CASE "menu"
menu = MenuCheck(0)
item = MenuCheck(1)
CASE ELSE
PRINT kbd$
leave = TRUE
END SELECT
END SUB

DEFINT A-W
SUB loadem
'
loded = FALSE
DO
        cancel = FALSE
        b = Alert(4, "New Game or old.", 9, 10, 14, 70, " New ", " Old ", "")
        IF b = 2 THEN
                CALL fastin
        ELSE
        oldgame = FALSE
        CALL uload
        IF cancel = TRUE THEN
        ELSE
        OPEN pat$ FOR INPUT AS #1
        x = LOF(1)
        x$ = STRING$(x, " ")
        DEF SEG = SSEG(x$)
        BLOAD pat$, SADD(x$)
        CLOSE #1
        DEF SEG
        x$ = LEFT$(x$, LEN(x$) - 7)
        a$ = x$
        lena = LEN(a$)
        nua = lena / 150
        nn1$ = pat$
        END IF
        CALL uload
        IF cancel = TRUE THEN
        ELSE
        OPEN pat$ FOR INPUT AS #1
        x = LOF(1)
        x$ = STRING$(x, " ")
        DEF SEG = SSEG(x$)
        BLOAD pat$, SADD(x$)
        CLOSE #1
        DEF SEG
        x$ = LEFT$(x$, LEN(x$) - 7)
        a$ = a$ + x$
        loded = TRUE
        nn2$ = pat$
        nu = LEN(a$) / 150
        END IF
        END IF
LOOP UNTIL loded
END SUB

DEFSNG A-W
SUB makemen
MenuPreProcess
MenuShow
MouseShow
END SUB

SUB makestrings
tired$(1) = "in prime spirit"
tired$(2) = "passing fresh"
tired$(3) = "rather tired"
tired$(4) = "a trifle careworn"
tired$(5) = "somewhat dispirited"
tired$(6) = "very dispirited"
tired$(7) = "at the end of their tether"
tired$(8) = "completely worn out"

org$(1) = "in parade order"
org$(2) = "well ordered"
org$(3) = "a little ragged"
org$(4) = "a little disordered"
org$(5) = "very ragged"
org$(6) = "thouroughly disordered"
org$(7) = "no more than a ragged mob"
org$(8) = "completely lacking in any form of order"

moralpr$(0) = "elated and eager for the fray"
moralpr$(1) = "cheerful and confident"
moralpr$(2) = "steadfast and undaunted"
moralpr$(3) = "weary but undaunted"
moralpr$(4) = "weary and anxious"
moralpr$(5) = "worn out and fearful"
moralpr$(6) = "ragged and demoralised"
moralpr$(7) = "demoralised and panic stricken"
moralpr$(8) = "dispersed"

rubbish$(1) = ", the Scoundrel has shown his heel, abandoning his brave fellows. "
rubbish$(2) = ", the Scrub has abandonned all honour and fled the field. "
rubbish$(3) = " appears Shy ! He has run like a Cur. "
rubbish$(4) = " has fled apace, intent on outrunning news of his Cowardice. "
rubbish$(5) = " has taken to his coach which, it is long gone post haste for home. "
rubbish$(6) = " was last seen some miles from the Field and in a great hurry to be further. "
rubbish$(7) = " did not await the outcome of the Dread Field, but has run. "
rubbish$(8) = " departed in ungentle haste. "
rubbish$(9) = " has behaved most shocking, and run from the fray. "
rubbish$(10) = " made an untimely departure of the Field, somewhat in advance of his poor Troops. "


  mele$(1) = " Ok.                    "
  mele$(2) = " Wrong terrain.         "
  mele$(3) = " Wrong formation.       "
  mele$(4) = " Other error: restart.  "

  armour$(1) = " No armour     "
  armour$(2) = " Cuirass       "
  armour$(3) = " Half Cuirass  "
  armour$(4) = " Chain Mail    "
  armour$(5) = " Mail & Quilt  "
  armour$(6) = " Quilt         "

  rally$(1) = " at once rallied the gallant unit ": fail$(1) = " failed to rally the disheartened men "
  rally$(2) = " soon rallied the troops ": fail$(2) = " tried but failed to rally the dispirited soldiers "
  rally$(3) = " appealed to the honour of the unit ": fail$(3) = " appealed in vain to the honour of the unit "
  rally$(4) = " appealed to the past glories of the unit ": fail$(4) = " appealed in vain to the pride of the unit "
  rally$(5) = " successfully harrangued the flagging troops ": fail$(5) = " unsuccessfully harrangued the demoralised troops "
  rally$(6) = " won round the flagging troops ": fail$(6) = " failed to hearten the shattered remnants "
  rally$(7) = " eventually won round the failing unit ": fail$(7) = " failed to rally the disheartened body "
  rally$(8) = " eventually won round the wavering troops ": fail$(8) = " failed to rally the disheartened remnants "
  rally$(9) = " eventually won round the shaken soldiers ": fail$(9) = " failed to rally the demoralised remnants "
  rally$(10) = " eventually rallied the wavering unit ": fail$(10) = " failed to rally the frightened troops "

  fire$(1) = " Fire from front.             "
  fire$(2) = " Fire onto flank.             "
  fire$(3) = " Fire from flank.             "
  fire$(4) = " Fire from rear.              "
  fire$(5) = " Fire from unseen foe.        "
  fire$(6) = " Surprise fire.               "
  fire$(7) = " Bombardment.                 "
  fire$(8) = " Wrong terrain.               "
  fire$(9) = " Wrong formation.             "
  fire$(10) = " No fire, re-start.           "

  charge$(1) = " Charge from front.                   "
  charge$(2) = " Charge onto flank.                   "
  charge$(3) = " Charge from flank.                   "
  charge$(4) = " Charge from rear.                    "
  charge$(5) = " Unexpected charge.                   "
  charge$(6) = " Surprise charge.                     "
  charge$(7) = " Reciprocal frontal charge.           "
  charge$(8) = " Retreating Friends Passing.          "
  charge$(9) = " Retreating Friends Interpenetrating. "
  charge$(10) = " Advancing Friends Interpenetrating.  "
  charge$(11) = " Wrong terrain.                       "
  charge$(12) = " Wrong formation.                     "
  charge$(13) = " Other error.                         "

  rank$(1) = " Marshal                "
  rank$(2) = " Field Marshal          "
  rank$(3) = " General                "
  rank$(4) = " Lieutenant General     "
  rank$(5) = " Major General          "
  rank$(6) = " Brigadier General      "
  rank$(7) = " Brigadier              "
  rank$(8) = " Colonel                "
  rank$(9) = " Lieutenant Colonel     "
  rank$(10) = " Major                  "
  rank$(11) = " Captain                "
  rank$(12) = " Lieutenant             "
  rank$(13) = " Subaltern              "
  rank$(14) = " Ensign                 "
  rank$(15) = " Sergeant Major         "
  rank$(16) = " Sergeant               "
  rank$(17) = " Corporal               "
  rank$(18) = " Commandant             "
  rank$(19) = " Commander              "
  rank$(20) = " Adjutant               "
  rank$(21) = " Emperor                "
  rank$(22) = " King                   "
  rank$(23) = " Prince                 "
  rank$(24) = " Duke                   "
  rank$(25) = " Lord                   "
  rank$(26) = " Count                  "
  rank$(27) = " Baron                  "
  rank$(28) = " Mayor                  "
  rank$(29) = " Father                 "
  rank$(30) = " Governor               "
  rank$(31) = " Commisioner            "
  rank$(32) = " Paramount Chief        "
  rank$(33) = " Chief                  "
  rank$(34) = " Chieftain              "
  rank$(35) = " Sultan                 "
  rank$(36) = " Emir                   "
  rank$(37) = " Sheikh                 "
  rank$(38) = " Mullah                 "
  rank$(39) = " Iman                   "
  rank$(40) = " Bakaski                "
  rank$(41) = " Sipahadar              "
  rank$(42) = " Mokumdar               "
  rank$(43) = " Momba                  "
  rank$(44) = " Induna                 "
  rank$(45) = " Ndoda                  "
  rank$(46) = " Cuadillo Don           "
  rank$(47) = " Hetmen                 "
  rank$(48) = " Jagirdar               "
  rank$(49) = " Zemandar               "
  rank$(50) = " Dissawa                "
  rank$(51) = " Aqib                   "

  windfrom$(1) = " north"
  windfrom$(2) = " north-east"
  windfrom$(3) = " east"
  windfrom$(4) = " south-east"
  windfrom$(5) = " south"
  windfrom$(6) = " south-west"
  windfrom$(7) = " west"
  windfrom$(8) = " north-west"

guntype$(0) = "tension weapon"
guntype$(1) = "syphon"
guntype$(2) = "primitive smoothbore"
guntype$(3) = "smoothbore"
guntype$(4) = "muzzle loading rifle"
guntype$(5) = "rifled breechloader"
guntype$(6) = "howitzer"
guntype$(7) = "mortar"
guntype$(8) = "rocket"

cat$(0) = "broken its joints"
cat$(1) = "spilled fire"
cat$(2) = "bursted assunder"
cat$(3) = "become overheated and burst"
cat$(4) = "bursted its barrel"
cat$(5) = "blown its breech"
cat$(6) = "overheated and burst"
cat$(7) = "bursted and upturned"
cat$(8) = "exploded prematurely"

  priner$(0) = " Printer off "
  priner$(1) = " Printer on  "

  shot$(0) = " hurried "
  shot$(1) = " rapid "
  shot$(2) = " steady "
  shot$(3) = " ragged "
  shot$(4) = " faltering "
  shot$(5) = " scattered "
  shot$(6) = " panic "
  shot$(7) = " panic "
  shot$(8) = " panic "

  morale$(0) = " enthusiastical      "
  morale$(1) = " confident           "
  morale$(2) = " steady              "
  morale$(3) = " holding             "
  morale$(4) = " wavering            "
  morale$(5) = " shaken              "
  morale$(6) = " demoralised         "
  morale$(7) = " routed              "
  morale$(8) = " routed beyond rally "
  
  od$(0) = " charge             "
  od$(1) = " charge             ": od1$(0) = " charge             "
  od$(2) = " advance rapidly    ": od1$(1) = " advance rapidly    "
  od$(3) = " advance steadily   ": od1$(2) = " advance steadily   "
  od$(4) = " engage             ": od1$(3) = " engage             "
  od$(5) = " hold               ": od1$(4) = " hold               "
  od$(6) = " delay              ": od1$(5) = " delay              "
  od$(7) = " retire             ": od1$(6) = " retire             "
  od$(8) = " retreat            ": od1$(7) = " retreat            "
  od$(9) = " rally              ": od1$(8) = " rally              "
  od$(10) = " reserve            ": od1$(9) = " reserve            "
  od$(11) = " appearing on field "
  od$(12) = " not activated      "
  od$(13) = " withdraw           "
  od$(14) = " withdraw           "
  od$(15) = " reform after melee "
  od$(16) = " rally after melee  "
  od$(17) = " reform after rout  "
  od$(18) = " panic              "
  od$(19) = " panic              "
  od$(20) = " panic              "
  od$(21) = " rout               "
  od$(22) = " rout               "
  od$(23) = " recover order      "
  od$(24) = " arrival imminent   "
  od$(25) = " arrival anticipated"
  od$(26) = " arrival anticipated"
  od$(27) = " fast approaching   "
  od$(28) = " fast approaching   "
  od$(29) = " approaching        "
  od$(30) = " approaching        "
  od$(31) = " approaching        "
  od$(32) = " marching           "
  od$(33) = " marching           "
  od$(34) = " marching           "
  od$(35) = " marching           "
  od$(36) = " marching           "
  od$(37) = " marching           "
  od$(38) = " marching           "
  od$(39) = " marching           "
  od$(40) = " marching           "
  od$(41) = " marching           "
  od$(42) = " marching           "
  od$(43) = " marching           "

  weath$(0) = " fine           "
  weath$(1) = " fine           "
  weath$(2) = " hot            "
  weath$(3) = " misty          "
  weath$(4) = " light rain     "
  weath$(5) = " windy          "
  weath$(6) = " heavy rain     "
  weath$(7) = " snow           "

comand$(1) = " The Army of "
comand$(2) = " The Army of "
comand$(3) = " The Corps of "
comand$(4) = " The Division of "
comand$(5) = " The Brigade of "

ammo$(1) = " shot               "
ammo$(2) = " common shell       "
ammo$(3) = " cannister          "
ammo$(4) = " bolt               "
ammo$(5) = " spherical case     "
ammo$(6) = " shell and carcase  "
ammo$(7) = " cannister and case "
ammo$(8) = " explosive rocket   "
ammo$(9) = " incendiary rocket  "
ammo$(10) = " bombs              "
ammo$(11) = " impact shell       "
ammo$(12) = " grapeshot          "
ammo$(13) = " shell and case     "
ammo$(14) = " impact shell       "
ammo$(15) = " impact shell       "
ammo$(16) = " impact shell       "

terrain$(0) = " clear                     "
terrain$(1) = " clear                     "
terrain$(2) = " shallow hills             "
terrain$(3) = " steep hills               "
terrain$(4) = " open woods/orchards       "
terrain$(5) = " dense woods               "
terrain$(6) = " scrub                     "
terrain$(7) = " difficult ground          "
terrain$(8) = " soft sand                 "
terrain$(9) = " rocks and boulders        "
terrain$(10) = " water                     "
terrain$(11) = " fences/hedges             "
terrain$(12) = " stone walls               "
terrain$(13) = " ditch & bank              "
terrain$(14) = " wagon laager              "
terrain$(15) = " light buildings           "
terrain$(16) = " stone buildings           "
terrain$(17) = " field entrenchments       "
terrain$(18) = " full entrenchments        "

drill$(0) = " column of route        "
drill$(1) = " line                   "
drill$(2) = " open column            "
drill$(3) = " column of companies    "
drill$(4) = " hollow square          "
drill$(5) = " loose order            "
drill$(6) = " skirmish order         "
drill$(7) = " line                   "
drill$(8) = " battalion column       "
drill$(9) = " hollow square          "
drill$(10) = " battle line            "
drill$(11) = " battalion column       "
drill$(12) = " battalion masse        "
drill$(13) = " division masse         "
drill$(14) = " column of mob          "
drill$(15) = " solid square           "
drill$(16) = " hollow triangle        "
drill$(17) = " attack column          "
drill$(18) = " company column         "
drill$(19) = " deep line              "
drill$(20) = " attack column          "
drill$(21) = " company column         "
drill$(22) = " loose order masse      "
drill$(23) = " loose order line       "
drill$(24) = " close order line       "
drill$(25) = " close order mass       "
drill$(26) = " swarm                  "
drill$(27) = " screen                 "
drill$(28) = " assault column         "
drill$(29) = " close column           "
drill$(30) = " mobile square          "
drill$(31) = " deep mass              "
drill$(32) = " dismounted line        "
drill$(33) = " dismounted loose order "
drill$(34) = " dismounted skirmishers "
drill$(35) = " Limbered               "
drill$(36) = " extended order         "
drill$(37) = " Limbered               "
drill$(38) = " Limbered               "
drill$(39) = " In Train               "
drill$(40) = " Loose Masse            "
drill$(41) = " Line                   "
drill$(42) = " Line                   "
drill$(43) = " Column of Squadrons    "
drill$(44) = " Column of Divisions    "
drill$(45) = " Loose Order            "
drill$(46) = " Skirmish Order         "
drill$(47) = " dismounted line        "
drill$(48) = " dismounted screen      "
drill$(49) = " Platoon Column         "
drill$(50) = " Squadron Column        "
drill$(51) = " Echelon                "
drill$(52) = " Extended Line          "
drill$(53) = " Loose Order Line       "
drill$(54) = " Close Order Line       "
drill$(55) = " Close Masse            "
drill$(56) = " Swarm                  "
drill$(57) = " Screen                 "
drill$(58) = " Mounted Column         "
drill$(59) = " Mounted Line           "
drill$(60) = " Mounted Screen         "
drill$(61) = " Limbered               "
drill$(62) = " open deployed          "
drill$(63) = " close deployed         "
drill$(64) = " Deploying              "
drill$(65) = " Limbered               "
drill$(66) = " deployed               "
drill$(67) = " Loose mass             "
drill$(68) = " Close mass             "
drill$(69) = " Screen                 "
drill$(70) = " Masse                  "
drill$(71) = " Screen                 "
drill$(72) = " firing line            "
drill$(73) = " complete disorder      "
drill$(74) = " complete disorder      "
drill$(75) = " Complete Disorder      "
drill$(76) = " dismounted picket      "

END SUB

DEFINT A-W
SUB nsa
  junk = Alert(4, "The Save Function is disabled" + "|in this Demo Version" + "|of Blood & Iron.", 9, 10, 14, 70, "Continue", "", "")
END SUB

SUB ordercase

brigu = numsub
SELECT CASE ortyp
CASE 1
  DO
    tod = 1
    action = action - 1
    ofchan = 10
    CALL ofiord(officer)
    uchan = 1
    CALL uniord(unit)
    CALL grabstats(officer)
    action = max(action, 0)
  LOOP UNTIL action < 1 OR tod = 1
  IF action > 0 THEN
    action = action - 1
  END IF
  od = nod
  pw = action
  CALL replacestats(officer)
CASE 2
  ofchan = 12
  CALL ofiord(officer)
  nod = od
  DO
    tod = 1
    action = action - 1
    FOR unit = officer + 1 TO officer + brigu
      uchan = 2
      CALL uniord(unit)
    NEXT unit
  LOOP UNTIL action < 1 OR tod = 1
    CALL grabstats(officer)
    action = action - 1
    action = max(action, 0)
    od = nod
    pw = action
    CALL replacestats(officer)
CASE 3
  DO
    tod = 1
    action = action - 1
    ofchan = 3
    CALL ofiord(unit)
    CALL grabstats(officer)
    action = max(action, 0)
    od = nod
    pw = action
    CALL replacestats(officer)
  LOOP UNTIL action < 1 OR tod = 1
CASE 4
  ofchan = 4
  CALL ofiord(officer)
  DO
    tod = 1
    action = action - 1
    FOR unit = officer + 1 TO officer + brigu
      CALL grabstats(unit)
      IF btype = 0 THEN
        CALL ofiord(unit)
      END IF
    NEXT unit
  LOOP UNTIL action < 1 OR tod = 1
  CALL grabstats(officer)
  action = max(action, 0)
  od = nod
  pw = action
  CALL replacestats(officer)
  offin = 1
END SELECT

END SUB

SUB orderch
DO
  CALL header
  PRINT "Which Officer would like to change orders ";
  CALL officercheck
  IF noff = FALSE THEN
  ELSE
    offin = 0
    DO
      CALL grabstats(officer)
      ns = numsub
      nutot = nu
      IF officer < nua THEN
        nutot = nua
      END IF
      IF ns + officer > nutot THEN
        ns = nutot - officer
      END IF

      IF oftyp < 5 THEN
        CALL genlist2(officer)
        ns = c1 - 2
        flag = TRUE
      ELSE
        CALL genlist1(officer)
        flag = FALSE
      END IF

      CALL grabstats(officer)
      CALL ofhed
      wate
      choice = windows("issuing orders to unit:                ", ns + 2, uname$()) - 1
      ortyp = 1
      IF flag THEN
        unit = VAL(uname$(choice + 1))
        ortyp = 3
      ELSE
        unit = officer + choice - 1
      END IF

      IF unit < officer THEN
        offin = 1
      ELSE
        orpos = 9
        IF officer = unit THEN
          IF flag THEN
            ortyp = 4
          ELSE
            ortyp = 2
          END IF
        END IF
        CALL grabstats(officer)
        action = pw
        CALL ofhed
        wate
        nod = windows(" New order:", orpos, od1$()) + 1
        CALL grabstats(officer)
        bestod = morale(spm, 1)
        nod = max(nod, bestod)
        sofa = ofa ^ 2 / 50
        CALL ordercase
        CALL grabstats(officer)
        action = max(action, 0)
        od = nod
        pw = action
        CALL replacestats(officer)
        CALL orderpr(officer)
      END IF
    LOOP UNTIL offin = 1 OR action < 1 OR tod = 1
  END IF
LOOP UNTIL officer = 0
header
END SUB

SUB ordercheck
'
IF od < 10 THEN
IF od < odr THEN
'
CALL rendom
'
IF x > mr THEN
od = odr
END IF
'
END IF
END IF
'

END SUB

SUB orderpr (ff)
CLS
CALL grabstats(ff)

brigu = numsub
CALL ofhed

SELECT CASE ortyp
CASE 1
  CALL grabstats(ff)
  CALL grabstats(unit)
  CALL actodpr
CASE 2
  FOR unit = ff + 1 TO officer + brigu
    CALL grabstats(unit)
    CALL actodpr
  NEXT unit
CASE 3
  CALL grabstats(ff)
  CALL grabstats(unit)
  CALL actodpr
CASE 4
  FOR unit = ff + 1 TO officer + brigu
    grabstats (unit)
    IF btype = 0 THEN
      IF mr = 0 THEN
        review$ = "Unit " + STR$(unit) + "). " + officer$ + " has taken to his heels. "
      ELSE
        review$ = "Unit " + STR$(unit) + "). " + officer$ + " current order: " + RTRIM$(od$(od)) + ". "
      END IF
      worps (review$)
      PRINT
    END IF
  NEXT unit
END SELECT
wate

END SUB

SUB repair

FOR i = 1 TO nu
  CALL grabstats(i)
  stafof = 0
  fear = 10
  sat = 0
  aw = 0
  IF btype = 0 THEN
    pw = INT((ofa * x2 / 10) + 1)
    stafof = i
    aw = i
  END IF
  std = 10
  msince = 1
  wm = 1
  spm = 1
  od = 12
  ofp = 100
  tu = i - 1
  tu = tu * 150
  MID$(a$, tu + 54) = CHR$(mr)
  MID$(a$, tu + 64) = MKI$(mf)
  CALL replacestats(i)
NEXT i
END SUB

DEFINT X-Z
SUB sa
ON LOCAL ERROR GOTO grog1
ooop1:
bat$ = STRING$(500, " ")
'
MID$(bat$, 1, LEN(nn1$)) = nn1$
'
MID$(bat$, 100, LEN(nn2$)) = nn2$
'
MID$(bat$, 200, 7) = phase$
'
MID$(bat$, 210, 2) = MKI$(gs)
'
MID$(bat$, 220, 2) = MKI$(grs)
'
MID$(bat$, 225) = CHR$(tablz)
'
MID$(bat$, 230) = CHR$(gff * 10)
'
MID$(bat$, 240) = CHR$(htim)
'
MID$(bat$, 250) = CHR$(mins)
MID$(bat$, 251) = CHR$(skil)
MID$(bat$, 252) = CHR$(death)
MID$(bat$, 253) = CHR$(pen3)
f = max(1, sf / 1000)
MID$(bat$, 254) = CHR$(f)
MID$(bat$, 255) = CHR$(cshow)
'
MID$(bat$, 260) = CHR$(weath)
'
MID$(bat$, 261) = CHR$(windir)
'
MID$(bat$, 266) = CHR$(move)
'
weff = weff(weath, 12)
'
MID$(bat$, 270, 2) = MKI$(vis)
'

    choice = Alert(4, " Save to which Drive?", 9, 10, 14, 70, "A:", "C:", "Other")
    SELECT CASE choice
CASE 1
filespec$ = "A:\*.biA"
pat$ = "a:\"
CASE 2
filespec$ = "C:\ecw\bandi3\*.biA"
pat$ = "C:\ecw\bandi3\"
CASE 3
ok = FALSE
DO UNTIL ok > 0
PRINT "Please enter the path for your save file folder"
PRINT "For example C:\myfold\"
INPUT pat$
filespec$ = pat$ + "*.biA"
ok = getfilecount(filespec$)
IF ok = 0 THEN
        ok = 1
        ELSE
        IF ok = -2 THEN
        junk = Alert(4, "This is an unacceptable path to save to", 9, 10, 14, 70, "Continue", "", "")
        ok = 0
        END IF
        END IF
LOOP
END SELECT
pat$ = pat$ + "BATTLE.biF"
DEF SEG = SSEG(bat$)
 BSAVE pat$, SADD(bat$), LEN(bat$)
DEF SEG
FOR x = 1 TO 2
'
IF x = 1 THEN

DEF SEG = SSEG(a$)
BSAVE nn1$, SADD(a$), nua * 150
DEF SEG
ELSE
b$ = RIGHT$(a$, LEN(a$) - nua * 150)
DEF SEG = SSEG(b$)
BSAVE nn2$, SADD(b$), LEN(b$)
DEF SEG

END IF
'
NEXT x
EXIT SUB
grog1:
x = Alert(4, "Sory: no files are here", 11, 20, 15, 60, "", "", "")
RESUME ooop1

END SUB

DEFSNG X-Z
SUB setup
IF NOT oldgame THEN
CLS
tf = 100
nu = LEN(a$) / 150
move = 1
gs = 0
WHILE gs < 100 OR gs > 5000
CALL header
PRINT "What is the ground scale..  (1:100 to 1:5000) ";
INPUT gs
WEND
grs = gs
gs = gs / 100
gff = gs / 5 + 2
tablz = 0
WHILE tablz < 19 OR tablz > 255
PRINT
PRINT "What table width in centimetres (min 20, max 255) ";
INPUT tablz
WEND
gff = gff * tablz / 180
htim = -1
WHILE htim < 0 OR htim > 24
PRINT
PRINT "What is the time in hours (24 hr clock) ";
INPUT htim
WEND
CALL wc
weff = weff(weath, 12)
CALL pvis
CALL skill
END IF
END SUB

DEFSNG A-W
SUB setupdesktop STATIC

MouseHide

WIDTH , 25
COLOR 15, 1
CLS
MouseShow

END SUB

DEFINT A-W
SUB setupmenu
MenuSet 1, 0, 1, " Game          ", 2
MenuSet 1, 1, 1, " Blood & Iron ", 2
'
MenuSet 2, 0, 1, " Move          ", 2
MenuSet 2, 1, 1, " Officer ", 2
MenuSet 2, 2, 1, " Ammo ", 2
'
MenuSet 3, 0, 1, " Change        ", 2
MenuSet 3, 1, 1, " Formation  ", 2
MenuSet 3, 2, 1, " Terrain ", 2
MenuSet 3, 3, 1, " Weather ", 2
MenuSet 3, 4, 1, " Orders ", 2
MenuSet 3, 5, 1, " Options ", 3
'
MenuSet 4, 0, 1, " List          ", 2
MenuSet 4, 1, 1, " Printer Off", 2
MenuSet 4, 2, 1, " Units ", 2
MenuSet 4, 3, 1, " Ammo", 2
MenuSet 4, 4, 1, " Brigades", 2
'
MenuSet 5, 0, 1, " Quit to       ", 2
MenuSet 5, 1, 1, " Moving ", 2
MenuSet 5, 2, 1, " Save ", 2
MenuSet 5, 3, 1, " End Game ", 2
'
MenuSet 6, 0, 1, " Combat        ", 2
MenuSet 6, 1, 0, " Not this phase ", 0

IF NOT displaytype THEN
MenuColor 0, 7, 15, 8, 7, 0, 15
ELSE
MenuColor 0, 7, 4, 8, 15, 0, 12
END IF
MenuPreProcess
END SUB

DEFINT X-Z
SUB skill
'
skil = Alert(4, "What level do you want to play at", 9, 10, 14, 70, " Simple ", "Moderate", " Real ")
d = Alert(4, "What casualty level do you want", 9, 10, 14, 70, "Real", "Bloody", "Fast")
cshow = Alert(4, "Do you wish to see the casualties", 9, 10, 14, 70, " No ", " Yes ", "") - 1

SELECT CASE skil
CASE 1
pen1 = INT(100 / gs)
CASE 2
pen1 = INT(200 / gs)
CASE 3
pen1 = INT(300 / gs)
END SELECT
pen3 = pen1

SELECT CASE d
CASE 1
death = 10
CASE 2
death = 15
CASE 3
death = 20
END SELECT


END SUB

DEFSNG X-Z
SUB start
priner = FALSE
CALL makestrings
CALL loadem
CALL setup
IF NOT oldgame THEN
CALL repair
END IF
END SUB

SUB ul
IF priner THEN
  CALL palert
END IF
FOR unit = 1 TO nu
  CALL grabstats(unit)
  
  IF unit = 1 OR unit = nua + 1 THEN
    IF unit = nua + 1 THEN
      IF priner THEN
        PRINT #10, CHR$(12)
        dummy = Alert(4, "Second army print out ", 9, 10, 14, 70, "", "", "")
      ELSE
        PRINT
        PRINT
        CALL wate
      END IF
    END IF
    
    CALL header
    review$ = "The army of " + officer$
    CALL worp(review$)
    IF priner = FALSE THEN
     PRINT
    ELSE
     PRINT #10, ;
    END IF

  ELSE
     
    IF btype = 0 AND unit <> 2 AND unit <> nua + 2 AND NOT priner THEN
      CALL watet
      CALL header
    END IF
    
  END IF
  
  IF btype = 0 THEN
    PRINT #10,
    IF mr = 0 THEN
      review$ = "Officer " + STR$(unit) + ":  " + officer$ + " has taken to his heels and is no longer on the field. "
    ELSE
      review$ = "Officer " + STR$(unit) + ":  " + officer$ + " is " + RTRIM$(morale$(wm)) + " and has the current order: " + od$(od)
    END IF
    CALL worp(review$)
    IF priner = FALSE THEN
     PRINT
    ELSE
     PRINT #10, ;
    END IF
  ELSE
    '
    IF mr = 0 OR mf = 0 THEN
      review$ = STR$(unit) + ": " + unit$ + " has dispersed utterly in rout. "
    ELSE
      review$ = STR$(unit) + ": " + unit$ + " in " + RTRIM$(drill$(cform))
      review$ = review$ + " in " + RTRIM$(terrain$(tr))
      review$ = review$ + ", Order: " + RTRIM$(od$(od)) + ", Morale: " + RTRIM$(morale$(wm)) + ". "
      review$ = review$ + ", Previous move: " + STR$(mov) + ". "
    END IF
     CALL worp(review$)
  END IF
 
  NEXT unit
'
IF priner = 0 THEN
  CALL watet
ELSE
  PRINT #10, CHR$(12)
END IF
'
CLS
'

END SUB

SUB uload
ON LOCAL ERROR GOTO grog
ooop:
leave = FALSE
DO
  DO
    choice = Alert(4, " Load from which Drive?", 9, 10, 14, 70, "A:", "C:", "Other")
    SELECT CASE choice
    CASE 1
      IF oldgame = FALSE THEN
        filespec$ = "A:\*.biA"
      ELSE
        filespec$ = "A:\*.biF"
      END IF
      pat$ = "A:\"
    CASE 2
      IF oldgame = FALSE THEN
        filespec$ = "C:\ecw\bandi3\*.biA"
      ELSE
        filespec$ = "C:\ecw\bandi3\*.biF"
      END IF
    pat$ = "C:\ecw\bandi3\"
    CASE 3
      ok = FALSE
      DO UNTIL ok > 0
        PRINT "Please enter the path to your load file folder"
        PRINT "For example C:\myfold\"
        INPUT pat$
        IF oldgame = FALSE THEN
          filespec$ = pat$ + "*.biA"
        ELSE
          filspec$ = pat$ + "*.biF"
        END IF
        ok = getfilecount(filespec$)
        IF ok = 0 THEN
          junk = Alert(4, "There are no files in this folder", 9, 10, 14, 70, "Continue", "", "")
        ELSE
          IF ok = -2 THEN
            junk = Alert(4, "This is an unacceptable path to search", 9, 10, 14, 70, "Continue", "", "")
            ok = 0
          END IF
        END IF
      LOOP
    END SELECT
    IF LEN(DIR$(filespec$)) = 0 THEN
      leave = FALSE
      x = Alert(4, "There are no files here!", 9, 10, 14, 70, "", "", "")
    END IF
  LOOP UNTIL LEN(DIR$(filespec$)) > 0
  FileCount = getfilecount(filespec$)
  REDIM filelist$(FileCount)
  filelist$(1) = DIR$(filespec$)
  FOR indx = 2 TO FileCount
    filelist$(indx) = DIR$
  NEXT indx
  x = ListBox(filelist$(), UBOUND(filelist$))
  x$ = filelist$(x)
  IF x = 0 THEN
    leave = FALSE
  ELSE
    pat$ = pat$ + x$
    leave = TRUE
  END IF
LOOP UNTIL leave = TRUE

EXIT SUB

grog:
x = Alert(4, "Sory: no files are here", 11, 20, 15, 60, "", "", "")
RESUME ooop
END SUB

SUB uniord (unit)

CALL grabstats(unit)

bestodr = morale(spm, 1)
te = terrain(tr, 1)
fe = fmn(cform, 2)
uchanc = uchan
IF od > nod THEN
  uchanc = uchan + spm / 2
END IF

stafef = sofa
IF sat > 0 THEN
  stafef = sofa * 2
END IF
z = INT(comcon ^ 2 / 30)
cod = (z + ofa + sofa) / uchanc / te * 6
CALL rendom

IF od > 14 AND od < 18 THEN
ELSE
  IF (x < cod AND nod <> od) OR nod > 9 THEN
    od = nod
    ofp = ofp + 1
  ELSE
    IF nod <> od THEN
      tod = 0
      action = action - 1
      ofp = ofp - 1
      IF move = 1 THEN
        od = 5
      END IF
    END IF
  END IF
END IF

od = max(bestodr, od)
CALL replacestats(unit)

END SUB

