DECLARE SUB unitpr ()
DECLARE SUB nsave ()
'$INCLUDE: 'C:\BC7\ecw\bandi3\campaign\cam.BI'
DECLARE SUB ap (count%)
DECLARE SUB artillery ()
DECLARE SUB artpr ()
DECLARE SUB bfchnge (x%)
DECLARE SUB bm1 (buf%)
DECLARE SUB brig ()
DECLARE SUB changit (xx%)
DECLARE SUB checkem ()
DECLARE SUB chofal ()
DECLARE SUB chofla ()
DECLARE SUB classch (nv%)
DECLARE SUB classs ()
DECLARE SUB comch (nv%)
DECLARE SUB commite ()
DECLARE SUB copyright ()
DECLARE SUB corpz ()
DECLARE SUB countpts ()
DECLARE SUB countup ()
DECLARE SUB deleat (x%, y%, w%)
DECLARE SUB equal ()
DECLARE FUNCTION even% (x%)
DECLARE SUB expch (nv%)
DECLARE SUB exper ()
DECLARE SUB fmtn ()
DECLARE SUB free ()
DECLARE SUB genlist (x%)
DECLARE SUB grabstats (xx%)
DECLARE SUB grabstuff ()
DECLARE SUB header ()
DECLARE SUB infantry ()
DECLARE SUB keyclear ()
DECLARE SUB logstats (sbt%)
DECLARE FUNCTION MAX% (x%, y%)
DECLARE SUB men ()
DECLARE SUB mgp (count%)
DECLARE FUNCTION MIN% (a%, b%)
DECLARE SUB mstring ()
DECLARE SUB namech ()
DECLARE SUB natans ()
DECLARE SUB natcheck1 ()
DECLARE SUB natchek ()
DECLARE SUB newarm ()
DECLARE SUB newdiv ()
DECLARE SUB nofficer ()
DECLARE FUNCTION ODD% (x%)
DECLARE SUB offch ()
DECLARE SUB officrs ()
DECLARE SUB offnat ()
DECLARE SUB offrank ()
DECLARE SUB ordal (n%)
DECLARE SUB po1 ()
DECLARE FUNCTION Points! ()
DECLARE SUB redef ()
DECLARE SUB rendom ()
DECLARE SUB revewe ()
DECLARE SUB sap (count%)
DECLARE SUB setofn ()
DECLARE SUB singu ()
DECLARE SUB statpr ()
DECLARE SUB strength ()
DECLARE SUB subu ()
DECLARE SUB totpr ()
DECLARE FUNCTION trim$ (x$)
DECLARE SUB troopr ()
DECLARE SUB ttype ()
DECLARE SUB unamed ()
DECLARE SUB wate ()
DECLARE SUB wepnpr ()
DECLARE SUB wepnstats ()
DECLARE SUB wepz ()
DECLARE FUNCTION windows% (title$, number%, x$())
DECLARE SUB worp (x$)
DECLARE SUB worps (x$)
DECLARE SUB zero ()
DECLARE SUB batrec ()
DECLARE SUB bufm ()
DECLARE SUB decorate ()
DECLARE SUB disband ()
DECLARE SUB drafts ()
DECLARE SUB genup ()
DECLARE SUB movem ()
DECLARE SUB movoff ()
DECLARE SUB offtry ()
DECLARE SUB ofnal ()
DECLARE SUB printit ()
DECLARE SUB promote ()
DECLARE SUB train ()
DECLARE SUB colordisplay ()
DECLARE SUB getdetails ()
DECLARE SUB latlong ()
DECLARE SUB MonoDisplay ()
DECLARE SUB noway ()
DECLARE SUB quit ()
DECLARE SUB setofa ()
DECLARE SUB setofl ()
DECLARE SUB sets ()
DECLARE SUB setuname ()
DECLARE SUB setupdesktop ()
DECLARE SUB uload ()
DECLARE SUB usave ()
DECLARE SUB maxim ()

CLOSE

DIM GloTitle(MAXMENU)           AS MenuTitleType
DIM GloItem(MAXMENU, MAXITEM)   AS MenuItemType
DIM GloWindow(MAXWINDOW)        AS windowType
DIM GloButton(MAXBUTTON)        AS buttonType
DIM GloEdit(MAXEDITFIELD)       AS EditFieldType
DIM GloWindowStack(MAXWINDOW)   AS INTEGER
DIM GloBuffer$(MAXWINDOW + 1, 2)



DIM SHARED force$(37), force(37, 20), force1$(37), delet(50), finame$(15), faccr$(15), far$(30), n1$(37), language$(37), ntype$(30), nation$(37), mess$(4), mess(4)
DIM SHARED fate$(5), happy$(12), prim$(2), brave$(10), lbase(10), able$(10), obase(10), loyal$(10), skill$(10), infl$(10), death$(10), hcase$(13), game$(10), action$(10), action(10, 3)
DIM SHARED weather$(15), weather(15, 4), terrain$(9), terrain(9, 3), tyme$(3), route$(7), route(7, 2)
DIM SHARED batres$(5), batres(5, 2), month$(12), month(12, 1), days$(7), supply$(8), supply(8), repl$(9), repl(9)
DIM SHARED armour$(6), disease$(35), disease(35, 2), morale$(8), ofrale$(8), morale(8, 4), aftbat$(10), aftbat(10, 8)
DIM SHARED type$(21), band$(21, 4), tipe(21, 3), chopper$(21), chopper(21, 2), officer$(61), officer(61, 2), comand$(8), formpos$(75), formpos(75, 12)
DIM SHARED gun$(201), gun(201, 7), musket$(228), musket(228, 6), experience$(7), experience(7, 4), commit$(7), commit(7, 4), class$(26), class(26, 4)
DIM SHARED buffer$(3), tt$(8), wch$(4), hm$(3), uname$(50), wtypem$(10), wtypea$(10)
DIM SHARED detail$(30), tit$(4), tat$(3), tot$(4), na1$(120), na2$(120), na3$(120)
DIM SHARED tirt$(3), ttx$(230), filelist$(80), ttll$(4), ttlox$(5), gatling$(24), gatling(24, 7)
DIM SHARED who$(15), guntype$(9), gatype$(8), mustype$(9), chop$(21, 2), who(15, 10)

priner = FALSE
year = 1904
buffer = 1
clang = 0
latlon = 0


RANDOMIZE TIMER






'
' Set up strings etcetera
'
x = 34
CLS
getdetails
MenuInit
WindowInit
MouseShow
x = Alert(2, "Boots, Boots...|the Campaign and Army Generating Program|Copyright D.B.Millward and S.J.Norburn|1992-1994", 9, 10, 14, 70, "Colour", "Monochrome", "")
IF x = 1 THEN
colordisplay
ELSE
MonoDisplay
END IF
GetBackground 1, 1, 1, 80, back1$
GetBackground 2, 1, MAXROW, MAXCOL, back$
leavegame = FALSE
WHILE NOT leavegame
        kbd$ = MenuInkey$
        WHILE MenuCheck(2)
         GOSUB menutrap
        WEND
WEND
MouseHide
COLOR 15, 0
END

menutrap:
setupdesktop
menu = MenuCheck(0)
item = MenuCheck(1)
SELECT CASE menu
CASE 1
copyright
CASE 2
SELECT CASE item
       CASE 1: newarm
       CASE 2: army = true: newdiv
       CASE 3: army = true: brig
       CASE 4: nat = FALSE: army = true: singu
       CASE 5: wepnpr
       CASE 6: printit
    END SELECT
CASE 3
SELECT CASE item
        CASE 1: usave
        CASE 2: uload
        CASE 3: troopr
        CASE 4: quit
END SELECT
CASE 4: CALL bfchnge(item)
CASE 5
SELECT CASE item
        CASE 1: setofn
        CASE 2: nofficer
        CASE 3: promote
        CASE 4: decorate
        CASE 5: offtry
        CASE 6: revewe
        CASE 7: setofa
        CASE 8: setofl
        CASE 9: movoff
        CASE 10: ofnal
        CASE 11: corpz
END SELECT
CASE 6
SELECT CASE item
        CASE 1: setuname
        CASE 2: disband
        CASE 3: drafts
        CASE 4: redef
        CASE 5: bufm
        CASE 6: movem
        CASE 7: batrec
        CASE 8: genup
        CASE 9: train
        CASE 10: equal
        CASE 11:  sets
        CASE 12: free
        CASE 13: latlong
END SELECT
END SELECT
CLS
header
PutBackground 1, 1, back1$
REM PutBackground 2, 1, back$
RETURN
END

SUB ap (count)
  
av = gun(count, 1)
rof = INT(gun(count, 2) / 6)
er = gun(count, 3) * 100
lr = gun(count, 4) * 150
ef = gun(count, 5)
tp = gun(count, 6)
se = gun(count, 7)
se1! = se / 4
w$ = STR$(se1!) + " kg. "

SELECT CASE tp
CASE 0
  f$ = "Hurling various missiles "
CASE 1
  f$ = "Projecting liquid fire "
CASE 7
  IF se > 255 THEN
    f$ = "Throwing a bomb in excess of "
  ELSE
    f$ = "Throwing a " + w$ + " bomb "
  END IF
CASE 8
  f$ = "Launching a " + w$ + " projectile "
CASE ELSE
  f$ = "Firing a " + w$ + " shell "
END SELECT

IF av > year AND nwep = 1 THEN
ELSE
  wepn = wepn + 1
  review$ = "The " + trim$(gun$(count)) + " a " + trim$(guntype$(tp)) + " "
  IF av = 1830 THEN
    review$ = review$ + "already available in " + STR$(av) + ". "
  ELSE
    review$ = review$ + "first available in " + STR$(av) + ". "
  END IF
  IF rof < 1 THEN
    review$ = review$ + f$ + "at a rate of fire of less than " + STR$(rof) + "rpm. "
  ELSE
    review$ = review$ + f$ + "at a rate of fire of " + STR$(rof) + "rpm. "
  END IF
  review$ = review$ + "Point blank range " + STR$(er) + "m.  Long range " + STR$(lr) + "m.  Efficiency " + STR$(ef) + "%. "
  IF priner THEN CALL worp(review$) ELSE CALL worps(review$)
  PRINT
  IF nwep = 1 AND priner = FALSE THEN
    IF ((wepn MOD 5) = 0) THEN
      wate
      PRINT "Blood and Iron: Data for various pieces of Military Ordnance for the year "; year
      PRINT
    END IF
  END IF
END IF
END SUB

SUB artillery
  dt = gun(wp, 1)
  rf = gun(wp, 2)
  er = gun(wp, 3)
  lr = gun(wp, 4)
  ef = gun(wp, 5)
  tpw = gun(wp, 6)
  se = gun(wp, 7)
  dt2 = gun(wp2, 1)
  rf2 = gun(wp2, 2)
  er2 = gun(wp2, 3)
  lr2 = gun(wp2, 4)
  ef2 = gun(wp2, 5)
  tpw2 = gun(wp2, 6)
  se2 = gun(wp2, 7)
  '
  IF tc > 9 AND tc < 14 THEN
    CALL rendom
    amo = fd * 2 * x2
    IF amo > 60 THEN
      amo = 60 * x2
    END IF
  ELSE
    amo = 180
  END IF
  '

END SUB

SUB artpr

IF trype = 15 THEN
  review$ = review$ + " Manning " + STR$(numan) + " elephants and "
ELSE
  review$ = review$ + " Serving "
END IF
g = gf + gf2
IF g = 0 THEN
  review$ = review$ + "no guns whatsoever. "
