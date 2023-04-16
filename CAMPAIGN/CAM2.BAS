DECLARE SUB unitpr ()
DECLARE SUB artpr ()
DECLARE SUB bm1 (buf%)
DECLARE SUB bufq ()
DECLARE SUB campr ()
DECLARE SUB countup ()
DECLARE SUB dayad ()
DECLARE SUB deleat (x%, y%, w%)
DECLARE SUB genlist (x%)
DECLARE SUB grabstats (xx%)
DECLARE SUB grabstuff ()
DECLARE SUB header ()
DECLARE SUB keyclear ()
DECLARE SUB logstats (sbt%)
DECLARE SUB modexp ()
DECLARE SUB modlos ()
DECLARE SUB natans ()
DECLARE SUB officrs ()
DECLARE SUB offnat ()
DECLARE SUB offrank ()
DECLARE SUB ordal (n%)
DECLARE SUB po1 ()
DECLARE SUB rendom ()
DECLARE SUB repem ()
DECLARE SUB replce ()
DECLARE SUB sentence ()
DECLARE SUB setdate ()
DECLARE SUB sortit (k%)
DECLARE SUB statpr ()
DECLARE SUB totpr ()
DECLARE SUB trainit ()
DECLARE SUB untrain ()
DECLARE SUB wate ()
DECLARE SUB wepnstats ()
DECLARE SUB wipeout ()
DECLARE SUB worp (x$)
DECLARE SUB worps (x$)
DECLARE SUB zero ()
DECLARE SUB batlpr ()
DECLARE SUB die ()
DECLARE SUB diseaze ()
DECLARE SUB drafts ()
DECLARE SUB owounds ()
DECLARE SUB noway ()
'$INCLUDE: 'C:\BC7\ecw\bandi3\campaign\cam.BI'

SUB batlpr
  '
  IF trype = 0 THEN

    PRINT #8, "-----------------------------------"
    review$ = STR$(unit) + "). " + comand$(oftyp) + chap$
    worp (review$)
    review$ = chap$ + " "
    CALL owounds
    worp (review$)
    PRINT #8, "-----------------------------------"
    PRINT #8, "*                                                       * "
  ELSE
    review$ = STR$(unit) + "). " + uname$
    IF mf = 0 THEN
      wipeote = true
      review$ = review$ + " was wiped out to a man. "
      worp (review$)
      review$ = ""
    ELSE
      review$ = review$ + ", presently " + STR$(mf) + " " + trim$(experience$(te)) + " " + trim$(type$(trype))
      IF trype > 8 THEN
        artpr
      ELSE
        review$ = review$ + ". "
      END IF
      review$ = review$ + "They " + morale$(wm)
      IF menlos THEN
        casp = INT(menlos / omf * 100)
        review$ = review$ + "They suffered " + STR$(menlos) + " in killed or wounded (" + STR$(casp) + "%). "
      END IF
      IF prisoner THEN
        review$ = review$ + STR$(prisoner) + " are missing, presumed killed or captured. "
      END IF
      SELECT CASE std
      CASE 11 TO 256
        review$ = review$ + "The unit is to be mentioned in dispatches for its bravery. "
      CASE 1, 0
        review$ = review$ + "The unit's Colours were taken by the enemy. "
      CASE ELSE
      END SELECT
    END IF

worp (review$)
CALL owounds
    worp (review$)
    PRINT #8,
  END IF
  '

END SUB

DEFSNG X-Y
SUB batrec
  '
  IF LEN(buffer$(buffer)) = 0 THEN
   junk = Alert(4, "Buffer " + STR$(buffer) + "|is empty.", 7, 9, 20, 69, "", "", "")
  ELSE
  
  units = LEN(buffer$(buffer)) / 150
  grabstats (1)
  CALL header
  PRINT
  PRINT "What is the name of this army"
  LINE INPUT aname$
  IF aname$ = "" THEN
    aname$ = "The Army"
  END IF
  PRINT
  PRINT "Where did the battle take place"
  LINE INPUT place$
  IF place$ = "" THEN
    place$ = "Schlachtfeld"
  END IF

  IF daytl > 0 THEN
    dayt = month(montl, 1)
    IF yearl / 4 = INT(yearl / 4) AND montl = 2 THEN
      dayt = dayt + 1
    END IF
    dayth = daytl
    month = montl
    year = yearl
    CALL dayad
    PRINT
    daat = Alert(4, "The last recorded date is " + cdate$ + "|Is this acceptable?", 7, 9, 19, 69, " Yes ", " no  ", "")
    IF daat = 2 THEN
      daytl = 0
    END IF
  ELSE
    setdate
  END IF

  IF units > 50 THEN
    PRINT "Calculating the morale of "; aname$
  END IF
  zero
  
  FOR unit = 1 TO units
    grabstats (unit)
    IF unit = 1 THEN
      armywm = wm
      gen$ = chap$
    END IF
    sortit (starbite)
    countup
    IF trype = 0 THEN
      bgde = bgde + 1
      bgdewm = bgdewm + wm
    END IF
  NEXT unit
  bgdewm = INT(bgdewm / bgde)
  keyclear
  
  header
  PRINT
  PRINT

  review$ = "Was the battle of " + place$ + " a?"
  DO
  bres = windows(review$, 5, batres$())
  IF bres = 0 THEN noway
  LOOP UNTIL bres > 0
  gres = MAX(bres, morale(armywm, 1))
  pres = MAX(bres, morale(bgdewm, 1))
  actwm = MIN(bgdewm, armywm)
  
  header
  PRINT
  PRINT
  review$ = "After the battle of " + place$ + " on " + cdate$ + ". What does " + aname$ + " intend to do ? "
  DO
  ownact = windows(review$, 10, aftbat$())
  IF ownact = 0 THEN noway
  LOOP UNTIL ownact > 0
  act = MAX(ownact, batres(bres, 1))
  act = MAX(act, morale(actwm, 2))
  enmact = 0
  
  header
  PRINT
  PRINT
  review$ = "After the battle " + " of " + place$ + " on " + cdate$ + ". What does the enemy do ? "
  worps (review$)
  wate
  DO
  enmact = windows("Does the enemy:      ", 10, aftbat$())
  IF enmact = 0 THEN noway
  LOOP UNTIL enmact > 0
  tact = MAX(act, aftbat(enmact, 1))
  timel = aftbat(tact, 8)
  timel = INT(timel * 100 / ofa)
  
  zero
  plst = Alert(4, " List of losses etc.", 7, 9, 19, 69, " Yes", " No ", "")
  po1
  keyclear
  header
  review$ = aname$
  review$ = review$ + ", after the battle at " + place$ + " " + cdate$
  worp (review$)
  PRINT #8, "   "
  review$ = gen$ + " regards the battle as a " + trim$(batres$(gres)) + ". "
  IF enmact THEN
    review$ = review$ + "The enemy " + trim$(aftbat$(enmact)) + " and "
    IF nact > act THEN
      review$ = review$ + "he is forced to "
    ELSE
      review$ = review$ + "he orders the Army to "
    END IF
  ELSE
    review$ = review$ + "he orders the Army to "
  END IF
  review$ = review$ + trim$(aftbat$(tact)) + ". This opperation continues for " + STR$(timel) + " days. "
  worp (review$)
  PRINT #8,
  
  wate
  FOR unit = 1 TO units
    grabstats (unit)
    
    IF trype = 0 THEN
      IF wm = 8 THEN
        ofp = 0
      END IF
      IF plst = 1 THEN
        batlpr
      END IF
      wm = 1
    ELSE
      SELECT CASE std
      CASE 0 TO 9
        stead = stead * 5 / 4
      CASE 11 TO 250
      stead = stead - 1
      END SELECT
      modlos
      modexp
      countup
      wepnstats
      IF plst = 1 THEN
        batlpr
        IF priner = FALSE THEN
          IF unit / 3 = INT(unit / 3) OR unit = units THEN
            wate
          END IF
        END IF
      END IF
      
      IF wipeote = true THEN
         wipeote = FALSE
      END IF
    END IF
    MID$(m$, 46) = CHR$(10)
    MID$(m$, 47) = CHR$(ofw)
    MID$(m$, 50) = CHR$(0)
    MID$(m$, 66) = CHR$(0)
    MID$(m$, 67) = CHR$(0)
    MID$(m$, 69, 2) = MKI$(0)
    MID$(m$, 71) = CHR$(1)
    MID$(m$, 73) = CHR$(0)
    MID$(m$, 81) = CHR$(10)
    MID$(m$, 83) = CHR$(0)
    MID$(m$, 84) = CHR$(0)
    MID$(m$, 85) = CHR$(1)
    MID$(m$, 86) = CHR$(100)
    MID$(m$, 99) = CHR$(0)
    MID$(m$, 109) = CHR$(10)
    
    omf = mf
    logstats (starbite)
  NEXT unit
  
  keyclear
  totpr
  keyclear
  CLOSE #8
  wipeout
  PRINT
  PRINT "Battle aftermath complete"
  wate
  
