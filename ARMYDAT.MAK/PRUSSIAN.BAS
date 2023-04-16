OPTION BASE 1
DECLARE SUB test ()
DECLARE SUB putem ()
DECLARE SUB test2 ()
COMMON SHARED troopname$(), title$(), tdat$, troopdata%(), offset%, tx$
DIM troopname$(500), title$(15), tdat%(10, 3), troopdata%(500, 18)
OPEN "C:\ecw\bandi3\armies.nam\german.nam" FOR OUTPUT AS #1
offset% = 1
tdat$ = ""
WRITE #1, " Prussian and German Armies ", "9"
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
'
prus1:
  DATA Prussian Line 1849-1862,50,2,15
  DATA " Officers                    ",1,2,3,4,5,6,7,8,3,4,5,6,3,4,5,6,5,6,9,9
  DATA " Grenadier Bataillon         ",1,16,3,5,4,201,0,0,0,0,50,90,20,55,8,81,1,50,2,60
  DATA " Musketier Bataillon         ",1,14,3,5,4,200,0,90,169,0,40,90,30,50,10,81,1,40,2,60
  DATA " Fusilier Bataillon          ",2,14,3,5,4,200,0,90,169,0,40,90,30,50,10,81,1,45,2,60
  DATA " Jager Bataillon             ",2,14,3,6,4,120,0,0,0,0,50,95,20,50,10,166,1,50,2,60
  DATA " Scharfschutzen              ",2,14,3,6,4,120,0,0,0,0,50,100,20,50,11,166,1,55,2,60
  DATA " Reserve Musketier Bataillon ",1,3,3,5,4,200,0,0,0,0,40,85,30,45,10,1,1,40,2,60
  DATA " Reserve Fusilier Bataillon  ",2,3,3,5,4,200,0,90,169,0,40,85,30,45,10,1,1,45,2,60
  DATA " Kurassiere                  ",7,14,3,47,4,150,0,95,173,1,50,100,25,60,8,18,8,15,2,60
  DATA " Dragoner                    ",7,14,3,47,4,150,0,95,173,0,50,95,30,55,8,18,8,20,2,60
  DATA " Husaren                     ",6,14,3,48,4,150,0,95,173,0,45,100,35,55,8,18,8,20,2,60
  DATA " Uhlanen                     ",6,14,3,48,4,150,0,0,0,0,45,95,35,50,8,18,9,20,2,60
  DATA " Schwerbewoffnete Batterie   ",9,2,3,61,4,60,8,2,118,0,40,90,20,10,11,116,2,45,2,2
  DATA " Leichtbewoffnete Batterie   ",9,2,3,61,4,40,8,2,117,0,50,90,25,10,11,115,2,45,2,2
  DATA " Kavallerie Batterie         ",10,2,3,62,4,45,8,2,117,0,50,100,25,10,11,114,2,45,2,2
  '
prus2:
  DATA Prussian Guard 1849-1862,60,2,12
  DATA " Officers                   ",1,2,3,4,5,6,7,8,3,4,5,6,3,4,5,6,5,6,9,9
  DATA " Garde Grenadiere           ",1,1,3,5,4,250,0,0,0,0,70,100,10,60,9,215,1,40,2,60
  DATA " Garde zu Fuss              ",1,1,3,5,4,250,0,0,0,0,70,100,10,60,9,215,1,40,2,60
  DATA " Garde Fuziliere            ",1,1,3,5,4,250,0,0,0,0,70,100,10,60,9,82,1,40,2,60
  DATA " Garde Jager                ",2,1,3,6,4,165,0,0,0,0,70,100,10,60,9,82,1,50,2,60
  DATA " Garde Landwehr             ",1,6,3,5,4,200,0,0,0,0,50,90,20,50,9,81,1,30,2,60
  DATA " Garde Kuirassier           ",7,1,3,47,4,150,0,0,0,1,60,110,15,70,8,137,8,30,2,30
  DATA " Garde Uhlan                ",6,1,3,48,4,150,0,50,137,0,60,100,20,60,8,166,9,30,2,30
  DATA " Garde Dragooner            ",7,1,3,47,4,150,0,0,0,0,60,100,15,60,8,166,8,30,2,30
  DATA " Garde Hussaren             ",6,1,3,48,4,150,0,50,137,0,60,110,20,65,8,166,8,30,2,30
  DATA " Garde Artillerie zu Fuss   ",9,1,3,61,3,40,6,0,0,0,70,100,10,10,11,116,2,50,2,2
  DATA " Garde Artillerie zu Pferd  ",10,1,3,62,2,40,4,0,0,0,70,100,10,10,11,41,2,50,2,10
  '
