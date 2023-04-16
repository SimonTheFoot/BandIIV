DECLARE SUB nsa ()
DECLARE SUB chargedisp ()
DECLARE SUB pcharged ()
DECLARE SUB pcharger ()
DECLARE SUB actodpr ()
DECLARE SUB apeshit (ape%)
DECLARE SUB brighead (tl%)
DECLARE SUB brigmorale ()
DECLARE SUB genlist1 (w%)
DECLARE SUB movegen (tl%)
DECLARE SUB movegen1 ()
DECLARE SUB movem ()
DECLARE SUB officercheck ()
DECLARE SUB ofiord (ttt%)
DECLARE SUB setmarch ()
DECLARE SUB ordercase ()
DECLARE SUB ordercheck ()
DECLARE SUB sa ()
DECLARE SUB uniord (unit%)
'$INCLUDE: 'C:\bc7\ecw\bandi3\game\bloodiba.bi'

SUB actodpr
'
IF btype > 0 THEN
  IF mr = 0 OR mf = 0 THEN
    IF mf = 0 THEN
      mes$ = "has been wiped out entirely."
    ELSE
      mes$ = "has dispersed in rout."
    END IF
  ELSE
    mes$ = "current order: " + od$(od)
  END IF
ELSE
  IF mr = 0 THEN
    mes$ = "has fled the field."
  ELSE
    mes$ = "current order: " + od$(od)
  END IF
END IF
review$ = "Unit " + STR$(unit) + "). the " + unit$ + " " + mes$
CALL worps(review$)
PRINT
'

END SUB

SUB apeshit (ape)
'
nord = FALSE
agr = ofl
IF even(ofl / 2) THEN
agr = ofl * 2
ELSE
IF even(ofl) THEN
agr = ofl * 3 / 2
END IF
END IF
'
SELECT CASE btype
CASE 0
tallyho = FALSE
rushoff = max(agr - (ofa + comcon), 1)
hangaround = (msince + 4) / 5
IF od < 4 OR od > 22 THEN
hangaround = 1
ELSE
hangaround = hangaround + 1
END IF
CASE 1 TO 8, 15
 bbof = bofa / 2
IF sat THEN
bbof = bofa
END IF
rushoff = max(agr - (ofa + bbof + comcon), 1)
hangaround = (msince + 4) / 5
CASE ELSE
rushoff = max(agr - (ofa + bofa + comcon * 2), 1)
hangaround = (msince + 4) / 10
END SELECT
rushoff = rushoff * (100 - comcon) / 100
'
SELECT CASE od
CASE 2 TO 3
rushoff = rushoff / wm / 2
nod = wm
CASE 4 TO 6
rushoff = rushoff / wm * hangaround / 5
nod = morale(wm, 1)
CASE 7, 8, 13, 14
rushoff = rushoff / wm * hangaround / 8
nod = morale(wm, 1)
CASE 10
rushoff = rushoff / wm * hangaround / 12
nod = 3
CASE 1, 15 TO 20
rushoff = 0
CASE 21, 22
rushoff = 100
nod = 8
CASE ELSE
rushoff = 0
END SELECT
nod = max(nod, 2)
'
IF tallyho = true THEN
rushoff = rushoff * 2
END IF
'
rendom
IF x < rushoff THEN
tallyho = true
nord = true
IF od <> nod THEN
od = nod
replacestats (ape)
chtyp = oftyp
SELECT CASE chtyp
CASE 5
ortyp = 2
officer = ape
action = pw
CALL ordercase
grabstats (ape)
od = nod
pw = max(action, 0)
review$ = review$ + ". " + officer$ + " has issued the new Brigade order: " + RTRIM$(od$(od)) + " "
review$ = review$ + "and now has " + STR$(pw) + " action points left. "
CASE 1 TO 4
ortyp = 4
officer = ape
action = pw
CALL ordercase
grabstats (ape)
od = nod
pw = max(action, 0)
review$ = review$ + ". " + officer$ + " has issued the new general order: " + RTRIM$(od$(od)) + " "
review$ = review$ + "and now has " + STR$(pw) + " action points left. "
CASE 6, 7
od = nod
review$ = review$ + ". " + officer$ + " has issued the new order "
END SELECT
END IF
END IF
neword = Order(od, 1)
replacestats (ape)
END SUB