END IF
  

END SUB

DEFINT X-Y
SUB bufm
 
  PRINT TAB(5);
  PRINT TAB(5); "Which buffer to move";
  m = 8
  DO UNTIL m >= 0 AND m < 7
    INPUT m
  LOOP
  IF m = 0 THEN
  ELSE
    PRINT TAB(5); "Which buffer to add buffer "; m; " to";
    n = 8
    DO UNTIL n > 0 AND n < 7
      INPUT n
    LOOP
    IF m = n THEN
    ELSE
      o = LEN(buffer$(m)) + LEN(buffer$(n))
      IF o > 32000 THEN
       junk = Alert(4, " The buffers are to large to join ", 9, 10, 60, 50, "", "", "")
       ELSE
        buffer$(n) = buffer$(n) + buffer$(m)
        buffer$(m) = ""
      END IF
    END IF
  END IF

END SUB

SUB decorate
IF LEN(buffer$(buffer)) = 0 THEN
  junk = Alert(4, "Buffer " + STR$(buffer) + "|is empty.", 7, 9, 20, 69, "", "", "")
ELSE
  grabstats (1)
  gen$ = chap$
  header
  PRINT "Should these proceedings be printed to: "
  CALL po1
  unit = -1
  DO UNTIL unit = 0
    DO
      header
      PRINT "Which officer do you wish to Honour (Unit number)";
      INPUT unit
    LOOP WHILE unit < 0 OR unit > units
    IF unit = 0 THEN

    ELSE
      grabstats (unit)
      PRINT
      PRINT chap$
      PRINT "commanding "; uname$
      PRINT
      PRINT "(Please type in the name of the honour to be awarded.)"
      PRINT "What is to be his honour ";
      INPUT honour$
      PRINT
      review$ = "On the recommendation of " + gen$ + " " + chap$ + " has been awarded " + honour$ + ". "
      review$ = review$ + "When news of the Award is posted amongst the Army, "
      rendom
      ofl = ofl + ofa / 20 * xs
      ofl = MIN(ofl, 180)
      MID$(m$, 44) = CHR$(ofl)
      logstats (starbite)
      SELECT CASE ofp
      CASE 81 TO 90
        gench = 50
        genad = -1
        review$ = review$ + "there is grave muttering in the ranks, which the officers seem scarce willing to subdue ! "
      CASE 91 TO 95
        gench = 30
        genad = -1
        review$ = review$ + "there are a few raised eyebrows from certain officers. "
      CASE 96 TO 100
        gench = 10
        genad = -1
        review$ = review$ + "there are many who wonder if this is deserved. "
      CASE 101 TO 110
        gench = 20
        genad = 1
        review$ = review$ + "the award is greeted by the tossing off of many a bumper by the deserving officer's unit. "
      CASE 111 TO 120
        gench = 40
        genad = 1
        review$ = review$ + "both officers and men applaud. Here's health to the Hero and success for the campaign. "
      CASE 121 TO 250
        gench = 60
        genad = 1
        review$ = review$ + "the Hero is feted through the Army. Both his and the Commander's health are toasted with three times three and may give them Joy of it !"
      CASE ELSE
        gench = 100
        genad = -2
        review$ = review$ + "there is widespread dismay and indignation amongst both his fellow officers and men. "
      END SELECT
      worp (review$)
      PRINT #8,
      wate
      rendom
      IF x < gench THEN
        grabstats (1)
        ofa = ofa + genad
        ofa = MAX(0, ofa)
        ofa = MIN(180, ofa)
        MID$(m$, 42) = CHR$(ofa)
        logstats (starbite)
      END IF
      unit = -1
    END IF
  LOOP
  header

  
END IF
END SUB

