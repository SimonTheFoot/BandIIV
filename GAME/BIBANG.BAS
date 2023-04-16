DECLARE SUB artilleryfire ()
DECLARE SUB checkamo ()
DECLARE SUB checkfirer ()
DECLARE SUB extratarg ()
DECLARE SUB firebac ()
DECLARE SUB firer ()
DECLARE SUB firerstats ()
DECLARE SUB infire ()
DECLARE SUB mgfire ()
DECLARE SUB penetrate ()
DECLARE SUB pickamo ()
DECLARE SUB range ()
DECLARE SUB targetstats ()
DECLARE SUB targetunit ()
DECLARE SUB pout (cas%)
'$INCLUDE: 'C:\bc7\ecw\bandi3\game\bloodiba.bi'

SUB artilleryfire STATIC

CALL grabstats(fyrer)
hit1 = 0
hit2 = 0
fyrer$ = unit$
fwm = spm + 1
gft = gf + gf2
firedis = fires
SELECT CASE r
CASE 1 TO 300
  rm = 3
  firedis = firedis ^ 1.5
CASE 301 TO 1200
  rm = 4
  r1 = r
  firedis = firedis * er / r1
CASE ELSE
  rm = 5
  r1 = r ^ 1.3
  firedis = firedis * er / r1
END SELECT

aquire = 0
IF (target = targ AND r < 1200) THEN
  firedis = firedis * 1.5
  aquire = 1
END IF

targ = target

a = 0
gf = max(gf, 0)
expl = FALSE
'
guns = suf
formp = fmn(cform, 7)
gunsout = 0
gunexp = 0

IF guns > 0 THEN
  cat = 0
  z = (100 - ef) / 2
  z = 100 - z
  FOR gunf = 1 TO guns
    CALL rendom
    IF x < z THEN
    ELSE
      CALL rendom
      expl = fires * z / 100
      IF x > expl THEN
        gunsout = gunsout + 1
        CALL rendom
        IF x > z THEN
          IF x1 > 1 THEN
            v = INT(10 * xs)
          ELSE
            v = 0
          END IF
          cat = cat + v
          gunexp = gunexp + 1
        END IF
      END IF
    END IF
  NEXT gunf

  IF gunexp > 0 THEN
    IF gunexp = 1 THEN
      review$ = "One of the " + guntype$(tp) + " has " + cat$(tp)
    ELSE
      review$ = STR$(gunexp) + " of the " + guntype$(tp) + " has " + cat$(tp)
    END IF
    IF cat > 0 THEN
      menlos = menlos + cat
      IF cat = 1 THEN
        review$ = review$ + " causing injury to one of the crewmen. "
      ELSE
        review$ = review$ + " inflicting " + STR$(cat) + " casualties amongst the crew. "
      END IF
    END IF
    CALL worps(review$)
    CALL wate
    gunlos = gunlos + gunexp
  END IF
END IF

CALL replacestats(fyrer)
rff = rf * formp / 100 / rm * fires / 100
rff2 = rf2 * formp / 100 / rm * fires / 100
rff = rff * mr / mo * (255 - disorg) / 255
rff2 = rff2 * mr / mo * (255 - disorg) / 255

pfn = formp
CALL checkamo
gf1 = gf
gf3 = gf2

IF gunsout > 0 THEN
  FOR a = 1 TO gunsout
    rendom
    acc = guns / gf * 100
    IF x < acc THEN
      gf1 = gf1 - 1
      gf1 = max(gf1, 0)
    ELSE
      gf3 = gf3 - 1
      gf3 = max(gf3, 0)
    END IF
  NEXT a
END IF

shot1 = gf1 * rff
shot2 = gf3 * rff2
firedis = firedis / modcon
IF firedis > 99 THEN
  firedis = 99
END IF
shots = shot1 + shot2
sf = sf + shots * 20
IF shots = 0 THEN
  review$ = "The battery may not fire during this turn: none of its guns are capable of being fired because of fouling or other problems."
  CALL worps(review$)
  CALL wate