SUB b4move
'
phase$ = "B4MOVE "
'
IF phase$ = here$ OR oldgame = FALSE THEN
'
oldgame = FALSE
'
moving = FALSE
'
END IF
END SUB

SUB brighead (tl)
keyclear
kk = tl

IF kk = nua + 1 THEN
  IF priner THEN
    PRINT #10, CHR$(12)
    x = Alert(4, "Second army print out.", 9, 10, 14, 70, "", "", "")
    PRINT #10,
    PRINT #10,
    PRINT #10,
  END IF
END IF

wmb = wm
nx = kk + numsub

IF priner = FALSE AND kk <> 1 THEN
  CALL wate
END IF

IF priner = 0 THEN
  CALL header
ELSE
  IF kk = 1 OR kk = nua + 1 THEN
    gtim$ = STR$(htim) + ":"
    IF mins < 10 THEN
      gtim$ = gtim$ + "0"
    END IF
    gtim$ = gtim$ + STR$(mins)
    IF mins = 0 THEN
      gtim$ = gtim$ + "0"
    END IF
    review$ = "'Blood & Iron': Game Move " + STR$(move) + " "
    review$ = review$ + "Time: " + gtim$ + ".  Weather:" + weath$(weath) + ".  "
    review$ = review$ + "Visibility is " + STR$(vis) + " m. (ie. " + STR$(INT(vis / gs) / 100) + " m. on the table). "
    CALL worp(review$)
    PRINT #10,
  END IF
END IF
'
PRINT #10, ; "_________________________________________________"
PRINT #10,
IF mr = 0 THEN
  review$ = "Officer: " + STR$(kk) + " " + officer$ + " has fled the Field."
  CALL worp(review$)
  PRINT #10,
ELSE
  review$ = STR$(kk) + ")" + comand$(oftyp) + " " + officer$ + " "
  PRINT #10,
  pw = INT(pw)
  IF pw = 1 THEN
    review$ = review$ + "(one action point only). "
  ELSE
    review$ = review$ + "(" + STR$(pw) + " action points). "
  END IF
  CALL worp(review$)
  review$ = officer$ + " is "
  IF ofw > 100 THEN
    IF ofw > 200 THEN
      review$ = review$ + "dead. His Second in Command has taken over. He is "
    ELSE
      review$ = review$ + "wounded. "
    END IF
  END IF
  review$ = review$ + RTRIM$(morale$(wm)) + " "
  CALL apeshit(kk)
  IF nord = FALSE THEN
    review$ = review$ + "and his present order is " + RTRIM$(od$(od)) + ". "
  END IF
  
  IF stafof <> 0 AND stafof <> tl THEN
    uw = stafof
    CALL grabstats(stafof)
    z = INT(mf / 50) * 50
    review$ = review$ + "He is with unit " + STR$(uw) + " the " + unit$ + ". "
    IF btype > 0 THEN
      CALL grabstats(tl)
      IF z > 49 THEN
        review$ = review$ + "He finds the unit currently has about " + STR$(z) + " men "
      ELSE
        review$ = review$ + "He finds the unit currently has less than 50 men left "
      END IF
      morp = INT(100 / mr) / 8 + 1
      morp = MIN(morp, 8)
      morp = max(morp, 1)
      disp = INT(disp / 8)
      disp = MIN(disp, 8)
      review$ = review$ + "and is " + tired$(morp) + " and " + org$(disp) + ". "
    END IF
  END IF
  CALL worp(review$)
  review$ = ""
  PRINT #10,
  neword = Order(od, 1)
  replacestats (kk)
  IF move = 1 AND od = 12 THEN
    brigu = numsub
    CALL setmarch
    grabstats (kk)
  END IF
END IF
grabstats (tl)
IF aw <> 0 AND aw <> tl THEN
  kk = aw
  grabstats (kk)
  review$ = "The Brigade ammunition wagon " + STR$(kk) + " "
  IF am < 50 THEN
    am = am + 50
    review$ = review$ + "is re-supplying unit " + STR$(kk) + ". "
  ELSE
    review$ = review$ + "is with unit " + STR$(kk) + ". "
  END IF
  replacestats (kk)
  CALL worp(review$)
END IF
END SUB

SUB brigmorale
nsub = numsub
bofa = ofa

nx = tl + numsub

IF nx > nu THEN
  k = nx - nu
  nx = nu
  numsub = numsub - k
  CALL replacestats(tl)
  nsub = numsub
