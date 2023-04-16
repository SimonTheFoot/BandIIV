OPTION BASE 1
DECLARE SUB test ()
DECLARE SUB putem ()
DECLARE SUB test2 ()
COMMON SHARED troopname$(), title$(), tdat$, troopdata%(), offset%, tx$
DIM troopname$(500), title$(15), tdat%(10, 3), troopdata%(500, 18)
OPEN "C:\ecw\bandi3\armies.nam\latino.nam" FOR OUTPUT AS #1
offset% = 1
tdat$ = ""
WRITE #1, " Latin American Armies ", "4"
FOR i% = 1 TO 4
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
latin1:
  DATA Paraguay 1860-1870 ,30,5,16
  DATA " Officers                  ",1,2,3,4,5,6,7,8,9,10,10,9,8,7,10,9,8,7,3,5
  DATA " Infanteria Escogido       ",1,16,3,18,6,140,0,0,0,0,45,95,20,40,9,135,1,25,5,50
  DATA " Infanteria Linea          ",1,14,3,18,6,125,0,0,0,0,40,90,25,40,9,1,1,25,5,50
  DATA " Infanteria de Marin       ",1,14,3,18,6,125,0,0,0,0,40,90,25,40,9,135,1,25,5,50
  DATA " Infanteria Ligera         ",2,14,3,19,6,125,0,0,0,0,40,90,25,45,9,3,1,30,5,60
  DATA " Marineros                 ",2,14,3,19,6,125,0,0,0,0,40,90,25,45,9,135,2,30,5,60
  DATA " Milicia Infanteria        ",1,7,3,31,8,100,0,50,0,0,20,70,50,30,10,21,14,20,5,30
  DATA " Guarania Guerreros        ",2,11,3,12,5,50,0,20,108,0,10,80,50,40,33,21,6,20,5,20
  DATA " Escoltar de Gobierno      ",6,16,3,44,2,125,0,0,0,0,40,95,20,50,9,159,8,20,5,50
  DATA " Dragenes de Escoltar      ",6,16,3,44,2,125,0,0,0,0,40,90,20,50,9,147,8,20,5,50
  DATA " Lanzeros                  ",6,14,3,44,3,100,0,25,0,0,40,90,30,50,9,2,9,20,5,20
  DATA " Milicia Caballeria        ",6,7,3,52,3,100,0,25,0,0,20,90,40,40,9,21,9,20,5,20
  DATA " Bateria Montada           ",10,14,3,62,3,45,6,0,0,0,40,90,30,10,11,38,2,30,5,7
  DATA " Bateria a Pie             ",9,14,3,61,3,45,6,0,0,0,40,90,30,10,11,2,2,30,5,2
  DATA " Batteria posicional       ",9,14,3,61,1,55,2,0,0,0,40,90,30,10,11,75,2,40,5,2
  DATA " Batteria reservada        ",9,14,3,61,3,55,6,0,0,0,40,90,30,10,11,128,2,40,5,2
  '
latin2:
  DATA Argentina 1864-1870,30,5,13
  DATA " Officers                  ",1,2,3,4,5,6,7,8,9,10,2,4,6,8,9,3,5,9,3,7
  DATA " Infanteria de Linea       ",1,2,3,18,6,100,0,0,0,0,40,85,40,50,9,10,1,30,5,100
  DATA " Infanteria de Linde       ",2,7,3,19,6,100,0,0,0,0,40,85,40,50,9,10,1,35,5,100
  DATA " Guardia Nacional          ",1,7,3,18,6,100,0,0,0,0,30,85,45,40,10,10,1,30,5,100
  DATA " Legiones Voluntarios      ",2,4,3,19,6,100,0,0,0,0,25,90,50,40,10,10,1,30,5,100
  DATA " Legion Paraguayano        ",2,4,3,19,6,100,0,0,0,0,35,90,40,40,10,10,1,30,5,100
  DATA " Infanteria de Milicia     ",1,7,3,18,6,100,0,0,0,0,30,80,50,20,46,10,2,30,5,50
  DATA " Caballeria de Escolta     ",7,16,3,44,4,100,0,0,0,0,40,90,40,40,8,47,8,20,5,50
  DATA " Dragenes                  ",7,2,3,44,4,100,0,0,0,0,30,85,40,40,8,44,8,20,5,50
  DATA " Lanzeros                  ",6,2,3,44,4,100,0,0,0,0,30,90,40,40,8,147,9,20,5,50
  DATA " Gauchos                   ",6,10,3,52,5,100,0,0,0,0,30,90,40,45,46,147,9,25,5,50
  DATA " Caballeria de Milicia     ",7,7,3,52,4,100,0,0,0,0,30,90,50,30,46,147,8,10,5,50
  DATA " Artileria Ligera          ",10,2,3,62,3,40,6,0,0,0,30,85,30,10,11,24,2,30,5,9
  '
