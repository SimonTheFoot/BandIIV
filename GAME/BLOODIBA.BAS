DECLARE SUB allupdate ()
DECLARE SUB ax ()
DECLARE SUB bl ()
DECLARE SUB brigchange (unit!)
DECLARE SUB checkdisp ()
DECLARE SUB detailupd ()
DECLARE FUNCTION even! (s!)
DECLARE SUB grabstats (kk!)
DECLARE SUB header ()
DECLARE SUB keyclear ()
DECLARE FUNCTION max! (x%, y%)
DECLARE FUNCTION MIN! (a!, b!)
DECLARE SUB mme ()
DECLARE SUB MonoDisplay ()
DECLARE FUNCTION odd% (s%)
DECLARE SUB oneupdate (tunit%)
DECLARE SUB palert ()
DECLARE SUB pam ()
DECLARE SUB panic ()
DECLARE SUB pfc ()
DECLARE SUB ptc ()
DECLARE SUB pvis ()
DECLARE SUB rendom ()
DECLARE SUB replacestats (mm%)
DECLARE SUB uncon ()
DECLARE SUB unitchange (unit%)
DECLARE SUB wate ()
DECLARE SUB watet ()
DECLARE SUB wc ()
DECLARE FUNCTION windows% (title$, number%, x$())
DECLARE SUB windy ()
DECLARE SUB worp (x$)
DECLARE SUB worps (x$)
DECLARE SUB sh ()
DECLARE SUB combatants ()
DECLARE SUB meleeing ()
DECLARE SUB b4move ()
DECLARE SUB brigterchange (unit!)
DECLARE SUB ch ()
DECLARE SUB changefor (kk!)
DECLARE SUB genlist1 (w!)
DECLARE SUB movement ()
DECLARE SUB officercheck ()
DECLARE SUB pom ()
DECLARE SUB bombard ()
DECLARE SUB colordisplay ()
DECLARE SUB eg ()
DECLARE SUB orderch ()
DECLARE SUB sa ()
DECLARE SUB setupdesktop ()
DECLARE SUB setupmenu ()
DECLARE SUB skill ()
DECLARE SUB start ()
DECLARE SUB ul ()
DECLARE SUB nsa ()
'$INCLUDE: 'H:\bandi3\game\bloodiba.bi'



DIM SHARED mele$(4), armour$(6), rally$(10), fail$(10), fire$(10), charge$(13)
DIM SHARED rank$(51), windfrom$(8), weath$(8), terrain$(19), morale$(44)
DIM SHARED guntype$(10), cat$(10), shot$(44), od$(44), od1$(44), priner$(2)
DIM SHARED comand$(5), formation$(25), rubbish$(10), moralpr$(8), uname$(200)
DIM SHARED filelist$(70), ammo$(16), drill$(77), tired$(8), org$(8)

DIM SHARED armour(6, 18), fire(10), charge(13, 3), formpos(76, 12)
DIM SHARED ammo(16, 3), Order(43, 4)
DIM SHARED fmn(77, 15), terrain(19, 9), morale(44, 6), weff(8, 14)

DIM GloTitle(MAXMENU)           AS MenuTitleType
DIM GloItem(MAXMENU, MAXITEM)   AS MenuItemType
DIM GloWindow(MAXWINDOW)        AS windowType
DIM GloButton(MAXBUTTON)        AS buttonType
DIM GloEdit(MAXEDITFIELD)       AS EditFieldType
DIM GloWindowStack(MAXWINDOW)   AS INTEGER
DIM GloBuffer$(MAXWINDOW + 1, 2)

REM ON ERROR GOTO rest

OPEN "SCRN:" FOR OUTPUT AS #10
displaytype = TRUE
priner = FALSE
oldgame = FALSE
GOSUB setup
CLS
MenuInit
WindowInit
MouseShow
scn = ALERT(2, "Blood & Iron: Game Program|Copyright D.B.Millward & S.J.Norburn, 1993", 9, 10, 14, 70, "Colour", "Monochrome", "")
start
IF scn = 1 THEN
colordisplay
ELSE
MonoDisplay
END IF

MouseHide
GetBackground 1, 1, MAXROW, MAXCOL, back$
leavegame = FALSE
PutBackground 1, 1, back$
MouseShow
phase$ = "B4MOVE "
WHILE NOT leavegame
        kbd$ = MenuInkey$
        WHILE MenuCheck(2)
         GOSUB menutrap
        WEND
WEND
MouseHide
COLOR 15, 0
END

CALL setupdesktop
menutrap:
menu = MenuCheck(0)
item = MenuCheck(1)
SELECT CASE menu
        CASE 1
        x = ALERT(4, "Blood & Iron: Game Program|Copyright D.B.Millward & S.J.Norburn, 1993", 9, 10, 14, 70, "", "", "")
        CASE 2
        IF item = 1 THEN CALL pom ELSE CALL pam
        CASE 3
        SELECT CASE item
                CASE 1
                CALL pfc
                CASE 2
                CALL ptc
                CASE 3
                CALL wc
                CASE 4
                CALL orderch
                CASE 5
                CALL skill
        END SELECT
        CASE 4
        SELECT CASE item
                CASE 1
                IF priner THEN
                priner = FALSE
                MenuSet 4, 1, 1, " Printer Off", 2
                ELSE priner = TRUE
                MenuSet 4, 1, 1, "Printer On", 2
                END IF
                CASE 2
                CALL ul
                CASE 3
                CALL ax
                CASE 4
                CALL bl
        END SELECT
        CASE 5
        SELECT CASE item
                CASE 1
                SELECT CASE phase$
                        CASE "B4MOVE "
                        CALL movement
                        MenuSet 6, 1, 1, " Charges ", 2
                        MenuSet 5, 1, 1, " Shooting ", 2
                        CASE "MOVEMEN"
                        CALL allupdate
                        MenuSet 5, 1, 1, " Melees ", 2
                        MenuSet 6, 1, 1, " Shooting ", 2
                        CASE "FIRING "
                        CALL allupdate
                        MenuSet 5, 1, 1, " Update ", 2
                        MenuSet 6, 1, 1, " Melee ", 2
                        CASE "MELEE  "
                        CALL allupdate
                        MenuSet 5, 1, 1, " Moving ", 2
                        MenuSet 6, 1, 0, " No actions this phase", 0
                END SELECT
                IF phase$ = "MELEE  " THEN
                phase$ = "B4MOVE "
                CALL detailupd
                ELSE
                IF phase$ = "FIRING " THEN phase$ = "MELEE  "
                IF phase$ = "MOVEMEN" THEN phase$ = "FIRING "
                IF phase$ = "B4MOVE " THEN phase$ = "MOVEMEN"
                END IF
                CASE 2
                sa
                CASE 3
                eg
        END SELECT
        CASE 6
        SELECT CASE phase$
        CASE "B4MOVE "
        CASE "MOVEMEN"
        CALL ch
        CASE "FIRING "
        CALL sh
        CASE "MELEE  "
        mme
        END SELECT
END SELECT
oldgame = FALSE
MenuPreProcess
PutBackground 1, 1, back$
RETURN

setup:

RESTORE armour
FOR l = 0 TO 5
  FOR m = 1 TO 17
    READ armour(l, m)
  NEXT m
NEXT l
armour:
  DATA 10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10
  DATA 10,15,15,15,16,17,13,15,15,11,14,14,10,15,14,15,20
  DATA 10,14,14,14,15,16,12,12,15,11,13,13,10,14,13,14,18
  DATA 10,16,16,16,17,18,13,14,14,11,15,14,10,16,15,16,30
  DATA 10,14,14,14,14,15,12,12,12,11,14,12,10,14,13,14,24
  DATA 10,12,12,12,12,13,11,11,11,10,12,11,10,12,11,12,18

RESTORE fdata
FOR l = 1 TO 10
READ fire(l)
NEXT l
fdata:
  DATA 10,15,25,30,20,30,10,0,0,0