END IF

FOR count = tl TO nx
  CALL grabstats(count)
  k = (wm + 1) / 2
  k = k ^ 2
  z = z + k
  brigfear = max(brigfear, INT(fear))
NEXT count

IF tl < nua THEN
  grabstats (1)
  z = z / ofa * 80
ELSE
  grabstats (nua + 1)
  z = z / ofa * 80
END IF

CALL rendom
CALL grabstats(tl)
z = z / numsub
fear = brigfear
cform = 2
bad = z
CALL morale1(bad)

odr = od
mtr = MIN(mtr, 8)
wm = mtr
spm = mtr
mr = mr - morlos
mr = max(mr, 0)
IF wm > 6 THEN
  IF stafof > 0 THEN
    st = stafof
    CALL grabstats(st)
    sat = 0
    CALL replacestats(st)
    CALL grabstats(tl)
    stafof = 0
  END IF
END IF

END SUB

SUB brigterchange (unit)
IF check <> 1 THEN
ELSE
'
'
hq = unit
'
ns = numsub
'
DO
'
unit = unit + 1
'
CALL grabstats(unit)
'
IF btype = 0 THEN
ELSE
CALL unitchange(unit)
END IF
'
LOOP WHILE unit <> hq + ns
'
END IF

END SUB

SUB ch

DO
  pexit = FALSE
  charger = 0
  CALL pcharger
  IF charger > 0 THEN
    CALL pcharged
    IF target > 0 THEN
      CALL chargedisp
    END IF
  END IF
LOOP UNTIL charger = 0
CLS
END SUB

SUB changefor (kk)
grabstats (kk)
IF btype = 0 THEN
ELSE
  m = kk

  IF spm > 5 OR spm = 0 THEN
    IF spm > 4 THEN
      x = Alert(4, "The " + unit$ + "|No change until rallied ", 9, 10, 14, 70, "", "", "")
    END IF
    IF spm = 0 THEN
      x = Alert(4, "The " + unit$ + "|are out of control.", 9, 10, 14, 70, "", "", "")
    END IF
  ELSE
    review$ = unit$ + " now in " + drill$(cform)
    x = 1
    WHILE formpos(fp, x) <> -1
      y = formpos(fp, x)
      formation$(x) = drill$(y)
      x = x + 1
    WEND
    choice = windows(review$, x - 1, formation$())
    cform = formpos(fp, choice)
    CALL replacestats(m)
  END IF
END IF

END SUB

SUB genlist1 (w) STATIC
REDIM uname$(200)
officer = w
CALL grabstats(officer)
v = numsub
y = 1
uname$(1) = "No units                       "
unit = officer
lv = 1

DO
CALL grabstats(unit)
uname$(y + lv) = " " + STR$(w + y - 1) + " " + unit$
y = y + 1
unit = unit + 1
LOOP WHILE y < v + 2
'

END SUB

SUB genlist2 (w)
grabstats (w)
REDIM uname$(200)
IF w < nua THEN
pexit = nua
ELSE
pexit = nu
END IF
rank = oftyp
count = w
c1 = 1
uname$(1) = "No units                                 "
lv = 1
PRINT
PRINT officer$; " "; "is consulting his Staff"
DO
grabstats (count)
IF btype = 0 THEN
officer$ = officer$ + SPACE$(50)
officer$ = LEFT$(officer$, 50)
num$ = STR$(count) + "    "
num$ = LEFT$(num$, 5) + officer$
uname$(c1 + lv) = num$
 c1 = c1 + 1
END IF
count = count + 1
CALL grabstats(count)
LOOP UNTIL count = pexit OR oftyp <= rank
nst = numsub
END SUB

