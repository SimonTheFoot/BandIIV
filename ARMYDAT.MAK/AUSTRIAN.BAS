OPTION BASE 1
DECLARE SUB test ()
DECLARE SUB putem ()
DECLARE SUB test2 ()
COMMON SHARED troopname$(), title$(), tdat$, troopdata%(), offset%, tx$
DIM troopname$(500), title$(15), tdat%(10, 3), troopdata%(500, 18)
OPEN "C:\ecw\bandi3\armies.nam\austrian.nam" FOR OUTPUT AS #1
offset% = 1
tdat$ = ""
WRITE #1, "Armies  and Allies of Austria", "7"
FOR i% = 1 TO 7
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
aust1:
  DATA Austria-Hungary 1849-1860,40,2,15
  DATA " Officers                   ",1,2,3,4,5,6,7,8,9,4,5,6,3,4,5,6,5,6,9,10
  DATA " Grenadier                  ",1,16,3,7,4,236,0,0,0,0,50,90,10,50,8,3,1,50,2,50
  DATA " Jager                      ",2,4,3,8,6,200,0,0,0,0,50,90,15,50,9,16,1,50,2,50
  DATA " Deutsche Bataillon         ",1,14,3,7,6,236,0,0,0,0,40,80,20,45,9,3,1,40,2,50
  DATA " Magyar Bataillon           ",1,4,3,7,6,236,0,0,0,0,40,90,25,45,9,3,1,40,27,50
  DATA " Italienische Bataillon     ",1,14,3,7,6,236,0,0,0,0,40,90,30,45,9,3,1,40,4,50
  DATA " Grenzer                    ",2,7,3,8,6,236,0,0,0,0,30,90,30,50,10,174,1,30,17,50
  DATA " Kuirassiere                ",7,2,3,45,6,200,0,0,0,2,60,95,20,60,8,16,8,30,2,50
  DATA " Dragoner                   ",7,2,3,45,6,200,0,0,0,0,50,90,20,50,8,16,8,30,2,50
  DATA " Chevauleger                ",6,2,3,46,6,200,0,0,0,0,50,90,25,50,8,16,8,30,2,50
  DATA " Husaren                    ",6,2,3,46,8,200,0,0,0,0,40,100,30,60,8,16,8,30,27,50
  DATA " Uhlanen                    ",6,2,3,46,8,200,0,0,0,0,40,90,30,50,8,16,9,30,18,50
  DATA " Infanterie Batterie        ",9,2,3,61,4,40,8,2,108,0,50,80,20,10,11,106,2,40,2,2
  DATA " Cavallerie Batterie        ",10,2,3,62,4,40,8,2,108,0,50,90,20,10,11,106,8,40,2,2
  DATA " Feuerwerker Batterie       ",13,2,3,62,4,30,8,0,0,0,50,90,20,10,11,57,2,40,2,2
  '