latin3:
  DATA Brazil  1865-1872,30,5,14
  DATA " Officers                  ",1,2,3,4,5,6,7,8,9,10,10,9,8,7,10,9,8,7,3,5
  DATA " Infanteria Linea          ",1,2,3,3,8,100,0,0,0,0,30,70,40,30,9,15,1,25,31,60
  DATA " Infanteria Ligera         ",2,2,3,4,8,100,0,0,0,0,30,75,40,35,9,15,1,30,31,60
  DATA " Guardia Nacional          ",1,7,3,3,8,100,0,0,0,0,20,80,50,30,9,82,1,20,31,60
  DATA " Voluntarios da Patria     ",2,4,3,4,6,100,0,0,0,0,25,80,50,30,10,186,1,30,31,60
  DATA " Milicia                   ",1,7,3,31,8,100,0,0,0,0,20,60,60,20,46,3,10,15,31,60
  DATA " Dragenes                  ",6,2,3,43,4,100,0,0,0,0,30,85,40,40,8,47,8,20,31,60
  DATA " Lanzeros                  ",6,2,3,44,4,100,0,0,0,0,30,90,40,40,9,44,9,20,31,60
  DATA " Gauchos                   ",6,10,3,52,5,80,0,0,0,0,20,80,50,40,46,18,9,20,31,60
  DATA " Rio Grandese              ",6,10,3,52,5,80,0,0,0,0,20,80,50,40,46,18,9,20,31,60
  DATA " Milicia Caballeria        ",7,7,3,52,4,100,0,0,0,0,20,70,60,30,46,147,9,10,31,60
  DATA " Bateria a Pie             ",9,2,3,61,3,40,6,0,0,0,30,80,30,10,11,41,2,30,31,10
  DATA " Bateria montada           ",10,2,3,62,3,40,6,0,0,0,30,85,30,15,11,37,2,30,31,10
  DATA " Batteria posicion         ",9,14,3,61,3,55,6,0,0,0,40,90,30,15,11,47,2,30,31,10
  '
latin4:
  DATA Banda Oriental 1864-1870,30,5,11
  DATA " Officers                  ",1,2,3,4,5,6,7,8,9,10,10,9,8,7,10,9,8,7,5,7
  DATA " Fusileros                 ",1,2,3,18,6,120,0,0,0,0,30,80,40,40,9,10,1,25,5,60
  DATA " Guardia Nacional          ",2,2,3,19,6,120,0,0,0,0,30,85,40,45,9,10,1,30,5,60
  DATA " Voluntarios               ",2,4,3,18,5,100,0,0,0,0,25,90,50,40,10,10,1,30,5,60
  DATA " Milicia                   ",1,7,3,31,4,100,0,0,0,0,20,70,60,20,46,21,2,15,5,60
  DATA " Batalona Garribaldi       ",2,4,3,18,3,100,0,0,0,0,35,90,30,40,10,15,1,35,4,60
  DATA " Dragenes de Escolta       ",6,16,3,43,4,100,0,0,0,0,30,85,40,40,8,47,8,20,5,50
  DATA " Lanzeros                  ",6,2,3,52,4,100,0,0,0,0,30,90,40,40,8,147,9,20,5,30
  DATA " Gauchos                   ",6,10,3,52,5,100,0,0,0,0,10,90,50,50,46,147,9,20,5,30
  DATA " Milicia Caballeria        ",6,7,3,51,4,100,0,0,0,0,20,70,60,30,29,21,9,10,5,30
  DATA " Bateria del Parqu         ",9,2,3,62,3,40,6,0,0,0,30,85,30,15,11,15,2,30,5,1

  '
'
SUB putem
 DEF SEG = SSEG(tdat$)
 BSAVE "C:\ecw\bandi3\armies.dat\latino.arm", SADD(tdat$), LEN(tdat$)
END SUB

SUB test
OPEN "A:\armies.dat\latino.arm" FOR INPUT AS #1
x% = LOF(1)
tdat$ = STRING$(x%, " ")
 DEF SEG = SSEG(tdat$)
 BLOAD "A:\armies.dat\latino.arm", SADD(tdat$)
OPEN "A:\amies.nam\latino.nam" FOR INPUT AS #2
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

