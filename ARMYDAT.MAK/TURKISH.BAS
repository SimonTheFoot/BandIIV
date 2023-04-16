OPTION BASE 1
DECLARE SUB test ()
DECLARE SUB putem ()
DECLARE SUB test2 ()
COMMON SHARED troopname$(), title$(), tdat$, troopdata%(), offset%, tx$
DIM troopname$(500), title$(15), tdat%(10, 3), troopdata%(500, 18)
OPEN "C:\ecw\bandi3\armies.nam\turkish.nam" FOR OUTPUT AS #1
offset% = 1
tdat$ = ""
WRITE #1, " Armies of the Middle East ", "6"
FOR i% = 1 TO 6
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
turk1:
  DATA Ottoman Turks 1852-1855,30,10,16
  DATA " Officers                 ",1,2,3,4,5,5,6,6,7,7,8,8,9,9,9,10,10,10,3,5
  DATA " Nizam Infantry           ",1,2,3,3,6,135,0,75,10,0,35,85,30,45,9,3,1,25,10,60
  DATA " Chasseurs                ",2,2,3,19,6,135,0,0,0,0,40,90,30,45,10,10,1,30,10,60
  DATA " Redif Infantry           ",1,3,3,3,6,135,0,0,0,0,30,80,30,40,10,3,1,25,10,60
  DATA " Mustafiz                 ",1,10,3,3,6,135,0,0,0,0,20,70,40,40,10,1,1,25,10,60
  DATA " Bashi Bazouks            ",2,7,3,11,5,100,0,90,26,0,20,70,60,30,33,24,3,20,10,40
  DATA " Albanian Arnauts         ",2,10,3,11,8,100,0,80,184,0,25,95,40,55,11,182,13,30,10,50
  DATA " Druzes Levents           ",2,10,3,11,8,100,0,90,26,0,20,95,45,55,11,24,3,20,10,50
  DATA " Lancers                  ",6,2,3,44,4,120,0,50,98,0,30,80,40,40,10,147,9,20,10,40
  DATA " Dragoons                 ",6,2,3,43,4,120,0,0,0,0,30,80,40,40,10,147,8,20,10,40
  DATA " Circassian Hamadiye      ",6,11,3,52,4,100,0,0,0,0,20,90,50,40,33,24,18,20,10,40
  DATA " Kurdish Hamadiye         ",6,11,3,52,3,100,0,0,0,0,10,80,40,50,33,24,9,20,10,40
  DATA " Horse Battery            ",10,2,3,62,3,40,6,0,0,0,40,80,30,10,11,109,2,30,10,2
  DATA " Mountain Battery         ",11,2,3,64,2,30,4,0,0,0,40,80,30,10,11,102,2,30,10,2
  DATA " Light Battery            ",9,2,3,61,3,40,6,0,0,0,40,80,30,10,11,110,2,30,10,2
  DATA " Heavy Battery            ",12,2,3,61,3,40,6,0,0,0,40,80,30,10,11,112,2,30,10,2
  '
turk2:
  DATA Ottoman Turks 1855-1856,30,10,16
  DATA " Officers                 ",1,2,3,4,5,5,6,6,7,7,8,8,9,9,9,10,10,10,3,5
  DATA " Nizam Infantry           ",1,2,3,3,6,135,0,0,0,0,35,85,30,45,9,10,1,25,10,60
  DATA " Chasseurs                ",2,2,3,4,6,135,0,0,0,0,40,90,30,45,10,10,1,30,10,60
  DATA " Redif Infantry           ",1,3,3,3,6,135,0,0,0,0,30,80,30,40,10,3,1,25,10,60
  DATA " Mustafiz                 ",1,10,3,3,6,135,0,0,0,0,20,70,40,40,10,1,1,25,10,60
  DATA " Bashi Bazouks            ",2,7,3,12,5,100,0,80,26,0,20,70,60,30,33,24,3,20,10,40
  DATA " Albanian Arnauts         ",2,10,3,11,8,100,0,80,184,0,25,95,40,55,11,182,13,30,10,50
  DATA " Druzes Levents           ",2,10,3,11,8,100,0,90,26,0,20,95,45,55,11,24,3,20,10,50
  DATA " Lancers                  ",6,2,3,44,4,120,0,50,98,0,30,80,40,40,10,147,9,20,10,40
  DATA " Dragoons                 ",6,2,3,43,4,120,0,0,0,0,30,80,40,40,10,147,8,20,10,40
  DATA " Circassian Hamadiye      ",6,11,3,52,4,100,0,0,0,0,20,90,50,40,33,24,18,20,10,40
  DATA " Kurdish Hamadiye         ",6,11,3,52,3,100,0,0,0,0,10,80,40,50,33,24,9,20,10,40
  DATA " Horse Battery            ",10,2,3,62,3,40,6,0,0,0,40,80,30,10,11,109,2,30,10,2
  DATA " Mountain Battery         ",11,2,3,64,2,30,4,0,0,0,40,80,30,10,11,102,2,30,10,2
  DATA " Light Battery            ",9,2,3,61,3,40,6,0,0,0,40,80,30,10,11,110,2,30,10,2
  DATA " Heavy Battery            ",12,2,3,61,3,40,6,0,0,0,40,80,30,10,11,112,2,30,10,2
  '
