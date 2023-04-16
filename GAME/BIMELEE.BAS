DECLARE SUB atwon ()
DECLARE SUB defwon ()
DECLARE SUB melcalc ()
DECLARE SUB pcharget ()
DECLARE SUB interp ()
DECLARE SUB meldisp ()
'$INCLUDE: 'C:\bc7\ecw\bandi3\game\bloodiba.bi'

SUB atwon

CALL grabstats(unit)
mcas = INT(casdefcause)
mcas = MIN(mcas, caspos)
casdiv = max(1, mf)
casp = mcas / casdiv * 100
wasp = casp
fear = fear / 2

a = casp
CALL morale1(a)
wasp = wasp * mtr
wm = mtr
me = morale(wm, 1)
morlos = 0
mr = mr + mr / 10 * xs
odr = od
menlos = menlos + mcas
CALL replacestats(unit)

CALL header
review$ = unit$ + " were victorious in the assault, "
IF mtr < 4 THEN
  review$ = review$ + "and are " + RTRIM$(morale$(mtr)) + ". "
ELSE
  review$ = review$ + "but are, alas, " + RTRIM$(morale$(mtr)) + ". "
END IF
IF cshow THEN
  review$ = review$ + "The victory cost them " + STR$(mcas) + " casualties. "
END IF
CALL worps(review$)
wcs = 3
a = casp
CALL wounds(unit, a)

PRINT
CALL grabstats(unit)
CALL rendom
IF x > (ag / mtr) THEN
  od = 15
ELSE
  od = 1
END IF

msince = 1
ofpad = ofa / 10 * xs
ofp = ofp + ofpad
CALL replacestats(unit)

' ******* start of losers ************

CALL grabstats(tunit)
mcas = INT(casatcause)
IF mcas = mf THEN
  menlos = mcas
  CALL replacestats(tunit)
  casp = 100
  lasp = 1000
  review$ = "As a result of its defeat " + unit$ + " cease to exist as a military unit, having been wiped out to a man. "
ELSE
  casdiv = max(1, mf)
  casp = (mcas) / casdiv * 100
  lasp = casp
  a = fear * 2
  fear = MIN(50, a)
  a = casp
  CALL morale1(a)
  wm = max(wm, mtr)
  lasp = lasp * wm

  SELECT CASE wm
  CASE 1 TO 3
    IF trn > 8 THEN
      od = 5
    ELSE
      od = 16
    END IF
  CASE 4
    od = 13
  CASE 5
    od = 18
  CASE ELSE
    od = 21
    ofp = ofp / 2
  END SELECT

  IF winodr < 3 THEN
    SELECT CASE od
    CASE 13
      od = 18
      casp = casp * 3 / 2
    CASE 16
      excas = mcas * xs
    CASE 18
      excas = mcas * xs * 2
      casp = casp * 3 / 2
    CASE 21
      excas = mcas * xs * 3
      casp = casp * 2
    END SELECT
  END IF
  defodr = od
  mcas = INT(mcas + excas)
  mcas = MIN(mcas, caspos)
  menlos = menlos + mcas
  menlos = MIN(menlos, mf)
  CALL replacestats(tunit)

  review$ = unit$ + " were worsted in the affray, "
  IF mtr < 4 THEN
    review$ = review$ + "however, they remain " + RTRIM$(morale$(mtr)) + ". "
  ELSE
    review$ = review$ + "and are now " + RTRIM$(morale$(mtr)) + ". "
  END IF
  IF cshow THEN
    review$ = review$ + "They suffered the loss of " + STR$(mcas) + " men in their defeat. "
  END IF
END IF
CALL worps(review$)
    wcs = 3
    a = casp
CALL wounds(tunit, a)

CALL grabstats(tunit)
guncap = 0
IF std THEN
  chasp = (lasp - wasp) / 2
  chasp = MIN(90, chasp)
  IF mr - morlos < 1 THEN
    chasp = 99
  END IF
  rendom
  IF x < chasp THEN
    morlos = morlos * 3
    colours = TRUE
    IF btype < 9 THEN
      h$ = "Colours"
    ELSE
      h$ = "guns"
      gunlos = gf
      guncap = gf
    END IF

    review$ = "The " + h$ + " of the " + unit$
    review$ = review$ + " were captured by the "
    morlos = morlos * 2
    std = 0
  END IF
END IF

msince = 1
CALL replacestats(tunit)