prus3:
  DATA Prussian Line 1862-1867,60,2,17
  DATA " Officers                 ",1,2,3,4,5,6,7,8,3,4,5,6,3,4,5,6,5,6,9,9
  DATA " Jager                    ",2,5,3,21,4,165,0,0,0,0,50,90,20,50,9,82,1,45,2,60
  DATA " Musketeer                ",1,5,3,20,4,250,0,0,0,0,50,90,20,50,9,215,1,40,2,60
  DATA " Fusileer                 ",1,5,3,20,4,250,0,0,0,0,50,90,20,50,9,215,1,40,2,60
  DATA " Kuirassier               ",7,5,3,57,4,150,0,0,0,1,50,100,25,60,8,137,8,30,2,30
  DATA " Dragoner                 ",7,5,3,57,4,150,0,0,0,0,50,90,25,50,8,166,8,30,2,30
  DATA " Hussaren                 ",6,5,3,58,4,150,0,50,137,0,40,100,30,60,8,166,8,30,2,30
  DATA " Uhlan                    ",6,5,3,58,4,150,0,50,137,0,40,90,30,50,8,166,9,30,2,30
  DATA " Artillerie zu Fuss       ",9,5,3,61,3,40,6,0,0,0,50,90,20,10,12,41,2,50,2,10
  DATA " Korpsartillerie          ",9,5,3,61,3,40,6,0,0,0,50,90,20,10,12,116,2,50,2,2
  DATA " Artillerie zu Pferde     ",10,5,3,62,2,40,4,0,0,0,50,100,20,10,12,41,2,50,2,10
  DATA " Landwehr Jager           ",2,6,3,21,4,160,0,0,0,0,40,90,30,40,10,18,1,40,2,60
  DATA " Landwehr                 ",1,6,3,20,4,200,0,0,0,0,40,90,30,40,10,15,1,30,2,60
  DATA " Landwehr Kuirassier      ",7,6,3,57,4,150,0,0,0,1,40,90,30,40,8,137,8,25,2,30
  DATA " Landwehr Dragoner        ",7,6,3,57,4,150,0,0,0,0,40,90,35,40,8,18,8,25,2,30
  DATA " Landwehr Husaren         ",6,6,3,58,4,150,0,0,0,0,40,90,35,50,8,137,8,25,2,30
  DATA " Landwehr Uhlan           ",6,6,3,58,4,150,0,0,0,0,40,90,35,40,8,137,9,25,2,30
  '
prus4:
  DATA Prussian Guard 1862-1867,60,2,12
  DATA " Officers                   ",1,2,3,4,5,6,7,8,3,4,5,6,3,4,5,6,5,6,9,9
  DATA " Garde Grenadiere           ",1,1,3,20,4,250,0,0,0,0,70,100,10,60,9,139,1,40,2,60
  DATA " Garde zu Fuss              ",1,1,3,20,4,250,0,0,0,0,70,100,10,60,9,139,1,40,2,60
  DATA " Garde Fuziliere            ",1,1,3,20,4,250,0,0,0,0,70,100,10,60,9,139,1,40,2,60
  DATA " Garde Jager                ",2,1,3,21,4,165,0,0,0,0,70,100,10,60,9,82,1,50,2,60
  DATA " Garde Landwehr             ",1,6,3,20,4,200,0,0,0,0,50,90,20,50,9,215,1,30,2,60
  DATA " Garde Kuirassier           ",7,1,3,57,4,150,0,0,0,1,60,110,15,70,8,137,8,30,2,30
  DATA " Garde Uhlan                ",6,1,3,58,4,150,0,50,137,0,60,100,20,60,8,82,9,30,2,30
  DATA " Garde Dragooner            ",7,1,3,57,4,150,0,0,0,0,60,100,15,60,8,82,8,30,2,30
  DATA " Garde Hussaren             ",6,1,3,58,4,150,0,50,137,0,60,110,20,65,8,82,8,30,2,30
  DATA " Garde Artillerie zu Fuss   ",9,1,3,61,3,40,6,0,0,0,70,100,10,10,11,41,2,50,2,10
  DATA " Garde Artillerie zu Pferd  ",10,1,3,62,2,40,4,0,0,0,70,100,10,10,11,41,2,50,2,10
  '
