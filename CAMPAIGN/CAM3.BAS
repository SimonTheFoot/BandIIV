DECLARE SUB checkem ()
DECLARE SUB header ()
DECLARE SUB rendom ()
DECLARE SUB wate ()
DECLARE FUNCTION autoname$ (m%)
DECLARE FUNCTION getfilecount% (filespec$)
DECLARE FUNCTION num% ()
DECLARE SUB setupdesktop ()
DECLARE SUB setupmenu ()
DECLARE SUB cmdchk ()
'$INCLUDE: 'C:\BC7\ecw\bandi3\campaign\cam.BI'

FUNCTION autoname$ (m)
IF m = clang THEN
ELSE
IF m = 32 THEN
  rendom
  SELECT CASE x
  CASE 1 TO 20
    m = 1
  CASE 21 TO 30
    m = 3
  CASE 31 TO 40
    m = 4
  CASE 41 TO 50
    m = 5
  CASE 51 TO 60
    m = 2
  CASE 61 TO 80
    m = 23
  CASE ELSE
    m = 31
  END SELECT
END IF

a$ = ""
b$ = ""
c$ = ""

SELECT CASE m
CASE 1
a$ = "eng1": a = 110
b$ = "eng2": b = 110
CASE 2
a$ = "ger1": a = 75
b$ = "ger2": b = 80
CASE 3
a$ = "fr1": a = 90
b$ = "fr2": b = 100
CASE 4
a$ = "it1": a = 100
b$ = "it2": b = 100
CASE 5
a$ = "sp1": a = 60
b$ = "sp2": b = 100
CASE 6
a$ = "ru1": a = 60
b$ = "ru2": b = 50
c$ = "ru3": c = 80
CASE 7
a$ = "mu1": a = 60
b$ = "mu2": b = 40
CASE 8
a$ = "hi1": a = 110
b$ = "hi2": b = 90
CASE 9
a$ = "si1": a = 55
CASE 10, 34
a$ = "tu1": a = 60
b$ = "tu2": b = 10
CASE 11
a$ = "af1": a = 25
b$ = "af2": b = 23
CASE 12
a$ = "ch1": a = 25
b$ = "ch2": b = 25
c$ = "ch3": c = 30
CASE 13
a$ = "ar1": a = 60
b$ = "ar2": b = 60
CASE 14
a$ = "ma1": a = 60
b$ = "ma2": b = 30
CASE 15, 37
a$ = "in1": a = 110
CASE 16
a$ = "gr1": a = 50
b$ = "gr2": b = 50
CASE 17
a$ = "se1": a = 60
CASE 18
a$ = "po1": a = 40
b$ = "po2": b = 40
CASE 19
a$ = "ka1": a = 50
CASE 20
a$ = "da1": a = 35
b$ = "da2": b = 55
CASE 21
a$ = "sw1": a = 46
b$ = "sw2": b = 64
CASE 22
a$ = "du1": a = 42
b$ = "du2": b = 100
c$ = "du3": c = 10
CASE 23
a$ = "tu1": a = 60
b$ = "af2": b = 23
CASE 24
a$ = "sc1": a = 60
b$ = "sc2": b = 60
CASE 25
a$ = "wa1": a = 30
b$ = "wa2": b = 20
c$ = "wa3": c = 8
CASE 26
a$ = "ir1": a = 60
b$ = "ir2": b = 60
CASE 27
a$ = "hu1": a = 40
b$ = "hu2": b = 50
CASE 28
a$ = "bo1": a = 30
b$ = "bo2": b = 30
CASE 29
a$ = "ro1": a = 15
b$ = "ro2": b = 25
CASE 30
a$ = "ru1": a = 60
b$ = "bu1": b = 30
CASE 31
a$ = "pg1": a = 40
b$ = "pg1": b = 40
CASE 33
a$ = "am1": a = 30
b$ = "am2": b = 50
CASE 35
a$ = "br1": a = 50
b$ = "br1": b = 50
CASE 36
a$ = "ja1": a = 48
b$ = "ja1": b = 50
END SELECT

