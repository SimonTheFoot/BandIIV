OPTION BASE 1
DECLARE SUB test ()
DECLARE SUB putem ()
DECLARE SUB test2 ()
COMMON SHARED troopname$(), title$(), tdat$, troopdata%(), offset%, tx$
DIM troopname$(500), title$(15), tdat%(10, 3), troopdata%(500, 18)
OPEN "C:\ecw\bandi3\armies.nam\fareast.nam" FOR OUTPUT AS #1
offset% = 1
tdat$ = ""
 WRITE #1, " Armies of the Orient ", "10"
FOR i% = 1 TO 10
   READ title$, a%, lang%, numtroops%
   WRITE #1, title$, a%, lang%, numtroops%
   FOR k% = 1 TO numtroops%
     READ x$
     x$ = x$ + "                                                "
     x$ = LEFT$(x$, 50)
     PRINT x$
     tdat$ = tdat$ + x$
     FOR l% = 1 TO 20
       READ troopdata%
       x$ = MKI$(troopdata%)
       tdat$ = tdat$ + x$
       PRINT troopdata%; ",";
       NEXT l%
     PRINT
     NEXT k%
     NEXT i%
CALL putem
CLOSE #1
REM CALL test
' troop(1)  troop type
' troop(2)  troop class
' troop(3)  experience
' troop(4)  formation
' troop(5)  sub units
' troop(6)  men in a sub unit
' troop(7)  number of guns
' troop(8)  % with primary weapon (0=100)
' troop(9)  secondary missile weapon
' troop(10) armour
' troop(11) command control
' troop(12) confidence
' troop(13) steadyness
' troop(14) aggression
' troop(15) officer rank
' troop(16) primary missile weapon
' troop(17) melee weapon
' troop(18) fire discipline
'
china1:
  DATA Imperial Chinese 1830-1859,10,12,15
  DATA " Officers                   ",1,2,3,4,5,5,6,6,7,7,8,8,9,9,9,10,10,10,5,7
  DATA " Tartar Cavalry             ",6,20,3,52,4,125,0,0,0,0,40,90,40,55,11,106,9,30,12,30
  DATA " Black Banner Cavalry       ",6,10,3,52,4,125,0,0,0,0,40,90,45,40,11,106,9,30,12,30
  DATA " Black Banner Infantry      ",1,10,3,15,5,110,0,50,0,0,40,90,50,40,11,112,10,30,12,30
  DATA " Tigermen                   ",2,10,3,11,5,110,0,0,0,0,40,100,40,55,11,108,3,30,12,30
  DATA " Green Banner Cavalry       ",7,10,3,52,4,125,0,0,0,0,30,80,50,30,11,106,9,30,12,30
  DATA " Green Banner Infantry      ",1,10,3,15,5,110,0,50,0,0,30,80,50,30,11,112,10,30,12,30
  DATA " Green Banner Garrisons     ",1,10,3,15,5,110,0,50,0,0,20,70,50,30,11,112,10,30,12,30
  DATA " Village Militia            ",1,7,3,15,5,110,0,50,0,0,30,80,50,30,11,112,7,30,12,30
  DATA " Jingals                    ",16,10,3,73,10,5,10,0,0,0,30,80,40,10,11,130,2,30,12,1
  DATA " Rockets                    ",13,10,3,61,2,20,4,0,0,0,40,90,40,10,11,86,3,20,12,11
  DATA " Light Battery              ",9,2,3,63,2,40,4,0,0,0,40,90,40,10,11,4,2,20,12,1
  DATA " Medium Battery             ",9,2,3,63,2,50,4,0,0,0,40,90,40,10,11,7,2,20,12,1
  DATA " Heavy Battery              ",9,2,3,63,2,60,4,0,0,0,40,90,40,10,11,8,2,20,12,1
  DATA " Mountain Artillery         ",11,2,3,64,2,20,4,0,0,0,40,90,40,10,11,129,2,30,12,1
  '