RESTORE cdata
FOR l = 1 TO 13
FOR m = 1 TO 3
READ charge(l, m)
NEXT m
NEXT l
cdata:
  DATA 10,10,12
  DATA 2,15,20
  DATA 1,20,30
  DATA 1,20,30
  DATA 4,15,25
  DATA 1,30,30
  DATA 12,12,15
  DATA 10,12,15
  DATA 10,15,25
  DATA 10,10,10
  DATA 0,0,0
  DATA 0,0,0
  DATA 0,0,0

RESTORE formpos
FOR q = 0 TO 75
  a = 0
  DO
    a = a + 1
    READ b
    formpos(q, a) = b
   LOOP UNTIL b = -1
NEXT q

formpos:
DATA 0,1,-1
DATA 0,1,3,19,4,-1
DATA 0,1,3,19,5,6,4,-1
DATA 0,7,8,19,9,-1
DATA 0,7,8,19,5,6,36,9,-1
DATA 0,7,17,19,9,-1
DATA 0,7,17,19,5,6,9,-1
DATA 0,7,12,19,9,15,-1
DATA 0,7,12,19,5,6,9,15,-1
DATA 0,20,21,9,15,-1
DATA 0,25,31,15,-1
DATA 0,22,23,25,-1
DATA 0,22,26,27,-1
DATA 0,7,8,9,16,-1
DATA 0,7,8,9,5,6,16,-1
DATA 0,24,25,31,15,-1
DATA 0,1,8,5,6,4,-1
DATA 0,1,2,3,5,6,4,-1
DATA 0,1,2,28,29,4,-1
DATA 0,1,2,28,29,5,6,4,-1
DATA 0,1,17,18,4,-1
DATA 0,1,17,18,5,6,4,-1
DATA 0,7,18,9,-1
DATA 0,1,17,18,5,6,9,-1
DATA 0,7,20,21,9,15,-1
DATA 0,1,20,21,5,6,15,9,-1
DATA 0,1,10,28,29,6,4,-1
DATA 0,1,2,3,10,6,-1
DATA 0,7,8,19,9,-1
DATA 0,7,8,19,9,29,-1
DATA 0,14,-1
DATA 0,10,6,22,25,6,-1
DATA 0,10,6,36,22,25,-1
DATA 0,24,25,31,5,6,-1
DATA 0,1,2,3,5,6,36,4,-1
DATA 0,1,2,3,5,6,30,4,-1
DATA 0,1,2,3,5,6,36,30,4,-1
DATA 0,58,59,60,1,5,6,4,-1
DATA 0,58,59,60,10,5,6,36,-1
DATA 0,55,56,22,26,27,-1
DATA 0,58,59,60,1,5,6,4,-1
DATA 0,41,43,44,-1
DATA 0,42,43,44,45,46,-1
DATA 0,41,50,51,-1
DATA 0,42,50,51,45,46,-1
DATA 0,41,49,50,51,-1
DATA 0,42,49,50,51,45,-1
DATA 0,41,49,50,51,-1
DATA 0,42,49,50,51,45,-1
DATA 0,41,49,50,-1
DATA 0,41,49,50,45,-1
DATA 0,55,54,47,48,-1
DATA 0,40,53,56,57,47,48,-1
DATA 0,40,55,53,54,47,48,-1
DATA 0,40,53,56,57,47,48,-1
DATA 0,41,43,44,52,32,33,34,-1
DATA 0,42,43,44,45,46,32,33,34,-1
DATA 0,41,50,51,52,-1
DATA 0,42,50,51,45,46,76,-1
DATA 0,42,49,50,51,52,32,33,34,-1
DATA 0,42,49,59,51,56,57,33,34,-1
DATA 0,61,62,63,-1
DATA 0,61,62,63,64,-1
DATA 0,65,66,-1
DATA 0,39,62,63,-1
DATA 0,37,62,63,-1
DATA 0,38,62,63,-1
DATA 0,35,62,-1
DATA 0,35,63,-1
DATA 0,39,62,63,-1
DATA 0,61,62,63,-1
DATA 0,55,40,53,-1
DATA 0,67,68,69,-1
DATA 0,70,71,72,-1
DATA 0,-1
DATA 0,-1

RESTORE fmn
FOR q = 0 TO 76
  FOR a = 1 TO 13
    READ b
    fmn(q, a) = b
  NEXT a
NEXT q

fmn:
DATA 24,10,20,25,50,10,10,30,10,25,0,0,25
DATA 6,10,8,10,10,12,100,100,100,1,1,1,1
DATA 10,10,6,5,10,10,25,100,100,29,2,2,10
DATA 12,10,10,18,12,10,20,100,100,3,3,3,1
DATA 2,12,12,20,6,50,60,50,100,4,1,1,4
DATA 6,8,6,5,8,6,100,100,100,1,5,5,5
DATA 8,6,3,4,4,1,100,100,100,10,6,6,6
DATA 6,10,10,10,8,10,80,100,100,7,8,8,7
DATA 12,12,12,18,20,12,40,100,100,8,8,8,7
DATA 2,12,12,20,6,50,60,50,100,4,8,8,4
DATA 6,8,6,5,8,6,100,100,100,1,10,10,10
DATA 10,12,12,18,20,12,30,100,100,8,8,8,7
DATA 12,12,12,18,18,15,12,100,100,12,12,12,7
DATA 12,12,12,16,15,12,25,100,100,13,13,13,7
DATA 8,8,12,20,8,4,60,100,100,14,14,14,14
DATA 2,12,14,20,10,50,40,50,100,15,12,12,15
DATA 2,12,10,16,4,40,50,50,100,4,8,8,16
DATA 12,12,12,12,20,12,40,100,100,17,17,17,7
DATA 15,12,6,6,10,12,40,100,100,18,18,18,7
DATA 4,12,12,12,10,15,50,100,100,19,19,19,19
DATA 8,12,12,18,18,12,25,100,100,20,20,20,7
DATA 8,10,12,12,18,12,30,100,100,21,21,21,7
DATA 12,12,10,12,18,6,30,100,100,22,22,22,23
DATA 10,8,6,6,5,2,100,80,60,24,23,23,23
DATA 6,12,12,12,6,4,50,100,100,24,24,24,24
DATA 10,12,12,15,9,4,15,80,100,25,25,25,24
DATA 12,6,5,5,3,2,50,100,100,22,26,26,26
DATA 12,5,3,5,2,1,100,100,100,22,27,27,27
DATA 10,10,5,6,10,12,25,100,100,29,28,28,10
DATA 12,10,12,15,12,12,20,100,100,29,29,3,1
DATA 5,12,12,18,6,30,80,100,100,4,30,30,4
DATA 12,12,16,20,9,4,15,80,100,31,31,31,24
DATA 6,8,8,10,10,10,90,90,90,1,42,42,32
DATA 8,6,5,5,8,4,90,90,90,1,42,42,33
DATA 8,4,3,4,4,1,90,90,90,1,42,42,34
DATA 24,8,20,20,4,4,0,100,100,35,35,35,63
DATA 12,6,3,2,4,1,100,100,100,1,6,6,6
DATA 18,10,20,20,4,4,0,100,10,37,37,37,62
DATA 8,10,20,30,4,4,0,100,100,37,37,37,62
DATA 28,10,12,15,4,4,0,100,100,38,38,38,62
DATA 32,10,12,12,8,6,70,80,80,40,40,40,40
DATA 28,10,14,14,20,10,50,100,100,41,41,44,41
DATA 32,10,12,12,20,10,50,100,100,42,42,44,42
DATA 32,12,12,12,20,10,40,100,80,43,43,43,43
DATA 32,12,10,12,20,10,40,100,80,44,44,44,44
DATA 35,8,8,10,10,8,90,100,100,42,45,45,45
DATA 36,6,6,8,5,5,100,100,100,42,45,45,45
DATA 8,8,10,10,3,2,80,80,80,47,47,44,47
DATA 10,6,5,6,2,1,80,80,80,48,48,44,47
DATA 32,12,12,16,20,10,40,100,80,50,49,49,49
DATA 32,12,12,16,20,10,40,100,80,50,50,50,50
DATA 32,12,12,12,20,10,60,120,100,50,51,50,51
DATA 26,10,4,4,20,10,80,100,100,41,52,52,52
DATA 32,10,8,10,6,6,90,100,100,53,53,40,53
DATA 25,12,12,12,10,8,75,80,80,54,54,55,54
DATA 30,12,15,20,10,9,30,70,70,55,55,55,55
DATA 36,10,10,12,8,6,70,80,80,56,56,56,56
DATA 36,10,10,8,8,4,100,80,80,57,57,56,56
DATA 24,8,12,20,6,5,20,50,50,47,58,58,47
DATA 20,8,12,12,6,5,50,50,50,47,59,58,47
DATA 20,8,8,10,6,5,50,50,50,47,60,58,47
DATA 28,10,20,20,4,4,0,100,100,61,61,61,63
DATA 4,10,20,6,10,4,100,100,100,62,61,61,62
DATA 4,10,24,6,10,6,100,100,100,63,61,61,63
DATA 18,10,18,12,10,6,60,100,100,63,64,64,63
DATA 12,10,24,30,2,4,0,100,100,65,65,65,56
DATA 1,10,15,18,10,8,100,100,100,66,65,65,66
DATA 25,10,16,26,20,50,50,50,100,67,67,67,67
DATA 20,12,16,30,20,50,50,50,100,68,68,68,68
DATA 20,12,12,20,20,50,50,50,100,69,69,69,69
DATA 24,10,16,25,6,5,20,50,50,70,70,70,62
DATA 24,6,12,12,6,1,20,50,50,61,61,61,62
DATA 2,10,10,12,6,2,100,50,50,62,70,70,62
DATA 15,10,10,12,1,1,10,30,10,73,73,73,73
DATA 16,10,12,16,1,1,10,30,10,74,74,74,74
DATA 30,10,16,24,1,1,10,30,10,75,75,75,75
DATA 6,8,8,10,10,10,25,30,30,76,76,43,76