ELSE
  hit1 = 0
  hit2 = 0
  hits = 0
  fire = 1
  IF sud = gft AND suf = gf2 THEN
  ELSE

    FOR gunf = 1 TO shot1
      a = a + 1
      CALL rendom
      IF x < firedis THEN
        hit1 = hit1 + 1
      END IF
    NEXT gunf
    
    CALL pickamo
    IF tp = 7 AND r > 300 THEN
      amtp = 2
    END IF

    SELECT CASE fmn
    CASE 0, 2 TO 4, 8, 9, 11 TO 18, 20 TO 22, 28 TO 31, 35, 37 TO 40, 43, 44, 49, 50, 55, 58, 61, 65, 67, 68, 70
      imp1 = ammo(amtp, 1)
    CASE ELSE
      imp1 = ammo(amtp, 2)
    END SELECT
    acc = se
    imp1 = acc * imp1 / 10
    FOR a = 1 TO hit1
      acc = imp1 * fe
      acc = acc / te
      acc = acc / 8
      v = INT(RND * acc)
      cas1 = cas1 + v
      NEXT a
    END IF
  IF shot2 THEN
    FOR gunf = 1 TO shot2
      a = a + 1
      CALL rendom
      IF x < firedis THEN
        hit2 = hit2 + 1
      END IF
    NEXT gunf

    CALL pickamo
    IF tp2 = 7 AND r > 300 THEN
      amtp2 = 2
    END IF
    SELECT CASE fmn
    CASE 0, 2 TO 4, 8, 9, 11 TO 18, 20 TO 22, 28 TO 31, 35, 37 TO 40, 43, 44, 49, 50, 55, 58, 61, 65, 67, 68, 70
      imp1 = ammo(amtp2, 1)
    CASE ELSE
      imp1 = ammo(amtp2, 2)
    END SELECT

    FOR a = 1 TO hit2
      cas2 = cas2 + RND(imp1 * fe / te / 5)
    NEXT a

  END IF
  hits = hit1 + hit2
END IF

END SUB

SUB checkamo

IF btype < 9 THEN
  x$ = "per man. "
ELSE
  x$ = "per gun. "
END IF

IF am < 20 THEN
  SELECT CASE am
  CASE 12 TO 20
    review$ = unit$ + " has less than twenty rounds of ammunition left " + x$
  CASE 6 TO 12
    review$ = unit$ + " has less than a dozen rounds of ammunition left " + x$
  CASE 1 TO 5
    review$ = unit$ + " has less than half a dozen rounds of ammunition left " + x$
  CASE 0
    review$ = unit$ + " has entirely run out of ammunition left. "
  END SELECT
  CALL worps(review$)
  CALL wate
END IF

IF btype < 20 THEN
  a = rff * suf / numsub * pfn / 100
ELSE
  a = rff * suf / numsub * pfn / 1000
END IF

IF move = 1 AND firet = 7 THEN
  a = a * SQR(tbomb) * 2
END IF

am = am - a
am = max(am, 0)
            
END SUB

SUB checkfirer
ftype = btype
SELECT CASE btype
CASE 1 TO 8
  IF gf = 0 THEN
    firetype = 1
  ELSE
    firetype = 4
  END IF
CASE 9 TO 19
  firetype = 2
CASE 20
  firetype = 3
CASE ELSE
  firetype = 0
END SELECT

END SUB

SUB extratarg
CALL grabstats(target)
casdiv = max(1, mf)
casp = cas / casdiv * 100
expl = FALSE
'
IF aw THEN
CALL rendom
expl = FALSE
IF x < casp THEN
cas = cas + 20 * xs
expl = TRUE
END IF
END IF
'
IF btype > 8 THEN
CALL rendom
gunlos = INT(ng * casp * xs * 2)
gunlos = MIN(gunlos, ng)
END IF
'
prinon = TRUE
casl = cas
replacestats (target)
END SUB

SUB firebac
grabstats (origtarg)
firemod = 1

SELECT CASE btype
CASE 1 TO 5
  x$ = " companies "
  sud = numsub - pf
CASE 6 TO 8
  x$ = " squadrons "
  sud = numsub - pf
CASE ELSE
  x$ = " guns "
  sud = gf + gf2 - pf
END SELECT

IF sud < 1 THEN
  fireback = FALSE