SUB interp
'
CALL header
numel = 0
IF chargecat < 10 THEN
  CALL grabstats(charger)
  pest1 = mf / stead * comcon
  IF btype > 5 THEN
    pest1 = pest1 * 2
  END IF
  attype = btype
  numel = numan

  CALL grabstats(target)
  pest2 = mf / stead * comcon
  IF btype > 5 THEN
    pest2 = pest2 * 2
  END IF
  IF chargecat = 9 THEN
    CALL rendom
    SELECT CASE attype
    CASE 6 TO 8
      disorg = disorg + 150 - comcon
    CASE 15
      disorg = disorg + 250 - comcon
    CASE ELSE
      disorg = disorg + 100 - comcon
    END SELECT
    disorg = MIN(255, disorg)
  END IF

  fear = charge(chargecat, 2)
  casp = pest1 / pest2 * 10
  a = casp
  CALL morale1(a)
  wm = mtr
  review$ = unit$ + " are " + RTRIM$(morale$(wm)) + " "
  SELECT CASE wm
  CASE 0 TO 1
    review$ = review$ + "and proceed with their move. "
  CASE 2
    IF disorg > comcon * 2 THEN
      review$ = review$ + "but halt to recover their dressing. "
    ELSE
      review$ = review$ + "and proceed with their move. "
    END IF
  CASE 3 TO 5
    review$ = review$ + "and halt at the point of contact. "
    od = 9
  CASE ELSE
    CALL rendom
    m = INT(movebase * x1)
    review$ = review$ + "and join the retreat, running " + STR$(m) + "cms. "
  END SELECT
  IF numel > 0 THEN
    CALL rendom
    cas = (numel * 5 * xs) + 1
    review$ = review$ + "Unfortunately, " + STR$(cas) + " men are trampled by the elephants as they burst through. "
  END IF
  CALL replacestats(target)

ELSE

  CALL grabstats(charger)
  attype = btype
  numel = numan
  CALL grabstats(target)
  deftype = btype

  SELECT CASE attype
  CASE 6 TO 8
    disorg = disorg + 100 - comcon
  CASE 14
    disorg = disorg + 150 - comcon
    cas = INT(numel * xs * 10)
  CASE ELSE
    IF comcon > 60 THEN
      disorg = disorg + 50 - comcon
    ELSE
      disorg = disorg + 10
    END IF
  END SELECT
  disorg = MIN(255, disorg)
  replacestats (target)

  CALL grabstats(charger)
  SELECT CASE deftype
  CASE 6 TO 8
    disorg = disorg + 100 - comcon
  CASE 14
    disorg = disorg + 150 - comcon
    cas = INT(numel * xs * 10)
  CASE ELSE
    IF comcon > 60 THEN
      disorg = disorg + 50 - comcon
    ELSE
      disorg = disorg + 10
    END IF
  END SELECT
  disorg = MIN(255, disorg)
  replacestats (charger)

  review$ = unit$
  k = disorg - comcon
  SELECT CASE k
  CASE 0 TO 10
    review$ = review$ + " are somewhat disordered, but proceed with their move. "
  CASE 11 TO 30
    review$ = review$ + " are much disordered and halt to recover their dressing. "
  CASE 31 TO 255
    review$ = review$ + " are completely called to a halt in disorder. "
  CASE ELSE
    review$ = review$ + " pass the obstructing unit without impediment. "
  END SELECT

END IF
'
CALL worps(review$)
wate
'

END SUB

SUB movegen (tl)
m = tl
CALL grabstats(m)
IF btype <> 0 AND (mr = 0 OR mf = 0) THEN
  IF mr = 0 THEN
    review$ = STR$(m) + ": " + unit$ + " has routed beyond rally. "
  ELSE
    review$ = STR$(m) + ": " + unit$ + " has been wiped out to a man. "
  END IF