china2:
  DATA Imperial Chinese 1860-1868,10,12,16
  DATA " Officers                   ",1,2,3,4,5,5,6,6,7,7,8,8,9,9,9,10,10,10,5,7
  DATA " Tartar Cavalry             ",6,20,3,52,4,125,0,0,0,0,40,90,40,55,11,106,9,30,12,30
  DATA " Black Banner Cavalry       ",6,10,3,52,4,125,0,0,0,0,40,90,45,40,11,106,9,30,12,30
  DATA " Black Banner Infantry      ",1,10,3,15,5,110,0,50,0,0,40,90,50,40,11,112,10,30,12,30
  DATA " Foriegn Legion             ",2,20,3,16,4,50,0,0,0,0,40,90,40,50,8,28,1,40,1,60
  DATA " Phillipine Legion          ",2,20,3,16,4,50,0,0,0,0,40,90,40,50,10,3,1,30,5,60
  DATA " Green Banner Cavalry       ",7,10,3,52,4,125,0,0,0,0,30,80,50,30,11,106,9,30,12,30
  DATA " Green Banner Infantry      ",1,10,3,15,5,110,0,50,0,0,30,80,50,30,11,112,10,30,12,30
  DATA " Green Banner Garrisons     ",1,10,3,15,5,110,0,50,0,0,20,70,50,30,11,112,10,30,12,30
  DATA " Village Militia            ",1,7,3,15,5,110,0,50,0,0,30,80,50,30,11,112,7,30,12,30
  DATA " Jingals                    ",16,10,3,73,10,5,10,0,0,0,30,80,40,10,11,130,2,30,12,1
  DATA " Rockets                    ",13,10,3,61,2,20,4,0,0,0,40,90,40,10,11,86,3,20,12,11
  DATA " Light Battery              ",9,2,3,63,2,40,4,0,0,0,40,90,40,10,11,4,2,20,12,1
  DATA " Medium Battery             ",9,2,3,63,2,50,4,0,0,0,40,90,40,10,11,7,2,20,12,1
  DATA " Heavy Battery              ",9,2,3,63,2,60,4,0,0,0,40,90,40,10,11,8,2,20,12,1
  DATA " Mountain Artillery         ",11,2,3,64,2,20,4,0,0,0,40,90,40,10,11,129,2,30,12,1
  '
china3:
  DATA Tiaping Rebels 1849-1861,10,12,13
  DATA " Officers                   ",1,2,3,4,5,5,6,6,7,7,8,8,9,9,9,10,10,10,5,7
  DATA " Cavalry Leu                ",6,10,3,52,4,125,0,0,0,0,40,90,40,50,11,115,8,30,12,30
  DATA " Guard Leu                  ",2,1,1,11,5,105,0,0,0,0,50,105,40,55,11,1,3,30,12,30
  DATA " Veteran Leu                ",2,10,1,11,5,105,0,0,0,0,50,100,40,55,11,112,3,30,12,30
  DATA " Secondary Leu              ",2,10,3,11,5,105,0,50,0,0,40,100,40,55,11,112,14,30,12,30
  DATA " Primary Leu                ",1,10,3,15,5,105,0,10,0,0,30,80,50,30,11,112,7,30,12,30
  DATA " Northern Leu               ",1,10,3,15,5,105,0,50,106,0,30,80,50,30,11,112,7,30,12,30
  DATA " Womens Leu                 ",1,10,3,15,5,105,0,10,0,0,30,80,50,30,11,112,7,30,12,30
  DATA " Jingals                    ",16,10,3,73,10,5,10,0,0,0,30,80,40,10,11,130,2,30,12,1
  DATA " Rockets                    ",13,10,3,61,2,20,4,0,0,0,40,90,40,10,11,86,3,20,12,11
  DATA " French Battery             ",9,10,3,63,1,40,3,0,0,0,40,90,40,10,11,110,2,20,12,1
  DATA " Medium Battery             ",9,10,3,63,1,50,2,0,0,0,40,90,40,10,11,128,2,20,12,1
  DATA " Light Artillery            ",11,7,3,64,1,20,2,0,0,0,40,90,40,10,11,129,2,30,12,1
  '
china4:
  DATA Tiaping Rebels 1861-1864,10,12,12
  DATA " Officers                   ",1,2,3,4,5,5,6,6,7,7,8,8,9,9,9,10,10,10,5,7
  DATA " Cavalry Leu                ",6,10,3,52,4,125,0,0,0,0,40,90,40,50,11,115,8,30,12,30
  DATA " Guard Leu                  ",2,1,1,11,5,105,0,80,15,0,50,105,40,55,11,1,3,30,12,30
  DATA " Veteran Leu                ",2,10,1,11,5,105,0,90,81,0,50,100,40,55,11,1,3,30,12,30
  DATA " Secondary Leu              ",2,10,3,11,5,105,0,50,0,0,40,100,40,55,11,27,7,30,12,30
  DATA " Primary Leu                ",1,10,3,15,5,105,0,50,0,0,30,80,50,30,11,112,7,30,12,30
  DATA " Womens Leu                 ",1,10,3,15,5,105,0,10,0,0,30,80,50,30,11,2,7,30,12,30
  DATA " Jingals                    ",16,10,3,73,10,5,10,0,0,0,30,80,40,10,11,130,2,30,12,1
  DATA " Rockets                    ",13,10,3,61,2,20,4,0,0,0,40,90,40,10,11,86,3,20,12,11
  DATA " French Battery             ",9,10,3,63,1,40,3,0,0,0,40,90,40,10,11,110,2,20,12,1
  DATA " Medium Battery             ",9,10,3,63,1,50,2,0,0,0,40,90,40,10,11,128,2,20,12,1
  DATA " Light Artillery            ",11,7,3,64,1,20,2,0,0,0,40,90,40,10,11,129,2,30,12,1
  '