ELSE
  SELECT CASE od
  CASE 8, 12, 18
    fireback = FALSE
  CASE ELSE
    SELECT CASE fm
    CASE 62, 63, 66, 73 TO 75
      fireback = FALSE
    CASE ELSE
      IF spm > 4 OR (r > xr AND r > xr2) OR firet = 3 OR firet = 4 OR firet = 10 THEN
        fireback = FALSE
      ELSE
        CALL header
        review$ = "The " + unit$ + " came under fire from "
        retfire = fires + (ofa + comcon) / 2
        grabstats (origfire)
        review$ = review$ + "The " + unit$ + ". "
        IF retfire > 100 THEN
          review$ = review$ + "They have " + STR$(sud) + " sub-units still to fire, do you wish to fire back."
          CALL worps(review$)
          fireb = Alert(4, " Return Fire ", 9, 10, 14, 70, " No ", " Yes ", "")
        ELSE
          review$ = "They have " + STR$(sud) + " sub-units still to fire and they wish to fire back unless there is a better target. "
          CALL worps(review$)
          fireb = Alert(4, " Return Fire ", 9, 10, 14, 70, " Yes ", " No ", "")
          IF fireb = 2 THEN
            fireb = 1
          ELSE
            fireb = 2
          END IF
        END IF

        fireback = FALSE
        IF fireb = 2 THEN
          fireback = TRUE
        END IF
        IF firet = 5 OR firet = 6 THEN
          firemod = (firet - 4) * 2
        END IF
      END IF
    END SELECT
  END SELECT
END IF

END SUB

SUB firer
leave = FALSE
'
DO
CALL header
'
PRINT
PRINT "Which unit is to fire ";
INPUT fyrer
LOOP WHILE fyrer < 0 OR fyrer > nu
'

IF fyrer = 0 THEN
leave = TRUE
ELSE
CALL grabstats(fyrer)
IF btype = 0 THEN
x = Alert(4, chap$ + "|is a Staff Officer and may not fire.", 9, 10, 14, 70, "", "", "")
fyrer = 0
END IF

IF od = 12 OR od = 23 THEN
x = Alert(4, unit$ + "|is not activated and may not fire.", 9, 10, 14, 70, "", "", "")
    od = 3
END IF

IF spm > 5 THEN
x = Alert(4, unit$ + "|is " + morale$(spm) + " and may not fire.", 9, 10, 14, 70, "", "", "")
fyrer = 0
END IF

IF am = 0 THEN
x = Alert(4, unit$ + "|is out of ammunition and may not fire.", 9, 10, 14, 70, "", "", "")
fyrer = 0
END IF

IF btype < 9 THEN
  n = numsub
ELSE
  n = gf + gf2
END IF
q = n - pf

IF q < 1 THEN
x = Alert(4, "All of " + unit$ + "|has already fired.", 9, 10, 14, 70, "", "", "")
fyrer = 0
END IF

SELECT CASE cform
CASE 35, 37, 38, 39, 61, 65
  x = Alert(4, unit$ + "|is still limbered and may not fire.", 9, 10, 14, 70, "", "", "")
  fyrer = 0
END SELECT
END IF

END SUB

SUB firerstats
CALL header

SELECT CASE btype
CASE 1 TO 5
  x$ = " companies "
  sud = numsub - pf
CASE 6 TO 8
  x$ = " squadrons "
  sud = numsub - pf
CASE ELSE
  x$ = " guns "
  sud = gf + gf2 - pf
END SELECT

CALL header
PRINT
PRINT unit$; " has "; sud; x$; " still to fire."
PRINT
PRINT "How many will fire ";

DO
INPUT suf
LOOP UNTIL suf >= 0

IF suf = 0 THEN
fyrer = 0
ELSE
suf = MIN(suf, sud)
pf = pf + suf
CALL replacestats(fyrer)
END IF
'
END SUB

SUB fpout
PRINT #10,
PRINT #10, ; "Army Casualties."
PRINT #10,
'
IF men THEN
  a = (INT(mecas / men * 100))
  review$ = "Infantry: " + STR$(mecas) + " from " + STR$(men) + " men (" + STR$(a) + "%)."
  CALL worp(review$)