FOR l = 0 TO 18
  FOR a = 1 TO 9
    READ b
    terrain(l, a) = b
  NEXT a
NEXT l

terrain:
DATA 10,10,10,1,10,10,10,0,1
DATA 10,10,10,1,10,10,10,0,1
DATA 10,10,8,2,10,9,11,5,2
DATA 12,7,5,4,10,9,13,16,3
DATA 18,8,5,5,15,8,12,16,5
DATA 30,8,4,3,18,8,13,20,8
DATA 18,8,5,8,12,10,12,16,5
DATA 5,8,6,4,10,10,12,14,4
DATA 5,8,5,3,10,20,12,14,4
DATA 25,8,4,8,18,8,14,16,6
DATA 1,8,8,5,9,8,8,0,6
DATA 25,5,5,6,14,10,14,8,4
DATA 30,5,5,6,16,12,16,10,5
DATA 25,5,2,2,20,20,15,22,10
DATA 25,5,5,6,14,10,14,8,4
DATA 30,4,2,8,14,11,15,20,12
DATA 35,4,2,8,20,14,16,22,12
DATA 15,5,10,2,20,20,15,22,10
DATA 20,5,10,2,30,30,20,30,10

RESTORE weath
FOR l = 0 TO 7
FOR m = 1 TO 14
READ weff(l, m)
NEXT m
NEXT l
weath:
  DATA 10,10,10,10,10,10,10,10,10,10,10,300,10,10
  DATA 10,10,10,10,10,10,10,10,10,10,10,300,10,10
  DATA 9,10,10,10,10,10,10,10,10,9,9,200,15,8
  DATA 8,8,9,10,10,10,10,10,10,10,8,50,7,6
  DATA 6,7,9,10,10,10,10,10,10,10,9,150,3,7
  DATA 5,9,10,10,10,10,10,10,10,10,9,250,12,9
  DATA 6,5,8,10,10,10,10,10,10,10,8,100,1,5
  DATA 8,6,8,10,10,10,10,10,10,10,6,50,2,5

RESTORE moral
FOR l = 0 TO 8
FOR m = 1 TO 3
READ morale(l, m)
NEXT m
NEXT l
moral:
  DATA 0,2,6
  DATA 1,10,8
  DATA 1,10,10
  DATA 4,15,10
  DATA 6,20,15
  DATA 7,30,20
  DATA 8,50,30
  DATA 14,100,50
  DATA 21,100,100

RESTORE Order
FOR l = 0 TO 42
FOR m = 1 TO 4
READ Order(l, m)
NEXT m
NEXT l
Order:
DATA 9,30,1,0
DATA 19,25,1,0
DATA 2,20,10,0
DATA 3,10,20,5
DATA 4,15,20,2
DATA 5,1,30,10
DATA 6,15,40,4
DATA 6,25,50,3
DATA 7,50,50,2
DATA 5,0,40,30
DATA 10,0,0,20
DATA 3,10,100,10
DATA 12,0,0,20
DATA 5,50,50,1
DATA 6,20,50,2
DATA 5,0,50,20
DATA 7,0,50,25
DATA 8,0,10,20
DATA 15,50,0,0
DATA 6,50,0,0
DATA 8,50,0,0
DATA 21,80,0,0
DATA 21,100,0,0
DATA 3,0,1,30
DATA 11,0,0,0
DATA 24,0,0,0
DATA 25,0,0,0
DATA 26,0,0,0
DATA 27,0,0,0
DATA 28,0,0,0
DATA 29,0,0,0
DATA 30,0,0,0
DATA 31,0,0,0
DATA 32,0,0,0
DATA 33,0,0,0
DATA 34,0,0,0
DATA 35,0,0,0
DATA 36,0,0,0
DATA 37,0,0,0
DATA 38,0,0,0
DATA 39,0,0,0
DATA 40,0,0,0
DATA 41,0,0,0
DATA 42,0,0,0

RESTORE ammo
FOR l = 0 TO 15
FOR m = 1 TO 3
READ ammo(l, m)
NEXT m
NEXT l
ammo:
DATA 20,10,1
DATA 10,10,10
DATA 10,10,2
DATA 15,10,1
DATA 10,10,2
DATA 10,10,20
DATA 10,10,3
DATA 10,10,12
DATA 10,10,20
DATA 10,10,12
DATA 10,10,12
DATA 10,10,2
DATA 10,10,10
DATA 10,10,12
DATA 10,10,12
DATA 10,10,12

RETURN

rest:

SELECT CASE ERR
CASE 25
  header
  PRINT "Printer is offline or turned off"
CASE 27
  header
  PRINT "Printer is out of paper"
CASE 24
  header
  PRINT "Printer cable is disconected"
CASE ELSE
  header
  PRINT "You have an unidentifiable problem.  "
  PRINT "You will not be able to continue without restarting"
  wate
  END
END SELECT

PRINT " When you have fixed your printer problem "
wate

REM ON ERROR GOTO rest
RESUME NEXT

DEFSNG A-W
SUB al
x = ALERT(4, "Copyright 1993-97, D.Millward and S.Norburn | Written and compiled in | Microsoft Basic version 7.1", 9, 10, 14, 70, "", "", "")
'

END SUB

DEFINT X-Z
SUB allupdate
'
FOR unit = 1 TO nu
CALL oneupdate(unit)
NEXT unit
END SUB

DEFSNG X-Z
SUB armourf
IF typew < 2 THEN
CALL rendom
cs = cs / armour(arm, 17) * x1 * 10
END IF

END SUB

SUB ax
'

CALL palert

header
units = LEN(a$) / 150
count = 0
FOR unit = 1 TO units
  CALL grabstats(unit)
  IF unit = 1 OR unit = nua + 1 THEN
    PRINT #10,
  END IF

  IF btype = 0 THEN
    count = count + 1
    review$ = "Ammunition Source " + STR$(unit) + "). Wagon with unit number "
    IF aw < unit OR aw > unit + numsub THEN
      aw = unit
      CALL replacestats(aw)
    END IF
    k = aw
    CALL grabstats(aw)
    review$ = review$ + STR$(k) + ", the " + unit$ + ". "
    CALL worp(review$)
    IF unit = 1 OR unit = nua + 1 THEN
      PRINT #10, ;
    ELSE
      IF count / 5 = INT(count / 5) AND NOT priner THEN
        CALL watet
        count = 0
        CLS
        PRINT #10, TAB(5);
      END IF
    END IF
  END IF

  IF l = nua + 1 THEN
    IF priner THEN
      PRINT #10, CHR$(12)
      x = ALERT(4, "Second army print out ", 9, 10, 14, 70, "", "", "")
    ELSE
      count = 0
      CALL watet
      header
    END IF
  END IF