ELSE
  IF trype = 20 THEN
    IF gf THEN
      IF gf = 1 THEN
        review$ = review$ + "a single " + trim$(gatling$(wp)) + ". "
      ELSE
        review$ = review$ + STR$(gf) + " " + trim$(gatling$(wp)) + "s. "
      END IF
    END IF
    IF gf2 THEN
      IF gf2 = 1 THEN
        review$ = review$ + " and " + STR$(gf2) + " " + trim$(gatling$(wp2)) + ". "
      ELSE
        review$ = review$ + "and " + STR$(gf2) + " " + trim$(gatling$(wp2)) + "s. "
      END IF
    END IF
  ELSE
    IF gf THEN
      IF gf = 1 THEN
        review$ = review$ + "a single " + trim$(gun$(wp)) + ". "
      ELSE
        review$ = review$ + STR$(gf) + " " + trim$(gun$(wp)) + "s. "
      END IF
    END IF
    IF gf2 THEN
      IF gf2 = 1 THEN
        review$ = review$ + " and " + STR$(gf2) + " " + trim$(gun$(wp2)) + ". "
      ELSE
        review$ = review$ + "and " + STR$(gf2) + " " + trim$(gun$(wp2)) + "s. "
      END IF
    END IF
  END IF
END IF

END SUB

SUB bfchnge (x)
IF x < 4 THEN
  buffer = x
  FOR i = 1 TO 3
    CALL MenuSetState(4, i, 1)
  NEXT i
  CALL MenuSetState(4, x, 2)
ELSE
  C = Alert(4, "Clear all buffers or just buffer " + STR$(buffer), 7, 9, 19, 69, " All ", STR$(buffer), "")
  IF C = 1 THEN
    buffer$(1) = ""
    buffer$(2) = ""
    buffer$(3) = ""
    year = 0
    dayth = 0
    month = 0
    cdate$ = ""
  ELSE
    buffer$(buffer) = ""
  END IF
  buffer = 1
END IF
END SUB

SUB bm1 (buf)
  FOR a = 1 TO 230
    ttx$ = ""
  NEXT a
  counts = 2
  FOR i = 1 TO LEN(buffer$(buf)) STEP 150
    m$ = MID$(buffer$(buf), i, 150)
    ttx$(counts) = " Unit " + STR$(1 + (i - 1) / 150)
    IF i < 1450 THEN
      ttx$(counts) = ttx$(counts) + " "
    END IF
    ttx$(counts) = ttx$(counts) + " " + MID$(m$, 111, 40)
    counts = counts + 1
  NEXT i
  ttx$(1) = " Exit" + SPACE$(31)
  counts = counts - 1

END SUB

SUB brig
CALL natchek
IF army = 0 THEN
ELSE
CALL natcheck1
trype = 0
typ = 0
CALL officrs
logstats (0)

officer = LEN(buffer$(buffer)) / 150
DO UNTIL nunit = 2
  CALL singu
  units = LEN(buffer$(buffer)) / 150
  FOR unit = officer TO units
  CALL grabstats(unit)
    PRINT unit; "). "; TAB(8); uname$
  NEXT unit
  brigade = units - officer
  '
  wate
  IF brigade = 10 THEN
    nunit = Alert(4, "A maximum of 10|units per brigade ", 7, 9, 19, 69, "", "", "")
    nunit = nunit + 1
    ELSE
   nunit = Alert(4, " Another unit in this brigade? ", 7, 9, 19, 69, " Yes ", " No ", "")
   END IF
  '
  header
  IF allnat > 0 AND nunit < 2 THEN
    natchek
  END IF
  '
LOOP
END IF
END SUB

SUB bufq
  middle = FALSE
  bfr = 5
  DO UNTIL bfr < 4
    PRINT
    PRINT " Moving Unit "; unit; " ";
    IF trype THEN
      PRINT " "; uname$
    ELSE
      PRINT comand$(oftyp); chap$
    END IF
    PRINT
    PRINT " Which buffer do you want to move it to ";
    INPUT bfr
  LOOP
  header
  IF LEN(buffer$(bfr)) THEN
    bm1 (bfr)
    middle = true
    stp = LEN(buffer$(bfr))
  ELSE
    middle = FALSE
  END IF

END SUB

SUB campr
  '
  IF trype = 0 THEN
 
    PRINT #8, "-----------------------------------"
    review$ = STR$(unit) + "). " + comand$(oftyp) + chap$
    worp (review$)
    review$ = chap$ + " "
    IF ofw > 100 THEN
      IF ofw > 200 THEN
        review$ = review$ + " was taken with " + RTRIM$(disease$(pest)) + " and unhappily died thereby. "
      ELSE
        review$ = review$ + " was taken ill with " + RTRIM$(disease$(pest)) + " but most happily recovered entirely. "
      END IF
    ELSE
      review$ = chap$ + " " + ofrale$(wm) + ". "
    END IF
    worp (review$)
    PRINT #8, "-----------------------------------"
    PRINT #8,
  ELSE
  
    review$ = STR$(unit) + "). " + uname$
    IF mf = 0 THEN
      wipeote = true
      review$ = review$ + " has ceased to exist due to desertion or natural wastage. "
      worp (review$)
      review$ = ""
    ELSE
      review$ = review$ + ", currently " + STR$(mf) + " " + trim$(experience$(te)) + " " + trim$(type$(trype))
      IF trype > 8 THEN
        artpr
      ELSE
        review$ = review$ + ". "
      END IF
      review$ = review$ + "They " + morale$(wm)
      IF menlos THEN
        casp = INT(menlos / omf * 100)
        SELECT CASE odr
        CASE 1 TO 6
          IF pest > 0 THEN
          IF menlos > 1 THEN
            review$ = review$ + "They have lost " + STR$(menlos) + " men as a result of " + trim$(disease$(pest)) + " and general attrition (" + STR$(casp) + "%). "
          ELSE
          review$ = review$ + "A single unhealthy individual has succombed to " + trim$(disease$(pest)) + ". "
          END IF
          ELSE
          IF menlos > 1 THEN
            review$ = review$ + "They have lost " + STR$(menlos) + " men as a result of straggling, desertion or casualty (" + STR$(casp) + "%). "
          ELSE
          review$ = review$ + "One unfaithful ruffian has deserted. "
          END IF
          END IF
        CASE 7 TO 9
          IF pest > 0 THEN
            mess$ = "from " + RTRIM$(disease$(pest))
          ELSE
            mess$ = "as a result of attrition or desertion"
          END IF
          IF menlos > 1 THEN
            review$ = review$ + "They have lost " + STR$(menlos) + " men in skirmishes with the enemy or " + mess$ + " (" + STR$(casp) + "%). "
          ELSE
            review$ = review$ + "One poor unfortunate has been killed in clashes with the enemy. "
          END IF
        END SELECT
      END IF
    END IF
    worp (review$)
    PRINT #8,
  END IF
  '

END SUB

SUB changit (xx)
DO
  grabstats (xx)
  IF trype = 0 THEN
    uch = Alert(4, "Staff Officer|not unit ", 7, 9, 19, 69, "Leave Routine", "Retry", "")
  ELSE
    CALL statpr
    PRINT "Press any key to continue"
    wate
    u = -1
    DO UNTIL u >= 0 AND u < 13
      u = windows("Choices:", 12, happy$())
    LOOP
    IF u = 0 THEN u = 1
    uch = u
    u = 0
    IF uch > 1 THEN
      tpv! = tpv! - upv!
    END IF
    CALL statpr
    SELECT CASE uch
    CASE 2
      CALL men
    CASE 3
      CALL subu
    CASE 4
      CALL wepz
    CASE 5
      CALL exper
    CASE 6
      CALL commite
    CASE 7
      CALL ttype
    CASE 8
      CALL classs
    CASE 9
      CALL fmtn
    CASE 10
      CALL offch
    CASE 11
      CALL namech
    CASE 12
      CALL deleat(buffer, xx, 1)
    END SELECT
    IF uch < 12 THEN
      omf = mf
      mo = mr
      logstats (starbite)
    END IF
  END IF
LOOP UNTIL uch = 1 OR uch = 12
  
END SUB

SUB checkem

  units = LEN(buffer$(buffer)) / 150
  softyp = 6
  corps = 0
  divn = 0
  bgde = 0
  FOR unit = units TO 1 STEP -1
    
    grabstats (unit)
    IF trype > 0 THEN
      softyp = 6
    ELSE
      softyp = softyp - 1
    END IF
    
    oftyp = softyp
    
    SELECT CASE oftyp
    CASE 6
       bgde = bgde + 1
      divn = divn + 1
       corps = corps + 1
    CASE 5
      divn = divn + 1
      corps = corps + 1
      nsu = bgde
      bgde = 0
      n$ = "Brigade Headquarters"
    CASE 4
      corps = corps + 1
      nsu = divn
      divn = 0
      n$ = "Divisional Headquarters"
    CASE 3
      nsu = corps
      corps = 0
      n$ = "Corps Headquarters"
    CASE 1, 2
      nsu = corps
      corps = 0
      n$ = "Army Headquarters"
    END SELECT
    
    SELECT CASE oftyp
    CASE 1 TO 5
      n$ = n$ + "                                   "
      n$ = LEFT$(n$, 40)
      MID$(m$, 111) = n$
      mo = mr
    END SELECT
    
    IF unit = 1 THEN
      IF trype = 0 THEN
        oftyp = MIN(oftyp, 2)
        nsu = units - 1
      END IF
    END IF
    logstats (starbite)
    
  NEXT unit
  

END SUB

SUB chofal

header
 DO
 choice = windows("Is the officer: ", 10, able$())
 IF choice = 0 THEN noway
 LOOP UNTIL choice > 0

  rendom
  ofa = INT(obase(choice) * x1)
  '

END SUB

SUB chofla
  '
  header
 DO
 choice = windows("Is the officer: ", 10, brave$())
 IF choice = 0 THEN noway
 LOOP UNTIL choice > 0
  ofl = INT(RND(10) + lbase(choice))
  '

END SUB

SUB classch (nv)
  
  z = mr / class(tc, 1)
  z = z * class(nv, 1)
  mr = z

  z = stead / class(tc, 2)
  z = z * class(nv, 2)
  stead = z

  z = fd / class(tc, 3)
  z = z * class(nv, 3)
  fd = z

  z = cc / class(tc, 4)
  z = z * class(nv, 4)
  cc = z

END SUB

SUB classs
DO
  ntc = windows("Troop Class:        ", 21, class$())
  IF ntc = 0 THEN noway
LOOP UNTIL ntc > 0
classch (ntc)
tc = ntc
END SUB

SUB comch (nv)

  z = mr / commit(cmt, 1)
  z = z * commit(nv, 1)
  mr = z
  z = stead / commit(cmt, 2)
  z = z * commit(nv, 2)
  stead = z
  z = fd / commit(cmt, 3)
  z = z * commit(nv, 3)
  fd = z
  z = cc / commit(cmt, 4)
  z = z * commit(nv, 4)
  cc = z
  cmt = nv
  
END SUB

SUB commite
  
PRINT "Present Committment: "; commit$(cmt)
DO
  nte = windows("Committment:", 7, commit$())
  IF nte = 0 THEN noway
LOOP UNTIL nte > 0
CALL comch(nte)

END SUB

SUB copyright

dummy = Alert(4, "Boots, Boots...|the Campaign and Army Generating Program|Copyright D.B.Millward and S.J.Norburn|1992-1994", 9, 10, 14, 70, "", "", "")
END SUB

SUB corpz
sx = LEN(buffer$(buffer))
IF sx = 0 THEN
   junk = Alert(4, "Buffer " + STR$(buffer) + "|is empty.", 7, 9, 20, 69, "", "", "")
ELSE
  units = LEN(buffer$(buffer)) / 150
  header
  IF units < 30 THEN
    PRINT
    PRINT " It is inappropriate to split an army of only "; units; " units into Corps."
    wate
  ELSE
    tryp = 0
    typ = 0
    CALL officrs
    MID$(m$, 111, 20) = "Corps H.Q.          "
    oftyp = 3
    CALL logstats(0)
    moved$ = m$
    PRINT comand$(oftyp); chap$
    CALL genlist(1)
    DO
    choice = windows("To Command which Formations:                             ", count, uname$())
    IF choice < 2 THEN noway
    LOOP UNTIL choice > 1
    officer = VAL(uname$(choice)) - 1
    bfr = buffer
    buffer$(0) = ""
    a = LEN(buffer$(bfr)) / 150
    b = (officer) * 150
    buffer$(0) = MID$(buffer$(bfr), 1, b) + moved$
    buffer$(0) = buffer$(0) + MID$(buffer$(bfr), b + 1)
    buffer$(bfr) = buffer$(0)
    CALL deleat(bfr, a, 1)
   END IF