a$ = cmd$ + "\language.s\" + a$
OPEN a$ FOR INPUT AS #1
FOR i = 1 TO a
INPUT #1, na1$(i)
NEXT i
CLOSE #1
IF LEN(b$) > 0 THEN
b$ = cmd$ + "\language.s\" + b$
OPEN b$ FOR INPUT AS #1
FOR i = 1 TO b
INPUT #1, na2$(i)
NEXT i
CLOSE #1
END IF
IF LEN(c$) > 0 THEN
c$ = cmd$ + "\language.s\" + c$
OPEN c$ FOR INPUT AS #1
FOR i = 1 TO c
INPUT #1, na3$(i)
NEXT i
CLOSE #1
END IF
END IF
    sokay = 0
    DO UNTIL sokay = 1
    SELECT CASE m
      '
    CASE 1
      n = RND * 110
       name$ = na1$(n)
      n1$ = name$ + " "
      CALL rendom
      IF x < 10 THEN
        n = RND * 110
           name$ = na1$(n)
        n1$ = n1$ + name$ + " "
      END IF
      n = RND * 110
      name$ = na2$(n)
      CALL rendom
      IF x < 20 THEN
      n = RND * 110
      n2$ = na2$(n)
      name$ = n2$ + "-" + name$
      END IF
      n1$ = n1$ + name$
    CASE 2
      n = RND * 75
      name$ = na1$(n)
      CALL rendom
      IF x < 30 THEN
      n = RND * 70
      n$ = na1$(n) + " "
      name$ = n$ + "-" + name$
      END IF
      n1$ = name$ + " "
      n = RND * 80
       name$ = na2$(n)
      CALL rendom
      SELECT CASE x
      CASE 1 TO 50
      n1$ = n1$ + "von "
        CASE 51 TO 64
        n1$ = n1$ + "Freiherr von "
      CASE 65 TO 93
      CASE 94
      n1$ = n1$ + "von und zu "
      CASE 95 TO 100
      n1$ = n1$ + "zu "
      END SELECT
      n1$ = n1$ + name$
    CASE 3
      n = RND * 90
      name$ = na1$(n)
      n1$ = name$ + " "
      CALL rendom
      IF x < 25 THEN
      n = RND * 90
      name$ = na1$(n)
      name$ = name$ + "-" + n1$
      END IF
      n1$ = name$ + " "
      n = RND * 100
      name$ = na2$(n)
      CALL rendom
      IF x < 10 THEN
        n1$ = n1$ + "de "
      END IF
      n1$ = n1$ + name$
    CASE 4
      n = RND * 100
      n1$ = na1$(n) + " "
      n = RND * 100
      name$ = na1$(n)
      CALL rendom
      IF x < 20 THEN
        n1$ = n1$ + "di "
      END IF
      n1$ = n1$ + name$
    CASE 5
      n = RND * 60
      n1$ = na1$(n)
      CALL rendom
      IF x < 30 THEN
      n = RND * 60
      name$ = na1$(n)
      n1$ = n1$ + "-" + name$
      END IF
      n1$ = n1$ + " "
      n = RND * 100
      name$ = na2$(n)
      n1$ = n1$ + name$
      CALL rendom
      IF x < 30 THEN
      n = RND * 100
      name$ = na2$(n)
      n1$ = n1$ + "-" + name$
      END IF
      IF x > 95 THEN
        n1$ = n1$ + " de la Cruz"
      END IF
    CASE 6
      n = RND * 60
      name$ = na1$(n)
      n = RND * 50
      n1$ = na2$(n)
      n1$ = n1$ + "ovich "
      n1$ = name$ + " " + n1$
      n = RND * 80
      name$ = na3$(n)
      n1$ = n1$ + name$
    CASE 7
      n = RND * 60
      name$ = na1$(n)
      n1$ = name$ + " "
      n = RND * 40
      name$ = na2$(n)
      n1$ = n1$ + name$
    CASE 8
      n = RND * 110
      name$ = na1$(n)
      n1$ = name$ + " "
      n = RND * 110
      name$ = na1$(n)
      n1$ = n1$ + name$
      CALL rendom
      IF x < 30 THEN
      n = RND * 90
      name$ = na2$(n)
      n1$ = n1$ + " " + name$
      END IF
    CASE 9
      n = RND * 55
      name$ = na1$(n)
      n1$ = name$ + " "
      n1$ = n1$ + "Singh"
    CASE 10, 34
      n = RND * 60
      name$ = na1$(n)
      n1$ = name$ + " "
      n = RND * 10
      name$ = na2$(n)
      n1$ = n1$ + name$
    CASE 11
      n = RND * 25
      name$ = na1$(n)
      n1$ = name$ + " "
      n = RND * 23
      name$ = na2$(n)
      n1$ = n1$ + name$
    CASE 12
      n = RND * 25
      name$ = na1$(n)
      n1$ = name$ + " "
      n = RND * 25
      name$ = na2$(n)
      n1$ = n1$ + name$ + " "
      n = RND * 30
      name$ = na3$(n)
      n1$ = n1$ + name$
    CASE 13
      n = RND * 60
      name$ = na1$(n)
      n1$ = name$ + " ibn "
      n = RND * 60
      name$ = na2$(n)
      n1$ = n1$ + name$
    CASE 14
      n = RND * 60
      name$ = na1$(n)
      n1$ = name$ + " "
      n = RND * 30
      name$ = na2$(n)
      n1$ = n1$ + name$
    CASE 15, 37
      n = RND * 110
      name$ = na1$(n)
      n1$ = name$
    CASE 16
      n = RND * 50
      name$ = na1$(n)
      n1$ = name$ + " "
      n = RND * 50
      name$ = na2$(n)
      n1$ = n1$ + name$
    CASE 17
      n = RND * 60
      name$ = na1$(n)
      n1$ = name$ + " "
      n = RND * 60
      name$ = na1$(n)
      n1$ = n1$ + name$
      CALL rendom
      IF x > 50 THEN
        n1$ = n1$ + "ovic"
      ELSE
        n1$ = n1$ + "ic"
      END IF
    CASE 18
      n = RND * 40
      n1$ = na1$(n) + " "
      n = RND * 40
      n1$ = n1$ + na2$(n)
    CASE 19
      n = RND * 50
      n1$ = na1$(n)
      n = RND * 50
      name$ = na1$(n)
      IF name$ = n1$ THEN
        n1$ = autoname$(m)
      END IF
      n1$ = n1$ + " " + name$
    CASE 20
      n = RND * 35
      name$ = na1$(n)
      CALL rendom
      IF x < 50 THEN
      n = RND * 35
      n$ = na1$(n)
      name$ = n$ + "-" + name$
      END IF
      n1$ = name$ + " "
      n = RND * 55
      n1$ = n1$ + na2$(n)
    CASE 21
      n = RND * 46
      name$ = na1$(n)
      n1$ = name$
      CALL rendom
      IF x < 50 THEN
      n = RND * 46
      n2$ = na1$(n)
        IF n2$ = n1$ THEN
          n1$ = autoname$(m)
        END IF
        n1$ = name$ + "-" + n2$
      END IF
      n1$ = n1$ + " "
      n = RND * 64
      name$ = na2$(n)
      n1$ = n1$ + name$
    CASE 22
      n = RND * 42
      name$ = na1$(n)
      n1$ = name$
      n = RND * 100
      name$ = na2$(n)
      CALL rendom
      IF x < 60 THEN
      n = RND * 10
      n2$ = na3$(n)
        n1$ = n1$ + " " + n2$
      END IF
      n1$ = n1$ + " " + name$
    CASE 23
      n = RND * 60
      name$ = na1$(n)
      n1$ = name$ + " "
      n = RND * 23
      name$ = na2$(n)
      n1$ = n1$ + name$
    CASE 24
      n = RND * 60
      name$ = na1$(n)
      n1$ = name$ + " "
      n = RND * 60
      name$ = na2$(n)
      n1$ = n1$ + name$
    CASE 25
      n = RND * 30
      name$ = na1$(n)
      n1$ = name$ + " "
      CALL rendom
      IF x < 50 THEN
      n = RND * 8
      name$ = na3$(n)
        n1$ = n1$ + name$ + " "
      END IF
      n = RND * 20
      name$ = na1$(n)
      n1$ = n1$ + name$
    CASE 26
      n = RND * 60
      name$ = na1$(n)
      n1$ = name$ + " "
      n = RND * 60
      name$ = na2$(n)
      n1$ = n1$ + name$
    CASE 27
      n = RND * 40
      name$ = na1$(n)
      n1$ = name$ + " "
      n = RND * 50
      name$ = na2$(n)
      n1$ = n1$ + name$
    CASE 28
      n = RND * 30
      name$ = na1$(n)
      n1$ = name$ + " "
      n = RND * 30
      name$ = na1$(n)
      n1$ = n1$ + name$
    CASE 29
      n = RND * 15
      name$ = na1$(n)
      n1$ = name$ + " "
      n = RND * 25
      name$ = na2$(n)
      n1$ = n1$ + name$
    CASE 30
      n = RND * 30
      name$ = na1$(n)
      n1$ = name$ + " "
      n = RND * 30
      name$ = na2$(n)
     n1$ = n1$ + name$
    CASE 31
      n = RND * 40
      name$ = na1$(n)
      n1$ = name$ + " "
      n = RND * 40
      name$ = na2$(n)
      n1$ = n1$ + name$
      rendom
      IF x < 20 THEN
        n = RND * 40
        name$ = na2$(n)
        n1$ = n1$ + "-" + name$
      END IF
    CASE 33
      n = RND * 30
      name$ = na1$(n)
      n1$ = name$ + " "
      IF x < 10 THEN
        n1$ = n1$ + "Ter-" + name$
      END IF
      IF x > 10 AND x < 21 THEN
        n1$ = n1$ + "Melik-" + name$
      END IF
      n = RND * 50
      name$ = na2$(n)
      n1$ = n1$ + name$
      rendom
    CASE 35
      n = RND * 50
      name$ = na1$(n)
      n1$ = name$ + " "
      n = RND * 50
      name$ = na2$(n)
      n1$ = n1$ + name$
      rendom
      IF x < 20 THEN
        n = RND * 50
        name$ = na2$(n)
        n1$ = n1$ + " " + name$
      END IF
    CASE 36
      n = RND * 48
      name$ = na1$(n)
      n1$ = name$ + " "
      n = RND * 50
      name$ = na2$(n)
      n1$ = n1$ + name$
      rendom
    END SELECT
    
    IF LEN(n1$) > 40 THEN
      n1$ = autoname$(m)
    END IF
    '
    off$ = n1$
    '
 
  sokay = Alert(4, " Accept name: " + n1$, 7, 9, 19, 69, " Yes", "No  ", "")
  LOOP