aust2:
  DATA Austria-Hungary Volunteers & Militia 1849-1860,40,2,18
  DATA " Officers                  ",1,2,3,4,5,6,7,8,9,3,4,5,5,6,5,6,9,9,5,6
  DATA " Matrosen Korps             ",2,2,3,8,6,230,0,0,0,0,40,90,30,50,9,3,1,40,4,50
  DATA " Maraineinfanteristen       ",2,14,3,8,6,230,0,0,0,0,40,90,30,50,9,3,1,40,4,50
  DATA " Stabs Infanterie           ",1,8,3,7,3,224,0,0,0,0,40,80,30,40,9,3,1,40,2,50
  DATA " Stabs Dragoner             ",6,8,3,46,2,207,0,0,0,0,40,80,30,40,9,16,2,30,2,50
  DATA " Wien Freiwillige Korps     ",2,4,3,8,6,200,0,0,0,0,30,90,30,50,9,13,1,35,2,50
  DATA " Ostereiche Voluntiere      ",2,4,3,8,4,250,0,0,0,0,30,90,30,40,9,16,1,35,2,50
  DATA " Bohemien Voluntiere        ",2,4,3,8,6,200,0,0,0,0,30,90,30,40,9,16,1,35,28,50
  DATA " Moravien Voluntiere        ",2,4,3,8,6,200,0,0,0,0,30,90,30,40,9,16,1,35,28,50
  DATA " Magyar Voluntiere          ",2,4,3,8,4,200,0,0,0,0,30,90,30,40,9,13,1,35,27,50
  DATA " Galitzien Voluntiere       ",2,4,3,8,4,120,0,0,0,0,30,90,35,45,9,16,1,35,18,50
  DATA " Italienische Voluntiere    ",2,4,3,8,1,216,0,0,0,0,30,90,30,40,10,16,1,35,4,50
  DATA " Balkenische Voluntiere     ",2,4,3,8,6,160,0,0,0,0,30,90,35,45,9,174,1,30,17,50
  DATA " Landschutzen               ",2,7,3,8,4,130,0,0,0,0,30,90,40,30,28,168,12,30,2,36
  DATA " Trieste Korps              ",1,7,3,7,4,140,0,0,0,0,30,80,40,30,10,3,1,30,4,50
  DATA " Magyar Husaren Voluntiere  ",6,4,3,46,2,200,0,0,0,0,30,100,35,40,8,16,8,25,27,50
  DATA " Croat-sloveien Husaren     ",6,4,3,46,1,200,0,0,0,0,30,90,35,40,10,16,9,25,17,50
  DATA " Gendarmerie                ",2,18,3,46,1,200,0,0,0,0,20,70,40,30,10,16,1,30,2,50
  '
aust3:
  DATA Austria-Hungary 1860-1868,40,2,16
  DATA " Officers                   ",1,2,3,4,5,6,7,8,9,4,5,6,7,3,4,5,3,4,5,9
  DATA " Grenadiere                 ",1,16,3,7,6,168,0,0,0,0,50,90,10,50,9,13,1,50,2,50
  DATA " Deutsche Bataillon         ",1,14,3,7,6,168,0,0,0,0,40,80,20,40,9,13,1,45,2,50
  DATA " Magyar Bataillon           ",1,4,3,7,6,168,0,0,0,0,40,90,25,45,9,13,1,40,27,50
  DATA " Galitzienische Bataillon   ",1,14,3,7,6,168,0,0,0,0,40,80,20,40,9,13,1,40,18,50
  DATA " Italienische Bataillon     ",1,14,3,7,6,168,0,0,0,0,40,90,30,40,9,13,1,40,4,50
  DATA " Jager                      ",2,4,3,8,6,160,0,0,0,0,50,90,20,50,9,16,1,50,2,50
  DATA " Grenzer                    ",2,7,3,8,6,168,0,0,0,0,30,90,30,50,9,13,1,40,2,50
  DATA " Landesschutzen             ",2,7,3,8,6,120,0,0,0,0,30,90,30,40,10,16,12,40,2,35
  DATA " Kuirassiere                ",7,2,3,45,4,150,0,0,0,1,60,95,20,60,8,137,8,30,2,50
  DATA " Dragoner                   ",7,2,3,45,4,150,0,0,0,0,50,90,20,50,8,16,8,30,2,50
  DATA " Husaren                    ",6,2,3,46,5,120,0,0,0,0,40,100,30,60,8,16,8,30,27,50
  DATA " Uhlan                      ",6,2,3,46,5,120,0,0,0,0,40,90,30,50,8,16,9,30,18,50
  DATA " Infanterie Batterie        ",9,2,3,61,4,40,8,0,0,0,50,90,20,10,11,21,2,50,2,9
  DATA " Cavallerie Batterie        ",10,2,3,62,4,40,8,0,0,0,50,90,20,10,11,21,8,50,2,9
  DATA " Feueurwerker Batterie      ",10,2,3,62,4,30,8,0,0,0,50,90,20,11,10,57,8,50,2,2
  '