SUB die STATIC

  
  header
  worps (review$)
  PRINT
  PRINT "Working out effects of attrition ........."
  
  waste = action(odr, 3) / 10
  waste = waste / genable * 75
  waste = waste * tgt / 30
  waste = waste * sp / 10
  IF odr <> 4 THEN
    waste = waste * wa / 10
    waste = waste * tea / 10
  END IF
 
  IF genpest > 0 THEN
    pest = genpest
    coldkil = disease(pest, 2)
    waste = waste * coldkil / 10
  END IF
  
  signam = FALSE
  FOR unit = 1 TO units
    grabstats (unit)
    sortit (starbite)
    IF trype = 0 THEN
      pest = genpest
      IF pest > 0 THEN
        rendom
        IF x < dc THEN
          rendom
          wate
          IF x < coldkil / 2 THEN
            ofw = 201
            signam = true
            MID$(m$, 47) = CHR$(ofw)
            IF priner = FALSE THEN
              review$ = chap$ + " was taken with " + RTRIM$(disease$(pest)) + " and unhappily died thereby. "
              worps (review$)
              wate
            END IF
          ELSE
            ofw = 101
          END IF
        END IF
      END IF
    ELSE
      z = waste * tipe(trype, 3) / 5
      z = z * (stead + 30) / ofa
      z = mf * z / 100
      menlos = INT(z)
      IF menlos >= mf THEN
        menlos = mf
        signam = true
      END IF

      mf = mf - menlos
      mr = MAX(mr, mo)
    END IF
    logstats (starbite)
             
    IF plst = 1 THEN
      campr
      IF priner = FALSE THEN
      IF unit / 3 = INT(unit / 3) OR unit = units THEN
        wate
        END IF
      END IF
    END IF
  NEXT unit
  IF signam = true THEN
    CALL wipeout
  END IF
  keyclear
  
END SUB

SUB disband
units = LEN(buffer$(buffer)) / 150
  IF LEN(buffer$(buffer)) = 0 THEN
   junk = Alert(4, "Buffer " + STR$(buffer) + "|is empty.", 7, 9, 20, 69, "", "", "")
  ELSE

ext = 0
DO UNTIL ext = 1
  header
  PRINT TAB(5);
  PRINT TAB(5); "Which unit do you wish to disband (Unit number) ";
  unit = -1
  DO UNTIL unit >= 0 AND unit <= units
    INPUT unit
    
    IF unit <> 0 THEN
      CALL grabstats(unit)
      IF trype = 0 THEN

      junk = Alert(4, "Unit " + STR$(unit) + " is a brigade officer", 7, 9, 19, 69, "", "", "")
     unit = -1
     END IF
    END IF
   LOOP
  
  header

  IF unit = 0 THEN
  ext = 1
  ELSE
    CALL statpr
    choice = windows("Disband Unit", 3, tirt$())
    IF choice < 3 AND choice > 0 THEN
  CALL deleat(buffer, unit, 1)
      IF choice = 2 THEN
        rep = mf
        tr = 3
        goody = true
        CALL drafts
      END IF
    END IF
  END IF
  header
  
LOOP
END IF
END SUB

SUB diseaze
    
  IF pest = 0 THEN
    CALL rendom
    z = wd * ted
    z = z * sp / 10
    z = z / (cc + 10)
    dc = INT(z)
    IF x < dc THEN
      pest = INT(xs * 20) + wi
      temp$ = RTRIM$(disease$(pest))
      temp1$ = LEFT$(temp$, 2)
      temp1$ = UCASE$(temp1$)
      k = LEN(temp$) - 2
      temp$ = temp1$ + RIGHT$(temp$, k)
      review$ = review$ + temp$ + " has broken out amongst the army."
    END IF
  ELSE
    rendom
    coldstay = disease(pest, 1)
    dc = ted * coldstay / (cc + 1)
    temp$ = RTRIM$(disease$(pest))
    temp1$ = LEFT$(temp$, 2)
    temp1$ = UCASE$(temp1$)
    k = LEN(temp$) - 2
    temp$ = temp1$ + RIGHT$(temp$, k)
    IF x > dc THEN
      review$ = review$ + temp$ + " which had afflicted the army, has died out. "
      pest = 0
    ELSE
      review$ = review$ + temp$ + " continues to afflict the army."
    END IF
  END IF
  genpest = pest
  '


END SUB

SUB drafts

IF goody = FALSE THEN
  PRINT "Taking a fresh draft of reinforcements into the Army of"
  CALL grabstats(1)
  PRINT chap$
  PRINT
  PRINT "How many replacements have been received ";
  INPUT rep
  IF rep <> 0 THEN
    tr = windows("Are the replacements", 9, repl$())
  END IF
  IF tr = 0 THEN
    rep = 0
  END IF
  WHILE rep <> 0
    CALL repem
  WEND
  goody = FALSE
  header
END IF
END SUB

SUB genup STATIC

  units = LEN(buffer$(buffer)) / 150
  IF units = 0 THEN
  junk = Alert(4, " Buffer " + STR$(buffer) + " is empty.", 7, 9, 19, 69, "", "", "")
  ELSE
  zero
  po1
  
  grabstats (1)
  header
  PRINT TAB(5);
  PRINT TAB(5); "What is the name of the Army "
  PRINT TAB(5);
  INPUT aname$
  IF aname$ = "" THEN
    aname$ = "The Army "
  END IF
  header
  grabstats (1)
  IF daytl > 0 THEN
   dayt = month(montl, 1)
    IF yearl / 4 = INT(yearl / 4) AND montl = 2 THEN
      dayt = dayt + 1
    END IF
  dayth = daytl
  month = montl
  year = yearl
  CALL dayad
  PRINT
  daat = Alert(4, "The last recorded date is " + cdate$ + "|Is this acceptable?", 7, 9, 19, 69, " Yes ", " no  ", "")
  IF daat = 2 THEN
  daytl = 0
  END IF