ELSE
  IF od > 10 AND od < 13 OR od > 22 OR mr = 0 OR mf = 0 THEN
    neword = Order(od, 1)
    od = neword
    replacestats (m)
  ELSE
    IF btype = 0 THEN
    ELSE
      msince = msince + 1
      msince = MIN(msince, 10)
      replacestats (m)
      CALL pdate(m)
      CALL unitdetails(m)
      CALL ordercheck
      IF aw AND am < 40 THEN
         am = am + 60
      END IF
      k = 0
      neword = Order(od, 1)
      mc = Order(od, 2)
      CALL movegen1
      disorg = disorg + (mc * tdis) / 2
      disorg = MIN(disorg, 250)
      disorg = max(disorg, 0)
      IF priout THEN '
        review$ = STR$(m) + ") " + unit$ + " in " + RTRIM$(drill$(cform)) + " in " + RTRIM$(terrain$(tr)) + ". "
        review$ = review$ + "They are " + RTRIM$(morale$(wm))
        CALL apeshit(m)
        IF nord = FALSE THEN
          review$ = review$ + " and their current order is "
        END IF
        review$ = review$ + RTRIM$(od$(od)) + " "
      ELSE
        review$ = STR$(m) + ": "
        CALL apeshit(m)
        review$ = review$ + RTRIM$(od$(od)) + " "
      END IF
    END IF
    SELECT CASE od
    CASE 1
      mx = mv1
      mm1 = mv1
      rx = 0
      rm = 0
      IF tl < nua THEN
        headcase = 1
      ELSE
        headcase = 2
      END IF
    CASE 2
      mx = mv1
      mm1 = mv1 - comcon / 20
      rx = 0
      rm = 0
      IF m < nua THEN
        headcase = 1
      ELSE
        headcase = 2
      END IF
    CASE 3
      mx = mv1 / 2
      mm1 = mx * (100 - comcon) / 100
      rx = 0
      rm = 0
    CASE 4
      rx = mv1 / (stead / 20 + 1)
      mm1 = 0
      mx = rx * x2
      rm = 0
    CASE 5, 10, 23
      mx = mv1 / (stead / 10 + 10)
      mm1 = 0
      rx = mx * x1
      rm = 0
    CASE 6, 9, 15
      mx = 0
      mm1 = 0
      rx = mv1 * (comcon + 100) / 200
      rm = 0
    CASE 7
      mx = 0
      mm1 = 0
      rx = mv1 / 2
      rm = mv1 * 30 / (comcon + 20)
    CASE 8, 13, 14
      mx = 0
      mm1 = 0
      rx = mv1
      rm = mv1 * 100 / (100 + comcon)
    CASE 18 TO 22
      mx = 0
      mm1 = 0
      rx = mv1 * 3 / 2
      rm = rx
    CASE 16, 17
      mx = 0
      mm1 = 0
      rx = mv1 * (comcon + 100) / 200
      rm = max(mv1 / 2, 5)
    END SELECT
    rx = ABS(INT(rx * tablz / 180))
    rm = ABS(INT(rm * tablz / 180))
    mx = ABS(INT(mx * tablz / 180))
    mm1 = ABS(INT(mm1 * tablz / 180))
    mv1 = ABS(max(mx, rx))
    IF mm1 < 0 THEN
      rx = -mm1
    END IF
    IF rm > rx THEN
      rx = rm
    END IF
    IF btype <> 0 THEN
      IF nord = true THEN
        nord = FALSE
      END IF
      mov = mv1
      IF rx <> 0 AND mx <> 0 THEN
        review$ = review$ + STR$(mx) + " forward to " + STR$(rx) + " rearward. "
      ELSE
      IF mx THEN
        review$ = review$ + STR$(mm1) + " to " + STR$(mx) + " forward. "
      ELSE
      IF rx THEN
        review$ = review$ + STR$(rm) + " to " + STR$(rx) + " rearward. "
      ELSE
        review$ = review$ + "No movement. "
      END IF
    END IF
  END IF
END IF
CALL worp(review$)

IF wm < 6 THEN
  od = neword
END IF

IF priout THEN
  PRINT #10,
END IF
CALL replacestats(m)
END IF
END IF
END SUB

SUB movegen1
mv1 = movebase * te * fe / 50
'
CALL rendom
'
mv1 = mv1 * x1
'
IF od > 1 AND od < 4 THEN
'
CALL rendom
'
cc = comcon + ofa
tf = MIN(tdis, 9)
tf1 = tf + xs + 1
cc = cc * 2 / tf1
'
IF x > cc THEN
CALL rendom
mv1 = mv1 * x2
CALL rendom
END IF
'
IF x < 5 * tf THEN
od = 23
END IF
'
END IF
'

END SUB

SUB movem
CALL palert
prout

tl = 0
DO
  tl = tl + 1
  CALL grabstats(tl)
  IF tl = 1 THEN
    gen1 = ofa
  END IF
  IF tl = nua + 1 THEN
    gen2 = ofa
  END IF

  IF shot = 1 OR shot > 100 THEN
    shot = 100
    CALL rendom
    IF x > fires THEN
      ef = ef - 1
      ef = max(1, ef)
    END IF
  END IF
  
  IF btype = 0 THEN
    CALL brigmorale
    CALL grabstats(tl)
    CALL rendom
    wefap = weff(weath, 14)
    pw = INT(((ofa * x2 / 20) + 1) * wefap / 10)
    
    
    IF stafof = tl THEN
      pw = pw * 3 / 2
    END IF
    
    IF od > 12 THEN
      pw = INT(pw / 3)
    END IF

    action = pw
    IF tl < nua THEN
      grabstats (1)
    ELSE
      grabstats (nua + 1)
    END IF
    SELECT CASE ofa
    CASE 1 TO 60
      action = action - 1
    CASE 101 TO 120
      action = action - 1
    CASE 121 TO 256
      action = action + 2
    END SELECT
    
    CALL grabstats(tl)
    pw = action
    pw = MIN(pw, numsub + 1)
    pw = max(pw, 1)
    CALL replacestats(tl)
    CALL brighead(tl)
  ELSE
    CALL movegen(tl)
  END IF