china5:
  DATA The Ever Victorious Army 1861-63,30,12,7
  DATA " Officers                ",1,2,3,4,5,5,6,6,7,7,8,8,9,9,9,10,10,10,5,7
  DATA " Bodyguard               ",2,20,3,16,6,50,0,0,0,0,50,95,40,50,10,44,2,30,1,60
  DATA " 1st Battalion           ",2,2,3,16,10,110,0,90,28,0,50,95,40,50,10,1,1,30,1,60
  DATA " Rifle Battalion         ",2,2,3,16,10,70,0,70,81,0,50,95,40,50,10,15,1,40,1,60
  DATA " Other Battalions        ",2,2,3,16,10,60,0,0,0,0,40,95,40,50,10,1,1,30,1,60
  DATA " Heavy Battery           ",9,2,3,61,1,40,2,0,0,0,40,90,40,10,11,7,2,20,1,4
  DATA " Light Battery           ",9,2,3,61,2,40,3,0,0,0,40,90,40,10,11,110,2,20,1,4
  '
china6:
  DATA The Ever Victorious Army 1863-64,30,12,12
  DATA " Officers                ",1,2,3,4,5,5,6,6,7,7,8,8,9,9,9,10,10,10,5,7
  DATA " Bodyguard               ",2,1,3,17,6,50,0,0,0,0,50,95,40,50,10,18,1,30,1,60
  DATA " 1st Battalion           ",2,16,3,17,6,100,0,90,15,0,50,95,40,50,10,3,1,30,1,60
  DATA " Rifle Battalion         ",2,2,3,17,6,100,0,70,81,0,50,95,40,50,10,15,1,40,1,60
  DATA " Baloochi Infantry       ",2,15,3,17,2,100,0,0,0,0,40,95,35,50,11,1,1,40,1,60
  DATA " Sikh Infantry           ",2,15,3,17,1,100,0,0,0,0,40,95,30,50,11,1,1,45,1,60
  DATA " H.M. Light Infantry     ",2,15,3,17,2,100,0,0,0,0,50,90,15,65,9,15,1,60,1,60
  DATA " Other Battalions        ",2,22,3,17,6,100,0,0,0,0,40,95,40,50,10,3,1,35,1,60
  DATA " Heavy Battery           ",9,2,3,61,3,40,6,2,75,0,40,90,40,10,11,14,2,20,1,3
  DATA " Howitzer Battery        ",9,2,3,61,3,30,6,0,0,0,40,90,40,10,11,148,2,20,1,3
  DATA " Light Battery           ",9,2,3,61,3,30,6,0,0,0,40,90,40,10,11,126,2,20,1,3
  DATA " Rocket Battery          ",13,2,3,61,3,30,6,2,63,0,40,90,40,10,11,62,2,20,1,3
  '
japan7:
  DATA The Japanese Shogunate 1862-67 ,20,36,7
  DATA " Officers                   ",1,2,3,4,5,5,6,6,7,7,8,8,9,9,9,10,10,10,5,7
  DATA " Aizu Samuri              ",1,10,3,15,5,100,0,50,112,0,10,90,20,70,25,122,2,20,36,30
  DATA " Samuri                   ",1,10,3,15,5,100,0,75,165,0,20,90,30,60,25,112,2,20,36,30
  DATA " Samuri Cavalry           ",6,10,3,53,1,100,0,75,112,0,20,90,30,60,25,122,9,20,36,30
  DATA " Shotai                   ",1,4,3,18,6,100,0,0,0,0,40,90,30,50,10,10,2,30,36,30
  DATA " Sotsuzoku                ",1,10,3,15,5,100,0,75,112,0,30,80,50,30,25,122,10,20,36,30
  DATA " Artillery                ",9,4,2,61,3,30,6,0,0,0,40,90,30,10,12,15,2,30,36,2
  '
