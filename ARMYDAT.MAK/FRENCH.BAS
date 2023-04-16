OPTION BASE 1
DECLARE SUB test ()
DECLARE SUB putem ()
DECLARE SUB test2 ()
COMMON SHARED troopname$(), title$(), tdat$, troopdata%(), offset%, tx$
DIM troopname$(500), title$(15), tdat%(10, 3), troopdata%(500, 18)
OPEN "C:\ecw\bandi3\armies.nam\french.nam" FOR OUTPUT AS #1
offset% = 1
tdat$ = ""
 WRITE #1, " French Armies ", "9"
FOR i% = 1 TO 9
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
frog1:
  DATA Garde Imperiale 1854-1868,60,3,14
  DATA " Officers                        ",1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,2,3,9,10
  DATA " Grenadiers des Gardes           ",1,1,3,18,6,150,0,0,0,0,60,110,15,60,8,10,1,50,3,60
  DATA " Voltigeurs des Gardes           ",1,1,3,19,6,150,0,0,0,0,65,100,15,60,8,10,1,50,3,60
  DATA " Chasseurs des Gardes            ",1,1,3,19,8,150,0,0,0,0,65,100,15,60,8,10,1,50,3,60
  DATA " Zouaves des Gardes              ",1,1,3,19,6,150,0,0,0,0,65,100,15,60,8,10,1,50,3,60
  DATA " Gendarmes a Pieds des Gardes    ",1,1,3,19,8,120,0,0,0,0,65,100,15,60,8,10,1,50,3,60
  DATA " Cuirassiers des Gardes          ",7,1,3,43,5,150,0,0,0,1,60,110,15,70,8,147,8,20,3,30
  DATA " Caribiniers des Gardes          ",7,1,3,43,5,150,0,0,0,1,60,110,15,70,8,147,8,20,3,30
  DATA " Dragons des Gardes              ",7,1,3,43,5,150,0,0,0,1,60,110,15,70,8,147,8,20,3,30
  DATA " Guides des Gardes               ",6,1,3,44,5,150,0,0,0,0,60,100,20,65,8,147,8,30,3,30
  DATA " Chasseurs des Gardes            ",6,1,3,44,5,150,0,0,0,0,60,100,20,65,8,147,8,30,3,30
  DATA " Lanciers des Gardes             ",6,1,3,44,5,150,0,0,0,0,60,100,20,65,8,147,8,30,3,30
  DATA " Artillerie a Cheval de la Garde ",10,1,3,62,3,40,6,0,0,0,60,110,10,10,11,141,2,60,3,2
  DATA " Artillerie a Pieds de la Garde  ",9,1,3,61,3,40,6,0,0,0,60,110,10,10,11,142,2,60,3,2
  '
frog2:
  DATA Lignards Francais 1849-1868,60,3,12
  DATA " Officers                    ",1,2,3,4,5,6,7,8,9,10,2,4,6,8,1,3,5,6,7,8
  DATA " Infantrie de Ligne          ",1,14,3,18,6,120,0,0,0,0,50,90,20,50,9,10,1,40,3,60
  DATA " Infantrie Legere            ",2,14,3,19,6,120,0,0,0,0,50,90,20,50,9,10,1,50,3,60
  DATA " Chasseurs                   ",2,16,3,19,6,120,0,0,0,0,50,95,18,50,9,10,1,50,3,60
  DATA " Carabiniers a Cheval        ",7,16,3,43,5,150,0,0,0,0,55,105,25,65,8,147,8,25,3,60
  DATA " Cuirassiers                 ",7,14,3,43,5,120,0,0,0,1,50,100,25,60,8,147,8,20,3,30
  DATA " Dragons                     ",7,14,3,43,5,120,0,0,0,0,50,95,25,60,8,147,8,25,3,50
  DATA " Chasseur a Cheval           ",6,14,3,44,5,150,0,0,0,0,50,95,30,60,8,147,8,25,3,30
  DATA " Hussards                    ",6,14,3,44,5,150,0,0,0,0,40,100,30,65,8,147,8,25,3,30
  DATA " Lanciers                    ",6,14,3,44,5,150,0,0,0,0,40,95,30,60,8,147,9,25,3,30
  DATA " Artillerie a Pied           ",9,14,3,61,3,40,6,0,0,0,50,90,20,10,11,142,2,50,3,2
  DATA " Artillerie a Cheval         ",10,14,3,62,3,40,6,0,0,0,50,90,20,10,11,141,2,50,3,2
  '