END IF
header
END SUB

SUB countpts
  
  opv! = 0
  mpv! = 0
  tpv! = 0
  nu = LEN(buffer$(buffer)) / 150
  lowpv! = 100
  FOR aa = 1 TO nu
    grabstats (aa)
    upv! = Points!
    IF trype = 0 THEN
      opv! = opv! + upv!
    ELSE
      mpv! = mpv! + upv!
      IF pv! < lowpv! THEN
        lowpv! = pv!
        lpvu = aa
      END IF
    END IF
  NEXT aa
  tpv! = mpv! + opv!

END SUB

DEFSNG X-Y
SUB countup
  IF trype > 0 THEN
    SELECT CASE trype
    CASE 1 TO 5, 20
      tnb = tnb + mf
      tnbo = tnbo + omf
      tmg = tmg + gf + gf2
    CASE 6 TO 8
      tnh = tnh + mf
      tnho = tnho + omf
    CASE 9 TO 14, 16 TO 19
      tng = tng + gf + gf2
      tna = tna + mf
      tnao = tnao + omf
    CASE 15
      tng = tng + gf + gf2
      tna = tna + mf
      tnao = tnao + omf
      numel = numel + numan
    END SELECT
    ortot = ortot + omf
    '
    cas = omf - mf
    tcas = tcas + cas
    tpris = tpris + prisoner
  END IF
  '
  tpv! = tpv! + upv!
  '

END SUB

DEFINT X-Y
SUB dayad

  '
  DO UNTIL dayth <= dayt
    IF dayth > dayt THEN
      dayt = month(month, 1) + 1
      dayth = dayth - dayt + 1
      month = month + 1
      IF month = 13 THEN
        month = 1
        year = year + 1
      END IF
    END IF
    dayt = month(month, 1) + 1
  LOOP
  '
  r$ = STR$(dayth)
  ordal (dayth)
  cdate$ = r$ + " " + trim$(month$(month)) + " " + STR$(year)
  '
END SUB

SUB deleat (x, y, w)
  '
  IF y = 0 THEN
  ELSE
    p = (y - 1) * 150
    q = p + (w * 150)
    a = LEN(buffer$(x))
    r = a - q
    buffer$(0) = ""
    buffer$(0) = MID$(buffer$(x), 1, p)
    buffer$(0) = buffer$(0) + MID$(buffer$(x), q + 1, r)
    buffer$(x) = buffer$(0)
  END IF
  '

END SUB

SUB equal

IF LEN(buffer$(buffer)) = 0 THEN
  junk = Alert(4, "Buffer " + STR$(buffer) + "|is empty.", 7, 9, 20, 69, "", "", "")
ELSE
  countpts
  header
  PRINT
  PRINT "Points Values: men "; mpv!; " officers "; opv!
  PRINT
  PRINT "Total Points Value is currently: "; tpv!
  PRINT
  PRINT "What is the projected Points Value"
  a! = opv! + mpv! / 2
  b! = mpv! * 2 + opv!
  PRINT "(Possible range: "; a!; " - "; b!; ") ";
  targpv = -1
  DO UNTIL targpv! > a! AND targpv! < b!
    INPUT targpv!
  LOOP
  ttargpv! = targpv! - opv!
  pvm! = ttargpv! / mpv!
  nu = LEN(buffer$(buffer)) / 150
    
  FOR aa = 1 TO nu
    grabstats (aa)
    IF trype = 0 THEN
    ELSE
      z! = mf * pvm!
      mf = INT(z!)
      omf = mf
      logstats (starbite)
    END IF
  NEXT aa
  countpts

  IF tpv! <> targpv! THEN
    grabstats (lpvu)
    z! = (targpv! - tpv!)
    z! = z! / lowpv!
    mad = INT(z!)
    mf = mf + mad
    omf = mf
    logstats (starbite)
  END IF
  header
  PRINT
  PRINT "Points Adjustment complete"
  PRINT
  PRINT "New Points Value is currently: "; tpv!
  PRINT

  CALL wate
  header
END IF
  
END SUB

FUNCTION even (x)
IF x MOD 2 = 0 THEN even = true ELSE even = FALSE
END FUNCTION

SUB expch (nv)
  m = experience(te, 1)
  n = experience(nv, 1)
  z = mr / m
  z = z * n
  mr = z
  m = experience(te, 2)
  n = experience(nv, 2)
  z = stead / m
  z = z * n
  stead = z
  m = experience(te, 3)
  n = experience(nv, 3)
  z = fd / m
  z = z * n
  fd = z
  m = experience(te, 4)
  n = experience(nv, 4)
  z = cc / m
  z = z * n
  cc = z

  te = nv
  
END SUB

SUB exper
  SHARED experience$()
  
  nte = windows("Experience: ", 7, experience$())
  IF nte = 0 THEN EXIT SUB
  CALL expch(nte)

END SUB

SUB fmtn

  ok = FALSE
  DO UNTIL ok = true
   CALL statpr
    PRINT
    PRINT "Present Formation Type: "; trim$(formpos$(fm))
    nfm = windows("Formation Types:        ", 73, formpos$())
    IF nfm = 0 THEN ok = true
    SELECT CASE trype
    CASE 1
      SELECT CASE nfm
      CASE 1, 3, 5, 7, 9, 10, 13, 15, 16, 17, 18, 20, 22, 24, 26, 27 TO 32, 35
        ok = true
      CASE ELSE
        ok = FALSE
      END SELECT
    CASE 2
      SELECT CASE nfm
      CASE 1 TO 36
        ok = true
      CASE ELSE
        ok = FALSE
      END SELECT
    CASE 3 TO 5
      SELECT CASE nfm
      CASE 37 TO 40
        ok = true
      CASE ELSE
        ok = FALSE
      END SELECT
    CASE 6
      SELECT CASE nfm
      CASE 42, 44, 46, 48, 50, 52, 54, 56, 58, 59, 60
        ok = true
      CASE ELSE
        ok = FALSE
      END SELECT
    CASE 7
      SELECT CASE nfm
      CASE 41, 43, 45, 47, 49, 51, 53, 55, 57, 59
        ok = true
      CASE ELSE
        ok = FALSE
      END SELECT
    CASE 8
      SELECT CASE nfm
      CASE 40, 51, 52, 71
        ok = true
      CASE ELSE
        ok = FALSE
      END SELECT
    CASE 9 TO 61, 63, 67, 68
      SELECT CASE nfm
      CASE 5, 6, 7
        ok = true
      CASE ELSE
        ok = FALSE
      END SELECT
    CASE 10
      SELECT CASE nfm
      CASE 62, 63, 67, 68
        ok = true
      CASE ELSE
        ok = FALSE
      END SELECT
    CASE 11
      SELECT CASE nfm
      CASE 63, 64, 67, 68
        ok = true
      CASE ELSE
        ok = FALSE
      END SELECT
    CASE 12, 14
      SELECT CASE nfm
      CASE 63, 65, 66
        ok = true
      CASE ELSE
        ok = FALSE
      END SELECT
    CASE 13
      SELECT CASE nfm
      CASE 64, 69
        ok = true
      CASE ELSE
        ok = FALSE
      END SELECT
    CASE 15
      SELECT CASE nfm
      CASE 72
        ok = true
      CASE ELSE
        ok = FALSE
      END SELECT
    CASE 16 TO 19
      SELECT CASE nfm
      CASE 63, 64, 73
        ok = true
      CASE ELSE
        ok = FALSE
      END SELECT
    CASE 20
      SELECT CASE nfm
      CASE 61, 62, 64, 67, 68, 70
        ok = true
      CASE ELSE
        ok = FALSE
      END SELECT
    END SELECT
    '
    IF ok = FALSE THEN
    CALL statpr
      PRINT
      PRINT "New Formation Type: "; trim$(formpos$(nfm))
 junk = Alert(4, " Not a legal formation|for these troops", 7, 9, 19, 69, "", "", "")

    ELSE
      fm = nfm
    END IF
    '
  LOOP
  '

END SUB

SUB free
header
junk = Alert(4, "There are " + STR$(FRE(buffer$(buffer))) + " bytes available", 7, 9, 19, 69, "", "", "")
END SUB

SUB genlist (x)
 
  grabstats (x)
  units = LEN(buffer$(buffer)) / 150
  uname$(1) = "No units                                 "
  count = 1
  FOR unit = 1 TO units
    grabstats (unit)
    IF trype = 0 THEN
      count = count + 1
      anum$ = STR$(unit) + "    "
      anum$ = LEFT$(anum$, 5) + chap$ + "           "
      uname$(count) = anum$
    END IF
  NEXT unit

END SUB

SUB grabstats (xx)
  starbite = (xx - 1) * 150 + 1
  m$ = MID$(buffer$(buffer), starbite, 150)
  
  ofr = ASC(MID$(m$, 41))
  ofa = ASC(MID$(m$, 42))
  ofi = ASC(MID$(m$, 43))
  ofl = ASC(MID$(m$, 44))
oftyp = ASC(MID$(m$, 45))
  std = ASC(MID$(m$, 46))
  ofw = ASC(MID$(m$, 47))
  numan = ASC(MID$(m$, 48))
  arm = ASC(MID$(m$, 49))
  ow = ASC(MID$(m$, 50))
  trype = ASC(MID$(m$, 51))
  tc = ASC(MID$(m$, 52))
  te = ASC(MID$(m$, 53))
  mo = ASC(MID$(m$, 54))
  stead = ASC(MID$(m$, 55))
  fd = ASC(MID$(m$, 56))
  cc = ASC(MID$(m$, 57))
  mvb = ASC(MID$(m$, 58))
  nsu = ASC(MID$(m$, 59))
  ogf = ASC(MID$(m$, 60))
  fm = ASC(MID$(m$, 61))
  wp = ASC(MID$(m$, 62))
  mw = ASC(MID$(m$, 63))
  omf = CVI(MID$(m$, 64))
  ml = ASC(MID$(m$, 66))
  gl = ASC(MID$(m$, 67))
  amo = ASC(MID$(m$, 68))
  cs = CVI(MID$(m$, 69))
  cmt = ASC(MID$(m$, 74))
  wm = ASC(MID$(m$, 75))
  mr = ASC(MID$(m$, 76))
  gf = ASC(MID$(m$, 77))
  mf = CVI(MID$(m$, 78))
  pw = ASC(MID$(m$, 82))
  ofp = ASC(MID$(m$, 86))
  ag = ASC(MID$(m$, 87))
  so = ASC(MID$(m$, 99))
  rf = ASC(MID$(m$, 91))
  er = ASC(MID$(m$, 92))
  lr = ASC(MID$(m$, 93))
  ef = ASC(MID$(m$, 94))
  tpw = ASC(MID$(m$, 95))
  se = ASC(MID$(m$, 96))
  amot = ASC(MID$(m$, 101))
  gf2 = ASC(MID$(m$, 102))
  wp2 = ASC(MID$(m$, 110))
  '
  IF std = 32 THEN std = 10
  stpr = 100 - stead
  '
  IF trype > 8 THEN
    re = 100
    rf = rf / 5
  ELSE
    re = 10
  END IF
  '
  er = er * re
  lr = lr * re
  '
  IF trype = 0 THEN
    posw = ASC(MID$(m$, 69))
    west = ASC(MID$(m$, 70))
    posn = ASC(MID$(m$, 71))
    north = ASC(MID$(m$, 72))
    IF north = 1 THEN
      lat$ = " south. "
    ELSE
      lat$ = " north "
    END IF
    IF west = 1 THEN
      lon$ = " east "
    ELSE
      lon$ = " west "
    END IF
    IF posw > 0 OR posn > 0 THEN
      pos$ = "current position " + STR$(posw) + lon$ + STR$(posn) + lat$
    END IF
    daytl = ASC(MID$(m$, 91))
    montl = ASC(MID$(m$, 92))
    yearl = ASC(MID$(m$, 93)) + 1829
    pest = ASC(MID$(m$, 94))
    ELSE
    IF cmt = 0 THEN
      cmt = 3
    END IF
  END IF
  '
  uname$ = trim$(RIGHT$(m$, 40))
  chap$ = trim$(officer$(ofr)) + " "
  chap$ = chap$ + trim$(LEFT$(m$, 40))
  '