NEXT unit
'
IF priner = 0 THEN
  CALL watet
ELSE
  PRINT #10, CHR$(12)
END IF
CLS
'

END SUB

SUB bl
STATIC fred

IF priner THEN
  CALL palert
END IF

header
units = LEN(a$) / 150
FOR unit = 1 TO units

  CALL grabstats(unit)

  IF unit = 1 OR unit = nua + 1 THEN
    PRINT #10,
  END IF

  IF btype = 0 THEN
    fred = fred + 1
    review$ = "Officer, " + STR$(unit) + "). " + officer$ + ", current order: " + RTRIM$(od$(od)) + " (" + STR$(pw) + " action points). "
    IF stafof <> 0 AND stafof <> unit THEN
      k = stafof
      CALL grabstats(stafof)
      review$ = review$ + "At present this officer is with unit " + STR$(k) + ", the " + unit$ + ". "
    END IF
    CALL worp(review$)
    PRINT #10,

    IF unit = 1 OR unit = nua + 1 THEN
      fred = 1
      PRINT #10, ;
    END IF
  END IF

  IF unit = nua + 1 THEN
    IF priner THEN
      PRINT #10, CHR$(12)
      x = ALERT(4, "Second army print out ", 9, 10, 14, 70, "", "", "")
    ELSE
      CALL watet
      CLS
    END IF
    header
  END IF
  IF NOT priner THEN
    IF fred = 5 THEN
      wate
      fred = 1
    END IF
  END IF

NEXT unit

IF NOT priner THEN
  CALL watet
ELSE
 PRINT #10, CHR$(12)
END IF
'
CLS
'

END SUB

SUB brigchange (unit)
IF check <> 1 THEN
ELSE
  ns = numsub
  hq = unit
  DO
    unit = unit + 1
    CALL grabstats(unit)
    IF btype = 0 THEN
    ELSE
      CALL changefor(unit)
    END IF
  LOOP WHILE unit <> hq + ns
END IF

END SUB

SUB ccomp
idiot = ALERT(4, "End and QUIT the Game|No SAVE is performed", 9, 10, 14, 70, "No", "Yes", "")
IF idiot = 1 THEN
'
ELSE
idiot = ALERT(4, "Are you really sure about this", 9, 10, 14, 70, "No", "Yes", "")
END IF
'
IF idiot = 1 THEN
'
ELSE
'
END
'
END IF
END SUB

SUB checkall

DO
redo = FALSE
CALL checkdisp
firet = choice
grabstats (target)
fear = max(INT(fear), fire(firet))
CALL replacestats(target)

SELECT CASE choice
CASE 3
  shooters = shooters * 1.5
CASE 7
  IF ftype < 9 THEN
    x = ALERT(4, "Only available to|Artillery", 9, 10, 14, 70, "", "", "")
    redo = TRUE
  ELSE
    IF move = 1 AND tbomb = 0 THEN
      CALL bombard
    END IF
  END IF
CASE 8
  CALL ptc
  redo = TRUE
CASE 9
  CALL pfc
  redo = TRUE
CASE 0, 10
  fyrer = 0
  fireback = FALSE
END SELECT
'
LOOP WHILE redo <> FALSE

IF fyrer > 0 THEN
  grabstats (fyrer)
END IF

END SUB

SUB checkdisp
'
grabstats (fyrer)
CALL header
SELECT CASE cform
CASE 48 TO 51, 54 TO 56
review$ = "The " + unit$ + " " + RTRIM$(drill$(cform)) + " are shooting "
CASE ELSE
review$ = "The " + unit$ + " in " + RTRIM$(drill$(cform)) + " are shooting "
END SELECT
'
IF r > vis THEN
review$ = review$ + "into the brown, towards "
CALL rendom
shooters = shooters * xs
shooters2 = shooters2 * xs
ELSE
review$ = review$ + "at "
END IF

grabstats (target)

SELECT CASE cform
CASE 48 TO 51, 54 TO 56
review$ = review$ + "the " + unit$ + " who are " + RTRIM$(drill$(cform)) + " in "
CASE ELSE
review$ = review$ + "the " + unit$ + " formed in " + RTRIM$(drill$(cform)) + " in "
END SELECT
'
IF tr < 2 THEN
review$ = review$ + "the "
END IF
'
review$ = review$ + RTRIM$(terrain$(tr))
IF r < vis THEN
review$ = review$ + " at a range of " + STR$(r) + " metres."
ELSE
review$ = review$ + ". "
END IF
CALL worps(review$)
'
grabstats (fyrer)
wate
choice = windows("Firing choices: ", 10, fire$())
END SUB

SUB detailupd
'
DO
tbomb = tbomb - 1
tbomb = max(tbomb, 0)
 move = move + 1
'
CALL rendom
'
mins = mins + INT(gff * 5 * x2) + 1
'
IF mins > 59 THEN
'
mins = mins - 60
'
 htim = htim + 1
htim = htim MOD 24
'
END IF
'
IF xs * (weath + 10) > 10 THEN
'
weath = weath + INT(xs * 4)
'
END IF
'
IF weath > 6 THEN
'
weath = weath - 6
'
END IF
'
vf = 1
'
tf = 100
'
IF timeh < 7 OR timeh > 20 THEN
'
tf = 1
'
END IF
'
IF weath > 1 THEN
'
vf = vf * x2
'
END IF
'
a = sf - 1000
'
me = 2
'
IF weath = 5 THEN
'
me = 5
'
END IF
'
a = a / me
'
sf = a + 1000
'
CALL pvis
CALL windy
'
LOOP WHILE tbomb <> 0
END SUB

FUNCTION even (s)
IF s MOD 2 = 0 THEN even = TRUE ELSE even = FALSE
END FUNCTION

SUB gloop
DO
CALL keyclear
CALL b4move
CALL keyclear
CALL movement
CALL keyclear
CALL keyclear
CALL meleeing
CALL keyclear
CALL detailupd
LOOP
END SUB

SUB grabstats (kk)
tu = kk - 1
tu = tu * 150
tu = tu + 1
t$ = MID$(a$, tu, 150)
'
officer$ = LEFT$(t$, 40)
unit$ = RIGHT$(t$, 40)
'
ofr = ASC(MID$(t$, 41))
ofa = ASC(MID$(t$, 42))
ofl = ASC(MID$(t$, 44))
oftyp = ASC(MID$(t$, 45))
std = ASC(MID$(t$, 46))
ofw = ASC(MID$(t$, 47))
numan = ASC(MID$(t$, 48))
arm = ASC(MID$(t$, 49))
stafof = ASC(MID$(t$, 50))
btype = ASC(MID$(t$, 51))
mo = ASC(MID$(t$, 54))
stead = ASC(MID$(t$, 55))
fires = ASC(MID$(t$, 56))
comcon = ASC(MID$(t$, 57))
'
IF skil = 1 THEN
  comcon = 200
END IF
IF skil = 2 THEN
  comcon = comcon * 2