LOOP WHILE tl < nu
IF priner = true THEN
  PRINT #10, CHR$(12)
END IF
wate
CLS
END SUB

SUB movement
IF phase$ = here$ OR oldgame = FALSE THEN
IF NOT oldgame THEN
CALL movem
CALL sa
END IF
oldgame = FALSE
firing = FALSE
END IF
here$ = ""
END SUB

SUB officercheck
units = LEN(a$) / 150
DO
  INPUT officer
LOOP WHILE officer < 0 OR officer > units

noff = true
IF officer = 0 THEN
  noff = FALSE
  
ELSE
  
  CALL grabstats(officer)
  
  IF stafof < officer OR stafof > officer + numsub THEN
    stafof = officer
    CALL replacestats(officer)
  END IF
  
  IF btype <> 0 THEN
    x = Alert(4, "Not an Command Unit ", 9, 10, 14, 70, "", "", "")
    noff = FALSE
  END IF
  
  IF pw = 0 THEN
   x = Alert(4, "No action points left ", 9, 10, 14, 70, "", "", "")
     noff = FALSE
  END IF
  
  IF mr = 0 THEN
    x = Alert(4, "Deserted the Field", 9, 10, 14, 70, "", "", "")
    noff = FALSE
  END IF
  
END IF
END SUB

SUB ofiord (ttt) STATIC

grabstats (ttt)

IF od = nod THEN
ELSE
  ofef = ofchan
  mef = (spm + 1) / 2
  IF od > nod THEN
    ofef = ofef + mef
  END IF
  stafef = sofa
  IF sat > 0 THEN
    stafef = sofa * 2
  END IF
  z = comcon ^ 2 / 30
  cod = (z + ofa + stafef) / ofef
  CALL rendom

  IF x < cod OR nod > 9 THEN
    od = nod
    ofp = ofp + 1
  ELSE
    action = action - 1
    ofp = ofp - 1
    tod = 0
    IF move = 1 THEN
      od = 5
    END IF
  END IF

pw = pw - 1
pw = max(pw, 0)
replacestats (ttt)

END IF


END SUB

SUB pom
'
DO
CALL header
PRINT "Which officer wishes to move ";
CALL officercheck
IF noff = true THEN
'
action = pw
ns = numsub
 pw = pw - 1
pw = max(0, pw)
'
CALL replacestats(officer)
'
CALL ofhed

wate

'
IF stafof > 0 THEN
tunit = stafof
CALL grabstats(tunit)
'
stafof = 0
sat = 0
CALL replacestats(tunit)
END IF
CALL genlist1(officer)
choice = windows(" Moving to unit:                            ", ns + 2, uname$())
'
IF choice > 1 THEN
  unit = officer + choice - 2
  CALL grabstats(unit)
  sat = officer
  CALL replacestats(unit)
'
  CALL grabstats(officer)
  stafof = unit
  ofpm = spm
  rallyxx = ofa * mr / mo
  sof$ = officer$
  CALL replacestats(officer)
'
  IF pw > 0 THEN
    orpos = 9
    CALL ofhed
    wate
    nod = windows(" New order:", orpos, od1$()) + 1
    ofod = nod
  '
    grabstats (unit)
    IF ofpm < wm AND wm > 2 THEN
      rally = FALSE
      CALL rallytry
      CALL replacestats(unit)
      CALL grabstats(officer)
      pw = max(action, 0)
      CALL replacestats(officer)
    END IF
    IF action THEN
      CALL grabstats(officer)
      bestod = morale(spm, 1)
      nod = max(nod, bestod)
      sofa = ofa ^ 2 / 50
      brigu = numsub
      tod = 1
      DO
       action = action - 1
       ofchan = 8
       CALL ofiord(officer)
       IF rally = true THEN
        uchan = 1
       ELSE
        uchan = 10
       END IF
       CALL grabstats(unit)
       IF trype = 0 THEN
        CALL ofiord(unit)
       ELSE
        CALL uniord(unit)
       END IF
       CALL grabstats(officer)
       action = max(action, 0)
       od = nod
       action = action - 1
       action = max(action, 0)
       pw = action
       CALL replacestats(officer)
      LOOP UNTIL action < 2 OR tod = 1
    END IF
    CALL ofhed
    CALL grabstats(unit)
    CALL actodpr
    wate
    CLS
  ELSE
   officer = 0
  END IF
 END IF