clang = m
autoname = n1$
END FUNCTION

SUB cmdchk
cmd$ = RTRIM$(COMMAND$)
cmd$ = LTRIM$(COMMAND$)
IF RIGHT$(cmd$, LEN(cmd$)) <> "\" THEN cmd$ = cmd$ + "\"
IF LEN(cmd$) = 1 THEN cmd$ = "C:\ecw\bandi3\"
END SUB

SUB colordisplay STATIC
    displaytype = TRUE
    MouseHide
    setupmenu
   setupdesktop
   MenuShow
   MouseShow

END SUB

SUB getdetails
REM ON LOCAL ERROR GOTO errr
CALL cmdchk

cccp:
OPEN cmd$ + "armies.nam\stridat.nam" FOR INPUT AS #8
OPEN cmd$ + "armies.nam\test1.num" FOR INPUT AS #9

OPEN cmd$ + "armies.dat\filename" FOR INPUT AS #7
FOR q = 1 TO 13
INPUT #7, finame$(q)

NEXT q


CLOSE 7
OPEN cmd$ + "armies.nam\file" FOR INPUT AS #7
FOR q = 1 TO 13
INPUT #7, faccr$(q)

NEXT q

CLOSE 7
OPEN cmd$ + "armies.dat\file" FOR INPUT AS #7
FOR q = 1 TO 13
INPUT #7, far$(q)