END IF
'
movebase = ASC(MID$(t$, 58))
numsub = ASC(MID$(t$, 59))
ogn = ASC(MID$(t$, 60))
fp = ASC(MID$(t$, 61))
wp = ASC(MID$(t$, 62))
mw = ASC(MID$(t$, 63))
omf = CVI(MID$(t$, 64, 2))
morlos = ASC(MID$(t$, 66))
gunlos = ASC(MID$(t$, 67))
am = ASC(MID$(t$, 68))
menlos = CVI(MID$(t$, 69, 2))
cform = ASC(MID$(t$, 71))
mov = ASC(MID$(t$, 72))
disorg = ASC(MID$(t$, 73))
mensub = ASC(MID$(t$, 74))
wm = ASC(MID$(t$, 75))
mr = ASC(MID$(t$, 76))
gf = ASC(MID$(t$, 77))
mf = CVI(MID$(t$, 78, 2))
od = ASC(MID$(t$, 80))
msince = ASC(MID$(t$, 81))
pw = ASC(MID$(t$, 82))
pf = ASC(MID$(t$, 83))
aw = ASC(MID$(t$, 84))
tr = ASC(MID$(t$, 85))
ofp = ASC(MID$(t$, 86))
ag = ASC(MID$(t$, 87))
targ = ASC(MID$(t$, 88))
chrge = ASC(MID$(t$, 89))
spm = ASC(MID$(t$, 90))
rf = ASC(MID$(t$, 91))
er = ASC(MID$(t$, 92))
lr = ASC(MID$(t$, 93))
ef = ASC(MID$(t$, 94))
tp = ASC(MID$(t$, 95))
se = ASC(MID$(t$, 96))
mi = ASC(MID$(t$, 97))
mc = ASC(MID$(t$, 98))
sat = ASC(MID$(t$, 99))
shot = ASC(MID$(t$, 100))
gf2 = ASC(MID$(t$, 102))
rf2 = ASC(MID$(t$, 103))
er2 = ASC(MID$(t$, 104))
lr2 = ASC(MID$(t$, 105))
ef2 = ASC(MID$(t$, 106))
tp2 = ASC(MID$(t$, 107))
se2 = ASC(MID$(t$, 108))
fear = ASC(MID$(t$, 109))
wp2 = ASC(MID$(t$, 110))
'
caspos = mf - menlos
modcon = morale(spm, 2) / 10
modconm = morale(spm, 3) / 10
'

IF btype > 8 AND btype < 20 THEN
  l = 100
  ELSE
  l = 10
END IF
er = er * l
lr = lr * l
er2 = er2 * l
lr2 = lr2 * l
xr = lr * 3 / 2
xr2 = lr2 * 3 / 2
IF tp >= 5 THEN
  xr = lr
END IF
IF tp2 >= 5 THEN
  xr2 = lr2
END IF
'
unit$ = RTRIM$(unit$)
officer$ = RTRIM$(rank$(ofr)) + " " + RTRIM$(officer$)
'
END SUB

SUB header
'
CALL setupdesktop
review$ = "Blood & Iron III"
'
SELECT CASE mins
CASE 0
mins$ = "00"
CASE 1 TO 9
mins$ = "0" + STR$(mins)
CASE 10 TO 60
mins$ = STR$(mins)
END SELECT
'
review$ = review$ + " Move: " + STR$(move) + "  Time: " + STR$(htim) + ":" + mins$ + " hours. Scale 1:" + STR$(grs)
CALL worps(review$)
review$ = "Weather " + RTRIM$(weath$(weath)) + ", "
IF windir > 0 THEN
SELECT CASE windst
CASE 0 TO 75
wind$ = "with a light wind from the "
CASE 76 TO 100
wind$ = "with a wind is from the "
CASE ELSE
wind$ = "with a strong wind from the "
END SELECT
wind$ = wind$ + windfrom$(windir) + " "
ELSE
wind$ = " there is no wind. "
END IF
'
review$ = review$ + wind$
CALL worps(review$)
'
IF gs = 0 THEN
gs = 1000
END IF
review$ = "Visibility is " + STR$(vis) + " m. (ie. " + STR$(INT(vis / gs) / 100) + " m. on the table). "
CALL worps(review$)
PRINT
END SUB

SUB hello
PRINT "Error number "; ERR
'
IF FATAL THEN
  '
  PRINT "FATAL ERROR: SAVE FILE ON ERROR DISC"
  '
END IF
'
PRINT "(S)ave file or (C)ontinue"
'
INPUT l$
'
l$ = UCASE$(l$)
'
IF LEFT$(l$, 1) = "S" THEN
  '
  PRINT "Insert the ERROR SAVE DISC now"
  '
  CALL wate
  '
  bat$ = STRING$(500, " ")
  '
  MID$(bat$, 1) = name1$
  '
  MID$(bat$, 100) = name2$
  '
  MID$(bat$, 200, 7) = phase$
  '
  MID$(bat$, 210) = STR$(gs)
  '
  MID$(bat$, 220) = STR$(grs)
  '
  MID$(bat$, 230) = STR$(gff)
  '
  MID$(bat$, 240) = STR$(timeh)
  '
  MID$(bat$, 250) = STR$(mins)
  '
  MID$(bat$, 260) = STR$(weath)
  '
  weff = weff(weath, 12)
  '
  MID$(bat$, 270, 4) = STR$(vis)
  '
  nbat$ = "A:Error.BAT"
  '
  OPEN "O", #1, nbat$
  '
  CLOSE #1
  '
  FOR x = 1 TO 2
    '
    IF x = 1 THEN
      '
      d$ = name1$
      '
      OPEN "O", #1, d$
      '
      CLOSE #1
      '
    ELSE
      '
      d$ = name2$
      '
      OPEN "O", #1, d$
      '
      CLOSE #1
      '
    END IF
    '
  NEXT x
  '
END IF
'
RESUME NEXT
END SUB

SUB keyclear
DO
LOOP WHILE INKEY$ <> ""
END SUB

DEFINT X-Y
FUNCTION max (x, y)
IF x > y THEN
  max = x
ELSE
  max = y
END IF
END FUNCTION

FUNCTION MIN (a, b)
IF a < b THEN
MIN = a
ELSE
MIN = b
END IF
END FUNCTION

DEFSNG X-Y
SUB mme
CALL header
unit = 1
DO
'
CALL grabstats(unit)
'
IF btype THEN
'
IF (chrge AND od <= 3) OR od = 1 THEN
'
IF mf THEN
'
char = TRUE
'
'
PRINT "Unit "; unit; " the "; unit$; " may charge."
'
END IF
'
END IF
'
END IF
'
unit = unit + 1
'
LOOP WHILE unit < nu
'
IF char THEN
'
CALL wate
'
CALL combatants
'
ELSE
'
PRINT "No units may charge this move."
'
CALL wate
'
END IF
'
CLS
'

END SUB

SUB MonoDisplay
    displaytype = FALSE
    MouseHide
    CALL setupmenu
    setupdesktop
    MenuShow
    MouseShow
END SUB

DEFINT A-W
SUB morale1 (n)
'
rendom
casp = MIN(n + 1, 100)
casm = casp ^ 2 * fear
tmr = mr * fmn(cform, 2) / 10
IF casm < tmr + stead THEN
  casm = tmr + stead
END IF
casf = (casm - stead) * xs + stead
rst = stead / 5 * x1 + 1

IF mr < 1 THEN
  mtr = 8
ELSE
  CALL rendom
  casr = INT(casf / tmr * 10)
  CALL rendom
  SELECT CASE casr
  CASE 0 TO 5
    morlos = morlos - 1
    morlos = max(morlos, 0)
    mr = mr + (1 * xs)
    mtr = 1
  CASE 6 TO 50
    morlos = max(morlos, 1)
    mtr = 1
  CASE 51 TO 100
    morlos = max(morlos, rst / 2)
    mtr = 2
  CASE 101 TO 200
    morlos = max(morlos, rst)
    mtr = 3
    od = 5
  CASE 201 TO 300
    morlos = max(morlos, rst * 3 / 2)
    mtr = 4
    od = 6
  CASE 301 TO 400
    morlos = max(morlos, rst * 2)
    mtr = 5
    od = 7
  CASE 401 TO 600
    morlos = max(morlos, rst * 3)
    mtr = 6
   od = 20
  CASE ELSE
    morlos = max(morlos, rst * 5)
    mtr = 7
    od = 21
  END SELECT
'
  IF mtr > 2 THEN
    CALL panic
  ELSE
    CALL uncon
  END IF
END IF
'

END SUB

FUNCTION odd (s)
IF s MOD 2 = 1 THEN odd = TRUE ELSE odd = FALSE
END FUNCTION