IF colours = TRUE THEN
  colours = FALSE
  grabstats (unit)
  review$ = review$ + unit$
  mr = mr + 10
  IF guncap THEN
    std = std + guncap
  ELSE
    std = std + 100
  END IF
  std = MIN(std, 256)
  CALL replacestats(unit)
  CALL worps(review$)
END IF

IF defodr = 5 THEN
  grabstats (unit)
  od = 16
  replacestats (unit)
END IF

END SUB

DEFINT X-Z
SUB chargedisp
pexit = 1

DO
  CALL grabstats(charger)

  IF od = 10 THEN
    od = 5
  END IF
  
  chwm = spm
  CALL replacestats(charger)

  CALL header
  CALL grabstats(charger)
  IF disorg > 100 THEN
    review$ = "The " + unit$ + " in disordered " + RTRIM$(drill$(cform)) + " in "
  ELSE
    review$ = "The " + unit$ + " in " + RTRIM$(drill$(cform)) + " in "
  END IF
  IF tr = 1 THEN
    review$ = review$ + "the "
  END IF
  review$ = review$ + RTRIM$(terrain$(tr)) + " are contacting "
  CALL worps(review$)
 
  CALL grabstats(target)
  IF disorg > 100 THEN
    review$ = "The " + unit$ + " in disordered " + RTRIM$(drill$(cform)) + " in "
  ELSE
    review$ = "The " + unit$ + " in " + RTRIM$(drill$(cform)) + " in "
  END IF
  IF tr = 1 THEN
    review$ = review$ + "the "
  END IF
  review$ = review$ + RTRIM$(terrain$(tr))
  CALL worps(review$)
  PRINT
  wate
  choice = windows("Charge type:", 13, charge$())

  IF choice < 8 AND chwm > 2 THEN
    x = Alert(4, "The unit's morale is |" + morale$(chwm) + "|and thus may not charge!", 9, 10, 14, 70, "", "", "")
   choice = 13
  END IF
  IF choice = 0 THEN
    choice = 13
  END IF

  chargecat = choice
  SELECT CASE choice
    CASE 1 TO 6
      CALL pcharget
      pexit = 0
    CASE 7
      CALL pcharget
      k = charger
      charger = target
      target = k
      CALL pcharget
      pexit = 0
    CASE 8 TO 10
      CALL interp
      pexit = 0
    CASE 11
      CALL ptc
    CASE 12
      CALL pfc
    CASE ELSE
      pexit = 0
  END SELECT

LOOP UNTIL pexit = 0
header
END SUB

DEFSNG X-Z
SUB combatants
DO
  forced = TRUE
  CALL header
  PRINT
  PRINT "Which unit wishes to melee ";
  unit = -1
  DO
    INPUT unit
  LOOP WHILE unit < 0 OR unit > nu

  IF unit > 0 THEN
    CALL grabstats(unit)
    IF od > 3 OR mf = 0 OR btype = 0 THEN
      IF od = 9 OR od > 14 THEN
        x = Alert(4, unit$ + "|is rallying.", 9, 10, 14, 70, "", "", "")
        forced = FALSE
      END IF
      IF od > 3 THEN
        dummy = Alert(4, "The unit's order is not charge|It may not initiate melee.", 9, 10, 14, 70, "Melee", "No Melee", "")
        IF dummy = 1 THEN
          forced = TRUE
        ELSE
          forced = FALSE
        END IF
      END IF
      IF mf = 0 AND btype > 0 THEN
        dummy = Alert(4, "The unit has no men left", 9, 10, 14, 70, "", "", "")
        forced = FALSE
      END IF
      IF btype = 0 THEN
        dummy = Alert(4, "The unit is an officer|and may not be engaged", 9, 10, 14, 70, "", "", "")
        forced = FALSE
      END IF

    END IF

    IF forced = TRUE THEN
      ok = 0
      DO
        tunit = -1
        ok = 0
        grabstats (unit)
        DO
          header
          PRINT
          PRINT "Who are the "; unit$; " meleeing ";
          INPUT tunit
        LOOP WHILE tunit < 0 OR tunit > nu
        IF tunit = 0 THEN
          ok = 1
          forced = FALSE
        ELSE
          ok = 1
          CALL grabstats(tunit)
          IF mf = 0 THEN
            x = Alert(4, "The " + unit$ + " has no men left.", 9, 10, 14, 70, "", "", "")
            ok = 0
          END IF

          IF btype = 0 OR forced = FALSE THEN
            x = Alert(4, "The " + unit$ + "|is an officer unit.", 9, 10, 14, 70, "", "", "")
            ok = 0
          END IF
        END IF
      LOOP UNTIL tunit = 0 OR ok = 1
    END IF

    IF forced = TRUE THEN
      CALL meldisp
    END IF
  END IF