NEXT q
CLOSE 7


FOR q = 1 TO 37
 INPUT #8, nation$(q)

NEXT q


FOR q = 1 TO 4
  INPUT #8, mess$(q)
mess(q) = num
NEXT q


FOR q = 1 TO 5
INPUT #8, fate$(q)

NEXT q

FOR q = 1 TO 12
  INPUT #8, happy$(q)
  
NEXT q

INPUT #8, prim$(1)
INPUT #8, prim$(2)


FOR l = 1 TO 10
  INPUT #8, brave$(l), able$(l)
lbase(l) = num
obase(l) = num

NEXT l


FOR l = 1 TO 10
INPUT #8, loyal$(l), skill$(l)
NEXT l

FOR l = 1 TO 10
  INPUT #8, infl$(l), death$(l)

NEXT l

FOR l = 1 TO 13
  INPUT #8, hcase$(l)

NEXT l

FOR q = 1 TO 10
  INPUT #8, game$(q)
NEXT q

'
' 1 number of marches to be attempted
' 2 km expected per march
' 3 attrition from this action
'

FOR q = 1 TO 10
  INPUT #8, action$(q)
    FOR a = 1 TO 3
    action(q, a) = num
   NEXT a

NEXT q

'
' 1 effect on whether to march
' 2 effect on march rate
' 3 effecting disease
' 4 effecting normal attrition
'