END IF
'
IF hor THEN
  a = (INT(horcas / hor * 100))
  review$ = "Cavalry: " + STR$(horcas) + " from " + STR$(hor) + " men (" + STR$(a) + "%)."
  CALL worp(review$)
END IF
'
IF guners THEN
  a = (INT(gunercas / guners * 100))
  review$ = "Gunners: " + STR$(gunercas) + " from " + STR$(guners) + " men (" + STR$(a) + "%)."
  CALL worp(review$)
END IF
'
toc = mecas + horcas + gunercas
tom = men + hor + guner
PRINT #10,
a = (INT(toc / tom * 100))
review$ = "A Total of: " + STR$(toc) + " from " + STR$(tom) + " men (" + STR$(a) + "%). "

IF pointshow THEN
  review$ = review$ + "Total Points Value: " + STR$(tpv) + "pts. "
END IF
CALL worp(review$)
PRINT #10,
PRINT #10, ; "_______________________________________________________________________"
PRINT #10,
END SUB

SUB infire
CALL grabstats(fyrer)
fyrer$ = unit$
fwm = spm + 1
formp = 0
IF wp2 > 0 THEN
  pw2 = 100 - pw
  f = fmn(cform, 7)
  formp = MIN(f, pw2)
  shooters2 = mf * formp / 100
  pfn = formp
ELSE
  shooters2 = 0
  cas2 = 0
END IF

f = fmn(cform, 7)
formp = f - formp
formp = MIN(formp, pw)
pfn = pfn + formp
shooters1 = mf / 100 * formp
shooters1 = shooters1 * suf / numsub

rff1 = rf * 3
rff2 = rf2 * 3

t = max(r, 30)
rs = t ^ 1.5 * 10

IF r < 100 OR e < er THEN
  acc = (50 + er / 5)
  r1 = rs / acc
  acc = (50 + er2 / 5)
  r2 = rs / acc
ELSE
  acc = (er / 5 + r / 5)
  r1 = rs / acc
  rff1 = rff1 / 3 + 1
  acc = (er2 / 5 + r / 5)
  r2 = rs / acc
  rff2 = rff2 / 3 + 1
END IF

IF r > er THEN
  rff1 = rff1 / 2
END IF
IF r > er2 THEN
  rff2 = rff2 / 2
END IF

rff1 = MIN(rf * 3, INT(rff1))
rff2 = MIN(rf2 * 3, INT(rff2))

shooters1 = INT(shooters1 / mo * mr / 255 * (255 - disorg))
shooters2 = INT(shooters2 / mo * mr / 255 * (255 - disorg))

movef! = 12 / (mov + 12)

rff1 = rff1 * movef!
rff2 = rff2 * movef!
shooters = shooters1 + shooters2

CALL checkamo

IF tp > 1 THEN
  sf = sf + rff1 * shooters / 10
END IF

sharp = FALSE
SELECT CASE wp
CASE 11, 12, 13, 20, 22, 49, 54, 55, 94, 99, 115, 116
  sharp = TRUE
END SELECT
SELECT CASE wp2
CASE 11, 12, 13, 20, 22, 49, 54, 55, 94, 99, 115, 116
  sharp = TRUE
END SELECT
'
fire = 0
amtp = 0
amtp2 = 0
eft = eff
eft2 = eff2
targ = target

wf = weff(weath, tp)
eft1 = ef * wf / 10
eft2 = ef2 * wf / 10

IF shot = 0 THEN
  eft1 = eft1 + eft1 * fires / 250
  eft2 = eft2 + eft2 * fires / 250
END IF

IF r > lr THEN
  eft1 = eft1 / 2
END IF
IF r > lr2 THEN
  eft2 = eft2 / 2
END IF

t = max(r, 30)
rs = t
acc = rs / (er + 10)
r1 = rs * acc

IF r1 < rs THEN r1 = rs
r1 = r1 - er / 10
IF r1 < 30 THEN r1 = 30

CALL rendom

IF r < xr + 1 THEN
  cas1 = shooters1 * rff1 / r1
  cas1 = cas1 * eft1 / 100 * fe / te
ELSE
  cas1 = 0
END IF