japan8:
  DATA Japan; Chosu and Satsuma 1862-67 ,20,36,12
  DATA " Officers                   ",1,2,3,4,5,5,6,6,7,7,8,8,9,9,9,10,10,10,5,7
  DATA " Chosun Kiheitai          ",1,4,3,18,6,100,0,0,0,0,60,90,20,50,10,15,1,40,36,60
  DATA " Chosun Shotai            ",1,4,3,18,6,100,0,0,0,0,40,90,30,50,10,15,1,30,36,60
  DATA " Satsuma Shotai           ",1,4,3,18,6,100,0,0,0,0,30,90,30,50,10,10,2,30,36,30
  DATA " Satsuma Samuri           ",1,10,3,15,5,100,0,75,165,0,30,90,30,60,25,112,2,20,36,30
  DATA " Satsuma Cavalry          ",6,10,3,53,1,100,0,25,0,0,30,90,30,60,25,147,9,20,36,30
  DATA " Satsuma Sotsuzoku        ",1,10,3,15,5,100,0,75,112,0,30,80,50,30,25,122,10,20,36,30
  DATA " Tosa Shotai              ",1,4,3,18,6,100,0,0,0,0,30,90,30,50,10,7,2,30,36,30
  DATA " Tosa Samuri              ",1,10,3,15,5,100,0,75,7,0,30,90,30,60,25,112,2,20,36,30
  DATA " Tosa Cavalry             ",6,10,3,53,1,100,0,75,112,0,30,90,30,60,25,122,9,20,36,30
  DATA " Tosa Sotsuzoku           ",1,10,3,15,5,100,0,75,112,0,30,80,50,30,25,122,10,20,36,30
  DATA " Artillery                ",9,4,2,61,3,30,6,0,0,0,40,90,30,10,12,15,2,30,36,2
  '
japan9:
  DATA Meiji Japan 1868-80 ,20,36,9
  DATA " Officers                   ",1,2,3,4,5,5,6,6,7,7,8,8,9,9,9,10,10,10,5,7
  DATA " Imperial Guard           ",1,1,3,18,6,140,0,0,0,0,60,90,20,50,10,70,1,40,36,60
  DATA " Infantry                 ",1,10,3,18,6,120,0,0,0,0,40,90,40,50,10,70,1,30,36,60
  DATA " Reservists               ",1,10,4,18,6,120,0,0,0,0,30,90,50,40,10,15,1,20,36,60
  DATA " Cavalry                  ",7,10,3,57,4,120,0,0,0,0,30,90,30,70,10,71,8,20,36,30
  DATA " Aizu Gendarmes           ",2,4,3,31,6,100,0,0,0,0,30,90,30,70,10,15,2,20,36,30
  DATA " Tokyo Gendarmes          ",2,4,3,31,6,100,0,0,0,0,40,90,30,60,10,15,2,20,36,30
  DATA " Artillery                ",9,10,2,61,3,30,6,0,0,0,40,90,30,10,12,41,2,30,36,10
  DATA " Repeaters                ",20,10,2,61,1,20,2,0,0,0,40,90,30,10,12,5,2,30,36,15
  '
japan10:
  DATA Satsuma Rebels 1877-78 ,20,36,8
  DATA " Officers                   ",1,2,3,4,5,5,6,6,7,7,8,8,9,9,9,10,10,10,5,7
  DATA " Satsuma Samurai            ",1,4,3,18,6,100,0,60,15,0,30,95,30,60,10,70,2,30,36,30
  DATA " Higo Samurai               ",1,4,3,18,6,100,0,70,44,0,25,90,30,55,15,10,2,30,36,30
  DATA " Osumi Samurai              ",1,4,3,18,6,100,0,60,51,0,25,90,30,55,10,7,2,30,36,30
  DATA " Hyuga Samurai              ",1,4,3,18,6,100,0,60,57,0,25,90,30,60,10,15,2,30,36,30
  DATA " Shikoku Samurai            ",1,4,3,18,6,100,0,80,49,0,20,90,35,65,10,15,2,30,36,30
  DATA " Honshu Samurai             ",1,4,3,18,6,100,0,50,15,0,20,90,30,50,10,70,2,30,36,30
  DATA " Artillery                  ",9,4,2,61,3,30,6,0,0,0,40,90,30,10,12,15,2,30,36,2

  '
SUB putem
 DEF SEG = SSEG(tdat$)
 BSAVE "c:\ecw\bandi3\armies.dat\fareast.arm", SADD(tdat$), LEN(tdat$)
END SUB

SUB test
OPEN "A:\armies.dat\french.arm" FOR INPUT AS #1
x% = LOF(1)
tdat$ = STRING$(x%, " ")
 DEF SEG = SSEG(tdat$)
 BLOAD "A:\armies.dat\french.arm", SADD(tdat$)
OPEN "A:\armies.nam\french.nam" FOR INPUT AS #2
offs% = -89
FOR i% = 1 TO 15
CLS
PRINT "Troop replay listing now "
SLEEP
INPUT #2, title$, a%, lang%, numtroops%
  PRINT title$, a%, lang%, numtroops%
  FOR k% = 1 TO numtroops%
     offs% = offs% + 90
     x$ = MID$(tdat$, offs%, 50)
     PRINT x$;
    FOR l% = 1 TO 35 STEP 2
     x% = CVI(MID$(tdat$, offs% + 50 + l% - 1))
     PRINT x%; ",";
       NEXT l%
       IF k% = 6 THEN
     SLEEP
     END IF
     NEXT k%
     PRINT
     SLEEP
     CLS
NEXT i%
CLOSE #1
CLOSE #2
END SUB