END IF
IF daytl < 1 THEN
  CALL setdate
  FOR unit = 1 TO units
  grabstats (unit)
  IF trype = 0 THEN
  logstats (starbite)
  END IF
  NEXT unit
  END IF

  ordal (dayth)
  dayad
  grabstats (1)
  gen$ = chap$
  genable = ofa
  genlo = ofl
  '
  actn = 0
  DO UNTIL actn = 2
    header
    review$ = aname$ + " under the command of " + gen$ + ". On " + cdate$ + " "
    worps (review$)
    wate
    sply = windows("What is the army's supply state: ", 8, supply$())
    IF sply <= 0 THEN
      actn = 2
    ELSE
      sp = supply(sply)
      header
      worps (review$)
      wate
      weather = windows("Weather required: ", 15, weather$())
     IF weather <= 0 THEN
       actn = 2
     ELSE
       ww = weather(weather, 1)
       wt = weather(weather, 2)
       wd = weather(weather, 3)
       wa = weather(weather, 4)
    
       header
       review$ = review$ + "the weather is " + trim$(weather$(weather)) + " "
       worps (review$)
       wate
       tr = windows("The kind of terrain is the army in:", 9, terrain$())
       IF tr <= 0 THEN
         actn = 2
       ELSE
         tem = terrain(tr, 1)
         tea = terrain(tr, 2)
         ted = terrain(tr, 3)
    
         SELECT CASE tr
         CASE 1, 8, 9
           review$ = review$ + "and the army is in the" + RTRIM$(terrain$(tr)) + ". "
         CASE 2
           review$ = review$ + "and the army is in a" + RTRIM$(terrain$(tr)) + ". "
         CASE 3 TO 7
           review$ = review$ + "and the army is in an area of" + RTRIM$(terrain$(tr)) + ". "
         END SELECT
    
         header
         worps (review$)
         wate
         odr = windows("What is the army's order:", 10, action$())
         IF odr <= 0 THEN
            actn = 2
         ELSE
            header
            review$ = review$ + gen$ + " has given the order to" + RTRIM$(action$(odr)) + ". "
            worps (review$)
            PRINT
            PRINT "For how many days will this order hold ";
            tgt = -1
            DO UNTIL tgt > 0 AND tgt < 32
              INPUT tgt
            LOOP
            header
            worps (review$)
    
            IF odr = 3 OR odr > 6 THEN
              SELECT CASE odr
              CASE 3
                PRINT
                PRINT "What is the army's present location ";
                INPUT place$
                IF place$ = "" THEN
                  place$ = "Irgendstadt"
                END IF
                dayth = dayth + tgt
                dayad
                review$ = review$ + "The army is encamped in the area of " + place$ + " until the " + cdate$ + ". "
                review$ = review$ + "They now await new orders. "
                hold$ = review$
              CASE 7
                PRINT
                PRINT "To what place is the Army laying siege ";
                INPUT place$
                IF place$ = "" THEN
                  place$ = "Festung"
                END IF

                dayth = dayth + tgt
                dayad
                review$ = review$ + "The army is besieging " + place$ + " until the " + cdate$ + ". "
                review$ = review$ + "They now await new orders. "
                hold$ = review$
              CASE 8
                PRINT
                PRINT "To what place is the Army defending ";
                INPUT place$
                IF place$ = "" THEN
                  place$ = "Festung"
                END IF

                dayth = dayth + tgt
                dayad
                review$ = review$ + "The army is holding " + place$ + " until the " + cdate$ + ". "
                review$ = review$ + "They now await new orders. "
                hold$ = review$
              CASE 9
                PRINT
                PRINT "In which area is the Army skirmishing with the enemy ";
                INPUT place$
                IF place$ = "" THEN
                  place$ = "Schlachtfeld"
                END IF

                dayth = dayth + tgt
                dayad
                review$ = review$ + "The army is skirmishing with enemy patrols in the vicinity of " + place$ + " until the " + cdate$ + ". "
                review$ = review$ + "They now await new orders. "
                hold$ = review$
              CASE 10
                PRINT
                PRINT "Where has the Army surrendered to the enemy ";
                INPUT place$
                IF place$ = "" THEN
                  place$ = "Schamfeld"
                END IF

                dayth = dayth + tgt
                dayad
                review$ = review$ + "The army has surrendered to enemy at " + place$ + " on the " + cdate$ + ". "
                review$ = review$ + "They are no longer under your orders. "
                hold$ = review$
              END SELECT
            ELSE
              speed = 100
              FOR unit = 1 TO units
                grabstats (unit)
                IF trype > 0 THEN
                  mvb = tipe(trype, 2)
                  speed = MIN(speed, mvb)
                  countup
                END IF
              NEXT unit
              sighs = MAX(ortot / genable / 2, 50)
              wate
              road = windows("Which means of travel: ", 7, route$())
              IF road <= 0 THEN
                actn = 2
              ELSE
                header
      
                worps (review$)
                PRINT
                hold$ = review$
                td = -1
                DO
                  review$ = "How far does " + gen$ + " intend the army to march during the next " + STR$(tgt) + " days (in km.) "
                  worps (review$)
                  PRINT ;
                  INPUT td
                LOOP WHILE td < 1 OR td > 1000

                SELECT CASE weather
                  CASE 6 TO 10, 14
                  r = route(road, 2)
                CASE ELSE
                  r = route(road, 1)
                END SELECT
      
                md = 1
                SELECT CASE road
                CASE 1 TO 3
                  del = 0
                CASE 4, 7
                  del = 2
                CASE ELSE
                  del = 5
                END SELECT
                g = genlo * ww / 10
                g = MIN(g, 99)
                IF odr < 4 THEN
                  del = 0
                ELSE
                  w = 0
                  DO
                    w = w + 1
                    rendom
                    IF x > g THEN
                      del = del + 1
                    END IF
                  LOOP UNTIL w = tgt OR x < g
                END IF
                g = genable * ww * 20 / sighs
      
                tgt = tgt - del
                march = action(odr, 1)
                march = INT(march * tgt / 7)
                spd = action(odr, 2)
                te1 = MAX(tem, r)
      
                FOR w = 1 TO march
                  rendom
                  IF x < g THEN
                    md = md + 1
                  END IF
                NEXT w
              END IF
    
              dayth = dayth + del
              dayad
              review$ = hold$
              IF odr = 3 OR odr > 6 THEN
              ELSE
               IF tgt = 0 THEN
                 review$ = review$ + "After a divers series of delays the Army fails to make any advance during this period. "
               ELSE
                 IF del > 0 THEN
                   IF del = 1 THEN
                     review$ = review$ + "After a single day's delay, the movement begins on " + cdate$ + ". "
                   ELSE
                     review$ = review$ + "After a delay of " + STR$(del) + " days, the movement begins on " + cdate$ + ". "
                   END IF
                 ELSE
                   review$ = review$ + "With not a moment lost, the Army begins its' march on " + cdate$ + ". "
                 END IF
                 rendom
                 z = speed / 1000
                 z = z * spd * te1 * wt
                 kmpm = z
                 kmt = INT(kmpm * md * x1)
                 IF kmt > td THEN
                   tex = INT(kmt / td)
                   md = md * td / kmt
                   IF md > INT(md) THEN
                     e! = md - INT(md)
                     eta = 7 + INT(12 * e!)
                     md = INT(md + 1)
                   END IF
                   IF md = 1 THEN
                     tex = 1
                   END IF
                 END IF
                 IF tex THEN
                   IF tex = 1 THEN
                     review$ = review$ + "The army covers the  " + STR$(td) + " kilometres within the day in a single march "
                   ELSE
                     review$ = review$ + "It takes the army " + STR$(tex) + " days to move " + STR$(td) + " kilometres in " + STR$(md) + " marches "
                   END IF
                   dayth = dayth + tex
                   dayad
                   review$ = review$ + "arriving at " + STR$(eta) + ".00 hours on " + cdate$ + ". "
                 ELSE
                   review$ = review$ + "During period the army moves " + STR$(kmt) + " kilometres in "
                   IF md = 1 THEN
                     review$ = review$ + "a single march, and then halts again. "
                     tgt = 1
                   ELSE
                     review$ = review$ + STR$(md) + " marches. "
                   END IF
                 END IF
               END IF
               dayth = dayth + tgt
               dayad
               review$ = review$ + "They await new orders as of the " + cdate$ + ". "
               tex = 0
             END IF
           END IF
           header
           grabstats (1)
           CALL diseaze
           worp (review$)
           PRINT #8,
           PRINT
           PRINT "Comment "
           INPUT review$
           IF review$ <> "" THEN
             worp (review$)
             PRINT #8, ;
           END IF
           keyclear
           grabstats (1)
           plst = Alert(4, " List of losses etc.", 7, 9, 19, 69, " Yes ", " No ", "")
           CALL die
           actn = Alert(4, " Next period ", 7, 9, 19, 69, " Yes ", " no  ", "")
           header
         END IF
       END IF
     END IF
   END IF
   LOOP
   IF priner = true THEN
     PRINT #8, CHR$(12)
   END IF

  CLOSE #8