FOR q = 1 TO 15
  INPUT #8, weather$(q)
  
  FOR a = 1 TO 4
    weather(q, a) = num

NEXT a
NEXT q

' 1 effect on travel
' 2 effect on attrition
' 3 effect on disease
'
FOR q = 1 TO 9
  INPUT #8, terrain$(q)
  FOR a = 1 TO 3
  terrain(q, a) = num
NEXT a
NEXT q


FOR l = 1 TO 3
  INPUT #8, tyme$(l)

NEXT l
'

'
' 1 effect on travel in good weather
' 2 effect on travel in bad weather
'

FOR q = 1 TO 7
  INPUT #8, route$(q)
  FOR a = 1 TO 2
   route(q, a) = num
   NEXT a
 NEXT q



FOR l = 1 TO 9
  INPUT #8, repl$(l)
repl(l) = num
NEXT l

'
' 1 effect on attrition
'
FOR q = 1 TO 8
  INPUT #8, supply$(q)
supply(q) = num
NEXT q

FOR q = 1 TO 7
  INPUT #8, days$(q)
 NEXT q
'
FOR q = 1 TO 12
  INPUT #8, month$(q)
month(q, 1) = num
NEXT q

FOR q = 1 TO 5
  INPUT #8, batres$(q)
  FOR a = 1 TO 2
   batres(q, a) = num
NEXT a
NEXT q
'

'
' 1 minimum action required by enemy if this
' 2 effect of own action on casualties
' 3 effect of action on enemy casualties
' 4 effect of own action on morale
' 5 effect of action on enemy morale
' 6 effect of own action on gun loss
' 7 effect of action on enemy gun loss
' 8 time taken up doing this
'


FOR q = 1 TO 10
  INPUT #8, aftbat$(q)
 
  FOR a = 1 TO 8
   aftbat(q, a) = num

  NEXT a
NEXT q
'

'
' 1 best view of battle with this morale
' 2 best order after battle
' 3 effect on casualties
'


FOR q = 1 TO 8
  INPUT #8, morale$(q), ofrale$(q)
FOR a = 1 TO 3
   morale(q, a) = num
NEXT a
NEXT q
'

l = 0
DO UNTIL disease$(l) = "-1"
  l = l + 1
  INPUT #8, disease$(l)
  disease(l, 1) = num
 disease(l, 2) = num
LOOP


FOR l = 1 TO 6
  INPUT #8, armour$(l)
  
NEXT l


FOR l = 0 TO 75
  a = 0
  INPUT #8, formpos$(l)
 
DO
 a = a + 1
    formpos(l, a) = num
IF formpos(l, a) = -1 THEN
  EXIT DO
  END IF
  LOOP
NEXT l

'


FOR q = 1 TO 8
  INPUT #8, comand$(q)
 
NEXT q
'


FOR n = 1 TO 61
  INPUT #8, officer$(n)
 
officer(n, 1) = num
officer(n, 2) = num

NEXT n

FOR l = 1 TO 21
  INPUT #8, chopper$(l)
  FOR m = 1 TO 2
    chopper(l, m) = num
  NEXT m
  INPUT #8, chop$(l, 1), chop$(l, 2)
NEXT l

FOR q = 0 TO 20
  INPUT #8, type$(q), band$(q, 1), band$(q, 2), band$(q, 3), band$(q, 4)

tipe(q, 1) = num
tipe(q, 2) = num
tipe(q, 3) = num
NEXT q


'
' 1 confidence
' 2 steadyness
' 3 command control
' 4 fire discipline
'

FOR q = 1 TO 26
  INPUT #8, class$(q)
 
 FOR a = 1 TO 4
  class(q, a) = num

NEXT a

NEXT q

FOR l = 1 TO 7
  INPUT #8, commit$(l)
  FOR m = 1 TO 4
    commit(l, m) = num
  NEXT m
NEXT l

' change to confidence
' change to steadyness
' change to command control
' change to fire discipline
'


FOR l = 1 TO 7
  INPUT #8, experience$(l)
 
  FOR m = 1 TO 4
  experience(l, m) = num
  
  NEXT m

NEXT l


FOR q = 1 TO 24
INPUT #8, gatling$(q)
FOR m = 1 TO 7
gatling(q, m) = num
NEXT m
NEXT q

FOR q = 1 TO 15
INPUT #8, who$(q)
a = 0
DO
who(q, a) = num
IF who(q, a) = -1 THEN
EXIT DO
END IF
a = a + 1
LOOP
NEXT q