aust4:
  DATA Austria-Hungary Volunteers & Militia 1860-1868,40,2,18
  DATA " Officers                  ",1,2,3,4,5,6,7,8,9,3,4,5,5,6,5,6,9,9,5,6
  DATA " Matrosen Korps             ",2,2,3,8,6,160,0,0,0,0,40,90,30,50,9,13,1,40,4,50
  DATA " Maraineinfanteristen       ",2,14,3,8,6,160,0,0,0,0,40,90,30,50,9,13,1,40,4,50
  DATA " Stabs-infanterie           ",1,8,3,7,6,160,0,0,0,0,40,80,30,40,9,13,1,40,2,50
  DATA " Stabs Dragoner             ",6,8,3,46,4,150,0,0,0,0,40,80,30,40,9,13,2,30,2,50
  DATA " Wien Freiwillige Korps     ",2,4,3,8,6,200,0,0,0,0,30,90,30,50,9,13,1,35,2,50
  DATA " Ostereiche Voluntiere      ",2,4,3,8,4,150,0,0,0,0,30,90,30,40,9,13,1,35,2,50
  DATA " Bohemien Voluntiere        ",2,4,3,8,6,150,0,0,0,0,30,90,30,40,9,13,1,35,28,50
  DATA " Moravien Voluntiere        ",2,4,3,8,6,150,0,0,0,0,30,90,30,40,9,13,1,35,28,50
  DATA " Magyar Voluntiere          ",2,4,3,8,4,200,0,0,0,0,30,90,30,40,9,13,1,35,27,50
  DATA " Galitzien Voluntiere       ",2,4,3,8,4,120,0,0,0,0,30,90,35,45,9,13,1,35,18,50
  DATA " Italienische Voluntiere    ",2,4,3,8,1,216,0,0,0,0,30,90,30,40,10,13,1,35,4,50
  DATA " Balkenische Voluntiere     ",2,4,3,8,6,160,0,0,0,0,30,90,35,45,9,13,1,30,17,50
  DATA " Landschutzen               ",2,7,3,8,4,130,0,0,0,0,30,90,40,30,28,168,12,30,2,36
  DATA " Trieste Korps              ",1,7,3,7,4,140,0,0,0,0,30,80,40,30,10,13,1,30,4,50
  DATA " Magyar Husaren Voluntiere  ",6,4,3,46,2,200,0,0,0,0,30,100,35,40,8,16,8,25,27,50
  DATA " Croat-sloveien Husaren     ",6,4,3,46,1,200,0,0,0,0,30,90,35,40,10,16,9,25,17,50
  DATA " Gendarmerie                ",2,18,3,46,1,200,0,0,0,0,20,70,40,30,10,16,1,30,2,50
  '
aust5:
  DATA Bavarian 1851-1867,40,2,14
  DATA " Officers               ",1,2,3,4,5,6,7,8,9,4,5,6,3,4,5,6,5,6,8,9
  DATA " Leibregiment           ",1,1,3,20,6,160,0,0,0,0,50,100,15,60,9,22,1,40,2,60
  DATA " Musketiere             ",1,14,3,20,6,158,0,0,0,0,40,80,20,40,9,22,1,40,2,60
  DATA " Fusiliere              ",1,14,3,20,6,158,0,0,0,0,40,80,20,40,9,22,1,45,2,60
  DATA " Jager                  ",2,14,3,21,6,110,0,0,0,0,40,90,20,40,9,22,1,50,2,60
  DATA " Landwehr               ",1,3,3,20,6,150,0,0,0,0,30,80,30,30,10,22,1,30,2,60
  DATA " Landwehr Jager         ",2,3,3,21,6,100,0,0,0,0,30,90,30,30,10,22,1,40,2,60
  DATA " Landsturm              ",1,7,3,31,5,100,0,0,0,0,20,70,60,20,28,3,12,20,2,30
  DATA " Guard du Korps         ",7,1,3,47,4,148,0,0,0,1,50,100,15,60,8,137,8,30,2,60
  DATA " Kurassier              ",7,14,3,47,4,148,0,0,0,1,40,90,20,50,8,137,8,30,2,60
  DATA " Uhlans                 ",6,14,3,48,4,148,0,0,0,0,40,90,30,50,8,137,9,30,2,60
  DATA " Chevauleger            ",6,14,3,48,4,148,0,0,0,0,40,90,30,40,8,222,8,30,2,60
  DATA " Artillerie zu Fuss     ",9,14,3,61,2,40,4,0,0,0,40,80,20,10,12,21,2,40,2,9
  DATA " Artillerie zu Pferd    ",10,14,3,62,2,40,4,0,0,0,40,90,20,10,12,22,2,40,2,9
  '