END IF

END SUB

SUB movem
IF LEN(buffer$(buffer)) = 0 THEN
  junk = Alert(4, "Buffer " + STR$(buffer) + "|is empty.", 7, 9, 20, 69, "", "", "")
ELSE
  ext = 0
  DO UNTIL ext = 1
    header
    units = LEN(buffer$(buffer)) / 150
    bm1 (buffer)
    DO
      unit = windows("Unit or Command to move: ", counts, ttx$()) - 1
    LOOP UNTIL unit >= -1 AND unit <= units

    IF unit < 1 OR units < 1 THEN
      ext = 1
    ELSE
      grabstats (unit)
      IF trype = 0 THEN
        targtyp = oftyp
        oftyp = 8
        nut = 0
        cut = unit
        DO UNTIL oftyp <= targtyp OR cut = units
          cut = cut + 1
          nut = nut + 1
          grabstats (cut)
        LOOP
          IF cut = units THEN
          nut = nut + 1
          END IF
          nuts = nut * 150
          grabstats (unit)
          moved$ = MID$(buffer$(buffer), starbite, nuts)
          bufq
          IF NOT middle THEN
            buffer$(bfr) = moved$
          ELSE
          choice = windows("To follow which unit: ", counts, ttx$())
          choice = ABS(choice)
          IF choice = 0 THEN
            ext = 1
          ELSE
            buffer$(0) = ""
            a = LEN(buffer$(bfr)) / 150
            b = (choice - 1) * 150
            buffer$(0) = MID$(buffer$(bfr), 1, b) + moved$
            buffer$(0) = buffer$(0) + MID$(buffer$(bfr), b + 1)
            buffer$(bfr) = buffer$(0)
          END IF
        END IF
        IF ext = 0 THEN CALL deleat(buffer, unit, nut)
      ELSE
        moved$ = MID$(buffer$(buffer), starbite, 150)
        moveit = 1
        bufq
        IF NOT middle THEN
          buffer$(bfr) = moved$
        ELSE
          choice = windows("To follow which unit: ", counts, ttx$())
          choice = ABS(choice)
          IF choice = 0 THEN
            ext = 1
          ELSE
            buffer$(0) = ""
            a = LEN(buffer$(bfr)) / 150
            b = (choice - 1) * 150
            buffer$(0) = MID$(buffer$(bfr), 1, b) + moved$
            buffer$(0) = buffer$(0) + MID$(buffer$(bfr), b + 1)
            buffer$(bfr) = buffer$(0)
          END IF
        END IF
          IF ext = 0 THEN CALL deleat(buffer, unit, 1)
      END IF
    END IF
  LOOP


END IF

END SUB

SUB movoff
  IF LEN(buffer$(buffer)) = 0 THEN
   junk = Alert(4, "Buffer " + STR$(buffer) + "|is empty.", 7, 9, 20, 69, "", "", "")
  ELSE
  '
ext = 0
  DO UNTIL ext = 1
  genlist (1)
  choice = windows("     Officer to be moved:                      ", count, uname$())
    unit = VAL(uname$(choice))
    IF unit < 1 OR choice = 1 THEN
    ext = 1
    ELSE
      grabstats (unit)
      moveit = 0
      moved$ = m$
    CALL bufq
      IF NOT middle THEN
        buffer$(bfr) = moved$
      ELSE
       choice = windows("To follow which unit: ", counts, ttx$())
       IF choice = 0 THEN
        ext = 1
        ELSE
        buffer$(0) = ""
        a = LEN(buffer$(bfr)) / 150
        b = (choice - 1) * 150
        buffer$(0) = MID$(buffer$(bfr), 1, b) + moved$
        buffer$(0) = buffer$(0) + MID$(buffer$(bfr), b + 1)
        buffer$(bfr) = buffer$(0)
      END IF
      END IF
    IF ext <> 1 THEN CALL deleat(buffer, unit, 1)
    END IF

  IF LEN(buffer$(buffer)) = 0 THEN ext = 1
  LOOP
  '
END IF
END SUB

SUB offtry
units = LEN(buffer$(buffer))
IF units = 0 THEN
  junk = Alert(4, "Buffer " + STR$(buffer) + "|is empty.", 7, 9, 20, 69, "", "", "")