frog3:
  DATA Armee d'Afrique 1850-1868,40,3,11
  DATA " Officers                    ",1,2,3,4,5,6,7,8,9,10,2,4,6,8,1,3,5,9,5,6
  DATA " Legion Estrangere Grenadier ",2,15,3,19,6,120,0,0,0,0,50,95,20,60,10,10,1,45,3,60
  DATA " Legion Estrangere Fusilier  ",2,15,3,19,6,120,0,0,0,0,50,90,30,55,9,10,1,40,3,60
  DATA " Chasseurs                   ",2,14,3,19,6,120,0,0,0,0,40,90,30,50,9,10,1,40,3,60
  DATA " Tirailleurs Algeriens       ",2,4,3,19,6,120,0,0,0,0,30,90,30,50,11,10,2,30,3,60
  DATA " Zouaves                     ",2,4,3,19,6,120,0,0,0,0,40,90,30,50,10,10,1,30,3,60
  DATA " Zephyrs                     ",2,14,3,19,4,120,0,0,0,0,20,80,40,50,10,10,1,30,3,60
  DATA " Chasseurs Algerien          ",6,10,3,44,2,120,0,0,0,0,30,90,40,50,10,147,8,30,3,60
  DATA " Chasseurs d'Afrique         ",6,14,3,44,6,120,0,0,0,0,40,95,30,60,9,147,9,25,3,60
  DATA " Spahi d'Afrique             ",6,10,3,44,4,120,0,0,0,0,30,90,50,60,10,147,8,30,3,60
  DATA " Artillerie des Montagnes    ",11,1,3,64,3,40,6,0,0,0,60,110,10,10,11,102,2,60,3,2
  '
frog4:
  DATA Garde Imperiale 1868-1870,60,3,15
  DATA " Officers                        ",1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,2,3,9,10
  DATA " Grenadiers des Gardes           ",1,1,3,18,6,150,0,0,0,0,60,110,10,60,8,80,1,50,3,60
  DATA " Voltigeurs des Gardes           ",1,1,3,19,6,150,0,0,0,0,65,100,10,60,8,80,1,50,3,60
  DATA " Chasseurs des Gardes            ",1,1,3,19,8,150,0,0,0,0,65,100,10,60,8,80,1,50,3,60
  DATA " Zouaves des Gardes              ",1,1,3,19,6,150,0,0,0,0,65,100,10,60,8,80,1,50,3,60
  DATA " Gendarmes a Pieds des Gardes    ",1,1,3,19,8,120,0,0,0,0,65,100,10,60,8,80,1,50,3,60
  DATA " Cuirassiers des Gardes          ",7,1,3,57,5,150,0,0,0,1,60,110,15,70,8,151,8,20,3,30
  DATA " Caribiniers des Gardes          ",7,1,3,57,5,150,0,0,0,1,60,110,15,70,8,151,8,20,3,30
  DATA " Dragons des Gardes              ",7,1,3,57,5,150,0,0,0,1,60,110,15,70,8,151,8,20,3,30
  DATA " Guides des Gardes               ",6,1,3,58,5,150,0,0,0,0,60,100,20,65,8,151,8,30,3,30
  DATA " Chasseurs des Gardes            ",6,1,3,58,5,150,0,0,0,0,60,100,20,65,8,151,8,30,3,30
  DATA " Lanciers des Gardes             ",6,1,3,58,5,150,0,0,0,0,60,100,20,65,8,151,8,30,3,30
  DATA " Artillerie a Cheval de la Garde ",10,1,3,62,3,40,6,0,0,0,60,110,10,10,11,24,2,60,3,9
  DATA " Artillerie a Pieds de la Garde  ",9,1,3,61,3,40,6,0,0,0,60,110,10,10,11,24,2,60,3,9
  DATA " Mitrailleuses des Garde         ",20,1,3,62,3,40,6,0,0,0,60,110,10,10,11,9,2,60,3,13
  '