'
END IF
LOOP WHILE officer <> 0
'
CLS
'

END SUB

SUB pout (cas)
cas = cas * gff / 3
cas = cas * death / 10
IF move = 1 AND firet = 7 THEN
  cas = cas * SQR(tbomb) * 3 / 2
END IF

menleft = mf
tcas = menlos + cas

CALL rendom
tcas = MIN(tcas, menleft * x2)
menleft = mf - tcas

tcas = max(tcas, 0)
casdiv = max(1, mf)
casp = cas / casdiv * 100
pcas = cas
dex1 = INT(casp + 1)
dex1 = MIN(dex1, 5)
count = 0
adone = 0
twm = wm

recoil = 0
IF cas <> 0 THEN
  DO
   count = count + 1
   cas = INT(pcas * count / dex1)
   casdiv = max(1, mf)
   casp = (cas + menlos) / casdiv * 100
   IF amtp = 8 OR amtp = 9 THEN
     rendom
     IF x < stead THEN
       SELECT CASE btype
       CASE 1 TO 2
         fear = fear + 1
       CASE 3 TO 8
         fear = fear + 2
       END SELECT
     END IF
   END IF
   a = casp
   CALL morale1(a)
   twm = max(mtr, twm)
   IF mtr > 3 THEN
     adone = count + 1
   END IF
   LOOP UNTIL count >= dex1 OR adone
     IF adone THEN
       cas = INT(cas * (adone) / count)
     END IF
     wm = max(mtr, twm)
     recoil = 0
     IF adone <> 0 THEN
       recoil = INT(mov - (mov * x2 * (dex1 - adone) / dex1))
       recoil = recoil * ABS(recoil > 4)
     END IF
   END IF
   msince = 1
   CALL header
   review$ = "The " + fyrer$ + " "
   SELECT CASE amtp
   CASE 0
     review$ = review$ + "are shooting " + shot$(fwm) + " volleys "
     IF mgs THEN
       review$ = review$ + "and machine gun fire "
     END IF
   CASE 8, 9
     review$ = review$ + "are bringing " + shot$(fwm) + " fire with " + RTRIM$(ammo$(amtp))
     IF guns > 1 THEN
       review$ = review$ + "from several reeking tubes "
     ELSE
       review$ = review$ + "from a reeking tube "
     END IF
   CASE 20
     review$ = review$ + "are bringing a most prodigious fire from "
     IF guns > 1 THEN
       review$ = review$ + "from " + STR$(guns) + " mechanical repeating guns "
     ELSE
       review$ = review$ + " from a single mechanised repeating gun "
     END IF
   CASE ELSE
     review$ = review$ + "are bringing " + shot$(fwm) + " fire with " + RTRIM$(ammo$(amtp)) + " "
     IF amtp2 > 0 AND amtp2 <> amtp THEN
       review$ = review$ + "and " + RTRIM$(ammo$(amtp2))
     END IF
     IF guns > 1 THEN
       review$ = review$ + "from " + STR$(guns) + " guns "
     ELSE
       review$ = review$ + " from a single gun "
     END IF
   END SELECT

  review$ = review$ + "at the " + unit$ + " "
  IF pen1 = true THEN
    review$ = review$ + "penetrating a unit in front of them. "
  END IF

  CALL worps(review$)

  review$ = "The " + unit$ + " "
  IF cshow THEN
    IF cas < 1 THEN
      review$ = review$ + "however, suffered no casualties whatsoever "
      IF ampt > 0 AND amtp <> 20 THEN
        IF hits > 0 THEN
          review$ = review$ + "despite having received at least one hostile shot."
        ELSE
          review$ = review$ + "the enemy having failed to land a single accurate shot. "
        END IF
      END IF
    ELSE
      IF cas < 2 THEN
        review$ = review$ + "suffered a single casualty. "
      IF ampt > 0 AND amtp <> 20 THEN
        IF hits > 1 THEN
          review$ = review$ + "despite having received several enemy shot."
       ELSE
          review$ = review$ + "the enemy having placed a single deadly shot. "
       END IF
     END IF
   ELSE
     review$ = review$ + "suffered " + STR$(cas) + " casualties. "
     IF ampt > 0 AND amtp <> 20 THEN
       IF hits > 1 THEN
         review$ = review$ + "upon receiving several enemy shot. "
       ELSE
         review$ = review$ + "the enemy having landed a single murderous shot amongst them. "
       END IF
     END IF
   END IF
 END IF