ELSE
  CALL header
  PRINT "Print Results of the proposed proceedings to:"
  CALL po1
  unit = 1
  DO
    grabstats (1)
    geninf = ofi
    genable = ofa
    genr = officer(ofr, 1)
    gen$ = chap$
    unit = -1
    DO
      header
      PRINT TAB(5);
      PRINT TAB(5); "Which officer is to be brought to account (Unit number) ";
      INPUT unit
    LOOP WHILE unit < 0 OR unit > units

    IF unit = 0 THEN
      
    ELSE
      header
      grabstats (unit)
      PRINT TAB(5); chap$; " commanding:"
      PRINT TAB(5); unit$
      ttll$(1) = " Promote to Diplomatic post "
      ttll$(2) = " Drumhead Court Marshal     "
      ttll$(3) = " Full Court Marshal         "
      ttll$(4) = " Error                      "

      opt = windows("  Disciplinary Procedure   ", 4, ttll$())
      IF opt = 0 THEN opt = 4
      PRINT
      replace = FALSE
      review$ = gen$
      SELECT CASE opt
      CASE 1
        review$ = review$ + " has suggested that " + chap$ + " be posted forthwith to the Diplomatic Service. "
        IF genr > 3 THEN
          review$ = review$ + "Such a posting is not in his gift. However, he has proposed it to the Court. "
          IF geninf < ofi THEN
            indif = ofi - geninf
            review$ = review$ + chap$ + " used his "
            review$ = review$ + "considerable influence at Court to prevent the move. "
            review$ = review$ + gen$ + " is considerably embarrassed by the unsuccessful proposal "
            review$ = review$ + "and will undoubtedly lose considerable influence at Court because of it. "
            grabstats (1)
            ofi = ofi - indif
            ofi = MAX(10, ofi)
            MID$(m$, 43) = CHR$(ofi)
            logstats (1)
          ELSE
            rendom
            IF x < ((geninf * 2) - ofi) THEN
              review$ = review$ + "The Court fully concurred and " + chap$ + " has been sent to join "
              review$ = review$ + " the embassy to an 'important', but wild and inhsopitable far off land. "
              replace = true
            ELSE
              review$ = review$ + "After due consideration, the Court rejected his proposal. "
              review$ = review$ + chap$ + " will remain in post."
              review$ = review$ + gen$ + " is unlikely to be harmed by the unsuccessful request. "
            END IF
          END IF
        ELSE
          review$ = review$ + "After considerable vacillation, the Court was persuaded to comply with the request and " + chap$ + " has been sent to join "
          review$ = review$ + "the embassy to an important, but wild and far off land."
          replace = true
        END IF
      CASE 2
        review$ = review$ + " presiding over the "
        review$ = review$ + "Drumhead Court Marshal of " + chap$ + ". "
        PRINT
        rendom
        deaf = (ofa + ofl) * x1
        SELECT CASE deaf
        CASE 1 TO 70
          review$ = review$ + "The accused is found guilty of gross cowardice in the face of the enemy. "
          replace = true
          fdue = 1
        CASE 71 TO 110
          review$ = review$ + "The accused is found guilty of a serious dereliction of duty. "
          replace = true
          fdue = 2
        CASE 101 TO 150
          review$ = review$ + "The accused is found guilty of a technical dereliction of duty. "
          replace = true
          fdue = 3
        CASE ELSE
          review$ = review$ + "The accused is fully exonerated from all charges and absolved of any stain to his honour. "
        END SELECT
        IF replace = true THEN
          header
          worp (review$)
          wate
          PRINT #8,
          sentence
          rendom
          IF fate < 5 AND genr > 3 THEN
            IF fate = 1 THEN
              pofl = INT(ofl / 10)
              pofl = MIN(pofl, 10)
              pofl = MAX(pofl, 1)
              review$ = review$ + "The sentence of the Court Marshal, " + RTRIM$(ttlox$(fate)) + " was effected. "
              review$ = review$ + chap$ + " " + RTRIM$(death$(pofl)) + ". "
              rendom
              review$ = review$ + "When the execution was reported at Court, "
              IF x < ofi THEN
                review$ = review$ + gen$ + " was severely repremanded for overstepping his authority. "
              ELSE
                review$ = review$ + "there were no significant repercussions. "
              END IF
            ELSE
              PRINT
              review$ = review$ + chap$ + " appealed against the sentence. "
              rendom
              z = ofi / fate
              z = z * fdue
              IF x < z THEN
                fate = fate + 1
                IF fate = 4 THEN
                  fate = 5
                END IF
                review$ = review$ + "He had his sentence reduced to" + RTRIM$(fate$(fate))
                IF fate = 4 THEN
                  review$ = review$ + "He was, nevertheless, transfered to another command. "
                END IF
              ELSE
                review$ = review$ + "However, he was unsuccessful and sentence was duly effected. "
                IF fate < 3 THEN
                  pofl = INT(ofl / 10)
                  pofl = MIN(pofl, 10)
                  pofl = MAX(pofl, 1)
                  review$ = review$ + "The sentence of the Court Marshal was immediately executed. "
                  review$ = review$ + chap$ + " " + RTRIM$(death$(pofl)) + ". "
                END IF
              END IF
            END IF
          ELSE
            IF fate < 3 THEN
              pofl = INT(ofl / 10)
              pofl = MIN(pofl, 10)
              pofl = MAX(pofl, 1)
              review$ = review$ + "The sentence of the Court Marshal was immediately executed. "
              review$ = review$ + chap$ + " " + RTRIM$(death$(pofl)) + ". "
            ELSE
              review$ = review$ + "There is no right of appeal in this case, and the sentence, " + RTRIM$(ttlox$(fdue)) + " is effected. "
            END IF
          END IF
        END IF
      CASE 3
        review$ = review$ + gen$ + " presiding over "
        review$ = review$ + "the Full Court Marshal of " + chap$ + ". "
        rendom
        deaf = (ofa + ofl + ofi) * x1
        SELECT CASE deaf
        CASE 1 TO 90
          review$ = review$ + "The accused is found guilty of cowardice in the face of the enemy. "
          replace = true
          fdue = 2
        CASE 91 TO 130
          review$ = review$ + "The accused is found guilty of a serious dereliction of duty. "
          replace = true
          fdue = 3
        CASE 131 TO 160
          review$ = review$ + "The accused is found guilty of a technical dereliction of duty. "
          replace = true
          fdue = 5
        CASE ELSE
        review$ = review$ + "The accused is fully exonerated from all charges. "
        replace = FALSE
        END SELECT
        IF replace = true THEN
          header
          worp (review$)
          wate
          PRINT #8,
          sentence
          IF fate < fdue THEN
            k = fdue - fate
            rendom
            IF x < genable / k THEN
              fdue = fate
              review$ = review$ + "There is no right of appeal in this case, and the court agree with " + gen$ + ". The sentence, " + RTRIM$(ttlox$(fdue)) + " is effected. "
            ELSE
              k = k / 2
              k = MAX(k, 1)
              fdue = fate + k
              review$ = review$ + "There is no right of appeal in this case. However the court ameliorates the sentence to one of, " + RTRIM$(ttlox$(fdue)) + ". Which is duly effected. "
            END IF
            IF fdue < 3 THEN
              review$ = review$ + chap$ + " " + RTRIM$(death$(pofl)) + ". "
            END IF
          ELSE
            review$ = review$ + "There is no right of appeal in this case, the sentence, " + RTRIM$(ttlox$(fdue)) + " is effected. "
          END IF
        END IF
      END SELECT
      header
      PRINT
      worp (review$)
      PRINT #8,
      wate

      IF replace = true THEN
        CALL replce
      END IF
    END IF

  LOOP UNTIL unit = 0
  header