END SUB

SUB grabstuff
  trype = force(typ, 1)
  tc = force(typ, 2)
  te = force(typ, 3)
  fm = force(typ, 4)
  nsu = force(typ, 5)
  mf = force(typ, 6) * nsu
  ogf = force(typ, 7)
  pw = force(typ, 8)
  cmt = te

  IF ogf THEN
    gf2 = pw
    gf = ogf - gf2
    pw = 100
  ELSE
    gf = 0
    IF pw = 0 THEN
      pw = 100
    END IF
  END IF
  
  wp2 = force(typ, 9)
  arm = force(typ, 10)
  cc = force(typ, 11)
  mr = force(typ, 12)
  stead = force(typ, 13)
  ag = force(typ, 14)
  ofr = force(typ, 15)
  wp = force(typ, 16)
  mw = force(typ, 17)
  fd = force(typ, 18)
  nlang = force(typ, 19)
  amo = force(typ, 20)

  IF trype > 8 AND trype < 20 THEN
    amot = amo
    amo = 180
  ELSE
    amot = 0
  END IF

  mvb = tipe(trype, 1)
  
  stpr = 100 - stead
  IF trype = 15 THEN
    numan = mf / 10
    numan = MAX(numan, ogf)
  END IF

END SUB

SUB handlemenuevent
SELECT CASE kbd$
CASE "menu"
menu = MenuCheck(0)
item = MenuCheck(1)
CASE ELSE
PRINT kbd$
leave = true
END SELECT
END SUB

SUB header
PutBackground 1, 1, back1$
PutBackground 2, 1, back$
setupdesktop
LOCATE 3, 1
PRINT " Boots, Boots... the Blood & Iron Campaign Programme."
IF LEN(cdate$) > 1 THEN
  PRINT " Current Campaign date: "; cdate$
ELSE
  PRINT " No Campaign date set."
END IF
PRINT
END SUB

SUB infantry
dt = musket(wp, 1)
rf = musket(wp, 2)
er = musket(wp, 3)
lr = musket(wp, 4)
ef = musket(wp, 5)
tpw = musket(wp, 6)
  
IF wp2 > 0 THEN
  IF gf = 0 THEN
    dt2 = musket(wp2, 1)
    rf2 = musket(wp2, 2)
    er2 = musket(wp2, 3)
    lr2 = musket(wp2, 4)
    ef2 = musket(wp2, 5)
    tpw2 = musket(wp2, 6)
  ELSE
    dt2 = gatling(wp2, 1)
    rf2 = gatling(wp2, 2)
    er2 = gatling(wp2, 3)
    lr2 = gatling(wp2, 4)
    ef2 = gatling(wp2, 5)
    tpw2 = gatling(wp2, 6)
  END IF
END IF
IF resup = 1 THEN
  IF tc > 9 AND tc < 14 THEN
    CALL rendom
    amo = fd * 2 * x2
    IF amo > 60 THEN
      amo = 60 * x2
    END IF
  ELSE
    amo = 100
  END IF
ELSE
  IF tc > 9 AND tc < 14 THEN
    CALL rendom
    amo = amo * x2
  END IF
END IF

END SUB

SUB keyclear
DO UNTIL INKEY$ = ""
   LOOP
END SUB

SUB logstats (sbt)

IF gf < 0 THEN
  gf = 0
END IF
IF gf2 < 0 THEN
  gf2 = 0
END IF

  MID$(m$, 45) = CHR$(oftyp)
  MID$(m$, 48) = CHR$(numan)
  MID$(m$, 49) = CHR$(arm)
  MID$(m$, 51) = CHR$(trype)
  MID$(m$, 52) = CHR$(tc)
  MID$(m$, 53) = CHR$(te)
  MID$(m$, 54) = CHR$(mo)
  MID$(m$, 55) = CHR$(stead)
  MID$(m$, 56) = CHR$(fd)
  MID$(m$, 57) = CHR$(cc)
  MID$(m$, 58) = CHR$(mvb)
  MID$(m$, 59) = CHR$(nsu)
  MID$(m$, 60) = CHR$(ogf)
  MID$(m$, 61) = CHR$(fm)
  MID$(m$, 62) = CHR$(wp)
  MID$(m$, 63) = CHR$(mw)
  MID$(m$, 64, 2) = MKI$(omf)
  MID$(m$, 68) = CHR$(amo)
  MID$(m$, 74) = CHR$(cmt)
  MID$(m$, 75) = CHR$(wm)
  MID$(m$, 76) = CHR$(mr)
  MID$(m$, 77) = CHR$(gf)
  MID$(m$, 78, 2) = MKI$(mf)
  MID$(m$, 80) = CHR$(5)
  MID$(m$, 82) = CHR$(pw)
  MID$(m$, 87) = CHR$(ag)
  MID$(m$, 101) = CHR$(amot)
  MID$(m$, 102) = CHR$(gf2)
  MID$(m$, 110) = CHR$(wp2)
  IF trype = 0 THEN
    IF year > 1829 THEN
      a = year - 1829
    ELSE
      a = 0
    END IF
    MID$(m$, 91) = CHR$(dayth)
    MID$(m$, 92) = CHR$(month)
    MID$(m$, 93) = CHR$(a)
    MID$(m$, 94) = CHR$(pest)
    '
  END IF
  '
  REM PRINT "Before adding m$"; LEN(buffer$(buffer))
  IF sbt = 0 THEN
    buffer$(buffer) = buffer$(buffer) + m$
  ELSE
    MID$(buffer$(buffer), sbt, 150) = m$
  END IF

END SUB

FUNCTION MAX (x, y)
IF x > y THEN MAX = x ELSE MAX = y
END FUNCTION

SUB maxim

dt = gatling(wp, 1)
rf = gatling(wp, 2)
er = gatling(wp, 3)
lr = gatling(wp, 4)
ef = gatling(wp, 5)
tpw = gatling(wp, 6)

IF wp2 > 0 THEN
  dt2 = gatling(wp2, 1)
  rf2 = gatling(wp2, 2)
  er2 = gatling(wp2, 3)
  lr2 = gatling(wp2, 4)
  ef2 = gatling(wp2, 5)
  tpw2 = gatling(wp2, 6)
END IF

amo = 250
END SUB

SUB men
 
  '
  mf = 0
  DO UNTIL mf > 0 AND mf < 65000
 PRINT
    PRINT "How many men ";
    INPUT mf
  LOOP
  '
  MID$(m$, 64) = MKI$(mf)
  MID$(m$, 78) = MKI$(mf)
  '

END SUB

SUB mgp (count)
av = gatling(count, 1)
rof = gatling(count, 2) * 5
er = gatling(count, 3) * 10
lr = gatling(count, 4) * 10
ef = gatling(count, 5)
tp = gatling(count, 6)

IF av > year AND nwep = 1 THEN
ELSE

  wepn = wepn + 1
  review$ = "The " + trim$(gatling$(count)) + " "
  IF tp = 5 THEN
    review$ = review$ + "an "
  ELSE
    review$ = review$ + "a "
  END IF
  review$ = review$ + trim$(gatype$(tp)) + " "
  IF av = 1830 THEN
    review$ = review$ + "already available in 1830. "
  ELSE
    review$ = review$ + "first available in " + STR$(av) + ". "
  END IF
  review$ = review$ + "Rate of fire " + STR$(rof) + "rpm. "
  review$ = review$ + "Effective range " + STR$(er) + "m.  Long range " + STR$(lr) + "m.  Efficiency " + STR$(ef) + " ."

  IF priner THEN CALL worp(review$) ELSE CALL worps(review$)
  PRINT
  IF nwep = 1 AND priner = FALSE THEN
    IF ((wepn MOD 5) = 0) THEN
      wate
      PRINT "Blood and Iron: Data for various Mechanical Repeating Guns for the year "; year
      PRINT
    END IF
  END IF
END IF

END SUB

FUNCTION MIN (a, b)
IF a < b THEN
MIN = a
ELSE
MIN = b
END IF
END FUNCTION

SUB modexp

IF menlos > 0 OR prisoner > 0 THEN
SELECT CASE bres
    CASE 1, 2
      mr = MAX(mr, mo)
      SELECT CASE te
      CASE 1
        comch (2)
      CASE 2, 3
        v = te - 1
        expch (v)
        v = MAX(1, cmt - 1)
        comch (v)
      CASE 4, 5
        expch (3)
      CASE 7
        v = MAX(1, cmt - 1)
        comch (v)
      END SELECT
    CASE 3
      SELECT CASE te
      CASE 2, 3
        v = te - 1
        expch (v)
      CASE 4, 5
        expch (3)
      END SELECT
    CASE 4
      SELECT CASE te
      CASE 1
        v = MIN(7, cmt + 1)
        comch (v)
      CASE 2, 3
        v = MIN(7, cmt + 1)
        comch (v)
      CASE 4, 5
        expch (3)
        v = MIN(7, cmt + 1)
        comch (v)
      CASE 7
        v = MIN(3, cmt + 1)
        comch (v)
      END SELECT
    CASE 5
      SELECT CASE te
      CASE 1
        v = MIN(7, cmt + 2)
        comch (v)
      CASE 2, 3
        v = MIN(7, cmt + 2)
        comch (v)
      CASE 4, 5
        expch (3)
        v = MIN(7, cmt + 3)
        comch (v)
      CASE 7
        v = MIN(3, cmt + 1)
        comch (v)
      END SELECT
    END SELECT
  END IF
END SUB

SUB modlos
  morlos = mo - mr
  rendom
  z = morlos
  k = aftbat(tact, 4)
  z = z * k / 100 * x1
  morlos = INT(z)

  k = aftbat(enmact, 5)
  xlos = mr / 100
  xlos = xlos * k * xs
  k = morale(wm, 3)
  xlos = xlos * k / 100
  xlos = xlos * 50 / ofa
  xlos = xlos * (stead + 10) / 20
  xlos = INT(xlos)
  morlos = morlos + xlos
  morlos = MIN(morlos, mo)
  mr = mo - morlos
  SELECT CASE mr
  CASE 0
    wm = 8
  CASE 1 TO 10
    wm = 7
  CASE 11 TO 30
    wm = 6
  CASE 31 TO 40
    wm = 5
  CASE 41 TO 50
    wm = 4
  CASE 51 TO 70
    wm = 3
  CASE 71 TO 90
    wm = 2
  CASE ELSE
    wm = 1
  END SELECT
  
  menlos = omf - mf
  rendom
  k = aftbat(tact, 2)
  z = menlos / 100
  z = z * k * x1
  menlos = INT(z)
  menlos = MIN(omf, menlos)

  k = aftbat(enmact, 3)
  xlos = mf / 100
  xlos = xlos * k * xs
  xlos = xlos * morale(wm, 3) / 100
  xlos = xlos * 50 / ofa
  xlos = INT(xlos * (stead + 50) / 100)
  IF trype > 2 AND trype < 9 THEN
    xlos = INT(xlos / 2)
  END IF
  IF xlos = 1 THEN
    xlos = xlos + 1
  END IF
  
  mf = omf - menlos
  prisoner = INT(xlos)
  prisoner = MIN(prisoner, mf)
  prisoner = MAX(prisoner, 0)
  mf = mf - prisoner
  IF trype > 8 THEN
    gunlos = ogf - (gf + gf2)
    a = morlos / mo * 100
    b = menlos / omf * 100
    k = MAX(a, b)
    a = aftbat(tact, 6) + aftbat(enmact, 7)
    k = k * a
    IF gf THEN
      FOR a = 1 TO gf
        rendom
        IF x < k THEN
          gf = gf - 1
        END IF
      NEXT a
    END IF
    IF gf2 THEN
      FOR a = 1 TO gf2
        rendom
        IF x < k THEN
          gf2 = gf2 - 1
        END IF
      NEXT a
    END IF
    ogf = gf + gf2
  END IF
  '
  morec = morlos * ofa / 70
  morec = MIN(morlos, morec)
  mr = mr + morec
  mo = mr
  END SUB