FOR q = 0 TO 9
INPUT #8, guntype$(q)
NEXT q

FOR q = 1 TO 8
INPUT #8, gatype$(q)
NEXT q

FOR q = 0 TO 9
INPUT #8, mustype$(q)
NEXT q

FOR l = 1 TO 228
  INPUT #8, musket$(l)
  FOR m = 1 TO 6
    musket(l, m) = num
  NEXT m
NEXT l

FOR l = 1 TO 201
  INPUT #8, gun$(l)
FOR m = 1 TO 7
  gun(l, m) = num
NEXT m
NEXT l
CLS
CLOSE #8
CLOSE #9

    tit$(1) = " Establishment strength "
    tit$(2) = " Field strength         "
    tit$(3) = " Depleted strength      "

    tt$(1) = " Exit without change       "
    tt$(2) = " Change Primary Missile Weapon        "
    tt$(3) = " Change Secondary Missile Weapon      "
    tt$(4) = " Change Melee Weapon                  "
    tt$(5) = " Change Armour                        "
    tt$(6) = " Change Percentage with Weapon        "
    tt$(7) = " Change Number of Guns                "

  
    wch$(1) = " Small Arms            "
    wch$(2) = " Artillery             "
    wch$(3) = " Machine Guns          "
    wch$(4) = " Exit                  "


    hm$(1) = " All weapons             "
    hm$(2) = " Some weapons            "
    hm$(3) = " One weapon              "

    tat$(1) = " Promote             "
    tat$(2) = " Demote              "
    tat$(3) = " Exit without change "

    tot$(1) = " Promote to a staff position "
    tot$(2) = " Promote in rank inside unit "
    tot$(3) = " Demote                      "
    tot$(4) = " Exit without change         "

    tirt$(1) = " Disolve                    "
    tirt$(2) = " Disolve & Redistribute men "
    tirt$(3) = " Error                      "




EXIT SUB
errr:
CLS
CALL setupdesktop
PRINT
PRINT
PRINT
PRINT
PRINT "Can not find the 3 folders `LANGUAGES' etc."
PRINT "Please enter the path to them (eg. C:\ECW\HP\ )"
INPUT cmd$
cmd$ = LTRIM$(cmd$)
cmd$ = RTRIM$(cmd$)
RESUME cccp
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

SUB latlong

IF latlon THEN
    latlon = FALSE
CALL MenuSetState(6, 13, 1)
ELSE
    latlon = TRUE
CALL MenuSetState(6, 13, 2)
END IF

END SUB

SUB MonoDisplay
    displaytype = FALSE
    MouseHide
    setupmenu
   setupdesktop
   MenuShow
   MouseShow
END SUB

SUB noway
dummy = Alert(4, "This is an inappropriate use of cancel", 9, 10, 14, 70, "", "", "")
END SUB

SUB nsave
  junk = Alert(4, "The Save Function is disabled" + "|in this Demo Version" + "|of Blood & Iron.", 7, 9, 20, 69, "", "", "")
END SUB

FUNCTION num
INPUT #9, x
num = x
END FUNCTION

SUB quit

k = Alert(4, " Leave Campaign Programme|No Automatic Save is performed.: ", 7, 9, 19, 69, " No ", " Yes ", "")
IF k = 2 THEN
  leavegame = TRUE
ELSE
  leavegame = FALSE
END IF

END SUB

SUB setofa

  IF chofa THEN
CALL MenuSetState(5, 7, 1)
chofa = FALSE
ELSE
chofa = TRUE
allofa = Alert(4, " Set Ability|for Officers: ", 7, 9, 19, 69, " Staff ", " All ", "")
CALL MenuSetState(5, 7, 2)
IF allofa = 2 THEN
      allofa = TRUE
    ELSE
    allofa = FALSE
END IF
  END IF
END SUB

SUB setofl
  IF chofl = TRUE THEN
CALL MenuSetState(5, 8, 1)
chofl = FALSE
  ELSE
 chofl = TRUE
CALL MenuSetState(5, 8, 2)
allofl = Alert(4, " Set Loyalty|for Officers: ", 7, 9, 20, 69, " Staff ", " All ", "")
    IF allofl = 2 THEN
      allofl = TRUE
    ELSE
    allofl = FALSE
    END IF
  END IF
END SUB

SUB sets
date = 0
DO UNTIL date < 1905 AND date > 1829
  header
  PRINT "What is the date (1830-1904) ";
  INPUT date