END IF
END SUB

SUB ofnal
  '

  '
  units = LEN(buffer$(buffer)) / 150
  IF units = 0 THEN
   junk = Alert(4, "Buffer " + STR$(buffer) + "|is empty.", 7, 9, 20, 69, "", "", "")
   ELSE
   ext = 0
    DO UNTIL ext = 1
      header
      '
      PRINT
      PRINT "Which officer do you wish to change ";
      unit = -1
      DO UNTIL unit >= 0 AND unit <= units
        INPUT unit
      LOOP
      IF unit = 0 THEN
      ext = 1
      ELSE
        grabstats (unit)
        header
        PRINT "Presently: "; chap$
        '
        IF offname = true THEN
          offnat
         n1$ = autoname(ofn)
        ELSE
          PRINT TAB(5); "What is the name of the officer"
          PRINT TAB(5);
          n1$ = ""
          DO UNTIL LEN(n1$) > 0
            LINE INPUT n1$
         LOOP
        END IF
        n1$ = n1$ + "                 "
        off$ = LEFT$(n1$, 40)
        MID$(m$, 1) = off$
        MID$(m$, 41) = CHR$(ofr)
        chap$ = trim$(of$) + " " + trim$(off$)
        '
        logstats (starbite)
      END IF
    LOOP
  END IF
  header

END SUB

DEFSNG X-Y
SUB owounds

  '
  review$ = chap$ + " "
  IF wipeote = true THEN
    review$ = review$ + "was captured by the enemy. "
  ELSE
    IF ofw > 100 THEN
      IF ofw < 200 THEN
      rendom
       IF x < 35 THEN
          review$ = review$ + "died of his wounds. "
          ofw = 201
          MID$(m$, 47) = CHR$(ofw)
        ELSE
          review$ = review$ + "recovered quickly from his wounds and soon returned to duty. "
          review$ = review$ + "In the battle, he "
          ofw = 0
       END IF
      ELSE
        review$ = review$ + "was killed in the field. "
      END IF
    ELSE
      review$ = review$ + ofrale$(wm) + "He "
    END IF
    IF ofw > 200 THEN
      SELECT CASE ofp
      CASE 91 TO 99
        review$ = review$ + "He died a soldier's death, doing his duty. "
      CASE 100 TO 110
        review$ = review$ + "He died a very noble death, attendant to his duty to the end. "
      CASE 111 TO 260
        review$ = review$ + "He died a Hero's death, selflessly giving the final sacrefice for his men and his cause. "
      CASE ELSE
        review$ = review$ + "Unfortunately, he did not make an honourable death. "
      END SELECT
    ELSE
      SELECT CASE ofp
      CASE 81 TO 90
        review$ = review$ + "was noticabe during the battle, only by his absence. "
      CASE 91 TO 95
        review$ = review$ + "remained largely unremarked during the battle. "
      CASE 96 TO 99
        review$ = review$ + "discharged his duty competently enough. "
      CASE 100 TO 102
        review$ = review$ + "behaved very well, as befitting a soldier. "
      CASE 103 TO 110
        review$ = review$ + "played a valiant and distinguished part in the battle. "
      CASE 111 TO 120
        review$ = review$ + "was notable for his valour and expedition. "
      CASE 121 TO 130
        review$ = review$ + "played a prominent part in the hosilities, performing sterling deeds of valour. "
      CASE 131 TO 260
        review$ = review$ + "played the hero of the piece. "
      CASE ELSE
        review$ = review$ + "left the field in ungentle haste. "
      END SELECT
    END IF
  END IF
  '

END SUB

DEFINT X-Y
SUB printit

CALL natans
po1
header
    PRINT TAB(5); "Army Name"
    DO
      INPUT aname$
      IF LEN(aname$) > 8 OR LEN(aname$) < 3 THEN
        PRINT "Army name must have between 3 & 8 letters"
      END IF
    LOOP UNTIL LEN(aname$) < 9 AND LEN(aname$) > 2

    pat$ = "C:\ECW\bandi3\alists\" + aname$ + ".txt"
    OPEN pat$ FOR OUTPUT AS #10

FOR typ = 2 TO numtroops
  grabstuff
  
  review$ = force$(typ)
  CALL worp(review$)
  
  CALL unitpr
    SELECT CASE cc
    CASE 0 TO 15
      message$ = "a mere mob"
    CASE 16 TO 35
      message$ = "undisciplined"
    CASE 36 TO 45
      message$ = "disciplined"
    CASE 46 TO 55
      message$ = "well disciplined"
    CASE 56 TO 65
      message$ = "very well disciplined"
    CASE ELSE
      message$ = "superbly disciplined"
    END SELECT
    review$ = "Command Control: " + message$
    SELECT CASE ag
    CASE 0 TO 39
      message$ = "cautious"
    CASE 40 TO 55
      message$ = "impassive"
    CASE 56 TO 65
      message$ = "impetuous"
    CASE 66 TO 75
      message$ = "hot-headed"
    CASE ELSE
      message$ = "extremely rash"
    END SELECT
    IF (cc > 35 AND (ag > 55 OR ag < 40)) OR (cc < 35 AND (ag > 39 AND ag < 56)) THEN
      lk$ = ", but "
    ELSE
      lk$ = " and "
    END IF
    IF trype < 9 THEN
      review$ = review$ + lk$ + message$ + ". "
    ELSE
      review$ = review$ + ". "
    END IF
    SELECT CASE mr
    CASE 0 TO 50
      message$ = "timid"
    CASE 51 TO 65
      message$ = "diffident"
    CASE 66 TO 75
      message$ = "positive"
    CASE 76 TO 85
      message$ = "confident"
    CASE 86 TO 95
      message$ = "highly confident"
    CASE 96 TO 105
      message$ = "extremely confident"
    CASE ELSE
      message$ = "unshakably confident"
    END SELECT
    review$ = review$ + "Morale: " + message$
    SELECT CASE stead
    CASE 0 TO 8
      message$ = "completely steadfast"
    CASE 9 TO 15
      message$ = "steadfast"
    CASE 16 TO 25
      message$ = "steady"
    CASE 26 TO 35
      message$ = "steady enough"
    CASE 36 TO 45
      message$ = "excitable"
    CASE ELSE
      message$ = "unsteady"
    END SELECT
    IF (mr > 75 AND stead > 35) OR (mr < 66 AND stead < 36) THEN
      lk$ = ", but "
    ELSE
      lk$ = " and "
    END IF
    review$ = review$ + lk$ + message$ + ". "
    CALL worp(review$)

    z = mr / (80 + stead)
    z = z * ag
    SELECT CASE z
    CASE 0 TO 20
      message$ = "spineless"
    CASE 21 TO 30
      message$ = "reticent"
    CASE 31 TO 40
      message$ = "competent"
    CASE 41 TO 50
      message$ = "bold"
    CASE 51 TO 60
      message$ = "fierce"
    CASE 61 TO 70
      message$ = "fiercesome"
    CASE ELSE
      message$ = "ferocious"
    END SELECT
    IF trype < 9 THEN
      review$ = "They are " + message$ + " in melee "
    END IF
    SELECT CASE fd
    CASE 0 TO 15
      message$ = "negligable"
    CASE 16 TO 25
      message$ = "desultory"
    CASE 26 TO 35
      message$ = "competent"
    CASE 36 TO 45
      message$ = "effective"
    CASE 46 TO 55
      message$ = "impressive"
    CASE 56 TO 65
      message$ = "very impressive"
    CASE ELSE
      message$ = "murderous"
    END SELECT
    IF (z > 40 AND fd < 26) OR (z < 30 AND fd > 25) THEN
      lk$ = ", but "
    ELSE
      lk$ = " and "
    END IF
    IF trype < 9 THEN
      z = INT(z * 4 / 3)
      review$ = review$ + lk$ + "their firepower is " + message$ + ". "
    ELSE
      review$ = "Their gunnery is " + message$ + ". "
    END IF
    CALL worp(review$)
  
  k = typ - 1
  IF priner = FALSE THEN
    IF k / 2 = INT(k / 2) OR typ = ntype THEN
      wate
      CLS
    END IF
  ELSE
    IF typ = ntype THEN
      PRINT #8, CHR$(12)
    END IF
  END IF