frog5:
  DATA Lignards Imperials 1868-1870,60,3,15
  DATA " Officers                    ",1,2,3,4,5,6,7,8,9,10,2,4,6,8,1,3,5,6,7,8
  DATA " Infantrie de Ligne          ",1,14,3,18,6,120,0,0,0,0,50,90,20,50,9,80,1,40,3,60
  DATA " Infantrie Legere            ",2,14,3,19,6,120,0,0,0,0,50,90,20,50,9,80,1,50,3,60
  DATA " Fusiliers Marins            ",2,14,3,19,6,120,0,0,0,0,50,90,20,50,9,80,1,50,3,60
  DATA " Chasseurs                   ",2,16,3,19,6,120,0,0,0,0,50,95,18,50,9,80,1,50,3,60
  DATA " Carabiniers a Cheval        ",7,16,3,57,5,150,0,0,0,0,55,105,25,65,8,151,8,25,3,60
  DATA " Cuirassiers                 ",7,14,3,57,5,120,0,0,0,1,50,100,25,60,8,151,8,20,3,30
  DATA " Dragons                     ",7,14,3,57,5,120,0,0,0,0,50,95,25,60,8,151,8,25,3,50
  DATA " Chasseur a Cheval           ",6,14,3,58,5,150,0,0,0,0,50,95,30,60,8,151,8,25,3,30
  DATA " Hussards                    ",6,14,3,58,5,150,0,0,0,0,40,100,30,65,8,151,8,25,3,30
  DATA " Lanciers                    ",6,14,3,58,5,150,0,0,0,0,40,95,30,60,8,151,9,25,3,30
  DATA " Artillerie a Pied           ",9,14,3,61,3,40,6,0,0,0,50,90,20,10,11,24,2,50,3,9
  DATA " Artillerie de Reserve       ",9,14,3,61,3,40,6,0,0,0,50,90,20,10,11,142,2,50,3,9
  DATA " Artillerie a Cheval         ",10,14,3,62,3,40,6,0,0,0,50,90,20,10,11,24,2,50,3,9
  DATA " Mitrailleuses               ",20,1,3,62,3,40,6,0,0,0,40,80,20,10,11,9,2,40,3,13
  '
frog6:
  DATA Armee d'Afrique 1868-1871,40,3,10
  DATA " Officers                    ",1,2,3,4,5,6,7,8,9,10,2,4,6,8,1,3,5,9,5,6
  DATA " Legion Estrangere Grenadier ",2,15,3,19,6,120,0,0,0,0,50,95,20,60,10,80,1,45,3,60
  DATA " Legion Estrangere Fusilier  ",2,15,3,19,6,120,0,0,0,0,50,90,30,55,9,80,1,40,3,60
  DATA " Chasseurs                   ",2,4,3,19,6,120,0,0,0,0,40,90,30,50,9,80,1,40,3,60
  DATA " Tirailleurs Algeriens       ",2,4,3,19,6,120,0,0,0,0,30,90,30,50,11,80,2,30,3,60
  DATA " Zouaves                     ",2,4,3,19,6,120,0,0,0,0,40,95,30,50,10,80,1,30,3,60
  DATA " Zephyrs                     ",2,14,3,19,4,120,0,0,0,0,30,80,40,50,10,80,1,30,3,60
  DATA " Chasseurs Algerien          ",6,10,3,44,2,120,0,0,0,0,30,90,40,50,10,151,8,30,3,60
  DATA " Chasseurs d'Afrique         ",6,4,3,44,6,120,0,0,0,0,40,95,30,60,9,151,9,25,3,60
  DATA " Spahi d'Afrique             ",6,10,3,44,4,120,0,0,0,0,30,90,50,60,10,151,8,30,3,60
  '
frog7:
  DATA Lignards Republiquaines 1870-1871,40,3,17
  DATA " Officers                    ",1,2,3,4,5,6,7,8,9,10,2,4,6,8,1,3,5,6,7,8
  DATA " Infantrie de Ligne          ",1,14,3,18,6,120,0,0,0,0,50,90,25,50,9,80,1,35,3,60
  DATA " Infantrie Legere            ",2,14,3,19,6,120,0,0,0,0,50,90,25,50,9,80,1,45,3,60
  DATA " Chasseurs                   ",2,4,3,19,6,120,0,0,0,0,40,95,20,50,9,80,1,50,3,60
  DATA " Regements de marche         ",1,9,3,18,6,120,0,0,0,0,40,90,30,50,9,80,1,35,3,60
  DATA " Gendarmerie                 ",1,4,3,18,6,120,0,0,0,0,40,90,40,50,9,154,1,30,3,60
  DATA " Forestiers                  ",1,4,3,19,6,120,0,0,0,0,40,90,35,50,9,80,1,50,3,60
  DATA " Douanieres                  ",1,4,3,18,6,120,0,0,0,0,40,90,40,50,9,61,1,30,3,60
  DATA " Volontaires de l'Ouest      ",1,4,3,18,6,120,0,0,0,0,50,90,20,50,9,80,1,50,3,60
  DATA " Cuirassiers                 ",7,14,3,57,5,120,0,0,0,1,50,90,25,50,8,151,8,20,3,30
  DATA " Dragons                     ",7,14,3,57,5,120,0,0,0,0,50,90,25,50,8,151,8,25,3,50
  DATA " Chasseur a Cheval           ",6,14,3,58,5,150,0,0,0,0,50,90,30,50,8,151,8,25,3,30
  DATA " Hussards                    ",6,14,3,58,5,150,0,0,0,0,40,95,30,55,8,151,8,25,3,30
  DATA " Lanciers                    ",6,14,3,58,5,150,0,0,0,0,40,95,30,50,8,151,9,25,3,30
  DATA " Batteries a Pieds           ",9,14,3,61,3,40,6,0,0,0,40,90,20,10,11,45,2,40,3,10
  DATA " Batteries a Cheveaux        ",10,14,3,62,3,40,6,0,0,0,40,90,20,10,11,17,2,40,3,10
  DATA " Mitrailleuses               ",20,1,3,62,3,40,6,0,0,0,40,80,20,10,11,20,2,40,3,13
  '