IF wp2 THEN
  acc = rs / (er2 + 10)
  r2 = rs * acc
  IF r2 < rs THEN r2 = rs
  r2 = r2 - er2 / 10
  IF r2 < 30 THEN r2 = 30
  CALL rendom
  IF r < xr2 + 1 THEN
  cas2 = shooters2 * rff2 / r2
  cas2 = cas2 * eft2 / 100 * fe / te
ELSE
  cas2 = 0
END IF
ELSE
cas2 = 0
END IF

firemod = max(firemod, 1)

CALL rendom
cas1 = cas1 * 100 / (me + 100) / firemod
cas1 = cas1 / modcon
CALL rendom
IF typew < 2 THEN
  CALL rendom
  cas1 = cas1 / armour(arm, 17) * x1 * 10
END IF

cas2 = cas2 * 100 / (me + 100) / firemod
cas2 = cas2 / modcon
IF typew < 2 THEN
  CALL rendom
  cas2 = cas2 / armour(arm, 17) * x1 * 10
END IF

SELECT CASE cform
CASE 2, 10, 11, 16, 18
CASE ELSE
 shot = shot + 1
END SELECT
END SUB

  SUB mgfire
grabstats (target)

grabstats (fyrer)
fyrer$ = unit$
fwm = spm

IF btype = 20 THEN
  mg1 = gf
  mg2 = gf2
  amtp = 20
ELSE
  mg1 = 0
  mg2 = gf
END IF


IF mg1 > 0 THEN
  gunwoble = 0
  FOR gunf = 1 TO mg1
    rendom
    IF x < ef THEN
    ELSE
      IF gf = 1 THEN
        review$ = "The mechanical repeating gun has jammed"
      ELSE
        review$ = "Mechanical repeating gun number " + STR$(gunf) + " has jammed"
      END IF
      rendom
      explode = fires * ef / 80
      IF x > explode THEN
        mg1 = mg1 - 1
        gf = gf - 1
        review$ = review$ + " and is incapable of being repaired on the battlefield. "
      ELSE
        mg1 = mg1 - 1
        review$ = review$ + " and the gunners are working to clear it. "
      END IF
      IF gunwoble = 0 THEN
        hold$ = review$
        header
        PRINT fyrer$; " firing: "
        PRINT
        review$ = hold$
      END IF
      worps (review$)
      gunwoble = 1
    END IF
  NEXT gunf
END IF

  
IF mg2 > 0 THEN
  FOR gunf = 1 TO mg2
    rendom
    IF x < ef2 THEN
      IF gf2 = 1 THEN
        review$ = "The mechanical repeating gun has jammed"
      ELSE
        review$ = "Mechanical repeating gun number " + STR$(gunf + gf) + " has jammed"
      END IF
      rendom
      explode = fires * ef2 / 80
      IF x > explode THEN
        mg2 = mg2 - 1
        gf2 = gf2 - 1
        review$ = review$ + " and is obliged to be withdrawn from the battlefied for repair. "
      ELSE
        mg2 = mg2 - 1
        review$ = review$ + " and the crew are toiling like Spartans to clear it. "
      END IF
      IF gunwoble = 0 THEN
        hold$ = review$
        header
        PRINT fyrer$; " firing: "
        PRINT
        review$ = hold$
      END IF
      worps (review$)
      gunwoble = 1
    END IF
  NEXT gunf
END IF

IF gunwoble > 0 THEN
  wate
END IF

shooters1 = MIN(mf, mg1 * 10)
shooters2 = MIN(mf, mg2 * 10)
mgs = gf + gf2

movef = 12 / (mov + 12)
rff1 = rff1 * movef
rff2 = rff2 * movef

IF firetype = 3 THEN
  checkamo
END IF

rff1 = rf * 10
rff2 = rf2 * 10

fire = 0

    wf = W(weath, tp)
    eft1 = ef * wf / 10
eft2 = ef2 * wf / 10

IF r > lr THEN
  eft1 = eft1 / 2
END IF
IF r > lr2 THEN
  eft2 = eft2 / 2
END IF
rs = r

IF rs < 30 THEN rs = 30

rs = rs ^ 1.5 * 10
IF r < er THEN
  acc = (er / 5 + 50)
  r1 = rs / (acc)
  acc = (er2 / 5 + 50)
  r2 = rs / (acc)