NEXT typ
CLOSE #10

END SUB

SUB promote
IF LEN(buffer$(buffer)) = 0 THEN
  junk = Alert(4, "Buffer " + STR$(buffer) + "|is empty.", 7, 9, 20, 69, "", "", "")
ELSE
  units = LEN(buffer$(buffer)) / 150
  header
  unit = -1
  DO UNTIL unit = 0
    DO
      header
      PRINT TAB(5);
      PRINT TAB(5); "Which officer is to be promoted/demoted (Unit number) ";
      INPUT unit
    LOOP WHILE unit < 0 OR unit >= units
    IF unit <> 0 THEN
      grabstats (unit)
      orsbt = starbite
      orunit = unit
      PRINT
      PRINT chap$
      PRINT
      PRINT "Present Command : "; RIGHT$(m$, 40)
      IF trype = 0 THEN
        ofrch = windows("Promotions:", 3, tat$()) + 1
        IF ofrch = 1 THEN ofrch = 4
      ELSE
        ofrch = windows("Promotions:", 4, tot$())
      IF ofrch = 0 THEN ofrch = 4
      END IF
      IF ofrch = 4 THEN
        unit = 0
      END IF
      IF ofrch < 4 THEN
        IF ofrch = 1 THEN
          mx$ = m$
          typ = 1
          trype = 0
          CALL officrs
          n$ = LEFT$(m$, 45)
          n1$ = LEFT$(mx$, 45)
          MID$(m$, 1) = n1$
          MID$(m$, 45) = CHR$(5)
          logstats (0)
          grabstats (orunit)
          MID$(mx$, 1) = n$
          MID$(m$, 45) = CHR$(6)
          m$ = mx$
          logstats (orsbt)
          units = LEN(buffer$(buffer)) / 150
          unit = units
        END IF
        grabstats (unit)
        PRINT chap$
        PRINT "New Rank"
        offrank
        chap$ = RTRIM$(officer$(ofr)) + " "
        chap$ = chap$ + RTRIM$(LEFT$(m$, 40))
        rendom
        SELECT CASE ofrch
        CASE 1, 2
          ofi = ofi + 10 * xs
          ofl = ofl + 6 * x2!
        CASE 3
          ofi = ofi - 10 * xs
          ofl = ofl - 6 * x2!
        END SELECT
        ofi = MIN(ofi, 120)
        ofl = MIN(ofl, 120)
        ofi = MAX(ofi, 10)
        ofl = MAX(ofl, 10)
        MID$(m$, 41) = CHR$(ofr)
        MID$(m$, 43) = CHR$(ofi)
        MID$(m$, 44) = CHR$(ofl)
        logstats (starbite)
        header
        PRINT " New Rank : ";
        PRINT
        PRINT " "; chap$
        PRINT
        PRINT " commanding : "; uname$
        wate
      END IF
    END IF
    header
  IF unit <> 0 THEN
  unit = units + 1
  END IF
  LOOP


END IF
END SUB

SUB train
  IF LEN(buffer$(buffer)) = 0 THEN
   junk = Alert(4, "Buffer " + STR$(buffer) + "|is empty.", 7, 9, 20, 69, "", "", "")
  ELSE

  PRINT "Print the results of this Exercise to: "
  po1
  ext = 0
  DO UNTIL ext = 1
    header
  genlist (1)
  choice = windows("     Formation to be trained:                      ", count, uname$())
   
    IF choice <= 1 THEN
    ext = 1
    ELSE
      unit = VAL(uname$(choice))
      grabstats (unit)
      review$ = comand$(oftyp) + chap$
     rendom
      IF x > ofa THEN
     a = INT(RND * 10) + 1
     worp (review$)
        PRINT #8,
        review$ = chap$ + game$(a)
     worp (review$)
        PRINT #8,
        wate
        '
   ELSE
        review$ = review$ + " the Training Programme is proceeding:"
        worp (review$)
        PRINT #8,
      trype = -1
        DO UNTIL trype = 0 OR unit = units
          unit = unit + 1
          grabstats (unit)
          IF trype > 0 THEN
         
            review$ = "Unit " + STR$(unit) + ". "
            review$ = review$ + uname$ + " commanded by " + chap$ + ". "
        rendom
            IF x < ofa THEN
         trainit
            ELSE
              untrain
            END IF
            worp (review$)
            PRINT #8,
           logstats (starbite)
        IF priner = FALSE THEN
           wate
            END IF
        END IF
       LOOP
        '
      END IF
    END IF
    '
  LOOP
  IF priner = true THEN
    PRINT #8, CHR$(12)
  ELSE
    wate
  END IF
  CLOSE #8

  header
END IF
END SUB