END IF

IF btype = 15 THEN
  ell = INT(numan * casp * x1 / 30)
  IF ell THEN
    IF ell > 1 THEN
      review$ = review$ + "Additionally, " + STR$(ell) + " elephants were killed "
    ELSE
      review$ = review$ + "In addition, an elephant was also killed "
  END IF
  numan = numan - ell
  numan = max(numan, 0)
  END IF
END IF

IF targart > 0 THEN
SELECT CASE amtp
CASE 0, 3, 20
CASE ELSE
  gunexp = 0
  FOR a = 1 TO gf
    CALL rendom
    IF x < casp THEN
      gunexp = gunexp + 1
    END IF
  NEXT a
  IF btype = 15 AND ell > 0 THEN
    gunlos = max(gunlos, ell)
  END IF
  IF gunexp THEN
    IF gunexp > 1 THEN
      review$ = review$ + " and " + STR$(gunexp) + " guns were dismounted. "
    ELSE
      review$ = review$ + "and a single gun was dismounted. "
    END IF
    gunlos = gunlos + gunexp
  END IF
END SELECT
END IF

IF expl = true THEN
  xcas = INT(15 * xs)
  review$ = review$ + "To add to their woes, an conveyance of ammunition with the unit has exploded inflicting another " + STR$(xcas) + " casualties. "
  cas = INT(cas + xcas)
  expl = FALSE
END IF

review$ = review$ + "As a result of the fire, they are now " + RTRIM$(morale$(wm))

IF recoil THEN
  review$ = review$ + " and they recoil " + STR$(recoil) + " cms. "
ELSE
  review$ = review$ + ". "
END IF

IF mtr > 2 AND mtr < 5 THEN
  rendom
  IF x < (ofa + comcon) THEN
    f = fmn(cform, 13)
    IF f <> cform THEN
      review$ = review$ + "Their advance is halted and they reform into " + RTRIM$(drill$(f)) + ". "
    END IF
    cform = f
  END IF
END IF

iw = weff(weath, 13) / 10

IF firet = 7 THEN
  fire = fire * 2
END IF
IF fire THEN
  rendom
  SELECT CASE targt
  CASE 4 TO 5
    IF x < casp * fire * iw THEN
      review$ = review$ + "The woodland occupied by this unit is ablaze and must be evacuated"
      od = 13
    END IF
  CASE 11
    IF x < casp * fire * 5 * iw THEN
      review$ = review$ + "The village occupied by this unit is on fire and must be evacuated"
      od = 13
    END IF
  CASE 12
    IF x < casp * fire * 2 * iw THEN
      review$ = review$ + "The village occupied by this unit is on fire and must be evacuated"
      od = 13
    END IF
  END SELECT
END IF
CALL worps(review$)

menlos = menlos + cas
CALL replacestats(target)

IF cas = 0 THEN
ELSE
  IF sharp1 = true THEN
    wcs = 2
  ELSE
    wcs = 1
  END IF
CALL wounds(target, cas / mf * 100)
END IF
END SUB

SUB setmarch
CALL header
PRINT
review$ = comand$(oftyp) + officer$ + " "
review$ = review$ + "is not deployed on the field of battle. "
review$ = review$ + "After how many moves are they expected (1-20) to arrive "
CALL worps(review$)
DO
PRINT ";"
INPUT march
LOOP WHILE march < 1 OR march > 21
rendom
exm = march * (100 - comcon) / 100 * xs
march = INT(march + exm)
march1 = march + 22
FOR mch = kk TO kk + brigu
grabstats (mch)
od = march1
replacestats (mch)
NEXT mch


END SUB