SUB mstring
 
  m$ = STRING$(49, " ") + STRING$(25, 0) + CHR$(1) + "d" + STRING$(3, 0) + CHR$(5) + CHR$(0) + CHR$(60) + STRING$(14, 0) + CHR$(10) + CHR$(10) + CHR$(0) + CHR$(0)
  MID$(m$, 75) = CHR$(1)
  MID$(m$, 90) = CHR$(1)
  m$ = m$ + SPACE$(50)
  MID$(m$, 101) = CHR$(3)
  '
  '   type of officer: 0=army without corps, 1=army with corps, 2=corps, 3=division, 4=brigade, 5=unit
  '
  '  chap$=left$(t$,40)             ! officer's name
  '  ofr=ASC(MID$(t$,41))           ! officer's rank
  '  ofa=ASC(MID$(t$,42))           ! officer's ability
  '  ofi=ASC(MID$(t$,43))           ! officer's influence
  '  ofl=ASC(MID$(t$,44))           ! officer's loyalty/bravery
  '  oftyp=ASC(MID$(t$,45))         ! type of officer
  '  std=ASC(MID$(t$,46))           ! Colours
  '  ofw=ASC(MID$(t$,47))           ! Officer wounds etc
  '  numan=ASC(MID$(t$,48))         ! number of elephants etc
  '  arm=ASC(MID$(t$,49))           ! armour
  '  ow=ASC(MID$(t$,50))            ! unit officer is with or officer with unit
  '  trype=ASC(MID$(t$,51))         ! Troop type
  '  tc=ASC(MID$(t$,52)             ! Troop class
  '  te=ASC(MID$(t$,53)             ! Troop experience
  '  mo=ASC(MID$(t$,54))            ! Original morale
  '  stead=ASC(MID$(t$,55))         ! Steadfastness
  '  fire_d=ASC(MID$(t$,56))        ! fire discipline
  '  com_con=ASC(MID$(t$,57))       ! command control
  '  move_bas=ASC(MID$(t$,58))      ! basic move distance
  '  num_sub=ASC(MID$(t$,59))       ! number of sub units
  '  ogf=ASC(mid$(t$,60)            ! original number of guns
  '  fp=ASC(MID$(t$,61))            ! acceptable formations line
  '  wp=ASC(MID$(t$,62)             ! weapon
  '  mw=ASC(MID$(t$,63))            ! melee weapon
  '  or_st=CVI(MID$(t$,64,2))       ! original strength
  '  mor_loss=ASC(MID$(t$,66))      ! morale loss
  '  gun_loss=ASC(MID$(t$,67))      ! guns lost
  '  am=ASC(MID$(t$,68))            ! ammunition
  '  cs=CVI(MID$(t$,69,2))          ! Casualties
  '  form=ASC(MID$(t$,71))          ! Current formation
  '  mov=ASC(MID$(t$,72))           ! distance moved
  '  disorg=ASC(MID$(t$,73))        ! disorganisation
  '  cmt=ASC(MID$(t$,74))           ! committment
  '  wm=ASC(MID$(t$,75))            ! worst morale
  '  mr=ASC(MID$(t$,76))            ! current morale
  '  gf=ASC(MID$(t$,77))            ! guns fired
  '  mf=CVI(MID$(t$,78,2))          ! men in unit
  '  od=ASC(MID$(t$,80))            ! current order
  '  ms=ASC(MID$(t$,81))            ! moves since shot at
  '  pw=ASC(MID$(t$,82))            ! % with weapon
  '  pf=ASC(MID$(t$,83))            ! sub units fired
  '  aw=ASC(MID$(t$,84))            ! Ammunition wagon with or who it is with
  '  tr=ASC(MID$(t$,85))            ! Terrain in
  '  sb=ASC(MID$(t$,86))            ! ** the last spare byte **
  '  ag=ASC(MID$(t$,87))            ! Agression
  '  targ=ASC(MID$(t$,88))          ! artillery target
  '  charge=ASC(MID$(t$,89))        ! Charging this turn
  '  pm=ASC(MID$(t$,90))            ! Morale at start of move
  '  rf=ASC(MID$(t$,91))            ! rate of fire
  '  er=ASC(MID$(t$,92))            ! efective range
  '  lr=ASC(MID$(t$,93))            ! long range
  '  ef=ASC(MID$(t$,94))            ! efficiency
  '  tpw=ASC(MID$(t$,95))           ! lock type
  '  se=ASC(MID$(t$,96))            ! shell effect
  '  mi=ASC(MID$(t$,97))            ! melee vs infantry
  '  mc=ASC(MID$(t$,98))            ! melee vs cavalry
  '  so=ASC(MID$(t$,99))            ! staff officer with
  '  shot=ASC(MID$(t$,100))         ! fired this move or ever
  '  cf=ASC(mid$(t$,101))           ! comittment factor (3 to start with)
  '  gf2=ASC(mid$(t$,102))          ! number of guns with 2ndy weapon or %2ary W
  '  rf2=ASC(MID$(t$,103))          ! rate of fire of 2ndy weapon
  '  er2=ASC(MID$(t$,104))          ! effective range of "
  '  lr2=ASC(MID$(t$,105))          ! long       "     " "
  '  ef2=ASC(MID$(t$,106))          ! efficiency of      "
  '  tpw2=ASC(MID$(t$,107))         ! lock type of       "
  '  se2=ASC(MID$(t$,108))          ! shell effect       "
  '  fear=ASC(MID$(t$,109)          ! percieved threat to unit
  '  wp2=ASC(MID$(t$,110))          ! 2nd weapon
  '  unit_name$=mid$(t$,111,40)     ! unit name
  '

END SUB

SUB namech
 
 PRINT
  PRINT "What is the new name is to be: ";
  MID$(m$, 111, 40) = SPACE$(40)
  name$ = ""
  DO UNTIL LEN(name$) > 0 AND LEN(name$) < 41
  LINE INPUT name$
  LOOP
  MID$(m$, 111) = name$
  '

END SUB

SUB natans
troop = true
header
area = -1
DO UNTIL area >= 0
  area = windows("Areas:", 13, finame$())
LOOP
IF area = 0 THEN
area = 0
EXIT SUB
ELSE
patx$ = cmd$ + faccr$(area)
OPEN patx$ FOR INPUT AS #1
INPUT #1, title$, ntype$
ntype = VAL(ntype$)

FOR i = 1 TO ntype
  INPUT #1, detail$(i), na1$(i), language$(i), ntype$(i)
  detail$(i) = " " + detail$(i) + "                                  "
  detail$(i) = LEFT$(detail$(i), 45)
NEXT i
CLOSE #1
header
army = -1
DO UNTIL army > -1
  army = windows(title$, ntype, detail$())
LOOP
  IF army = 0 THEN
  area = 0
  army = 0
  EXIT SUB
 ELSE
title$ = detail$(army)
header
review$ = "Loading many and various pieces of information about the " + RTRIM$(title$) + ", please wait......"
worps (review$)
nlang = VAL(language$(army))
patxx$ = cmd$ + far$(area)
OPEN patxx$ FOR INPUT AS #1
x = LOF(1)
tdat$ = STRING$(x, " ")
DEF SEG = SSEG(tdat$)
BLOAD patxx$, SADD(tdat$)
CLOSE #1
DEF SEG
OPEN patx$ FOR INPUT AS #2
offs = -89
INPUT #2, a$, a$
FOR i = 1 TO army
INPUT #2, title$, a, lang, numtroops
FOR k = 1 TO numtroops
  offs = offs + 90
  x$ = MID$(tdat$, offs, 50)
  force$(k) = x$
  FOR l = 1 TO 39 STEP 2
    x = CVI(MID$(tdat$, offs + 50 + l - 1))
    force(k, l \ 2 + 1) = x
  NEXT l
  IF k > 1 THEN force1$(k - 1) = force$(k)
NEXT k
 NEXT i
CLOSE #1
CLOSE #2
END IF
END IF
END SUB

SUB natcheck1

allnat = Alert(4, "Is the Brigade ALL |the same nationality", 9, 10, 14, 70, "Yes", "No", "") - 1
END SUB

SUB natchek
 
 IF nlang > 0 THEN
  nat = Alert(4, "Are the troops of |the same nationality", 9, 10, 14, 70, " Yes", " No ", "")
  IF nat = 2 THEN
  CALL natans
    END IF
  ELSE
  nat = Alert(4, "Enter the Nationality ", 9, 10, 14, 70, "", "", "")
 CALL natans
  END IF
  '
END SUB

SUB newarm
CLS
buffer$(buffer) = ""
n$ = "Army Headquarters"
oftyp = 0

CALL natans
IF area = 0 THEN
ELSE
  trype = 0
  typ = 0
  CALL officrs
  CALL logstats(0)
  div = Alert(4, " Create a Division ", 7, 9, 19, 69, " No ", " Yes ", "")
  IF div = 2 THEN
    CALL newdiv
  ELSE
    bgde = 0
    DO UNTIL bgde = 2
      bgde = Alert(4, " Create a Brigade ", 7, 9, 19, 69, " Yes ", " No ", "")
      IF bgde = 1 THEN
        CALL brig
      END IF
    LOOP
  END IF
END IF
END SUB

SUB newdiv
CLS
n$ = "Divisional Headquarters"
natchek
IF army = 0 THEN
ELSE
oftyp = 2
typ = 0
trype = 0
CALL officrs
logstats (0)
'
DO UNTIL bgde = 2
  bgde = Alert(4, " Create a Brigade ", 7, 9, 19, 69, " Yes ", " no  ", "")
  IF bgde = 1 THEN
    brig
  END IF
CLS
LOOP
END IF
END SUB

SUB nofficer

 ofc = 0
  DO UNTIL ofc = 2
    n$ = "Staff Headquarters"
    oftyp = 5
    trype = 0
    typ = 0
    troop = FALSE
    officrs
    logstats (0)
    '
 ofc = Alert(4, " Create another|Officer ", 7, 9, 20, 69, " Yes ", " No  ", "")
  LOOP
  '

END SUB

FUNCTION ODD (x)
IF x MOD 2 = 0 THEN ODD = FALSE ELSE ODD = true
END FUNCTION

SUB offch
  '
 wofch = Alert(4, " Change Officer's ", 7, 9, 20, 69, " Rank ", " Nation ", "")
  IF wofch = 2 THEN
    offnat
    IF offname = true THEN
    n1$ = autoname(ofn)
    ELSE
      PRINT TAB(5); "What is the name of the officer"
      PRINT TAB(5);
      n1$ = ""
      DO UNTIL LEN(n1$) > 0
        LINE INPUT n1$
      LOOP
    END IF
  ELSE
    offrank
  END IF
  n1$ = n1$ + "                 "
  off$ = LEFT$(n1$, 40)
  MID$(m$, 1) = off$
  MID$(m$, 41) = CHR$(ofr)
  chap$ = trim$(of$) + " " + trim$(off$)
  '

END SUB

SUB officrs
  
  IF trype = 0 THEN
    mstring
  END IF
  
  IF nlang < 1 THEN
    natchek
  END IF
  IF offname = true THEN
    off$ = autoname(nlang)