turk3:
  DATA Ottoman Turks 1857-1870,30,10,16
  DATA " Officers                 ",1,2,3,4,5,5,6,6,7,7,8,8,9,9,9,10,10,10,3,5
  DATA " Nizam Infantry           ",1,2,3,17,8,100,0,0,0,0,35,85,30,45,9,15,1,25,10,60
  DATA " Chasseurs                ",2,16,3,17,8,100,0,0,0,0,40,90,30,45,10,15,1,30,10,60
  DATA " Redif Infantry           ",1,3,3,17,8,100,0,0,0,0,30,80,30,40,10,3,1,25,10,60
  DATA " Mustafiz                 ",1,10,3,17,8,100,0,0,0,0,20,70,40,40,10,1,1,25,10,60
  DATA " Bashi Bazouks            ",2,7,3,12,3,100,0,80,10,0,20,70,60,30,33,26,3,20,10,40
  DATA " Albanian Arnauts         ",2,10,3,11,4,100,0,70,10,0,25,95,40,55,11,184,13,30,10,50
  DATA " Druzes Levents           ",2,10,3,11,5,100,0,90,26,0,20,95,45,55,11,24,3,20,10,50
  DATA " Lancers                  ",6,2,3,44,4,120,0,50,98,0,30,80,40,40,10,147,9,20,10,40
  DATA " Dragoons                 ",6,2,3,43,4,120,0,0,0,0,30,80,40,40,10,147,8,20,10,40
  DATA " Circassian Hamadiye      ",6,11,3,52,4,100,0,0,0,0,20,90,50,40,33,24,18,20,10,40
  DATA " Kurdish Hamadiye         ",6,11,3,52,3,100,0,0,0,0,10,80,40,50,33,24,9,20,10,40
  DATA " Horse Battery            ",10,2,3,62,3,40,6,0,0,0,40,80,30,10,11,41,2,30,10,2
  DATA " Mountain Battery         ",11,2,3,64,2,30,4,0,0,0,40,80,30,10,11,32,2,30,10,2
  DATA " Light Battery            ",9,2,3,61,3,40,6,0,0,0,40,80,30,10,11,41,2,30,10,2
  DATA " Heavy Battery            ",12,2,3,61,3,40,6,0,0,0,40,80,30,10,11,42,2,30,10,2
  '
turk4:
  DATA Ottoman Turks 1870-1876,30,10,17
  DATA " Officers                 ",1,2,3,4,5,5,6,6,7,7,8,8,9,9,9,10,10,10,3,5
  DATA " Nizam Infantry           ",1,2,3,17,8,100,0,0,0,0,35,85,30,45,9,70,1,25,10,60
  DATA " Chasseurs                ",2,16,3,17,8,100,0,0,0,0,40,90,30,45,10,70,1,30,10,60
  DATA " Redif Infantry           ",1,3,3,17,8,100,0,0,0,0,30,80,30,40,10,15,1,25,10,60
  DATA " Mustafiz                 ",1,10,3,17,8,100,0,0,0,0,20,70,40,40,10,1,1,25,10,60
  DATA " Bashi Bazouks            ",2,7,3,12,3,100,0,80,92,0,20,70,60,30,33,26,3,20,10,40
  DATA " Albanian Arnauts         ",2,10,3,11,4,100,0,70,15,0,25,95,40,55,11,184,13,30,10,50
  DATA " Druzes Levents           ",2,10,3,11,5,100,0,90,26,0,20,95,45,55,11,24,3,20,10,50
  DATA " Lancers                  ",6,2,3,44,4,120,0,50,98,0,30,80,40,40,10,92,9,20,10,40
  DATA " Dragoons                 ",6,2,3,43,4,120,0,0,0,0,30,80,40,40,10,92,8,20,10,40
  DATA " Circassian Hamadiye      ",6,11,3,52,4,100,0,60,92,0,20,90,50,40,33,24,18,20,10,40
  DATA " Kurdish Hamadiye         ",6,11,3,52,3,100,0,70,26,0,10,80,40,50,33,24,9,20,10,40
  DATA " Horse Battery            ",10,2,3,62,3,40,6,0,0,0,40,80,30,10,11,41,2,30,10,2
  DATA " Mountain Battery         ",11,2,3,64,2,30,4,0,0,0,40,80,30,10,11,34,2,30,10,2
  DATA " Light Battery            ",9,2,3,61,3,40,6,0,0,0,40,80,30,10,11,41,2,30,10,2
  DATA " Heavy Battery            ",12,2,3,61,3,40,6,0,0,0,40,80,30,10,11,42,2,30,10,2
  DATA " Repeater Battery         ",20,14,3,62,1,15,2,0,0,0,50,90,20,10,11,4,13,30,10,11
  '