LOOP UNTIL unit = 0

END SUB

SUB defwon

CALL grabstats(tunit)

mcas = INT(casatcause)
mcas = MIN(mcas, caspos)
casdiv = max(1, mf)
casp = mcas / casdiv * 100
wasp = casp
fear = fear / 2

a = casp
CALL morale1(a)
wasp = wasp * mtr
wm = mtr
me = morale(wm, 1)
morlos = 0
mr = mr + mr / 10 * xs
menlos = menlos + mcas
CALL replacestats(tunit)

CALL header
review$ = unit$ + " won the melee, "
IF mtr < 4 THEN
  review$ = review$ + "and are " + RTRIM$(morale$(mtr)) + ". "
ELSE
  review$ = review$ + "however, they are " + RTRIM$(morale$(mtr)) + ". "
END IF
IF cshow THEN
  review$ = review$ + "They suffered " + STR$(mcas) + " casualties in the combat. "
END IF
wcs = 3
a = casp
CALL worps(review$)
CALL wounds(tunit, a)
PRINT
'
CALL grabstats(tunit)
CALL rendom
IF x > (ag / mtr) THEN
  IF trn > 8 THEN
    od = 5
  ELSE
    od = 15
  END IF
ELSE
  CALL rendom
  IF x > (comcon + ofa) THEN
    od = 1
  END IF
END IF
winodr = od

msince = 1
ofpad = ofa / 10 * xs
ofp = ofp + ofpad
CALL replacestats(tunit)

' ******* start of losers ************

CALL grabstats(unit)
mcas = INT(casdefcause)
casdiv = max(1, mf)
casp = mcas / casdiv * 100
lasp = casp
IF mcas = mf THEN
  menlos = mcas
  CALL replacestats(tunit)
  casp = 100
  lasp = 1000
  review$ = "As a result of the melee " + unit$ + " ceased to exist as a military unit, having been wiped out to a man. "
ELSE
  a = fear * 2
  fear = MIN(50, a)
  a = casp
  CALL morale1(a)
  wm = max(wm, mtr)
  lasp = lasp * wm

  SELECT CASE wm
  CASE 1 TO 3
    od = 16
  CASE 4
    od = 13
  CASE 5
    od = 18
  CASE ELSE
    od = 21
    ofp = ofp / 2
  END SELECT

  IF winodr < 3 THEN
    SELECT CASE od
    CASE 13
      od = 18
      casp = casp * 3 / 2
    CASE 16
      excas = mcas * xs
    CASE 18
      excas = mcas * xs * 2
      casp = casp * 3 / 2
    CASE 21
      excas = mcas * xs * 3
      casp = casp * 2
    END SELECT
  END IF
  mcas = INT(mcas + excas)
  mcas = MIN(mcas, caspos)
  menlos = menlos + mcas
  CALL replacestats(unit)
  
  review$ = unit$ + " were defeated in the struggle, "
  IF mtr < 4 THEN
    review$ = review$ + "nonetheless, they remain " + RTRIM$(morale$(mtr)) + ". "
  ELSE
    review$ = review$ + "and are " + RTRIM$(morale$(mtr)) + ". "
  END IF
  IF cshow THEN
    review$ = review$ + "They lost " + STR$(mcas) + " casualties in this rebuff. "
  END IF
END IF
  wcs = 3
  a = casp

CALL worps(review$)
CALL wounds(unit, a)


CALL grabstats(unit)
guncap = 0
IF std THEN
  chasp = (lasp - wasp) / 2
  chasp = MIN(90, chasp)
  IF mr - morlos < 1 THEN
    chasp = 99
  END IF
  CALL rendom
  IF x < chasp THEN
    morlos = morlos * 3
    colours = TRUE
    IF btype < 9 THEN
      h$ = "Colours"
    ELSE
      h$ = "guns"
      gunlos = gf
      guncap = gf
    END IF
    
    review$ = "The " + h$ + " of the " + unit$
    review$ = review$ + "were captured by the "
    morlos = morlos * 2
    std = 0
  END IF
END IF

msince = 1
CALL replacestats(unit)