ELSE
    header
    PRINT TAB(5); "What is the name of the officer ";
   off$ = ""
   DO UNTIL LEN(off$) > 0 AND LEN(off$) < 41
      LINE INPUT off$
   LOOP
   n1$ = off$
  END IF
  IF typ > 0 THEN
  ELSE
    offrank
  END IF
  
  ofp = 100
  header
  of$ = officer$(ofr)
  chap$ = trim$(of$) + " " + trim$(off$)
  rendom
  k = INT(18 * xs) + 1
  oft = 11 - force(1, k)
  oft = MAX(oft, 1)
  oft = MIN(oft, 10)
  ofa = INT(obase(oft) * x1)

  rendom
  IF chofa THEN
    IF allofa THEN
  CALL chofal
    ELSE
      IF trype = 0 THEN
      CALL chofal
      END IF
    END IF
  END IF
  '
  IF chofl THEN
    IF allofl THEN
      chofla
    ELSE
      IF trype = 0 THEN
        chofla
      END IF
    END IF
  ELSE
    rendom
    ofl = (100 - 30) * xs + 30
    IF area = 1 AND trype = 6 THEN
      IF ODD(ofl) THEN
        ofl = ofl + 1
      END IF
    END IF
  END IF

  rendom
  i = officer(ofr, 2)
  ofi = (100 - i) * xs + i
  off$ = off$ + "                              "
  off$ = LEFT$(off$, 40)
  '
  MID$(m$, 1) = off$
  MID$(m$, 45) = CHR$(oftyp)
  MID$(m$, 41) = CHR$(ofr)
  MID$(m$, 42) = CHR$(ofa)
  MID$(m$, 43) = CHR$(ofi)
  MID$(m$, 44) = CHR$(ofl)
  MID$(m$, 86) = CHR$(ofp)
  
  IF trype = 0 THEN
    '
    mr = MAX(ofl * 3 / 2, 75)
    mo = mr
    stead = MAX((120 - ofl) / 4, 5)
    cc = force(2, 11)
    pw = ofa / 20 + 2
    
    MID$(m$, 51) = CHR$(trype)
    MID$(m$, 54) = CHR$(mr)
    MID$(m$, 55) = CHR$(stead)
    MID$(m$, 57) = CHR$(cc)
    MID$(m$, 76) = CHR$(mr)
    MID$(m$, 80) = CHR$(10)
    MID$(m$, 82) = CHR$(pw)
    
    MID$(m$, 111) = "Staff Headquarters"
    upv! = Points!
    PRINT " Newly Created Officer :"
    PRINT
   PRINT " "; trim$(officer$(ofr)); " "; trim$(off$); ", points value: "; upv!


    wate
    header
  END IF
  '
END SUB

SUB offnat
 DO
 ofn = windows("Officers Nationality:", 30, nation$())
 IF ofn = 0 THEN noway
 LOOP UNTIL ofn > 0
END SUB

SUB offrank
 DO
 ofr = windows("Officers Rank:", 51, officer$())
 IF ofr = 0 THEN noway
 LOOP UNTIL ofr > 0
END SUB

SUB ofnch
 
  PRINT "Officer's present name is:        "; MID$(m$, 1, 40)
  PRINT
  PRINT "What is the new name is to be: ";
  MID$(m$, 1, 40) = SPACE$(40)
  name$ = ""
  DO UNTIL LEN(name$) > 0 AND LEN(name$) < 41
  LINE INPUT name$
  LOOP
  name$ = name$ + "                         "
  name$ = LEFT$(name$, 40)
  MID$(m$, 1) = name$
END SUB

SUB ordal (n)

  r$ = STR$(n)
  SELECT CASE n
  CASE 1, 21, 31, 41, 51, 61, 71, 81, 91
    r$ = r$ + "st"
  CASE 2, 22, 32, 42, 52, 62, 72, 82, 92
    r$ = r$ + "nd"
  CASE 3, 23, 33, 43, 53, 63, 73, 83, 93
    r$ = r$ + "rd"
  CASE ELSE
    r$ = r$ + "th"
  END SELECT
  '

END SUB

SUB po1
top:
k = 0
ON LOCAL ERROR GOTO pxx
  CLOSE #8
 ok = FALSE
  k = Alert(4, " List to Screen or Printer", 11, 20, 15, 62, " Screen ", " Printer ", "")
IF k = 1 THEN
    OPEN "SCRN:" FOR OUTPUT AS #8
    priner = FALSE
  ELSE
    OPEN "LPT1:" FOR OUTPUT AS #8
    priner = true
  PRINT #8, " "
  END IF
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
RESUME top
END SUB

FUNCTION Points!
 IF trype = 0 THEN
    Points! = INT(ofa * ofl / 5) + 1000
  ELSE
    erf = er / 10
    IF trype > 8 AND trype < 20 THEN
      pt! = (se + 1) / 3 + 1
    ELSE
      pt! = 1
    END IF
    
    pww! = rf * erf / 20
    pww! = pww! * ef * pt!
    
    pv! = (fd + cc) * mr / stead + 30
    pv! = (pv! + pww!) / 100
    Points! = INT(pv! * mf)
  END IF

END FUNCTION

SUB position

MID$(m$, 82) = CHR$(pw)
MID$(m$, 69) = CHR$(posw)
MID$(m$, 70) = CHR$(west)
MID$(m$, 71) = CHR$(posn)
MID$(m$, 72) = CHR$(north)
END SUB

SUB redef
  '
'
  units = LEN(buffer$(buffer)) / 150
  IF units = 0 THEN
    junk = Alert(4, "Buffer " + STR$(buffer) + "|is empty.", 7, 9, 19, 69, "", "", "")
    ELSE
    leave = 1
    DO UNTIL leave = 0
      header
      '
      PRINT
      PRINT "Which unit do you wish to change ";
      unit = -1
       DO UNTIL unit >= 0 AND unit <= units
        INPUT unit
      LOOP
      IF unit > 0 THEN
   
      uch = 0
          CALL changit(unit)
          header

        ELSE
        leave = 0
      END IF
    LOOP
    header
  END IF
  '

END SUB

SUB rendom

  xs = RND
  x = INT(RND * 100 + 1)
  x1 = RND * .4 + .8
  x2 = RND * .5 + .5
END SUB

SUB repem

DO UNTIL rep = 0
units = LEN(buffer$(buffer)) / 150
header
PRINT "Taking a fresh draft of reinforcements into the Army of"
CALL grabstats(1)
PRINT chap$
PRINT
PRINT rep; " replacements available."
PRINT
PRINT "Which unit is to be reinforced ";
unit = -1
DO UNTIL unit >= 0 AND unit <= units
INPUT unit
LOOP
IF unit <> 0 THEN
CALL grabstats(unit)
IF trype = 0 THEN
 junk = Alert(1, "Staff Officer not unit ", 10, 10, 60, 40, "", "", "")
ELSE
 CALL statpr
  PRINT
  review$ = "How many of the " + STR$(rep) + " men available are assigned to the " + uname$
  CALL worps(review$)
  PRINT ;
 INPUT r
  r = MAX(r, 0)
  r = MIN(r, rep)
  rep = rep - r
  mf = mf + r
  IF r > mf / 10 THEN
    stead = stead + (r ^ 2 / mf / tr)
    stead = MIN(stead, 200)
  END IF
 IF trype > 8 THEN
    PRINT "How many primary guns are to be added ";
    INPUT a
    gf = gf + a
  END IF
  CALL logstats(starbite)
  END IF
ELSE
rep = 0
END IF
LOOP
END SUB

SUB replce
  '
  grabstats (unit)
  typ = 1
  officrs
  logstats (starbite)
  '

END SUB

SUB revewe
  
header
units = LEN(buffer$(buffer)) / 150
 
IF units = 0 THEN
  ok = Alert(4, "No troops in this buffer", 7, 9, 20, 69, "", "", "")
  
ELSE
  header
  PRINT
  PRINT "Which officer (number please) is reviewing them ";
  unit = -1
   
  DO
    INPUT unit
  LOOP WHILE unit < 0 OR unit > units
      
  IF unit = 0 THEN
    ext = 1
  ELSE
    grabstats (unit)
    rev = unit
    IF unit = nu THEN
      lf = 1
      pff = 1
    ELSE
      IF even(ofa) THEN
        lf = ofa / 125
        pff = ofa / 100
      ELSE
        lf = (100 - ofa) / 80 + 1
        pff = (100 - ofa) / 100 + 1
      END IF
    END IF
    CALL po1
    header
    PRINT #8, "Officer review performed by "; chap$; "."
    PRINT #8,
    FOR unit = 1 TO units
      grabstats (unit)
      pofa = INT(ofa * pff / 10)
      pofa = MIN(pofa, 10)
      pofa = MAX(pofa, 1)
      pofi = INT(ofi * lf / 10)
      pofi = MIN(pofi, 10)
      pofi = MAX(pofi, 1)
      pofl = INT(ofl * lf / 10)
      pofl = MIN(pofl, 10)
      pofl = MAX(pofl, 1)
      pofc = ofl

      IF even(pofc / 2) THEN
        pofc = pofc * 2
      ELSE
        IF even(pofc) THEN
          pofc = pofc * 3 / 2
        END IF
      END IF
      sofc = pofc
      pofc = pofc / 10
      IF pofc > 10 THEN
        pofc = (pofc - 10) / 3 + 10
      END IF
      pofc = MIN(pofc, 13)

      IF rev = unit THEN
      ELSE
        review$ = STR$(unit) + "). " + uname$ + ". "
        review$ = review$ + "The commander, " + chap$ + " is" + loyal$(pofl)
        lk$ = "and "
        IF (pofl > 4 AND pofi < 5) OR (pofl < 5 AND pofi > 4) THEN
          lk$ = "however, "
        END IF

        review$ = review$ + lk$ + infl$(pofi) + " " + skill$(pofa)
        lk$ = " and "
        IF (pofa > 4 AND (pofc < 5 OR pofc > 9)) OR (pofa < 5 AND (pofc > 4 OR pofc < 9)) THEN
          lk$ = " but, "
        END IF

        review$ = review$ + lk$ + hcase$(pofc) + " "
        CALL worp(review$)
          
          
        PRINT #8,
      END IF
      IF priner = FALSE AND even(unit) THEN
        wate
      END IF
    NEXT unit
    IF priner = true THEN
      PRINT #8, CHR$(12)
    ELSE
      wate
    END IF
  END IF
END IF
header

END SUB

SUB sap (count)
av = musket(count, 1)
rof = musket(count, 2)
er = musket(count, 3) * 10
lr = musket(count, 4) * 10
ef = musket(count, 5)
tp = musket(count, 6)

IF av > year AND nwep = 1 THEN
ELSE

  wepn = wepn + 1
  review$ = "The " + trim$(musket$(count)) + " "
  IF tp = 5 THEN
    review$ = review$ + "an "
  ELSE
    review$ = review$ + "a "
  END IF
  review$ = review$ + trim$(mustype$(tp)) + " "
  IF av = 1830 THEN
    review$ = review$ + "already available in 1830. "
  ELSE
    review$ = review$ + "first available in " + STR$(av) + ". "
  END IF
  review$ = review$ + "Rate of fire " + STR$(rof) + "rpm. "
  review$ = review$ + "Effective range " + STR$(er) + "m.  Long range " + STR$(lr) + "m.  Efficiency " + STR$(ef) + " ."

  IF priner THEN CALL worp(review$) ELSE CALL worps(review$)
  PRINT
  IF nwep = 1 AND priner = FALSE THEN
    IF ((wepn MOD 5) = 0) THEN
      wate
      PRINT "Blood and Iron: Data for various Military Small Arms for the year "; year
      PRINT
    END IF
  END IF
END IF
END SUB

SUB sentence
  header
  PRINT "What will "; chap$; " be sentenced to:"
  ttlox$(1) = " Immediate Death         "
  ttlox$(2) = " Death by due process    "
  ttlox$(3) = " Hard Labour             "
  ttlox$(4) = " Dishonourable Discharge "
  ttlox$(5) = " A Salutory Fine         "
 DO
 fate = windows("  Disciplinary Procedure   ", 5, ttlox$())
 IF fate = 0 THEN noway
 LOOP UNTIL fate > 0