frog8:
  DATA Gardes & Marins Republiquaines 1870-71,60,3,11
  DATA " Officers                       ",1,2,3,4,5,6,7,8,9,10,2,4,6,8,1,3,5,6,7,8
  DATA " Gardes Republiquaines          ",1,1,3,18,6,120,0,0,0,0,50,90,20,50,9,80,1,40,3,60
  DATA " Gardes Republiquaines a Cheval ",7,1,3,57,5,120,0,0,0,1,50,100,25,60,8,151,8,20,3,30
  DATA " Fusiliers Marins               ",2,2,3,19,6,120,0,0,0,0,50,90,20,50,9,75,1,50,3,60
  DATA " Marins Provisionals            ",2,9,3,19,6,120,0,0,0,0,50,90,20,50,9,70,1,40,3,60
  DATA " Matelots                       ",2,4,3,19,6,120,0,0,0,0,50,90,20,50,9,63,1,30,3,60
  DATA " Batteries Marins 14cms         ",12,2,3,61,3,40,6,0,0,0,50,90,20,10,11,90,2,50,3,10
  DATA " Batteries Marins 16cms         ",14,2,3,61,3,40,6,0,0,0,50,90,20,10,11,91,2,50,3,10
  DATA " Batteries Marins 19cms         ",14,2,3,62,3,40,6,0,0,0,50,90,20,10,11,92,2,50,3,10
  DATA " Mitrailleuses Marins           ",20,2,3,62,3,40,6,0,0,0,40,80,20,10,11,22,2,40,3,15
  DATA " Mitrailleuses Americains       ",20,2,3,62,3,40,6,0,0,0,40,80,20,10,11,4,2,40,3,15
  '
frog9:
  DATA Gardes Mobiles & Nationals 1870-1871,20,3,16
  DATA " Officers                    ",1,2,3,4,5,6,7,8,9,10,2,4,6,8,1,3,5,6,7,8
  DATA " Gardes Mobiles              ",1,7,4,18,8,150,0,0,0,0,20,80,50,30,9,152,1,20,3,60
  DATA " Gardes Nationals            ",1,7,4,18,8,150,0,0,0,0,25,85,50,30,9,154,1,20,3,60
  DATA " Garde National de Paris     ",1,7,4,18,8,150,0,0,0,0,20,90,50,30,9,152,1,20,3,60
  DATA " Gardes Sedentaires          ",1,7,4,18,8,150,0,0,0,0,20,70,60,30,9,154,1,20,3,60
  DATA " Francs Tireurs              ",1,4,4,18,8,150,0,0,0,0,10,90,50,30,9,155,1,20,3,60
  DATA " Eclaireurs                  ",1,4,4,18,8,150,0,0,0,0,20,80,40,30,9,93,2,20,3,60
  DATA " Garibaldini                 ",1,15,4,18,8,150,0,0,0,0,30,90,30,50,9,75,1,30,4,60
  DATA " Gendarmerie Sedentaire      ",1,18,3,18,6,120,0,0,0,0,30,80,40,50,9,154,1,40,3,60
  DATA " Gardes Mobiles a Cheval     ",6,7,4,58,5,150,0,0,0,0,30,85,40,50,8,153,8,20,3,30
  DATA " Gardes Nationals a Cheval   ",6,7,4,58,5,150,0,0,0,0,30,85,40,50,8,153,8,20,3,30
  DATA " Batteries a Pieds 4lv       ",9,7,4,61,3,40,6,0,0,0,30,90,30,10,11,24,2,20,3,13
  DATA " Batteries a Pieds 8lv       ",9,7,4,61,3,40,6,0,0,0,30,90,30,10,11,25,2,20,3,13
  DATA " Batteries d'Obusiers        ",9,7,4,61,3,40,6,0,0,0,30,90,30,10,11,89,2,20,3,2
  DATA " Battteries Montees          ",10,7,4,62,3,40,6,0,0,0,30,90,30,10,11,24,2,20,3,13
  DATA " Mitrailleuses               ",20,7,4,62,3,40,6,0,0,0,40,80,30,10,11,21,2,30,3,15

SUB putem
 DEF SEG = SSEG(tdat$)
 BSAVE "c:\ecw\bandi3\armies.dat\french.arm", SADD(tdat$), LEN(tdat$)
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