SUB ofhed
CALL header
'
grabstats (officer)
pwl = pw
review$ = officer$ + " has " + STR$(pw) + " action points left and his current order is " + RTRIM$(od$(od)) + ". "
IF stafof <> 0 AND stafof <> officer THEN
uw = stafof
grabstats (stafof)
review$ = review$ + "He is with unit " + STR$(uw) + " the " + unit$ + ". "
END IF
worps (review$)
PRINT
'
IF rally = TRUE THEN
rally = FALSE
SELECT CASE ralres
CASE 1
review$ = "They are routed beyond rally. "
review$ = review$ + "Despite belabouring the frightened remnants with the flat of his blade "
review$ = review$ + sof$ + " failed to stay their headlong flight. "
'
CASE 2
rendom
review$ = "He " + rally$(tries) + " and they are now " + RTRIM$(moralpr$(wm)) + ". "
ofpad = ofl / 20 * xs
CASE 3
review$ = "He " + fail$(tries) + " and they remain " + RTRIM$(moralpr$(wm)) + ". "
END SELECT
worps (review$)
END IF
'
grabstats (officer)
ofp = ofp + ofpad
CALL replacestats(officer)

END SUB

SUB ol
'
IF priner THEN
CALL palert
END IF
'
CLS
'
count = 1
FOR aa = 1 TO nu
CALL grabstats(aa)
'
IF btype = 0 THEN
IF count = 9 AND NOT priner THEN

  CALL watet
  count = 1
  CLS
END IF
'
IF aa = nua + 1 THEN
  '
  IF priner THEN
   x = ALERT(4, "Second army print out ", 9, 10, 14, 70, "", "", "")
  ELSE
    count = 1
    CALL watet
    x = ALERT(4, "Second army print out ", 9, 10, 14, 70, "", "", "")
    CLS
  END IF
END IF
 count = count + 1
IF mr = 0 THEN
  review$ = "Officer " + STR$(aa) + ": " + officer$ + " has fled the Field !!!"
ELSE
  review$ = "Officer " + STR$(aa) + ": " + officer$ + " has " + STR$(pw) + " action points. "
  '
  IF stafof <> 0 AND stafof <> aa THEN
    uw = stafof
    CALL grabstats(stafof)
    review$ = review$ + "He is currently with unit " + STR$(uw) + ", the " + unit$
  END IF
END IF
CALL worp(review$)
PRINT #10, ;
'
END IF
NEXT aa
'
IF priner = 0 THEN
  CALL watet
ELSE
  IF unit = nua OR unit = units THEN
    PRINT #10, CHR$(12)
  END IF
END IF
CLS
'

END SUB

DEFINT X-Z
SUB oneupdate (tunit)

CALL grabstats(tunit)

IF mf > 0 AND btype > 0 THEN
  dis = menlos / mf * 10000 * modcon / comcon
  IF meleeup = TRUE THEN
    ndis = ndis * 2
  END IF
  disorg = disorg + ndis
  disorg = MIN(disorg, 250)
  mf = mf - menlos
  mf = max(mf, 0)
  menlos = 0
  mr = mr - morlos
  mr = max(mr, 0)
  morlos = 0

  IF gunlos THEN
    FOR a = 1 TO gunlos
      IF gf2 > 0 THEN
        CALL rendom
        SELECT CASE x
        CASE 1 TO 33
          gf2 = gf2 - 1
        CASE ELSE
          gf = gf - 1
        END SELECT
      ELSE
        gf = gf - gunlos
      END IF
    NEXT a
    gf = max(0, gf)
    gf2 = max(0, gf2)
    gunlos = 0
  END IF
END IF

spm = wm

CALL replacestats(tunit)

END SUB

DEFSNG X-Z
SUB palert
fwop:
ON LOCAL ERROR GOTO pxx
CLOSE #10
k = 0
ok = FALSE
DO UNTIL k = 2 OR ok = TRUE
  k = ALERT(4, " List to Screen or Printer ", 7, 9, 19, 69, " Screen ", " Printer ", "")

  IF k = 1 THEN
    OPEN "SCRN:" FOR OUTPUT AS #10
    priner = FALSE
    ok = TRUE
  ELSE
    OPEN "LPT1:" FOR OUTPUT AS #10
    PRINT #10, " ";
    priner = TRUE
    ok = TRUE
  END IF
LOOP

IF priner THEN
  MenuSet 4, 1, 1, " Printer On", 2
ELSE
  MenuSet 4, 1, 1, "Printer On", 2
END IF
MenuPreProcess

EXIT SUB
pxx:
ok = FALSE

SELECT CASE ERR
CASE 25
  header
  PRINT "Printer is offline or turned off"
CASE 27
  header
  PRINT "Printer is out of paper"
CASE 24
  header
  PRINT "Printer cable is disconected"
CASE ELSE
  header
  PRINT "You have an unidetifiable printer problem.  Please check it very carefully"
END SELECT

PRINT "Please correct the error and then press any key to continue"
wate
RESUME fwop

END SUB

SUB pam
'
DO
'
CALL header
PRINT "Ammunition source do you wish to move ";
CALL officercheck
'
IF officer <= 0 THEN
'                                      Dummy condition to allow exit(0=army leader:-ve=exit)
ELSE
ns = numsub
'
IF aw < officer OR aw > officer + ns THEN
aw = officer
CALL replacestats(officer)
END IF
'
CALL header
PRINT " Ammunition wagon ";
CALL grabstats(aw)
PRINT "currently with " + unit$
'
CALL grabstats(officer)
spare = aw
'
CALL grabstats(aw)
aw = 0
CALL replacestats(spare)
'
CALL genlist1(officer)
wate
unit = officer + windows("Moving to: ", ns + 2, uname$()) - 2

'
CALL grabstats(unit)
aw = officer
CALL replacestats(unit)
'
CALL grabstats(officer)
aw = unit
CALL replacestats(officer)
'
END IF
'
LOOP WHILE officer <> 0
'
CLS
'

END SUB

SUB panic
'
te = (terrain(tr, 5) + 2) / 3
pan = 3 * (ofa + comcon) / (mtr + 1) * te * 1.5
REM sjn addition
IF x > pan THEN
'
SELECT CASE mtr
CASE 0 TO 3
od = 9
CASE 4
od = 18
CASE 5
od = 19
CASE 6
od = 20
CASE ELSE
od = 20
END SELECT
'
END IF

END SUB

SUB pdate (m)
unit = m
CALL oneupdate(unit)

trecover = 0
IF wm < 7 THEN
  trecover = comcon + ofa - stead
  trecover = max(trecover, 10)
  trecover = trecover * msince
  trecover = trecover * Order(od, 4) / 10
ELSE
  disorg = 250
END IF

disorg = disorg - trecover
disorg = MIN(disorg, 250)
disorg = max(disorg, 0)

SELECT CASE wm
CASE 0
  ofp = ofp + 1
CASE 6 TO 10
  ofp = ofp - 1
CASE 7 TO 10
  ofp = ofp - 1
END SELECT

pf = 0

IF wm > 4 THEN
  cform = fmn(cform, 12)
  IF wm > 6 OR disorg > 200 THEN
    SELECT CASE btype
    CASE 1 TO 3
      cform = 73
    CASE 4 TO 8
      cform = 74
    CASE ELSE
      cform = 75
    END SELECT
  END IF
END IF

SELECT CASE cform
CASE 4, 9, 15, 16, 62, 63, 66, 72
  od = 5
END SELECT

IF od < 4 THEN
  cform = fmn(cform, 11)
END IF

me = morale(pm, 1)
od = max(me, od)
CALL replacestats(unit)
CALL grabstats(unit)


END SUB

SUB pfc

DO
  DO
    CALL header
    PRINT "Which unit wishes to change formation ";
    INPUT unit
  LOOP WHILE unit > nu OR unit < 0
  IF unit = 0 THEN
  ELSE
    CALL grabstats(unit)
    SELECT CASE oftyp
    CASE 0 TO 2
      check = ALERT(4, "Change Formation|for the whole Army", 9, 10, 14, 70, " Yes ", " No ", "")
      IF check = 1 THEN CALL brigchange(unit)
    CASE 3
      check = ALERT(4, "Change Formation|for the whole Corps", 9, 10, 14, 70, " Yes ", " No ", "")
      IF check = 1 THEN CALL brigchange(unit)
    CASE 4
      check = ALERT(4, "Change Formation|for the Division", 9, 10, 14, 70, " Yes ", " No ", "")
      IF check = 1 THEN CALL brigchange(unit)
    CASE 5
      check = ALERT(4, "Change Formation|for the Brigade", 9, 10, 14, 70, " Yes ", " No ", "")
      IF check = 1 THEN CALL brigchange(unit)
    CASE 6, 7
      CALL changefor(unit)
    CASE ELSE
    END SELECT
  END IF