prus5:
  DATA Prussian Line 1867-1871,70,2,16
  DATA " Officers                 ",1,2,3,4,5,6,7,8,3,4,5,6,3,4,5,6,5,6,9,9
  DATA " Jager                    ",2,5,3,21,4,165,0,0,0,0,50,90,20,50,9,167,1,45,2,60
  DATA " Musketeer                ",1,5,3,20,4,250,0,0,0,0,50,90,20,50,9,139,1,40,2,60
  DATA " Fusileer                 ",1,5,3,20,4,250,0,0,0,0,50,90,20,50,9,139,1,40,2,60
  DATA " Kuirassier               ",7,5,3,57,4,150,0,0,0,1,50,100,25,60,8,137,8,30,2,30
  DATA " Dragoner                 ",7,5,3,58,4,150,0,0,0,0,50,90,25,50,8,82,8,30,2,30
  DATA " Hussaren                 ",6,5,3,58,4,150,0,0,0,0,40,100,30,60,8,49,8,30,2,30
  DATA " Uhlan                    ",6,5,3,58,4,150,0,50,137,0,40,90,30,50,8,82,9,30,2,30
  DATA " Artillerie zu Fuss       ",9,5,3,61,3,40,6,0,0,0,50,90,20,10,12,41,2,50,2,10
  DATA " Artillerie zu Pferde     ",10,5,3,62,3,40,6,0,0,0,50,100,20,10,12,41,2,50,2,10
  DATA " Korpsartillerie          ",9,5,3,61,3,40,6,0,0,0,50,90,20,10,12,42,2,50,2,10
  DATA " Landwehr Jager           ",2,6,3,21,4,160,0,0,0,0,40,90,30,40,10,139,1,40,2,60
  DATA " Landwehr                 ",1,6,3,20,4,200,0,0,0,0,40,90,30,40,10,215,1,30,2,60
  DATA " Landwehr Dragoner        ",7,6,3,57,4,150,0,0,0,0,40,90,35,40,8,166,8,25,2,30
  DATA " Landwehr Husaren         ",6,6,3,58,4,150,0,0,0,0,40,90,35,50,8,49,8,25,2,30
  DATA " Landwehr Uhlan           ",6,6,3,58,4,150,0,0,0,0,40,90,35,40,8,166,9,25,2,30
  '
prus6:
  DATA Prussian Guard 1867-1871,70,2,12
  DATA " Officers                   ",1,2,3,4,5,6,7,8,3,4,5,6,3,4,5,6,5,6,9,9
  DATA " Garde Grenadiere           ",1,1,3,20,4,250,0,0,0,0,70,100,10,60,9,139,1,40,2,60
  DATA " Garde zu Fuss              ",1,1,3,20,4,250,0,0,0,0,70,100,10,60,9,139,1,40,2,60
  DATA " Garde Fuziliere            ",1,1,3,20,4,250,0,0,0,0,70,100,10,60,9,139,1,40,2,60
  DATA " Garde Jager                ",2,1,3,21,4,165,0,0,0,0,70,100,10,60,9,82,1,50,2,60
  DATA " Garde Landwehr             ",1,6,3,20,4,200,0,0,0,0,50,90,20,50,9,215,1,30,2,60
  DATA " Garde Kuirassier           ",7,1,3,57,4,150,0,0,0,1,60,110,15,70,8,137,8,30,2,30
  DATA " Garde Uhlan                ",6,1,3,58,4,150,0,0,0,0,60,100,20,60,8,49,9,30,2,30
  DATA " Garde Dragooner            ",7,1,3,57,4,150,0,0,0,0,60,100,15,60,8,82,8,30,2,30
  DATA " Garde Hussaren             ",6,1,3,58,4,150,0,0,0,0,60,110,20,65,8,49,8,30,2,30
  DATA " Garde Artillerie zu Fuss   ",9,1,3,61,3,40,6,0,0,0,70,100,10,10,11,41,2,50,2,10
  DATA " Garde Artillerie zu Pferd  ",10,1,3,62,3,40,6,0,0,0,70,100,10,10,11,41,2,50,2,10
  '
prus7:
  DATA Bavarian 1867-1871,40,2,14
  DATA " Officers               ",1,2,3,4,5,6,7,8,9,4,5,6,3,4,5,6,5,6,8,9
  DATA " Leibregiment           ",1,1,3,20,4,250,0,0,0,0,50,100,15,60,9,14,1,40,2,60
  DATA " Musketiere             ",1,14,3,20,4,250,0,0,0,0,40,80,20,40,9,14,1,40,2,60
  DATA " Fusiliere              ",1,14,3,20,4,250,0,0,0,0,40,80,20,40,9,14,1,45,2,60
  DATA " Jager                  ",2,14,3,21,4,250,0,0,0,0,40,90,20,40,9,14,1,50,2,60
  DATA " Landwehr               ",1,3,3,20,4,200,0,0,0,0,30,80,30,30,10,22,1,30,2,60
  DATA " Landwehr Jager         ",2,3,3,21,4,125,0,0,0,0,30,90,30,30,10,22,1,40,2,60
  DATA " Landsturm              ",1,7,3,32,5,100,0,0,0,0,20,70,60,20,28,22,12,20,2,30
  DATA " Guard du Korps         ",7,1,3,57,4,145,0,0,0,1,50,100,15,60,8,137,8,30,2,60
  DATA " Kurassier              ",7,14,3,57,4,145,0,0,0,1,40,90,20,50,8,137,8,30,2,60
  DATA " Uhlans                 ",6,14,3,58,4,145,0,0,0,0,40,90,30,50,8,82,9,30,2,60
  DATA " Chevauleger            ",6,14,3,58,4,145,0,0,0,0,40,90,30,40,8,82,8,30,2,60
  DATA " Artillerie zu Fuss     ",9,14,3,61,3,40,6,0,0,0,40,80,20,10,12,41,2,40,2,10
  DATA " Artillerie zu Pferd    ",10,14,3,62,3,40,6,0,0,0,40,90,20,10,12,41,2,40,2,10
  '