IF colours = TRUE THEN
  colours = FALSE
  CALL grabstats(tunit)
  review$ = review$ + unit$
  mr = mr + 10
  IF guncap THEN
    std = std + guncap
  ELSE
    std = std + 100
  END IF
  std = MIN(std, 256)
  CALL replacestats(tunit)
  CALL worps(review$)
END IF

END SUB

SUB melcalc

CALL grabstats(unit)
atform = cform
atrn = tr
atype = btype
atdis = disorg
atarm = arm
atwep = mw
atcc = comcon
atmen = mf

CALL header
CALL grabstats(tunit)
PRINT unit$; " has "; numsub; " sub units."
PRINT "How many are involved in the melee ";
DO
  INPUT ns
LOOP WHILE ns < 0 OR ns > numsub

IF ns > 0 THEN
  te = terrain(tr, 6)
  deftr = tr
  deftrn = te
  defact = od
  defch = chrge
  typedef = btype
  disdef = disorg
  defarm = arm
  defwep = mw
  defcom = comcon
  defmen = mf
  
  IF chrge AND tr < 3 THEN
    ag = ag * 1.2
    deftrn = 10
    IF btype > 5 AND btype < 9 THEN
      ag = ag * 1.5
    END IF
  END IF

  mweap = mi
  fe = fmn(cform, 8)
  IF atype > 5 AND atype < 9 THEN
    fe = fmn(cform, 9)
    mweap = mc
  END IF

  CALL rendom
  cc = 100
  IF btype > 5 AND btype < 9 THEN
    cc = defcom + (100 - defcom) * xs
  END IF
  deffighters = mf * ns / numsub * cc / 100
  defcount = deffighters
  deffighters = deffighters / 100 * fe
  deffighters = MIN(deffighters, (ABS((spm < 5)) * mf + 1))
  casdefcause = deffighters / 100 * mr / 100 * ag
  casdefcause = casdefcause / 1000 * (1000 - disdef + atdis)
  CALL rendom
  casdefcause = casdefcause / (mo + stead) * mweap
  casdefcause = INT(casdefcause + casdefcause * x2 / modcon) * 2
  CALL rendom
  armef = armour(atarm, defwep)
  casdefcause = casdefcause * x1
  IF armef > 0 THEN
    c = casdefcause / armef * 10
    c = RND(c)
  ELSE
    c = 0
  END IF
  protat = casdefcause - c
  IF protat > 1 THEN
    protat = RND * protat + 1
    casdefcause = casdefcause - protat
  ELSE
    protat = 0
  END IF
  casdefcause = MIN(casdefcause, atmen)


  CALL grabstats(unit)
  PRINT
  PRINT unit$; " has "; numsub; " sub units."
  PRINT "How many are involved in the melee ";
  DO
    INPUT ns
  LOOP WHILE ns < 0 OR ns > numsub

  IF ns THEN
    IF tr < 3 AND chrge THEN
      ag = ag * 1.2
      IF btype > 5 AND btype < 9 THEN
        ag = ag * 1.5
      END IF
    END IF

    mweap = mi
    fe = fmn(cform, 8)
    IF typedef > 5 AND typedef < 9 THEN
      fe = fmn(cform, 9)
      mweap = mc
    END IF

    CALL rendom
    cc = 100
    IF btype > 5 AND btype < 9 THEN
      cc = atcc + (100 - atcc) * xs
    END IF
    
    atmen = mf
    atfighters = mf * ns / numsub
    atcount = atfighters
    atfighters = atfighters / 100 * fe
    atfighters = MIN(atfighters, (ABS((spm < 5)) * mf + 1))
    atfighters = MIN(atfighters, defcount * 2)
    IF deftr > 5 THEN
      atfighters = MIN(atfighters, defcount)
    END IF
    casatcause = atfighters / 100 * mr / 100 * ag
    casatcause = casatcause / 1000 * (1000 + disdef - atdis)
    casatcause = casatcause / deftrn * 10
    CALL rendom
    casatcause = casatcause / (mo + stead) * mweap
    casatcause = INT(casatcause + casatcause * x2 / modcon) * 2
    CALL rendom
    casatcause = casatcause * x1

    armef = armour(defarm, atwep)
    IF armef > 0 THEN
      c = casatcause / armef * 10
      c = RND(c)
    ELSE
      c = 0
    END IF
    protdef = casatcause - c
    IF protdef > 1 THEN
      protdef = RND * protdef + 1
      casatcause = casatcause - protdef
    ELSE
      protdef = 0
    END IF
    IF defcount > atcount * 2 THEN
      casdefcause = casdefcause / defcount * atcount * 2
    END IF
    casatcause = MIN(casatcause, defmen)
    IF casatcause = casdefcause THEN
      CALL rendom
      IF x < 50 THEN
        casdefcause = casedefcause + 1
      ELSE
        casatcause = casatcause + 1
      END IF
    END IF

    IF casdefcause > casatcause THEN
      CALL defwon
    ELSE
      CALL atwon
    END IF
    CALL wate
 END IF