LOOP WHILE unit <> 0
CLS
'

END SUB

SUB points

sig$ = ". "
IF btype = 0 THEN
  upv = INT(ofa * ofl / 5) + 1000
  SELECT CASE ofw
  CASE 100 TO 199
    upv = INT((upv - 1000) / 2) + 1000
    sig$ = " (officer wounded). "
  CASE 200 TO 256
    upv = 1000
    sig$ = " (officer killed). "
  END SELECT
ELSE
  erf = er / 10
  IF btype > 8 AND btype < 20 THEN
    pt = (se + 1) / 3 + 1
    rf = rf / 5
  ELSE
    pt = 1
  END IF
  pww = rf * erf / 20 * ef * pt
  pv = (fires + comcon) * mr / stead + 30
  pv = (pv + pww) / 100
  upv = INT(pv * mf)
  IF spm = 6 OR wm = 6 THEN
    upv = INT(upv / 2)
    sig$ = " (unit demoralised). "
  END IF
  IF spm > 6 OR wm > 6 THEN
    upv = INT(upv / 4)
    sig$ = " (unit routed)."
  END IF
END IF
review$ = review$ + "Points Value: " + STR$(upv) + "pts" + sig$
tpv = tpv + upv

IF unit = nua OR unit = nu THEN
  IF countu <> 3 THEN
    wate
  END IF
  CLS
  PRINT #10,
END IF

END SUB

DEFINT X-Z
SUB prout
keyclear
priout = ALERT(4, " Short or full printout ", 9, 10, 14, 70, " Short ", " Full ", "") - 1
END SUB

DEFSNG X-Z
SUB ptc
DO
CALL header
'
PRINT "Which unit wishes to change terrain ";
'
DO
'
INPUT unit
'
LOOP WHILE unit > nu OR unit < 0
'
IF unit = 0 THEN
'
ELSE
'
CALL grabstats(unit)
'
SELECT CASE oftyp
'
CASE 0 TO 2
check = ALERT(4, "Change Terrain|for the whole Army", 9, 10, 14, 70, "Yes", "No", "")
IF check = 1 THEN CALL brigterchange(unit)
CASE 3
check = ALERT(4, "Change Terrain|for the whole Corps", 9, 10, 14, 70, "Yes", "No", "")
IF check = 1 THEN CALL brigterchange(unit)
CASE 4
check = ALERT(4, "Change Terrain|for the whole Division", 9, 10, 14, 70, "Yes", "No", "")
IF check = 1 THEN CALL brigterchange(unit)
CASE 5
check = ALERT(4, "Change Terrain|for the Brigade", 9, 10, 14, 70, "Yes", "No", "")
IF check = 1 THEN CALL brigterchange(unit)
CASE 6, 7
CALL unitchange(unit)
END SELECT
END IF
LOOP WHILE unit <> 0
CLS
'

END SUB

DEFINT X-Z
SUB pvis
'
weff = weff(weath, 12)
'
tf = 100
'
IF htim < 7 OR htim > 20 THEN
'
tf = 1
'
END IF
'
vis = INT((RND(0) * .4 + .8) * tf * weff / 10 * ABS((4000 - sf) / 2000 + 1))
'
vis = MIN(vis, 3000)
'

END SUB

SUB qu
SELECT CASE phase$
CASE "FIRING "
phase$ = "MELEE  "
CASE "MOVEMEN"
phase$ = "FIRING "
CASE "B4MOVE "
phase$ = "MOVEMEN"
MenuSet 6, 2, 1, " Charges ", 2
CASE "MELEE  "
phase$ = "B4MOVE "
END SELECT
MenuPreProcess


'



getout:
moving = TRUE
'
END SUB

SUB qu1
PRINT "  Updating before Shooting....................."
'
'  Menu Off
'
CALL allupdate
'
firing = TRUE
'

END SUB

SUB qu2
'

PRINT "  Updating before melee....................."
'
'  Menu Off
'
CALL allupdate
'
melee = TRUE
'

END SUB

SUB qu3
'

PRINT "  Updating before Order Changes etc........."
'
'  Menu Off
'
meleeup = TRUE
CALL allupdate
meleeup = FALSE
'
upd = TRUE
'

END SUB

DEFSNG X-Z
SUB rallytry
rally = TRUE
CALL header
CALL rendom
cast = omf - mf
cast = INT((cast + menlos) * x1 / 10) * 10
cast = max(0, cast)
m = INT(msince * gff) * 5
'
PRINT sof$; " is trying to rally the"
PRINT unit$; " who are currently "; morale$(wm)
IF cast > 0 THEN
PRINT "They have suffered around "; cast; " casualties, the most recent"
IF msince = 1 THEN
PRINT "within the last "; m; " minutes."
ELSE
PRINT "some "; m; " minutes ago."
END IF
ELSE
PRINT "They have taken no significant casualties"
END IF
wate
'
IF mr = 0 THEN
ralres = 1
ELSE
'
tries = 0
DO
action = action - 1
tries = tries + 1
CALL rendom
oe = Order(nod, 3)
nx = x / max(rallyxx * oe, 1)
rallyt = mr / max(wm * msince, 1)
IF nx < rallyt THEN
wm = ofpm
spm = ofpm
od = ofod
END IF
LOOP UNTIL action < 2 OR wm = ofpm
'
IF wm = ofpm THEN
action = action - 1
ralres = 2
action = max(action, 1)
ELSE
ralres = 3
action = 0
END IF
'
END IF
'

END SUB

SUB rendom
'
xs = RND
x1 = RND * .4 + .8
'
x = RND * 100 + 1
'
x2 = RND * .5 + .5
'

END SUB

DEFINT X-Z
SUB replacestats (mm)

tu = mm
tu = tu - 1
tu = tu * 150

tu = tu + 1
menlos = MIN(menlos, mf)
gunlos = MIN(gf, gunlos)
morlos = MIN(mr, morlos)

mf = max(mf, 0)
gf = max(gf, 0)
chrge = max(ABS(chrge), 0)

mr = MIN(mr, 200)
mr = max(mr, 0)

ofp = MIN(ofp, 256)
ofp = max(ofp, 0)

IF btype = 15 THEN
  gf = MIN(gf, numan)
END IF

t$ = MID$(a$, tu, 150)

MID$(t$, 46) = CHR$(ABS(MIN(254, std)))
MID$(t$, 47) = CHR$(ABS(MIN(254, ofw)))
MID$(t$, 48) = CHR$(ABS(MIN(254, numan)))
MID$(t$, 50) = CHR$(ABS(MIN(254, stafof)))
MID$(t$, 66) = CHR$(ABS(MIN(254, morlos)))
MID$(t$, 67) = CHR$(ABS(MIN(254, gunlos)))
MID$(t$, 68) = CHR$(ABS(MIN(254, am)))
MID$(t$, 69) = MKI$(ABS(menlos))
MID$(t$, 71) = CHR$(ABS(MIN(254, cform)))
MID$(t$, 72) = CHR$(ABS(MIN(254, mov)))
MID$(t$, 73) = CHR$(ABS(MIN(254, disorg)))
MID$(t$, 75) = CHR$(ABS(MIN(254, wm)))
MID$(t$, 76) = CHR$(ABS(MIN(254, mr)))
MID$(t$, 77) = CHR$(ABS(MIN(254, gf)))
MID$(t$, 78) = MKI$(ABS(mf))
MID$(t$, 80) = CHR$(ABS(MIN(254, od)))
MID$(t$, 81) = CHR$(ABS(MIN(254, msince)))
MID$(t$, 82) = CHR$(ABS(MIN(254, pw)))
MID$(t$, 83) = CHR$(ABS(MIN(254, pf)))
MID$(t$, 84) = CHR$(ABS(MIN(254, aw)))
MID$(t$, 85) = CHR$(ABS(MIN(254, tr)))
MID$(t$, 86) = CHR$(ABS(MIN(254, ofp)))
MID$(t$, 88) = CHR$(ABS(MIN(254, targ)))
MID$(t$, 89) = CHR$(ABS(MIN(254, chrge)))
MID$(t$, 90) = CHR$(ABS(MIN(254, spm)))
MID$(t$, 94) = CHR$(ABS(MIN(254, ef)))
MID$(t$, 99) = CHR$(ABS(MIN(254, sat)))
MID$(t$, 100) = CHR$(ABS(MIN(254, shot)))
MID$(t$, 102) = CHR$(ABS(MIN(254, gf2)))
MID$(t$, 109) = CHR$(ABS(MIN(254, INT(fear))))
'
MID$(a$, tu) = t$
'