turk5:
  DATA Ottoman Turks 1876-1884,30,10,17
  DATA " Officers                 ",1,2,3,4,5,5,6,6,7,7,8,8,9,9,9,10,10,10,3,5
  DATA " Nizam Infantry           ",1,2,3,17,8,100,0,0,0,0,35,85,30,45,9,73,1,25,10,60
  DATA " Chasseurs                ",2,16,3,17,8,100,0,0,0,0,40,90,30,45,10,73,1,30,10,60
  DATA " Redif Infantry           ",1,3,3,17,8,100,0,0,0,0,30,80,30,40,10,70,1,25,10,60
  DATA " Mustafiz                 ",1,10,3,17,8,100,0,0,0,0,20,70,40,40,10,73,1,25,10,60
  DATA " Bashi Bazouks            ",2,7,3,12,3,100,0,70,92,0,20,70,60,30,33,74,3,20,10,40
  DATA " Albanian Arnauts         ",2,10,3,11,4,100,0,70,93,0,25,95,40,55,11,74,13,30,10,50
  DATA " Druzes Levents           ",2,10,3,11,5,100,0,0,0,0,20,95,45,55,11,74,3,20,10,50
  DATA " Lancers                  ",6,2,3,44,4,120,0,50,98,0,30,80,40,40,10,202,9,20,10,40
  DATA " Dragoons                 ",6,2,3,43,4,120,0,0,0,0,30,80,40,40,10,202,8,20,10,40
  DATA " Circassian Hamadiye      ",6,11,3,52,4,100,0,0,0,0,20,90,50,40,33,92,18,20,10,40
  DATA " Kurdish Hamadiye         ",6,11,3,52,3,100,0,0,0,0,10,80,40,50,33,74,9,20,10,40
  DATA " Horse Battery            ",10,2,3,62,3,40,6,0,0,0,40,80,30,10,11,41,2,30,10,2
  DATA " Mountain Battery         ",11,2,3,64,2,30,4,0,0,0,40,80,30,10,11,34,2,30,10,2
  DATA " Light Battery            ",9,2,3,61,3,40,6,0,0,0,40,80,30,10,11,41,2,30,10,2
  DATA " Heavy Battery            ",12,2,3,61,3,40,6,0,0,0,40,80,30,10,11,42,2,30,10,2
  DATA " Repeater Battery         ",20,14,3,62,1,15,2,0,0,0,50,90,20,10,11,5,13,30,10,11
  '
turk6:
  DATA Recalcitrant Turks 1878-1882,30,10,12
  DATA " Officers                 ",1,2,3,4,5,5,6,6,7,7,8,8,9,9,9,10,10,10,3,5
  DATA " Bosnian Regulars         ",1,4,3,17,6,100,0,0,0,0,30,80,30,40,10,73,1,25,10,60
  DATA " Bosnian Bashi Bazouks    ",2,7,3,12,3,100,0,70,92,0,20,70,60,30,33,74,3,20,10,40
  DATA " Albanian Arnauts         ",2,20,3,11,4,100,0,70,93,0,25,95,40,55,11,74,13,30,10,50
  DATA " Pomack Regulars          ",1,4,3,26,8,100,0,0,0,0,30,80,30,40,15,202,2,25,10,60
  DATA " Pomack Bashi Bazouks     ",2,7,3,12,3,100,0,70,92,0,20,80,60,30,33,74,3,20,10,40
  DATA " Bosnian Horse            ",6,7,3,52,3,100,0,0,0,0,20,90,50,40,33,92,18,20,10,40
  DATA " Pomack Horse             ",6,4,3,52,1,100,0,0,0,0,20,90,50,40,33,92,18,20,10,40
  DATA " Circassian Mercenaries   ",6,20,3,52,4,100,0,0,0,0,20,90,50,40,33,92,18,20,10,40
  DATA " Mountain Battery         ",11,4,3,64,1,30,2,0,0,0,40,80,30,10,11,34,2,30,26,2
  DATA " Foot Battery             ",9,4,3,61,1,40,2,0,0,0,40,80,30,10,11,41,2,30,1,2
  DATA " Repeater Battery         ",20,14,3,62,1,15,2,0,0,0,50,90,20,10,11,5,13,30,1,11
  '
'
'

SUB putem
 DEF SEG = SSEG(tdat$)
 BSAVE "C:\ecw\bandi3\armies.dat\turkish.arm", SADD(tdat$), LEN(tdat$)
END SUB

SUB test
OPEN "A:\armies.dat\turkish.arm" FOR INPUT AS #1
x% = LOF(1)
tdat$ = STRING$(x%, " ")
 DEF SEG = SSEG(tdat$)
 BLOAD "A:\armies.dat\turkish.arm", SADD(tdat$)
OPEN "A:\armies.nam\turkish.nam" FOR INPUT AS #2
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