aust6:
  DATA Wurttemburg 1852-1867,40,2,9
  DATA " Officer                  ",1,2,3,4,5,6,7,8,9,4,5,6,3,4,5,6,5,6,4,8
  DATA " Musketier Bataillon      ",1,14,3,5,4,200,0,0,0,0,40,80,20,40,9,148,1,40,2,60
  DATA " Jager Bataillon          ",2,14,3,6,4,200,0,0,0,0,40,90,20,40,9,148,1,50,2,60
  DATA " Landwehr                 ",1,3,3,5,4,200,0,0,0,0,30,80,30,30,10,148,1,30,2,60
  DATA " Landwehr Jager           ",2,3,3,6,4,150,0,0,0,0,30,80,30,30,10,148,1,40,2,60
  DATA " Reiter                   ",6,14,3,48,4,200,0,0,0,0,40,90,20,50,8,223,8,30,2,60
  DATA " Leichter Batterie        ",9,14,3,61,4,40,8,0,0,0,40,80,20,10,11,21,2,40,2,9
  DATA " Schwerer Batterie        ",9,14,3,61,3,40,6,0,0,0,40,80,20,10,11,22,2,40,2,9
  DATA " Kavallerie Batterie      ",10,14,3,62,4,40,8,0,0,0,40,90,20,10,11,21,2,40,2,9
  '
aust7:
  DATA Saxony 1852-1867,50,2,10
  DATA " Officers                ",1,2,3,4,5,6,7,8,9,4,5,6,3,4,5,6,5,6,7,8
  DATA " Grenadier               ",1,16,3,22,4,200,0,0,0,0,50,90,15,60,9,149,1,40,2,60
  DATA " Infanterie              ",1,14,3,22,4,200,0,0,0,0,40,80,20,50,9,149,1,40,2,60
  DATA " Jager                   ",2,14,3,23,4,200,0,0,0,0,40,80,20,50,9,149,1,50,2,60
  DATA " Landsturm               ",1,7,3,32,5,100,0,0,0,0,20,80,60,30,28,3,12,20,2,30
  DATA " Garde Reiter            ",7,1,3,45,5,160,0,0,0,0,60,100,10,70,8,224,8,30,2,60
  DATA " Reiter                  ",6,14,3,46,5,160,0,0,0,0,50,90,20,60,8,224,8,30,2,60
  DATA " Fuss Batterie           ",9,14,3,61,3,40,6,0,0,0,40,80,20,10,11,42,2,40,2,10
  DATA " Kavallerie Batterie     ",10,14,3,62,3,40,6,0,0,0,40,80,20,10,11,42,8,40,2,10
  DATA " Reserve Batterie        ",9,14,3,61,3,40,6,0,0,0,40,80,20,10,11,116,2,40,2,2
  '

SUB putem
 DEF SEG = SSEG(tdat$)
 BSAVE "c:\ecw\bandi3\armies.dat\austrian.arm", SADD(tdat$), LEN(tdat$)
END SUB

SUB test
OPEN "A:\armies.dat\austrian.arm" FOR INPUT AS #1
x% = LOF(1)
tdat$ = STRING$(x%, " ")
 DEF SEG = SSEG(tdat$)
 BLOAD "A:\armies.dat\austrian.arm", SADD(tdat$)
OPEN "A:\armies.nam\austrian.nam" FOR INPUT AS #2
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