END SUB

SUB setdate

  
   DO
    header
    PRINT aname$
    PRINT
    PRINT "What year is it (1830-1904) ";
    INPUT year
  LOOP UNTIL year > 1829 AND year < 1905
  DO
  month = windows("What is the month:", 12, month$())
  IF month = 0 THEN noway
  LOOP UNTIL month > 0
 dayth = 0
  DO UNTIL dayth > 0 AND dayth <= dayt
    header
    PRINT aname$
    PRINT
    PRINT "What date in "; trim$(month$(month)); " "; year; " ";
    INPUT dayth
    dayt = month(month, 1)
    IF year / 4 = INT(year / 4) AND month = 2 THEN
      dayt = dayt + 1
    END IF
  LOOP
  '
END SUB

SUB setofn

IF offname THEN
    offname = FALSE
CALL MenuSetState(5, 1, 1)
ELSE
    offname = true
CALL MenuSetState(5, 1, 2)
END IF
END SUB

SUB singu
header
IF nat = FALSE THEN
  natchek
END IF
IF army = 0 THEN
ELSE
  oftyp = 4
  n$ = "New Unit"
  DO
    typ = windows(title$, numtroops - 1, force1$()) + 1
    IF typ = 1 THEN noway
  LOOP UNTIL typ > 1

  CALL mstring
  CALL grabstuff
  CALL officrs
  CALL unamed
  MID$(m$, 111) = uname$
  CALL strength
  CALL wepnstats

mo = mr
wm = 1
CALL logstats(0)
unit = LEN(buffer$(buffer)) / 150
pointz = true
uch = 0

DO
  CALL changit(unit)
LOOP UNTIL uch = 1 OR uch = 12
CALL keyclear

pointz = FALSE

IF uch < 8 THEN
  rendom
  mr = INT(mr * x1)
  rendom
  stead = INT(stead * x1)
  rendom
  fd = INT(fd * x1 * (ofa + 230) / 300)
  rendom
  mvb = INT(mvb * x1)
  rendom
  cc = INT(cc * x1 + 1)
  rendom
  ag = INT(ag * x1)
  IF cc < 30 AND pw < 90 THEN
    rendom
    pw = INT(pw * x1)
  END IF
  '
  starbite = (unit - 1) * 150 + 1
  logstats (starbite)
END IF
END IF
header

END SUB

DEFSNG X-Y
SUB sortit (k)
IF trype = 0 THEN
ELSE
ogf = ogf - gl
ogf = MAX(ogf, 0)
gl = 0
mf = mf - cs
mf = MAX(mf, 0)
cs = 0
mr = mr - ml
mr = MAX(0, mr)
ml = 0
CALL logstats(starbite)
END IF
END SUB

DEFINT X-Y
SUB statpr
 
  header
  CALL worps(uname$)
  PRINT
  review$ = STR$(INT(mf)) + " " + trim$(experience$(te)) + " " + trim$(class$(tc)) + " "
  review$ = review$ + trim$(type$(trype)) + " in "
  SELECT CASE tc
  CASE 1 TO 9, 14 TO 18, 20, 22
    IF nsu = 1 THEN
      review$ = review$ + "a single " + trim$(band$(trype, 1))
    ELSE
      review$ = review$ + STR$(nsu) + " " + trim$(band$(trype, 2))
    END IF
  CASE ELSE
    IF nsu = 1 THEN
      review$ = review$ + "a single " + trim$(band$(trype, 3))
    ELSE
      review$ = review$ + STR$(nsu) + " " + trim$(band$(trype, 4))
    END IF
  END SELECT
  review$ = review$ + ", "
  IF trype > 8 THEN
    artpr
  ELSE
    IF pw < 100 THEN
      review$ = review$ + STR$(pw) + "% "
    END IF
    review$ = review$ + "equipped with " + trim$(musket$(wp))
    IF wp2 THEN
      IF gf > 0 THEN
        IF gf > 1 THEN
          review$ = review$ + STR$(gf) + " " + trim$(gatling$(wp2)) + " are attached. "
        ELSE
          review$ = review$ + "a " + trim$(gatling$(wp2)) + " is attached. "
        END IF
      ELSE
        review$ = review$ + " and " + STR$(100 - pw) + "% with " + trim$(musket$(wp2)) + ". "
      END IF
    ELSE
      review$ = review$ + ". "
    END IF
  END IF
  worps (review$)
  PRINT "Commanded by "; chap$
  PRINT
  PRINT "Confidence:      "; INT(mr); TAB(30); "Steadyness:      "; INT(stpr)
  PRINT "Fire Discipline: "; INT(fd); TAB(30); "Command Control: "; INT(cc)
  '
  IF pointz = true THEN
    countpts
    PRINT "Individual Points: "; INT(pv! * 10) / 10
    PRINT "Unit Points:       "; upv!
    PRINT "Total Points:      "; tpv!
  END IF
  '

PRINT
END SUB

SUB strength

 tx$ = " Is the unit at: "
  DO
  str = windows(tx$, 3, tit$())
 IF str = 0 THEN noway
 LOOP UNTIL str > 0
 CALL rendom
  b = 95
  IF str = 2 THEN
    b = 70
  ELSE
    IF str = 3 THEN
      b = 50
    END IF
  END IF
  mf = INT(b / 100 * x1 * mf)
  omf = mf

  '
  END SUB

SUB subu
s = 0
DO UNTIL s > 0 AND s < 60
  PRINT TAB(5);
  PRINT TAB(5); "How many "; trim$(band$(trype, 1)); " do you wish to have"
  PRINT TAB(5); "(1 to 60) ";
  INPUT s
LOOP
  
mf = INT(mf / nsu * s)
MID$(m$, 59) = CHR$(s)
 
IF gf > 0 THEN
  ogf = ogf / nsu * s
  gf = ogf - gf2
  MID$(m$, 60) = CHR$(ogf)
  MID$(m$, 77) = CHR$(gf)
  MID$(m$, 102) = CHR$(gf2)
END IF
IF numan > 0 THEN
  numan = numan / nsu * s
  MID$(m$, 48) = CHR$(numan)
END IF
nsu = s
MID$(m$, 64) = MKI$(mf)
MID$(m$, 78) = MKI$(mf)
END SUB

SUB totpr
  '
  
  review$ = aname$ + ", Total Strength:"
  PRINT #8,
  IF tnb THEN
    review$ = review$ + STR$(tnb) + " bayonets "
    IF tmgs > 0 THEN
      review$ = review$ + " with " + STR$(tmgs) + " machine guns. "
    ELSE
      review$ = review$ + ". "
    END IF
  END IF
  IF tnh THEN
    review$ = review$ + STR$(tnh) + " sabres. "
  END IF
  IF tna THEN
    review$ = review$ + STR$(tna) + " gunners with " + STR$(tng) + " guns."
  END IF
  IF numel THEN
    review$ = review$ + STR$(numel) + " elephants."
  END IF
  CALL worp(review$)
  '
  IF tcas THEN
    casp = INT(tcas / ortot * 1000) / 10
    PRINT #8,
    PRINT #8, "They have suffered "; tcas; " casulties, ("; casp; "%), out of "; ortot
    PRINT #8,
    IF tpris > 0 THEN
      PRINT #8, "The enemy has taken "; tpris; " prisoners."
    END IF
  END IF
  
  IF pointshow THEN
    PRINT #8,
    PRINT #8, "Total Points values: "; tpv!; "pts."
  END IF
  '
  IF priner = true THEN
    PRINT #8, CHR$(12)
  ELSE
    wate
  END IF
  '

END SUB

DEFSNG X-Y
SUB trainit

  b = 1
  rendom
  a = (100 - fd) / 2
  IF x < a THEN
    b = 0
    fd = fd + 1
    IF trype < 9 THEN
      review$ = review$ + "Their is a distinct improvement in the men's Practice at Musketry. "
    ELSE
      review$ = review$ + "Their is a distinct improvement in the men's Practice at their Guns. "
    END IF
  END IF
  rendom
  a = (100 - cc) / 2
  IF x < a THEN
    b = 0
    cc = cc + 1
    review$ = review$ + "The unit answers smartly to their instruction. "
  END IF
  rendom
  a = (120 - mr) / 2
  IF x < a THEN
    b1 = 0
    mr = mr + 1
    review$ = review$ + "The men are shewing splendid confidence. "
  END IF
  IF b THEN
    review$ = review$ + "The unit is at Exercise according to its Regulation. "
  END IF
END SUB

DEFINT X-Y
FUNCTION trim$ (x$)
IF LEN(x$) > 1 THEN
DO UNTIL RIGHT$(x$, 1) <> " "
x$ = LEFT$(x$, LEN(x$) - 1)
LOOP
END IF
trim$ = x$
END FUNCTION

DEFSNG X-Y
SUB troopr
  
  IF LEN(buffer$(buffer)) = 0 THEN
   junk = Alert(4, "Buffer " + STR$(buffer) + "|is empty.", 7, 9, 19, 69, "", "", "")
  ELSE
    CALL po1
    CALL zero
    header
    PRINT TAB(5);
    PRINT TAB(5); "Army Name"
    DO
      INPUT aname$
      IF LEN(aname$) > 8 OR LEN(aname$) < 3 THEN
        PRINT "Army name must have between 3 & 8 letters"
      END IF
    LOOP UNTIL LEN(aname$) < 9 AND LEN(aname$) > 2

    pat$ = "C:\ECW\bandi3\obats\" + aname$ + ".txt"
    OPEN pat$ FOR OUTPUT AS #10
    'pointshow = Alert(4, " Show Points Values ", 7, 9, 19, 69, " Yes ", " No  ", "")
    'IF pointshow = 2 THEN
    '  pointshow = 0
    'END IF
    header
    CALL worp(aname$)
    
    units = LEN(buffer$(buffer)) / 150
    checkem
    FOR unit = 1 TO units
      grabstats (unit)
      IF trype = 0 THEN
        review$ = STR$(unit) + "). " + comand$(oftyp) + chap$ + ". "
        'upv! = Points!
        'IF pointshow >= 0 THEN
        '  review$ = review$ + " (" + STR$(upv!) + "pts.) "
        'END IF
        worp (review$)
        PRINT #8, " "
        
      ELSE
        CALL unitpr
      END IF
      countup
      IF priner = FALSE AND unit / 2 = INT(unit / 2) OR unit = units THEN
        wate
      END IF
    NEXT unit
    keyclear
    totpr
    CLOSE #10
    CLOSE #8
    header
  END IF

END SUB

DEFINT X-Y
SUB ttype
DO
trype = windows("Troop Type:         ", 16, type$())
IF trype = 0 THEN noway
LOOP UNTIL trype > 0

END SUB

SUB unamed
 choice = typ
  IF uname THEN
    m = LEN(buffer$(buffer)) / 150 + 1
    SELECT CASE nlang
    CASE 1, 6, 18, 20 TO 22, 24 TO 26
      n$ = STR$(m) + "th"
      IF m MOD 10 = 1 THEN
        n$ = STR$(m) + "st"
      END IF
      IF m MOD 10 = 2 THEN
        n$ = STR$(m) + "nd"
      END IF
      IF m MOD 10 = 3 THEN
        n$ = STR$(m) + "rd"
      END IF
      IF m = 11 OR m = 111 OR m = 211 OR m = 12 OR m = 112 OR m = 212 OR m = 13 OR m = 113 OR m = 213 THEN
        n$ = STR$(m) + "th"
      END IF
      n$ = n$ + force$(choice)
    CASE 2
      n$ = trim$(force$(choice))
      na$ = " Nr." + STR$(m)
      n$ = n$ + na$
    CASE 3
      n$ = STR$(m) + "eme"
      n$ = n$ + force$(choice)
    CASE 4, 5
      n$ = STR$(m) + "era"
      n$ = n$ + force$(choice)
    CASE ELSE
      n$ = trim$(force$(choice))
      na$ = trim$(n1$) + "'s "
      n$ = na$ + n$
    END SELECT
    ELSE
    REM call statpr
    PRINT TAB(5);
    PRINT TAB(5); "What is the unit name "
    PRINT TAB(5);
    LINE INPUT n$
  END IF
    n$ = n$ + "                                       "
    n$ = LEFT$(n$, 40)
  uname$ = n$