END SUB

SUB uncon
'
CALL rendom
'
IF x > (comcon + ofa) * 2 / 3 THEN
'
CALL rendom
'
IF x < ag THEN
'
od = 1
'
END IF
'
END IF
'

END SUB

DEFSNG X-Z
SUB unitchange (unit)

review$ = unit$ + " now in: " + terrain$(tr)
tr1 = windows(review$, 18, terrain$())

SELECT CASE od
CASE 7, 8, 13, 14, 18 TO 22
  tdiff = 0
CASE 4, 5
  tdiff = 100
  odr = od
CASE ELSE
  tdiff = terrain(tr, 1) - terrain(tr1, 1)
  odr = od
END SELECT

CALL rendom
locon = (comcon + ag) / spm * xs

IF locon > tdiff THEN
  header
  PRINT
  PRINT
  review$ = "The " + unit$ + " sucessfully leave the " + RTRIM$(terrain$(tr)) + " and are now in " + RTRIM$(terrain$(tr1)) + "."
  review$ = review$ + "   However, they halt to reform immediately having left and do not complete any remaining move distance."
  review$ = review$ + "   Their order remains " + RTRIM$(od$(od))
  CALL worps(review$)
  wate
ELSE
  header
  review$ = "The " + unit$ + " are loath to leave the " + RTRIM$(terrain$(tr))
  worps (review$)
  dummy = ALERT(4, "Force them to leave the" + terrain$(tr), 9, 10, 14, 70, " Remain ", "Leave", "")
  IF dummy = 1 THEN
    tr1 = tr
    odr = max(odr, 5)
  END IF
  od = odr
END IF

tr = tr1
mc = Order(od, 2)
x$ = od$(od)
disorg = disorg + mc * tdis
disorg = MIN(disorg, 250)
disorg = max(disorg, 0)

CALL replacestats(unit)


END SUB

SUB unitdetails (m)
kk = m
'
a = terrain(tr, 1)
te = terrain(tr, 2)
mi = terrain(tr, 3)
tdis = terrain(tr, 4)
'
IF btype > 5 THEN
te = mi
END IF
'
IF btype > 8 AND btype <> 11 AND btype <> 14 THEN
te = te / 2
END IF
'
SELECT CASE cform
CASE 28 TO 58
tdis = tdis * 2
CASE 5, 6, 23, 27, 35
tdis = tdis / 2
tdis = max(tdis, 1)
te = max(te, 8)
END SELECT
'
y$ = terrain$(tr)
x$ = drill$(cform)
'
fe = fmn(cform, 1)
'

END SUB

SUB wate
CALL keyclear
PRINT
PRINT "Press any key to continue.......";
DO
LOOP WHILE INKEY$ = ""
END SUB

SUB watet
CALL keyclear
DO
LOOP WHILE INKEY$ = ""
END SUB

SUB wc
review$ = "Current weather: " + RTRIM$(weath$(weath))
weath = windows(review$, 7, weath$())
CALL pvis
CALL windy
header

END SUB

FUNCTION windows (title$, number, x$())
CALL setupdesktop
PRINT title$
choice = ListBox(x$(), number)
windows = choice
CALL setupdesktop
END FUNCTION

SUB windy
IF windir THEN
CALL rendom
SELECT CASE x
CASE 1 TO 10
windir = windir + 1
CASE 91 TO 100
windir = windir - 1
END SELECT
SELECT CASE windir
CASE 0
windir = 8
CASE 9
windir = 1
END SELECT
ELSE
windir = INT(RND(0) * 8 + 1)
END IF
'
SELECT CASE weath
CASE 1
windst = 80
CASE 2
windst = 10
CASE 3
windst = 0
CASE 5
windst = 120
CASE ELSE
windst = 90
END SELECT
CALL rendom
windst = windst * x1
IF windst < x THEN
windir = 0
END IF

END SUB

DEFINT X-Y
SUB worp (x$)
IF priner = FALSE THEN
  CALL worps(x$)
  EXIT SUB
 END IF
  sl = LEN(x$)
  IF sl < 76 THEN
    report$ = x$
    PRINT #10, report$
  ELSE
    '
    n = 75
    n1 = 0
    n2 = 0
    sln = 100
    DO UNTIL sln < 1
      bly = sl - n1
      IF bly < 76 THEN
        report$ = MID$(x$, n1 + 1, bly)
        PRINT #10, report$
        sln = 0
      ELSE
        sln = sl - n1
        n = 75
        n2 = n1 + n
        v = ASC(MID$(x$, n2))
        IF v = 32 THEN
        ELSE
          DO UNTIL v = 32 OR n = 0
            n = n - 1
            n2 = n2 - 1
            v = ASC(MID$(x$, n2))
          LOOP
        END IF
        report$ = MID$(x$, n1 + 1, n)
        PRINT #10, report$
        n1 = n1 + n
      END IF
      '
    LOOP
    
  END IF
END SUB

SUB worps (x$)
  sl = LEN(x$)
  IF sl < 76 THEN
    report$ = x$
    PRINT report$
  ELSE
    '
    n = 75
    n1 = 0
    n2 = 0
    sln = 5
    '
    DO UNTIL sln < 1
      bly = sl - n1
      IF bly < 76 THEN
        report$ = MID$(x$, n1 + 1, bly)
        PRINT report$
        sln = 0
      ELSE
        sln = sl - n1
        n = 75
        n2 = n1 + n
        v = ASC(MID$(x$, n2))
        IF v = 32 THEN
        ELSE
          DO UNTIL v = 32 OR n = 0
            n = n - 1
            n2 = n2 - 1
            v = ASC(MID$(x$, n2))
          LOOP
        END IF
        report$ = MID$(x$, n1 + 1, n)
        PRINT report$
        n1 = n1 + n
      END IF
      '
   LOOP
  END IF

END SUB

DEFSNG X-Y
SUB wounds (cunit, casc)

IF sharp = TRUE THEN
  casc = casc * 2
  sharp = FALSE
END IF

CALL rendom
IF ofw > 200 OR x > casc THEN
ELSE
  CALL rendom
  IF ofw > 200 OR x > 70 THEN
    ofw = (ofw MOD 100) + 200
    x$ = "killed "
  ELSE
    ofw = ofw + 101
    x$ = "wounded "
  END IF
  review$ = officer$ + " has been " + x$
  SELECT CASE wcs
  CASE 1
    review$ = review$ + "by enemy fire. "
  CASE 2
    review$ = review$ + "by an enemy marksman. "
  CASE 1
    review$ = review$ + "in the melee. "
  END SELECT
  CALL replacestats(cunit)
  CALL worps(review$)
END IF

IF sat THEN
  store = sat
  CALL grabstats(store)
  CALL rendom
  IF ofw > 200 OR x > casc THEN
  ELSE
    CALL rendom
    IF ofw > 200 OR x > 70 THEN
      ofw = (ofw MOD 100) + 200
      x$ = "killed "
    ELSE
      ofw = ofw + 101
      x$ = "wounded "
    END IF
    review$ = officer$ + " has been " + x$
    SELECT CASE wcs
    CASE 1
      review$ = review$ + "by the enemy's fire. "
    CASE 2
      review$ = review$ + "by an enemy sharpshooter. "
    CASE 1
      review$ = review$ + "in the hand to hand fighting. "
    END SELECT
    stafof = 0
    CALL replacestats(store)
    CALL worps(review$)
  END IF
END IF
'
sat = 0
CALL grabstats(cunit)

END SUB

SUB zero

mecas = 0
horcas = 0
gunercas = 0
guners = 0
men = 0
hor = 0
gunlost = 0
tpv = 0

END SUB