ELSE
  acc = (er / 5 + r / 5)
  r1 = rs / (acc)
  acc = (er2 / 5 + r / 5)
  r2 = rs / (acc)
  IF r > er THEN
    rff1 = rff1 / 3 + 1
    rff2 = rff2 / 3 + 1
  END IF
END IF

IF r1 < 30 THEN r1 = 30
IF r2 < 30 THEN r2 = 30

rendom
IF r < xr + 1 THEN
  cas3 = shooters1 * rff1 / r1
  cas3 = cas3 * eft1 / 100
  cas3 = cas3 * fe / te
ELSE
  cas3 = 0
END IF

IF wp2 > 0 THEN
  rendom
  IF r < xr2 + 1 THEN
    cas4 = shooters2 * rff2 / r2
    cas4 = cas4 * eft2 / 100
    cas4 = cas4 * fe / te
  ELSE
    cas4 = 0
  END IF
ELSE
  cas4 = 0
END IF

firemod = max(firemod, 1)
rendom
cas3 = cas3 * 100 / (me + 100) / firemod
cas3 = cas3 / modcon
rendom
cas4 = cas4 * 100 / (me + 100) / firemod
cas4 = cas4 / modcon

shot = shot + 1
END SUB

SUB penetrate STATIC
exitp = FALSE
DO
'
CALL grabstats(fyrer)
pr = INT(lr / gs)
rm = INT(r / gs)
IF amtp = 1 THEN
  pen1 = pr - rm
  IF pen1 > pen3 THEN
    pen1 = INT(pen3 + (pr - rm - pen3) * xs)
  END IF
ELSE
  pen1 = MIN(pen3, (pr - rm))
END IF

CALL grabstats(target)
IF pen1 < 5 OR cas = 0 THEN
  exitp = TRUE
  wate
ELSE
  PRINT
  review$ = "Are there any "
  IF pt THEN
    review$ = review$ + "more "
  END IF
  pt = pt + 1
  review$ = review$ + "targets in the beaten zone of " + STR$(pen1) + " cms. "
  CALL worps(review$)
  INPUT temp$
  temp$ = UCASE$(LEFT$(temp$, 1))
  IF temp$ <> "Y" THEN
    exitp = TRUE
  ELSE
    targcas = cas
    targmen = mf
    targfe = fmn(cform, 3)
    targte = terrain(tr, 5)
    IF firetype = 2 THEN
      targfe = fmn(cform, 4)
      targte = terrain(tr, 6)
    END IF
    CALL targetunit
    
    IF target = 0 THEN
      exitp = TRUE
    ELSE
      exitp = FALSE
      fe = fmn(cform, 3)
      te = terrain(tr, 5)
      IF firetype = 2 THEN
        fe = fmn(cform, 4)
        te = terrain(tr, 6)
      END IF
      CALL rendom
      cas = INT(targcas * fe / targfe * te / targte * mf / targmen * xs)
    IF cas THEN
        CALL pout(cas)
      END IF
     END IF
  END IF
END IF
LOOP WHILE exitp <> TRUE
END SUB

SUB pickamo
SELECT CASE amot
CASE 1
  IF r < 300 THEN
    amtp = 3
    se = se ^ .5 * 8
  ELSE
    amtp = 1
    se = 10
  END IF
CASE 2
  IF targt = 11 OR targt = 12 THEN
    amtp = 2
    se = se ^ .5 * 5
  ELSE
    SELECT CASE r
    CASE 1 TO 300
      amtp = 3
      se = se ^ .5 * 8
    CASE 301 TO 600
      amtp = 12
      se = se ^ .5 * 6
    CASE ELSE
      amtp = 1
      se = 10
    END SELECT
  END IF
CASE 3
  SELECT CASE targt
  CASE 11, 12
    IF r < 300 AND targt = 11 THEN
      amtp = 3
      se = se ^ .5 * 8
    ELSE
      amtp = 6
      se = se ^ .5 * 4
    END IF
  CASE 13, 14
    IF r < 300 AND targt = 13 THEN
      amtp = 3
      se = se ^ .5 * 8
    ELSE
      amtp = 13
    END IF
  CASE ELSE
    SELECT CASE r
    CASE 1 TO 300
      amtp = 3
      se = se ^ .5 * 8
    CASE 301 TO 1000
      amtp = 5
      se = se ^ .5 * 7
    CASE ELSE
      amtp = 1
      se = 10
    END SELECT
  END SELECT