END IF

END SUB

SUB meldisp

CALL grabstats(unit)
CALL header
SELECT CASE cform
CASE 48 TO 51, 54 TO 56
  review$ = "The " + unit$ + " " + RTRIM$(drill$(cform)) + " in "
CASE ELSE
  review$ = "The " + unit$ + " in " + RTRIM$(drill$(cform)) + " in "
END SELECT
IF tr < 2 THEN
  review$ = review$ + "the "
END IF
  review$ = review$ + RTRIM$(terrain$(tr)) + " are charging; "

grabstats (tunit)
SELECT CASE cform
CASE 48 TO 51, 54 TO 56
  review$ = review$ + "the " + unit$ + " who are " + RTRIM$(drill$(cform)) + " in "
CASE ELSE
  review$ = review$ + "the " + unit$ + " formed in " + RTRIM$(drill$(cform)) + " in "
END SELECT
IF tr < 2 THEN
  review$ = review$ + "the "
END IF
review$ = review$ + RTRIM$(terrain$(tr))
IF chrge > 0 THEN
  review$ = review$ + " who are countercharging. "
ELSE
  review$ = review$ + " who receive the charge at the halt. "
END IF

CALL worps(review$)
wate
choice = windows("Melee Details:", 4, mele$())
'
SELECT CASE choice
CASE 1
  CALL melcalc
CASE 2
  CALL ptc
  CALL melcalc
CASE 3
  CALL pfc
  CALL melcalc
END SELECT

END SUB

SUB meleeing
'
phase$ = "MELEE  "
'
IF phase$ = here$ OR oldgame = FALSE THEN
'
oldgame = FALSE
'
upd = FALSE
'
END IF
'

END SUB

DEFINT X-Z
SUB pcharged
ok = FALSE
DO
  target = -1
  DO
    grabstats (charger)
    header
    PRINT
    review$ = "Which unit is being charged or passed by " + unit$
    worps (review$)
    INPUT target
  LOOP WHILE target < 0 OR target > nu

  IF target > 0 THEN
    ok = TRUE
    CALL grabstats(target)
    IF btype = 0 THEN
      x = Alert(4, "Unit " + STR$(target) + " is a Headquarters unit|and may not be charged.", 9, 10, 14, 70, "", "", "")
      ok = FALSE
    END IF

    IF mf = 0 THEN
      x = Alert(4, "The target has no men left in it!", 9, 10, 14, 70, "", "", "")
      ok = FALSE
    END IF
  END IF
LOOP UNTIL target = 0 OR ok = TRUE

END SUB

DEFSNG X-Z
SUB pcharger

pexit = FALSE
DO
  CALL header
  PRINT
  PRINT "Which unit is declaring a charge or interpenetration ";
  INPUT charger
  IF charger = 0 THEN
    pexit = TRUE
  ELSE
    IF charger > nu THEN
      x = Alert(4, "The maximum unit number is|" + STR$(nu) + " not " + STR$(charger) + ".", 9, 10, 14, 70, "", "", "")
      pexit = FALSE
    ELSE
      pexit = TRUE
      CALL grabstats(charger)
      IF od = 12 OR od > 23 THEN
        x = Alert(4, "The unit is not active", 9, 10, 14, 70, "", "", "")
        pexit = FALSE
      END IF
      IF mf = 0 AND btype > 0 THEN
        x = Alert(4, "The unit has no men left!", 9, 10, 14, 70, "", "", "")
        pexit = FALSE
      END IF
      IF btype = 0 THEN
        x = Alert(4, "Unit " + STR$(charger) + " is a Headquarters unit|and may not charge.", 9, 10, 14, 70, "", "", "")
        pexit = FALSE
      END IF
    END IF
  END IF
LOOP UNTIL pexit = TRUE

END SUB