END SUB

SUB unitpr
  review$ = uname$
  worp (review$)
  review$ = STR$(mf) + " " + trim$(experience$(te)) + " " + trim$(class$(tc)) + " " + trim$(type$(trype)) + " "
  review$ = review$ + "in "
  SELECT CASE tc
  CASE 1 TO 9, 14 TO 18, 20, 22
    IF nsu = 1 THEN
      review$ = review$ + "a single " + trim$(band$(trype, 1)) + ". "
    ELSE
      review$ = review$ + STR$(nsu) + " " + trim$(band$(trype, 2)) + ". "
    END IF
  CASE ELSE
    IF nsu = 1 THEN
      review$ = review$ + "a single " + trim$(band$(trype, 3)) + ". "
    ELSE
      review$ = review$ + STR$(nsu) + " " + trim$(band$(trype, 4)) + ". "
    END IF
  END SELECT
  IF trype < 9 THEN
    pw1 = pw / 100
    pw1 = INT(mf * pw1)
    pw2 = mf - pw1
    IF gf = 0 THEN
      IF pw1 < mf THEN
        review$ = review$ + STR$(pw1) + " "
        review$ = review$ + "Equipped with " + trim$(musket$(wp)) + " and " + chop$(mw, 1) + " "
        IF wp2 > 0 THEN
          review$ = review$ + "and " + STR$(pw2) + " with " + trim$(musket$(wp2)) + " and " + chop$(mw, 2) + " "
        ELSE
          review$ = review$ + "and " + STR$(pw2) + " with " + chop$(mw, 2) + " "
        END IF
      ELSE
        review$ = review$ + "Equipped with " + trim$(musket$(wp)) + " and " + chop$(mw, 1) + " "
      END IF
    ELSE
      review$ = review$ + "Equipped with " + trim$(musket$(wp)) + " and " + chop$(mw, 1) + " "
      IF gf = 1 THEN
        review$ = review$ + "A " + trim$(gatling$(wp2)) + " is attached. "
      ELSE
        review$ = review$ + STR$(gf) + " " + trim$(gatling$(wp2)) + "s are attached. "
      END IF
    END IF
    IF arm THEN
      review$ = review$ + " and wearing " + trim$(armour$(arm + 1))
    END IF
    review$ = review$ + ". "
    'review$ = review$ + "Ammunition carried " + STR$(amo) + " rounds per man. "
  ELSE
    artpr
  END IF
  'review$ = review$ + "Commanded by " + chap$ + ". "
  'upv! = Points!
  'IF pointshow > 0 THEN
  '  review$ = review$ + " (" + STR$(upv!) + "pts.) "
  'END IF
  worp (review$)
  PRINT #8, " "
  PRINT #8, "  "
END SUB

DEFSNG X-Y
SUB untrain

b = 1
  rendom
  a = (100 - cc) / 2
  IF x < a THEN
    b = 0
    cc = cc - 1
    review$ = review$ + "The Common Soldiers have shewn a certain laxity in attitude to their Superiors. "
  END IF
  rendom
  a = (120 - mr) / 2
  IF x < a THEN
    b = 0
    mr = mr - 1
    review$ = review$ + "The unit is becoming restive under Exercise. "
  END IF
  IF b THEN
    review$ = review$ + "The men are at Exercise according to their Regulation. "
  END IF

END SUB

DEFINT X-Y
SUB wate
CALL keyclear
DO UNTIL INKEY$ <> ""
LOOP
END SUB

SUB wepnpr

 choice = windows(" Which type: ", 4, wch$())

SELECT CASE choice
CASE 1
  trype = 1
CASE 2
  trype = 10
CASE 3
  trype = 20
CASE ELSE
  trype = 0
END SELECT

IF trype > 0 THEN
  po1
    
  choice = windows(" How many: ", 2, hm$())
  count = 0
  SELECT CASE choice
  CASE 1
    lots = 0
    SELECT CASE trype
    CASE 1
      count = 0
      DO UNTIL count = 228
        count = count + 1
        lots = lots + 1
        CALL sap(count)
        IF priner = FALSE AND lots = 5 THEN
          lots = 0
          CALL wate
        END IF
      LOOP
    CASE 10
      DO UNTIL count = 201
        count = count + 1
        lots = lots + 1
        CALL ap(count)
        IF priner = FALSE AND lots = 5 THEN
          CALL wate
          lots = 0
        END IF
      LOOP
    CASE 20
      DO UNTIL count = 24
        count = count + 1
        lots = lots + 1
        CALL mgp(count)
        IF priner = FALSE AND lots = 5 THEN
          CALL wate
          lots = 0
        END IF
      LOOP
    END SELECT

  CASE 2
    SELECT CASE trype
    CASE 1
      DO
        choice = windows("Which small arm ", 228, musket$())
        IF choice <= 0 THEN EXIT DO
          CALL sap(choice)
          wate
      LOOP
    CASE 10
      DO
        choice = windows("Which artillery piece ", 201, gun$())
        IF choice <= 0 THEN EXIT DO
          CALL ap(choice)
          wate
      LOOP
    CASE 20
      DO
        choice = windows("Which machine gun ", 24, gatling$())
        IF choice <= 0 THEN EXIT DO
          CALL mgp(choice)
          wate
      LOOP
    END SELECT
  END SELECT
END IF

END SUB

SUB wepnstats
  IF trype > 0 THEN
    SELECT CASE trype
    CASE 1 TO 7
      infantry
    CASE 8 TO 19
      artillery
    CASE 20
      maxim
    END SELECT
    MID$(m$, 91) = CHR$(rf)
    MID$(m$, 92) = CHR$(er)
    MID$(m$, 93) = CHR$(lr)
    MID$(m$, 94) = CHR$(ef)
    MID$(m$, 95) = CHR$(tpw)
    MID$(m$, 96) = CHR$(se)
    MID$(m$, 103) = CHR$(rf2)
    MID$(m$, 104) = CHR$(er2)
    MID$(m$, 105) = CHR$(lr2)
    MID$(m$, 106) = CHR$(ef2)
    MID$(m$, 107) = CHR$(tpw2)
    MID$(m$, 108) = CHR$(se)

    MID$(m$, 68) = CHR$(amo)
    MID$(m$, 97) = CHR$(chopper(mw, 1))
    MID$(m$, 98) = CHR$(chopper(mw, 2))
  END IF
  

END SUB

SUB wepz
wepch = 0
DO UNTIL wepch = 1

 wepch = windows(" Choices:", 7, tt$())
 IF wepch = 0 THEN wepch = 1
 SELECT CASE wepch
 CASE 2, 3
   SELECT CASE trype
   CASE 1 TO 8
     choice = windows("Which small arm ", 228, musket$())
   CASE 20
     choice = windows("Which machine gun ", 24, gatling$())
   CASE ELSE
     choice = windows("Which artillery piece ", 201, gun$())
   END SELECT
   IF choice > 0 THEN
     IF wepch = 2 THEN
       wp = choice
     ELSE
       wp2 = choice
     END IF
   END IF
 CASE 4
   choice = windows("Melee weapons:", 12, chopper$())
   IF choice > 0 THEN mw = choice
 CASE 5
   choice = windows("Armour:        ", 6, armour$()) - 1
   IF choice > 0 THEN arm = choice
 CASE 6
   IF trype < 9 THEN
     PRINT
     PRINT "What percentage do you wish to be armed with primary weapon ";
     l = 0
     DO UNTIL l > 0 AND l < 101
       INPUT l
     LOOP
     pw = l
     MID$(m$, 82) = CHR$(pw)
   ELSE
     junk = Alert(4, "Not appropriate" + "|to Artillery.", 7, 9, 20, 69, "", "", "")
   END IF
 CASE 7
   IF trype < 9 THEN
     PRINT "The unit has "; gf; " machine guns attached at the moment."
     PRINT
     PRINT "How many machine guns are to be attached (0 to 6) ";
     gf = -1
     DO
       INPUT gf
     LOOP UNTIL gf >= 0 AND gf < 7
     IF gf > 0 THEN
       DO
         wp2 = windows("add which machine gun ", 24, gatling$())
         IF wp2 = 0 THEN noway
       LOOP UNTIL wp2 > 0
     END IF
     pw = 100
     MID$(m$, 77) = CHR$(gf)
   ELSE
     gf2 = 0
     PRINT
     PRINT "How many primary guns in the battery ";
     l = -1
     DO UNTIL l >= 0 AND l < 101
       INPUT l
     LOOP
     gf = l
     MID$(m$, 77) = CHR$(gf)
     PRINT
     PRINT "How many secondary guns in the battery ";
     l = -1
     DO UNTIL l >= 0 AND l < 101
       INPUT l
     LOOP
     gf2 = l
   END IF
   ogf = gf + gf2
 END SELECT
 CALL wepnstats
LOOP
  
END SUB

FUNCTION windows (title$, number, x$())

LOCATE 5, 1
setupdesktop
PRINT title$
choice = ListBox(x$(), number)
windows = choice
setupdesktop
END FUNCTION

SUB wipeout

  '
  units = LEN(buffer$(buffer)) / 150
  wipe = 0
  PRINT
  PRINT "Replacing dead Officers and removing units with no men left."
  PRINT
  FOR unit = 1 TO units
    grabstats (unit)
    IF trype = 0 THEN
      IF ofw > 200 THEN
        typ = 1
        PRINT
        PRINT "Replacing "; chap$
        officrs
        logstats (starbite)
      END IF
    ELSE
      IF mf < 1 THEN
        wipe = wipe + 1
        PRINT
        PRINT "deleting unit "; unit; ". "; uname$
        delet(wipe) = unit
      ELSE
        IF ofw > 200 THEN
          typ = 1
          PRINT
          PRINT "New Officer for "; uname$
          PRINT "replacing "; chap$
          officrs
          logstats (starbite)
        END IF
      END IF
    END IF
  NEXT unit
  FOR del = wipe TO 1 STEP -1
   unit = delet(del)
  CALL deleat(buffer, unit, 1)
  NEXT del
  '
  PRINT
  PRINT "Replacement complete."
REM  wait
  header
  '
END SUB

SUB worp (x$)
'IF priner = FALSE THEN
'  CALL worps(x$)
' EXIT SUB
' END IF


  sl = LEN(x$)
  IF sl < 76 THEN
    report$ = x$
    PRINT #8, report$
    WRITE #10, report$
  ELSE
    '
    n = 75
    n1 = 0
    n2 = 0
    '
    sln = 100
    DO UNTIL sln < 1
      bl = sl - n1
      IF bl < 76 THEN
        report$ = MID$(x$, n1 + 1, bl)
        PRINT #8, report$
        WRITE #10, report$
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
        PRINT #8, report$
        WRITE #10, report$
        n1 = n1 + n
      END IF
      '
    LOOP
    
  END IF

  REM CLOSE #8
END SUB

SUB worps (x$)
LOCATE 23, 1

  sl = LEN(x$)
  IF sl < 75 THEN
    report$ = x$
    PRINT report$
  ELSE
    '
    n = 75
    n1 = 0
    n2 = 0
    sln = 100
    '
    DO UNTIL sln < 1
      bl = sl - n1
      IF bl < 76 THEN
        report$ = MID$(x$, n1 + 1, bl)
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
  PRINT
  '

END SUB

SUB zero
'
  ' makes them all zero
  '
  bgde = 0
  bgdewm = 0
  tnb = 0
  tnh = 0
  tng = 0
  tpv! = 0
  tna = 0
  tnbo = 0
  tnho = 0
  tnao = 0
  tcas = 0
  tmgs = 0
  ortot = 0
  tpris = 0
  numel = 0
  '

END SUB