CASE 4, 5
  SELECT CASE targt
  CASE 11, 12
    IF r < 300 AND targt = 11 THEN
      amtp = 3
      IF amot = 4 THEN
        se = se ^ .5 * 8
      ELSE
        se = se ^ .5 * 4
      END IF
    ELSE
      amtp = 6
      se = se ^ .5 * 4
    END IF
  CASE 13, 14
    IF r < 300 AND targt = 13 THEN
      amtp = 3
    IF amot = 4 THEN
      se = se ^ .5 * 8
    ELSE
      se = se ^ .5 * 4
    END IF
  ELSE
    amtp = 13
  END IF
CASE ELSE
  SELECT CASE r
  CASE 1 TO 300
    amtp = 3
    se = se ^ .5 * 8
  CASE 301 TO 600
    amtp = 12
    se = se ^ .5 * 6
  CASE 601 TO 1000
    amtp = 5
    se = se ^ .5 * 7
  CASE ELSE
    IF amot = 4 THEN
      amtp = 1
      se = 10
    ELSE
      amtp = 4
      se = 8
    END IF
  END SELECT
END SELECT
CASE 6
  SELECT CASE targt
  CASE 4, 5, 11 TO 14
    IF r < 300 AND targt = 11 THEN
      amtp = 3
      se = se ^ .5 * 5
    ELSE
      amtp = 11
      se = se ^ .5 * 6
    END IF
  CASE ELSE
    SELECT CASE r
    CASE 1 TO 300
      amtp = 3
      se = se ^ .5 * 5
    CASE 301 TO 1000
      amtp = 5
      se = se ^ .5 * 7
    CASE ELSE
      amtp = 11
      se = se ^ .5 * 6
    END SELECT
  END SELECT
CASE 7
  SELECT CASE targt
  CASE 11, 12
    IF r < 300 AND targt = 11 THEN
      amtp = 7
      se = se ^ .5 * 9
    ELSE
      amtp = 6
      se = se ^ .5 * 4
    END IF
  CASE 13, 14
    IF r < 300 AND targt = 13 THEN
      amtp = 7
      se = se ^ .5 * 9
    ELSE
      amtp = 13
    END IF
  CASE ELSE
    SELECT CASE r
    CASE 1 TO 300
      amtp = 7
      se = se ^ .5 * 9
    CASE ELSE
      amtp = 5
      se = se ^ .5 * 7
    END SELECT
  END SELECT
CASE 8
  SELECT CASE r
  CASE 1 TO 300
    amtp = 3
    se = se ^ .5 * 5
  CASE 301 TO 600
    amtp = 12
    se = se ^ .5 * 6
  CASE ELSE
    amtp = 2
    se = se ^ .5 * 5
  END SELECT
CASE 9
  SELECT CASE targt
  CASE 11, 12
    IF r < 300 AND targt = 11 THEN
      amtp = 3
      se = se ^ .5 * 5
    ELSE
      amtp = 6
      se = se ^ .5 * 4
    END IF
  CASE 13, 14
    IF r < 300 AND targt = 13 THEN
      amtp = 3
      se = se ^ .5 * 5
    ELSE
      amtp = 13
    END IF
  CASE ELSE
    SELECT CASE r
    CASE 1 TO 300
      amtp = 3
      se = se ^ .5 * 5
    CASE ELSE
      amtp = 5
      se = se ^ .5 * 7
    END SELECT
  END SELECT
CASE 10
  SELECT CASE r
  CASE 1 TO 300
    amtp = 13
    se = se ^ .5 * 8
  CASE ELSE
    amtp = 11
    se = se ^ .5 * 6
  END SELECT
CASE 11
  SELECT CASE targt
  CASE 4, 5, 11, 12
    amtp = 9
    se = se ^ .5 * 2
  CASE ELSE
    amtp = 8
    se = se ^ .5 * 4
  END SELECT
CASE 12
  amtp = 10
  se = se ^ .5 * 3