LOOP
gscale = 0
DO UNTIL gscale > 0
  gscale = ListBox%(mess$(), 4)
LOOP

header
IF gscale > 3 THEN
  DO UNTIL gscale > 99 AND gscale < 4001
    PRINT "Enter your ground scale: 1 to ";
    INPUT gscale
  LOOP
END IF

IF gscale < 4 THEN
  gscale = mess(gscale)
END IF
header
PRINT
PRINT "Setting Figure Scales for Blood & Iron"
PRINT
PRINT
PRINT "What is your infantry figure frontage in mm ";
INPUT footscale
z = footscale / 300
sc = z * gscale
sc1 = (sc * 5 / 3)
PRINT
PRINT "What is your artillery model frontage in mm ";
INPUT artscale
z = artscale / 12000
sc2 = z * gscale
sc3 = (sc2 * 5 / 3) + 1
me$ = STR$(INT(sc))
menx$ = STR$(INT(sc1))

header
PRINT
PRINT "Setting scales for Blood & Iron"
PRINT
PRINT
PRINT "Given these base sizes and ground scales,"
PRINT "a suitable figure scale would be:"
PRINT
PRINT "between " + me$ + " and " + menx$ + " men to the figure."
me$ = STR$(INT(sc2))
menx$ = STR$(INT(sc3))
PRINT "and from " + me$ + " to " + menx$ + " guns to the model."
wate
header
END SUB

SUB setuname

  IF uname THEN
    uname = FALSE
CALL MenuSetState(6, 1, 1)
  ELSE
    uname = TRUE
CALL MenuSetState(6, 1, 2)
  END IF
END SUB

DEFSNG X-Y
SUB setupdesktop STATIC

MouseHide
WIDTH , 25
IF displaytype = TRUE THEN
COLOR 15, 1
ELSE
COLOR 15, 0
END IF
CLS
MouseShow

END SUB

SUB setupmenu
MenuSet 1, 0, 1, " Blood & Iron ", 2
MenuSet 1, 1, 1, " Copyright ", 2

MenuSet 2, 0, 1, " Generator      ", 2
MenuSet 2, 1, 1, " New Army       ", 2
MenuSet 2, 2, 1, " New Division   ", 6
MenuSet 2, 3, 1, " Brigade        ", 2
MenuSet 2, 4, 1, " Single Unit    ", 2
MenuSet 2, 5, 1, " Weapon details ", 2
MenuSet 2, 6, 1, " Army Lists     ", 2

MenuSet 3, 0, 1, " Input/Output  ", 2
MenuSet 3, 1, 1, " Save File     ", 2
MenuSet 3, 2, 1, " Load File     ", 2
MenuSet 3, 3, 1, " List  File    ", 3
REM     not used MenuSet 3, 4, 1, " Fight Battle  ", 2
MenuSet 3, 4, 1, " Quit Game     ", 2

MenuSet 4, 0, 1, " Buffers       ", 2
MenuSet 4, 1, 2, " Buffer 1      ", 2
MenuSet 4, 2, 1, " Buffer 2      ", 2
MenuSet 4, 3, 1, " Buffer 3      ", 2
MenuSet 4, 7, 1, " Clear Buffers ", 2

MenuSet 5, 0, 1, " Officers          ", 2
MenuSet 5, 1, 1, " Auto name         ", 2
MenuSet 5, 2, 1, " Create New        ", 2
MenuSet 5, 3, 1, " Promote/Demote    ", 2
MenuSet 5, 4, 1, " Honour            ", 2
MenuSet 5, 5, 1, " Bring to Account  ", 2
MenuSet 5, 6, 1, " Review            ", 2
MenuSet 5, 7, 1, " Set Skill         ", 2
MenuSet 5, 8, 1, " Set Loyalty       ", 6
MenuSet 5, 9, 1, " Move Officers     ", 2
MenuSet 5, 10, 1, " Change Name       ", 5
MenuSet 5, 11, 1, " Create Army Corps ", 15
                                                                                            