SUB pcharget
CALL grabstats(target)
fear = max(INT(fear), charge(chargecat, 2))
deform = cform
deftrn = terrain(tr, 7)
defad = terrain(tr, 8)
definf = fmn(cform, 5)
defcav = fmn(cform, 6)
deftype = btype
IF cform < 40 THEN
  deftype = 1
END IF
defwm = modconm
replacestats (target)
CALL grabstats(charger)

IF sat THEN
  asat = sat
  CALL grabstats(asat)
  ofp = ofp + ofl / 10 * xs
  asmr = mr
  asof$ = officer$
  replacestats (asat)
  CALL grabstats(charger)
END IF

fear = (INT(fear) + charge(chargecat, 1)) / 2
attype = btype
IF cform < 40 THEN
  attype = 1
END IF
atinf = fmn(cform, 5)
atcav = fmn(cform, 6)
atwm = modconm

IF attype > 5 AND attype < 9 THEN
  defall = defcav
  deftrn = deftrn + defad
ELSE
  defall = definf
  IF deftype > 5 AND deftype < 9 THEN
    defall = defall * 10
    IF chargecat = 1 THEN
      chargecat = 2
    END IF
  END IF
END IF

IF deftype > 5 AND deftype < 9 THEN
  atall = atcav
ELSE
  atall = atinf
END IF

SELECT CASE chargecat
CASE 2, 3, 4
  defall = MIN(defall / 2, 5)
END SELECT

IF disorg > 100 THEN
  defall = MIN(defall, 5)
END IF

casp = (stead + 100) / ag
casp = casp / atwm / 100 * deftrn * defwm
a = casp
CALL morale1(a)

CALL header
PRINT
review$ = unit$ + " "

rally = FALSE
IF sat AND mtr > 1 THEN
  CALL rendom
  m = max(1, mtr / 2)
  IF x < asmr / m THEN
    mtr = 1
    rally = TRUE
  END IF
END IF

CALL rendom
cc = comcon * x1
CALL rendom
ca = ag * x1

IF mtr > 2 OR (mtr > 1 AND cc < 40 AND fear > 9 AND ca < 50) THEN
  IF (attype > 5 AND deftype > 5) OR attype < 6 THEN
    review$ = review$ + "will not charge home and halt 100m short of the target. "
    od = 9
    IF attype > 5 THEN
      disorg = (disorg + 100 - comcon) / 2
    ELSE
      disorg = disorg + 100 - comcon
    END IF
    fear = 15
  ELSE
    review$ = review$ + "will not charge home and veer off 100m. short of the target. "
    od = 13
    disorg = (disorg + 100 - comcon) / 2
    fear = 15
  END IF

  od = max(morale(spm, 1), od)
  disorg = MIN(disorg, 255)
  chrge = FALSE
  CALL replacestats(charger)
  CALL worps(review$)
  PRINT

ELSE
  cform = fmn(cform, 10)
  IF rally = TRUE THEN
    rally = FALSE
    review$ = review$ + "faltered, but were led on by " + asof$ + ". "
  ELSE
    review$ = review$ + "will attempt the charge. "
  END IF
  CALL worps(review$)
  PRINT

  chrge = TRUE
  od = 1
  wm = mtr
  CALL replacestats(charger)
  CALL grabstats(target)
  IF sat THEN
    dsat = sat
    CALL grabstats(dsat)
    ofp = ofp + ofl / 12 * xs
    dsmr = mr
    dsof$ = officer$
    replacestats (dsat)
    
  END IF