CASE ELSE
  rendom
  SELECT CASE targt
  CASE 4, 5, 11 TO 14
    IF r < 300 AND targt = 11 THEN
      amtp = 3
      se = se ^ .5 * 5
    ELSE
      amtp = 14
      se = se ^ .5 * 7 * xs
    END IF
  CASE ELSE
    SELECT CASE r
    CASE 1 TO 300
      amtp = 3
      se = se ^ .5 * 5
    CASE 301 TO 1000
      amtp = 5
      se = se ^ .5 * 7
    CASE ELSE
      amtp = 14
      se = se ^ .5 * 7 * xs
    END SELECT
  END SELECT
END SELECT
'

END SUB

SUB range
'
IF reciprocal = FALSE THEN
PRINT
PRINT "What is the range (in cms.) ";
'
DO
'
INPUT arl
'
LOOP WHILE arl < 0
'
r = INT(arl * gs)
END IF
IF arl = 0 THEN
'
fyrer = 0
'
ELSE
'
IF r > xr AND r > xr2 THEN
'
dummy = Alert(4, "The " + unit$ + "|are out of range.", 9, 10, 14, 70, "", "", "")
'
fyrer = 0
END IF
END IF
END SUB

SUB sh
DO
  IF fyrer > 0 AND fireback = TRUE THEN
    fyrer = origtarg
    target = origfire
    grabstats (target)
    grabstats (fyrer)
    CALL checkfirer
  ELSE
    CALL firer
    IF fyrer = 0 THEN
    ELSE
      CALL targetunit
      
      IF target > 0 THEN
        CALL grabstats(fyrer)
        CALL checkfirer
        IF fyrer > 0 THEN
          CALL range
        END IF
      END IF
    END IF
  END IF
  IF fyrer = 0 THEN
  ELSE
    CALL checkall
    IF fyrer = 0 THEN
    ELSE
      CALL grabstats(fyrer)
      CALL firerstats
      CALL targetstats
      IF fyrer = 0 THEN
      ELSE
        cas = 0
        cas1 = 0
        cas2 = 0
        cas3 = 0
        cas4 = 0
        SELECT CASE firetype
        CASE 1
          CALL infire
          cas = cas1 + cas2
          mgs = 0
        CASE 2
          CALL artilleryfire
          cas = cas1 + cas2
        CASE 3
          CALL mgfire
          cas = cas3 + cas4
        CASE 4
          CALL infire
          CALL mgfire
          cas = cas1 + cas4
        END SELECT
      END IF
    END IF
  END IF
  IF fyrer = 0 THEN
  ELSE
    unitstore = target
    CALL extratarg
    '
    origtarg = target
    origfire = fyrer
    
    CALL pout(cas)
    pt = 0
    CALL penetrate
    CALL firebac
    '
  END IF
LOOP WHILE leave <> TRUE
'
CLS
END SUB

SUB targetstats
'
IF fyrer = 0 THEN
ELSE
  CALL grabstats(target)
  IF od = 10 THEN
  od = 5
  replacestats (target)
END IF
'
targt = tr
te = terrain(tr, 5)
fe = fmn(cform, 3)
IF firetype = 2 THEN
  te = terrain(tr, 6)
  fe = fmn(cform, 4)
END IF
me = mov
'
targart = 0
IF btype > 8 THEN
  targart = 1
END IF
CALL grabstats(fyrer)
'
END IF
END SUB

SUB targetunit
PRINT
PRINT "Which unit is the target ";
DO
  DO
   exitp = TRUE
   INPUT target
  LOOP WHILE target < 0 OR target > nu
'
 IF target = 0 THEN
  fyrer = 0
 ELSE
 CALL grabstats(target)
'
 IF mf - menlos < 1 OR btype = 0 THEN
  exitp = FALSE
'
  IF mf - menlos < 1 THEN
   dummy = Alert(4, "The unit has no men left", 9, 10, 14, 70, "", "", "")
  END IF
'
  IF btype = 0 THEN
   dummy = Alert(4, "The unit is an officer|and may not be targeted.", 9, 10, 14, 70, "", "", "")
  END IF
'
 END IF
END IF
LOOP WHILE exitp <> TRUE
END SUB

