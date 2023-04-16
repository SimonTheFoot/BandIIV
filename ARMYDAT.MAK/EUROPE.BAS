OPTION BASE 1
DECLARE SUB test ()
DECLARE SUB putem ()
DECLARE SUB test2 ()
COMMON SHARED troopname$(), title$(), tdat$, troopdata%(), offset%, tx$
DIM troopname$(500), title$(15), tdat%(10, 3), troopdata%(500, 18)
OPEN "C:\ecw\bandi3\armies.nam\europe.nam" FOR OUTPUT AS #1
offset% = 1
tdat$ = ""
WRITE #1, " Other European Armies ", "5"
FOR i% = 1 TO 5
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
euro1:
  DATA Carlistas 1830-1838,50,5,12
  DATA " Officers                    ",1,2,3,4,5,6,7,8,9,10,2,4,6,8,1,3,5,9,5,7
  DATA " Regulares                   ",1,2,3,3,8,100,0,0,0,0,50,90,30,50,9,1,1,40,5,60
  DATA " Voluntarios                 ",2,4,3,4,5,100,0,0,0,0,40,90,40,50,10,1,1,30,5,60
  DATA " Miqueletes                  ",2,10,3,31,5,80,0,90,180,0,30,90,40,40,46,178,2,30,5,60
  DATA " Milicia                     ",1,7,3,3,5,100,0,0,0,0,20,70,60,20,10,1,2,10,5,60
  DATA " Guerilleros                 ",2,10,3,31,1,100,0,0,0,0,20,90,60,60,33,179,2,40,5,60
  DATA " Desertores Extranjeros      ",2,15,3,3,8,100,0,0,0,0,40,80,30,40,10,1,1,40,3,60
  DATA " Guiares                     ",6,1,3,52,4,80,0,0,0,0,50,95,30,60,8,2,8,30,5,60
  DATA " Lanzeros                    ",6,2,3,52,4,80,0,0,0,0,50,90,35,60,8,2,8,20,5,60
  DATA " Batteria a pie              ",9,2,3,61,3,40,6,1,113,0,50,90,30,10,11,111,2,40,5,2
  DATA " Bateria Montada             ",10,14,3,62,3,45,6,2,113,0,40,95,30,10,11,109,2,40,5,2
  DATA " Batteria Montana            ",11,2,3,64,1,20,2,0,0,0,50,90,30,10,11,102,2,40,5,2
  '
euro2:
  DATA Cristinos 1830-1840,30,5,16
  DATA " Officers                    ",1,2,3,4,5,6,7,8,9,10,10,9,8,7,10,9,8,7,5,6
  DATA " Guardia a pie               ",1,1,3,3,8,100,0,0,0,0,40,90,20,50,8,1,1,40,5,60
  DATA " Guardia a Caballo           ",7,1,3,43,4,120,0,0,0,0,40,95,30,55,8,2,8,20,5,60
  DATA " Fusileros                   ",1,14,3,3,8,90,0,0,0,0,30,80,40,40,9,1,1,30,5,60
  DATA " Cazadores                   ",2,14,3,4,8,90,0,0,0,0,30,80,40,40,9,1,1,35,5,60
  DATA " Guarneceres                 ",1,8,3,3,5,100,0,0,0,0,30,70,40,30,10,1,1,25,5,60
  DATA " Milicia Provincial          ",1,7,3,3,8,90,0,0,0,0,30,80,45,35,10,1,1,25,5,30
  DATA " Milicia Urbana              ",1,7,3,3,5,100,0,0,0,0,20,70,60,20,10,1,1,10,5,60
  DATA " Husaros                     ",6,14,3,44,4,120,0,0,0,0,30,90,40,50,8,2,8,20,5,30
  DATA " Lanzeros                    ",6,14,3,44,4,120,0,0,0,0,30,90,40,50,8,2,9,20,5,30
  DATA " Dragenes                    ",7,14,3,43,4,120,0,0,0,0,30,90,40,50,8,2,8,25,5,60
  DATA " Coraceros                   ",7,14,3,43,4,120,0,0,0,0,35,95,40,55,8,2,8,20,5,30
  DATA " Batteria a pie              ",9,2,3,61,3,40,6,1,113,0,40,90,30,10,11,111,2,40,5,2
  DATA " Bateria Montada             ",10,14,3,62,3,45,6,2,113,0,30,95,30,10,11,110,2,40,5,2
  DATA " Batteria Montana            ",11,2,3,64,1,20,2,0,0,0,40,90,30,10,11,102,2,40,5,2
  DATA " Batteria Obusier            ",11,2,3,61,1,20,2,0,0,0,40,90,30,10,11,67,2,40,5,2
  '
euro3:
  DATA British Legion 1830-1838,50,1,12
  DATA " Officers                    ",1,2,3,4,5,6,7,8,9,10,2,3,5,7,9,2,4,6,3,4
  DATA " Grenadiers                  ",1,16,3,2,6,80,0,0,0,0,50,90,30,50,10,1,1,40,1,60
  DATA " Irish Light Infantry        ",2,2,3,2,8,80,0,0,0,0,40,90,35,50,9,1,1,50,26,60
  DATA " Irish Line Infantry         ",1,2,3,1,8,80,0,0,0,0,40,90,35,50,9,1,1,40,26,60
  DATA " Highlanders                 ",2,2,3,2,8,80,0,0,0,0,40,90,35,55,9,1,1,40,24,60
  DATA " English Fusiliers           ",2,2,3,2,8,80,0,0,0,0,45,90,35,45,9,1,1,50,1,60
  DATA " English Line                ",1,2,3,1,8,80,0,0,0,0,45,90,35,45,9,1,1,40,1,60
  DATA " Rifles                      ",2,2,3,2,8,80,0,0,0,0,50,90,30,50,9,5,1,50,1,60
  DATA " Lancers                     ",7,2,3,42,4,120,0,0,0,0,50,90,35,60,8,2,9,25,1,30
  DATA " Royal Marines               ",2,2,3,2,4,80,0,0,0,0,60,90,15,60,10,1,1,60,1,60
  DATA " Royal Navy Sailors          ",2,4,3,31,5,100,0,50,115,0,40,90,30,65,12,1,19,30,1,60
  DATA " Royal Artillery             ",9,2,3,61,1,40,2,0,0,0,60,90,10,10,11,5,2,60,1,3
  '