'         **********************************
'            defender's morale
'         **********************************

  CALL grabstats(target)
  IF attype > 5 AND attype < 9 THEN
    fear = max(INT(fear), charge(chargecat, 3))
  ELSE
    fear = max(INT(fear), charge(chargecat, 2))
  END IF

  casp = stead / 10
  defall = max(defall, 1)
  casp = casp / defall / deftrn * atall * atwm / defwm * 10
  a = casp
  CALL morale1(a)

  review$ = unit$ + " "
  rally = FALSE
  IF sat AND mtr > 2 THEN
    CALL rendom
    m = max(1, mtr / 2)
    IF x < dsmr / m THEN
      mtr = 2
      rally = TRUE
    END IF
  END IF

  IF rally THEN
    review$ = review$ + "wavered, but were rallied by " + dsof$ + " and are now " + RTRIM$(morale$(mtr))
    rally = FALSE
  ELSE
    review$ = review$ + " are " + RTRIM$(morale$(mtr))
  END IF

  tmr = mtr + 1

  SELECT CASE tmr
  CASE 5 TO 6
    review$ = review$ + " but still face the charge. "
    wm = max(wm, mtr)
    morlos = morlos + 10
    od = max(morale(wm, 1), od)
    disorg = disorg + 100 - comcon
    fear = max(INT(fear), 20)
    cform = fmn(cform, 10)
    CALL replacestats(target)
    grabstats (charger)
    review$ = review$ + unit$ + " press home their charge "
    charge = TRUE
    replacestats (charger)
  CASE 4
    review$ = review$ + " and face the charge. "
    wm = mtr
    cform = fmn(cform, 10)
    CALL replacestats(target)
    CALL grabstats(charger)
    IF btype > 5 AND btype < 9 THEN
      agm = ag * tmr / 4
    ELSE
      agm = ag * tmr / 6
    END IF
    review$ = review$ + unit$ + " "
    casp = (stead / 10 + 1) * deftrn * defall / agm
    a = casp
    CALL morale1(a)
    rally = FALSE
    IF sat AND mtr > 1 THEN
      rendom
      m = max(1, mtr / 2)
      IF x < asmr / m THEN
        mtr = 1
        rally = TRUE
      END IF
    END IF
    IF mtr < 3 THEN
      IF rally THEN
        review$ = review$ + "faltered approaching the enemy "
        review$ = review$ + "but press home, led by " + officer$ + ". "
        rally = FALSE
      ELSE
        review$ = review$ + "press home their charge. "
      END IF
      chrge = TRUE
    ELSE
      review$ = review$ + "falter and halt 30m from the target. "
      od = 9
      chrge = FALSE
    END IF
    CALL replacestats(charger)

  CASE 1 TO 3
    review$ = review$ + " and face the charge. "
    wm = 1
    fear = MIN(10, INT(fear))
    cform = fmn(cform, 10)
    IF btype > 5 AND btype < 9 AND (od < 4 OR od = 5) THEN
      chrge = TRUE
      review$ = review$ + unit$ + " launch a countercharge. "
      CALL replacestats(target)
    ELSE
      CALL replacestats(target)
      CALL grabstats(charger)
      review$ = review$ + unit$ + " "
      agm = ag
      IF btype > 5 AND btype < 9 THEN
        agm = ag * tmr / 6
      ELSE
        agm = ag * tmr / 8
      END IF
      casp = (stead / 10 + 1) * deftrn * defall / agm
      a = casp
      CALL morale1(a)
      rally = FALSE
      IF sat AND mtr > 1 THEN
        CALL rendom
        m = max(1, mtr / 2)
       IF x < asmr / m THEN
         mtr = 1
         rally = TRUE
       END IF
     END IF
     IF mtr < 3 THEN
       IF rally THEN
         review$ = review$ + "faltered approaching the enemy "
         review$ = review$ + "but press home, led by " + officer$ + ". "
         rally = FALSE
       END IF
       review$ = review$ + "press home their charge. "
     ELSE
       review$ = review$ + "falter and halt 30m from the target. "
       chrge = FALSE
       od = 9
       replacestats (charger)
     END IF
   END IF

  CASE 0
    cform = fmn(cform, 10)
    IF deftype < 9 THEN
      chrge = TRUE
      review$ = review$ + unit$ + " launch a fierce countercharge. "
      CALL replacestats(target)
      CALL grabstats(charger)
      agm = ag / 2
      review$ = review$ + unit$ + " "
      casp = (stead / 10 + 1) * deftrn * defall / agm
      a = casp
     CALL morale1(a)
     IF mtr3 THEN
       review$ = review$ + "press home their charge. "
     ELSE
       review$ = review$ + "falter and halt 30m from the target. "
       od = 9
       chrge = FALSE
       replacestats (charger)
     END IF
   END IF

  CASE ELSE
    CALL rendom
    IF btype > 2 AND btype < 9 THEN
      rout = INT(movebase * 5 * x1)
    ELSE
      rout = INT(movebase * 2 * x1)
    END IF
    review$ = review$ + " and run " + STR$(rout) + " centimeters. "
    disorg = disorg + 200 - comcon
    disorg = MIN(255, disorg)
    wm = mtr
    fear = 40
    CALL replacestats(target)

  END SELECT
  CALL worps(review$)

END IF

CALL wate

END SUB