MenuSet 6, 0, 1, " Units            ", 2
MenuSet 6, 1, 1, " Auto name        ", 2
MenuSet 6, 2, 1, " Disband          ", 2
MenuSet 6, 3, 1, " Add Replacements ", 8
MenuSet 6, 4, 1, " Re-define        ", 2
MenuSet 6, 5, 1, " Buffer Move      ", 2
MenuSet 6, 6, 1, " Move Unit(s)     ", 2
MenuSet 6, 7, 1, " Battle Recovery  ", 4
MenuSet 6, 8, 1, " General Update   ", 2
MenuSet 6, 9, 1, " Train Brigade    ", 6
MenuSet 6, 10, 1, " Equalise Points  ", 2
MenuSet 6, 11, 1, " Set Scales       ", 2
MenuSet 6, 12, 1, " Free Memory      ", 2
MenuSet 6, 13, 1, " Set map ref      ", 2

IF NOT displaytype THEN
MenuColor 0, 7, 15, 8, 7, 0, 15
ELSE
MenuColor 0, 7, 4, 8, 15, 0, 12
END IF
MenuPreProcess
END SUB

DEFINT X-Y
SUB uload
ON LOCAL ERROR GOTO rabbit
oops:
    choice = Alert(4, " Load from which Drive?", 9, 10, 14, 70, "A:", "C:", "Other")
    SELECT CASE choice
CASE 1
filespec$ = "A:\*.BIA"
pat$ = "A:\"
CASE 2
filespec$ = "C:\ecw\bandi3\*.BIA"
pat$ = "C:\ecw\bandi3\"
CASE 3
ok = FALSE
DO UNTIL ok > 0
PRINT "Please enter the path to your load file folder"
PRINT "For example C:\myfold\"
INPUT pat$
filespec$ = pat$ + "*.BIA"
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
filecount = getfilecount(filespec$)
REDIM filelist$(filecount)
filelist$(1) = DIR$(filespec$)
    FOR indx = 2 TO filecount
        filelist$(indx) = DIR$
    NEXT indx
    x = ListBox(filelist$(), UBOUND(filelist$))
 x$ = filelist$(x)
 IF x = 0 THEN
 ELSE
pat$ = pat$ + x$
END IF

OPEN pat$ FOR INPUT AS #1
x = LOF(1)
x$ = STRING$(x, " ")
 DEF SEG = SSEG(x$)
 BLOAD pat$, SADD(x$)
CLOSE #1
DEF SEG
x$ = LEFT$(x$, LEN(x$) - 7)
buffer$(buffer) = x$
x$ = ""
EXIT SUB
rabbit:
junk = Alert(4, "Sorry: no suitable file", 11, 12, 15, 62, "", "", "")
RESUME oops
END SUB

SUB usave
  IF LEN(buffer$(buffer)) = 0 THEN
   junk = Alert(4, "Buffer " + STR$(buffer) + "|is empty.", 7, 9, 20, 69, "", "", "")
  ELSE

ON LOCAL ERROR GOTO mmm
CALL checkem
floop:
    choice = Alert(4, " Save to which Drive?", 9, 10, 14, 70, "A:", "C:", "Other")
SELECT CASE choice
CASE 1
filespec$ = "A:\*.BIA"
pat$ = "a:\"
CASE 2
filespec$ = "C:\ecw\bandi3\*.BIA"
pat$ = "C:\ecw\bandi3\"
CASE 3
ok = FALSE
DO UNTIL ok > 0
PRINT "Please enter the path for your save file folder"
PRINT "For example C:\myfold\"
INPUT pat$
filespec$ = pat$ + "*.BIA"
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
filecount = getfilecount(filespec$)
REDIM filelist$(filecount + 1)
filelist$(1) = DIR$(filespec$)
    FOR indx = 2 TO filecount
        filelist$(indx) = DIR$
    NEXT indx
    IF filecount > 0 THEN filelist$(indx) = "New Filename" ELSE filelist$(1) = "New Filename": indx = 1
    x = ListBox(filelist$(), UBOUND(filelist$))
 x$ = filelist$(x)
IF x = 0 THEN
ELSE
IF x = indx THEN
 PRINT "Enter your filename, (eg. `french1')"
 INPUT x$
 END IF
pat$ = pat$ + x$
 x = INSTR(1, pat$, ".")
 IF x > 0 THEN pat$ = LEFT$(pat$, x - 1)
pat$ = pat$ + ".BIA"
 y$ = buffer$(buffer)
DEF SEG = SSEG(y$)
 BSAVE pat$, SADD(y$), LEN(y$)
 DEF SEG
END IF
END IF
EXIT SUB
mmm:
x = Alert(4, "Sorry: can't do this |You may have a write protected disk|or selected an inappropriate path", 11, 20, 15, 60, "", "", "")
RESUME floop
END SUB