euro4:
  DATA Netherlands 1830-1832,40,22,18
  DATA " Officers                ",1,2,3,4,5,6,7,8,9,4,5,6,3,4,5,6,5,6,6,7
  DATA " Voetgarde Musketiere    ",1,1,3,3,8,105,0,0,0,0,50,90,15,55,8,1,1,40,22,60
  DATA " Voetgarde Fuseliere     ",2,1,3,4,8,105,0,0,0,0,55,95,15,55,8,1,1,45,22,60
  DATA " Grenadiere              ",1,1,3,3,8,105,0,0,0,0,50,95,20,55,8,1,1,40,22,60
  DATA " Voet Bataljon           ",1,14,3,3,8,85,0,0,0,0,40,85,25,45,9,1,1,40,22,60
  DATA " Fuselier Bataljon       ",2,14,3,4,8,85,0,0,0,0,40,90,25,45,9,1,1,45,22,60
  DATA " Wallonische Bataljon    ",1,14,6,3,8,85,0,0,0,0,30,80,45,45,9,1,1,40,3,60
  DATA " Wallonische Fuseliere   ",2,14,6,4,8,85,0,0,0,0,30,80,45,45,9,1,1,45,3,60
  DATA " Schutterijen            ",1,7,3,3,8,100,0,0,0,0,30,80,40,30,10,1,1,20,22,60
  DATA " Voluntier Jager         ",2,4,3,4,8,85,0,0,0,0,30,90,30,45,9,169,1,45,22,60
  DATA " Garnizoen Bataljon      ",1,14,3,3,8,85,0,0,0,0,30,80,35,45,9,1,1,40,22,60
  DATA " Garde Riterij           ",7,1,3,43,4,120,0,0,0,0,50,100,20,60,8,2,8,20,22,60
  DATA " Carabiniere             ",7,16,3,43,4,100,0,0,0,0,45,90,25,55,8,2,8,20,22,60
  DATA " Kurassiere              ",7,16,3,43,4,100,0,0,0,1,45,90,25,55,8,2,8,20,22,60
  DATA " Dragonder               ",6,14,3,44,4,100,0,0,0,0,40,85,30,50,8,2,8,20,22,60
  DATA " Huzaare                 ",6,14,3,44,4,100,0,0,0,0,40,90,30,55,8,2,8,20,22,60
  DATA " Voet Batterij           ",9,14,3,61,4,30,8,2,10,0,40,80,25,10,11,5,2,40,22,2
  DATA " Paarde Baterij          ",10,14,3,62,3,30,6,2,10,0,40,85,25,10,11,2,2,40,22,2
  '
euro5:
  DATA Belgians 1830,40,3,13
  DATA " Officers                ",1,2,3,4,5,6,7,8,9,10,5,6,7,8,9,10,5,6,7,8
  DATA " Infantrie de Ligne      ",1,4,3,3,8,85,0,0,0,0,30,80,30,45,9,1,1,40,3,40
  DATA " Tirailleurs             ",2,4,3,4,8,85,0,0,0,0,30,80,30,45,9,1,1,45,3,40
  DATA " Garde Bourgoise         ",1,7,3,3,8,100,0,0,0,0,20,90,40,40,10,1,1,25,3,60
  DATA " Milices Genereaux       ",1,7,5,31,5,100,0,50,2,0,20,80,50,30,28,1,12,20,3,30
  DATA " Les 'Moines'            ",1,4,7,31,1,100,0,50,2,0,20,110,30,30,29,1,12,20,3,30
  DATA " Corps Libres Belge      ",2,4,5,4,8,85,0,0,0,0,30,90,40,45,9,1,1,35,3,40
  DATA " Corps Libres Francaise  ",2,4,3,4,8,85,0,0,0,0,30,90,40,45,9,1,1,40,3,40
  DATA " Carabiniers             ",7,16,3,43,4,100,0,0,0,0,45,90,25,55,8,2,8,20,3,30
  DATA " Cheveauxlegeres         ",6,4,3,44,4,100,0,0,0,0,40,85,30,50,8,2,8,20,3,30
  DATA " Husards                 ",6,4,3,44,4,100,0,0,0,0,40,90,30,55,8,2,8,20,3,30
  DATA " Batterie d'Armee        ",9,4,3,61,3,30,6,2,10,0,40,80,25,10,11,5,2,40,3,2
  DATA " Batterie de la Garde    ",9,4,4,61,1,30,2,0,0,0,30,85,35,10,11,2,2,40,3,1
  '
  '

SUB putem
 DEF SEG = SSEG(tdat$)
 BSAVE "C:\ecw\bandi3\armies.dat\europe.arm", SADD(tdat$), LEN(tdat$)
END SUB

SUB test
OPEN "A:\armies.dat\europe.arm" FOR INPUT AS #1
x% = LOF(1)
tdat$ = STRING$(x%, " ")
 DEF SEG = SSEG(tdat$)
 BLOAD "A:\armies.dat\europe.arm", SADD(tdat$)
OPEN "A:\armies.nam\europe.nam" FOR INPUT AS #2
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