prus8:
  DATA Wurttemburg 1867-1871,40,2,10
  DATA " Officer                  ",1,2,3,4,5,6,7,8,9,4,5,6,3,4,5,6,5,6,4,8
  DATA " Infanterie               ",1,14,3,20,4,250,0,0,0,0,40,80,20,40,9,120,1,40,2,60
  DATA " Jager                    ",2,14,3,21,4,250,0,0,0,0,40,90,20,40,9,120,1,50,2,60
  DATA " Landwehr                 ",1,3,3,20,4,200,0,0,0,0,30,80,30,30,10,148,1,30,2,60
  DATA " Landwehr Jager           ",2,3,3,21,4,150,0,0,0,0,30,80,30,30,10,120,1,40,2,60
  DATA " Garde zu Pferde          ",6,1,3,48,1,150,0,0,0,0,50,100,20,60,8,82,8,30,2,60
  DATA " Reiter                   ",6,14,3,48,4,150,0,0,0,0,40,90,20,50,8,82,8,30,2,60
  DATA " Fuss Batterie            ",9,14,3,61,3,40,6,0,0,0,40,80,20,10,11,41,2,40,2,10
  DATA " Schwerer Batterie        ",9,14,3,61,3,40,6,0,0,0,40,80,20,10,11,42,2,40,2,10
  DATA " Kavallerie Batterie      ",10,14,3,62,3,40,6,0,0,0,40,90,20,10,11,41,2,40,2,10
  '
prus9:
  DATA Saxony 1868 - 1871,50,2,14
  DATA " Officers                ",1,2,3,4,5,6,7,8,9,4,5,6,3,4,5,6,5,6,7,8
  DATA " Grenadier               ",1,16,3,20,4,250,0,0,0,0,50,90,15,60,9,121,1,40,2,60
  DATA " Infanterie              ",1,14,3,20,4,250,0,0,0,0,40,80,20,50,9,121,1,40,2,60
  DATA " Fusilier                ",1,14,3,20,4,250,0,0,0,0,40,80,20,50,9,121,1,45,2,60
  DATA " Jager                   ",2,14,3,21,4,200,0,0,0,0,40,80,20,50,9,121,1,50,2,60
  DATA " Landwehr                ",1,3,3,20,4,200,0,0,0,0,30,80,30,30,10,166,1,30,2,60
  DATA " Landwehr Jager          ",2,3,3,21,4,200,0,0,0,0,30,80,30,30,10,166,1,40,2,60
  DATA " Landsturm               ",1,7,3,32,5,100,0,0,0,0,20,80,60,30,28,81,12,20,2,30
  DATA " Garde Reiter            ",7,1,3,57,4,150,0,0,0,0,60,100,10,70,8,82,8,30,2,60
  DATA " Reiter                  ",6,14,3,58,4,150,0,0,0,0,50,90,20,60,8,82,8,30,2,60
  DATA " Uhlan                   ",6,14,3,58,4,150,0,0,0,0,40,90,30,50,8,82,9,30,2,60
  DATA " Husaren                 ",6,14,3,58,4,150,0,0,0,0,40,90,30,50,8,82,8,30,2,60
  DATA " Fuss Batterie           ",9,14,3,61,3,40,6,0,0,0,40,80,20,10,11,41,2,40,2,10
  DATA " Kavallerie Batterie     ",10,14,3,62,3,40,6,0,0,0,40,80,20,10,11,41,8,40,2,10
  '

SUB putem
 DEF SEG = SSEG(tdat$)
 BSAVE "C:\ecw\bandi3\armies.dat\german.arm", SADD(tdat$), LEN(tdat$)
END SUB

SUB test
OPEN "A:\armies.dat\german.arm" FOR INPUT AS #1
x% = LOF(1)
tdat$ = STRING$(x%, " ")
 DEF SEG = SSEG(tdat$)
 BLOAD "A:\armies.dat\german.arm", SADD(tdat$)
OPEN "A:\armies.nam\german.nam" FOR INPUT AS #2
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

