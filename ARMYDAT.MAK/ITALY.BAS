OPTION BASE 1
DECLARE SUB test ()
DECLARE SUB putem ()
DECLARE SUB test2 ()
COMMON SHARED troopname$(), title$(), tdat$, troopdata%(), offset%, tx$
DIM troopname$(500), title$(15), tdat%(10, 3), troopdata%(500, 18)
OPEN "C:\ecw\bandi3\armies.nam\italy.nam" FOR OUTPUT AS #1
offset% = 1
tdat$ = ""
WRITE #1, " Italian Armies ", "9"
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
italy1:
  DATA Piedmont-Sardinia 1840-1856,40,4,11
  DATA " Officers               ",1,2,3,4,5,6,7,8,9,4,5,6,4,5,6,3,4,5,1,9
  DATA " Granatieri             ",1,16,3,3,4,160,0,0,0,0,50,100,20,50,9,3,1,40,4,60
  DATA " Bersaglieri            ",2,16,3,4,4,180,0,0,0,0,50,100,20,50,9,17,1,50,4,60
  DATA " Fusilieri              ",1,14,3,3,4,160,0,0,0,0,40,90,30,40,9,3,1,40,4,60
  DATA " Cacciatori             ",2,4,3,4,4,125,0,0,0,0,30,100,40,50,8,17,12,30,4,40
  DATA " Gardi Nazionali        ",1,7,3,3,4,125,0,0,0,0,20,80,40,30,10,1,1,20,4,30
  DATA " Guidi                  ",6,4,3,44,1,120,0,0,0,0,30,100,40,60,10,17,8,30,4,30
  DATA " Cavalleria             ",6,3,3,44,4,120,0,0,0,0,40,90,30,50,8,4,8,30,4,60
  DATA " Cavalleggeri           ",6,3,3,44,4,120,0,0,0,0,40,90,30,50,8,4,8,30,4,60
  DATA " Artilieri              ",9,3,3,61,4,35,8,2,113,0,40,90,30,10,10,111,2,40,4,2
  DATA " Cavalartilieri         ",10,3,3,62,4,35,8,2,113,0,40,90,30,10,10,111,8,40,4,2
  '
italy2:
  DATA Piedmont-Sardinia 1856-1865,40,4,9
  DATA " Officers               ",1,2,3,4,5,6,7,8,9,4,5,6,4,5,6,3,4,5,1,9
  DATA " Granatieri             ",1,16,3,18,4,160,0,70,10,0,50,100,20,50,9,3,1,40,4,60
  DATA " Bersaglieri            ",2,16,3,19,4,180,0,0,0,0,50,100,20,50,9,147,1,50,4,60
  DATA " Fusilieri              ",1,14,3,18,4,160,0,70,10,0,40,90,30,40,9,3,1,40,4,60
  DATA " Gardi Nazionali        ",1,7,3,3,4,125,0,0,0,0,30,80,40,30,10,3,1,20,4,30
  DATA " Cavalleria             ",6,3,3,58,4,120,0,0,0,0,40,90,30,50,8,4,8,30,4,60
  DATA " Cavalleggeri           ",6,3,3,58,4,120,0,0,0,0,40,90,30,50,8,4,8,30,4,60
  DATA " Artilieri              ",9,3,3,61,4,35,8,2,113,0,40,90,30,10,10,111,2,40,4,2
  DATA " Cavalartilieri         ",10,3,3,62,4,35,8,2,113,0,40,90,30,10,10,111,8,40,4,2
  '
italy3:
  DATA Piedmont-Sardinia 1865-1869,40,4,11
  DATA " Officers               ",1,2,3,4,5,6,7,8,9,4,5,6,4,5,6,3,4,5,1,9
  DATA " Granatieri             ",1,16,3,18,4,160,0,0,0,0,50,100,20,50,9,10,1,40,4,60
  DATA " Bersaglieri            ",2,16,3,19,4,180,0,0,0,0,50,100,20,50,9,147,1,50,4,60
  DATA " Fusilieri              ",1,14,3,18,4,160,0,0,0,0,40,90,30,40,9,10,1,40,4,60
  DATA " Gardi Nazionali        ",1,7,3,19,4,125,0,0,0,0,30,80,40,30,10,3,1,30,4,40
  DATA " Guidi                  ",6,16,3,58,6,160,0,0,0,0,50,100,20,60,8,147,8,30,4,30
  DATA " Cavalleria             ",6,3,3,58,5,160,0,0,0,0,40,90,30,50,8,147,8,30,4,60
  DATA " Lancieri               ",6,3,3,58,5,160,0,0,0,0,40,90,30,50,8,147,9,30,4,60
  DATA " Cavalleggeri           ",6,3,3,58,5,160,0,0,0,0,40,90,30,50,8,147,8,30,4,60
  DATA " Artilieri              ",9,3,3,61,3,35,6,0,0,0,40,90,30,10,11,24,2,40,4,2
  DATA " Cavalartilieri         ",10,3,3,62,3,35,6,0,0,0,40,90,30,10,11,24,8,40,4,2
  '
italy4:
  DATA Garribaldini 1858-59 ,50,5,8
  DATA " Officers                   ",1,2,3,4,5,6,7,8,9,10,2,3,5,7,9,2,4,6,3,5
  DATA " Cacciatore delle Alpi      ",2,4,3,32,4,150,0,90,10,0,40,95,40,60,8,1,1,40,4,60
  DATA " Volontari Valtellini       ",2,4,3,32,4,150,0,90,10,0,40,95,40,60,8,1,1,40,4,60
  DATA " Volontari Giovani          ",2,4,3,32,4,150,0,90,10,0,40,95,40,60,8,1,1,40,4,60
  DATA " Cacciatore delle Appennini ",2,4,3,32,4,150,0,90,10,0,40,95,40,60,8,1,1,40,4,60
  DATA " Carabinieri                ",2,4,3,32,3,150,0,0,0,0,45,90,40,60,8,146,1,45,4,60
  DATA " Guidi                      ",6,16,3,58,1,80,0,0,0,0,50,100,20,60,8,147,8,30,4,30
  DATA " Batteria Obusia            ",9,4,3,61,2,30,4,0,0,0,40,90,30,10,11,108,2,40,4,2
  '
italy5:
  DATA Garribaldini 1860-65 ,50,5,17
  DATA " Officers                ",1,2,3,4,5,6,7,8,9,10,2,3,5,7,9,2,4,6,3,5
  DATA " Volontari               ",2,4,3,32,6,72,0,90,10,0,40,95,40,60,8,1,1,40,4,60
  DATA " Bersaglieri             ",2,4,3,32,6,72,0,0,0,0,50,95,40,60,8,146,1,45,4,60
  DATA " Carabinieri             ",2,4,3,32,6,72,0,0,0,0,45,90,40,60,8,146,1,45,4,60
  DATA " Milanesi                ",2,4,3,32,6,72,0,80,10,0,45,95,40,60,8,3,1,40,4,60
  DATA " Vesuviani               ",2,4,3,32,6,72,0,70,1,0,35,90,45,60,8,100,2,40,4,60
  DATA " Squadristi              ",2,4,3,32,6,72,0,70,1,0,30,90,50,50,8,100,2,40,4,60
  DATA " Legione Estraneo        ",2,15,3,8,6,72,0,90,10,0,40,95,40,60,8,1,1,40,2,60
  DATA " Legione Ungherese       ",2,15,3,8,6,72,0,90,10,0,40,95,40,65,8,1,1,30,27,60
  DATA " Legione Francese        ",2,15,3,19,4,72,0,0,0,0,45,95,35,65,8,10,1,40,3,60
  DATA " Brigata Britanica       ",2,15,3,2,10,72,0,0,0,0,40,95,30,60,8,15,1,50,1,60
  DATA " Husari Ungherese        ",6,15,3,46,1,50,0,0,0,0,40,95,40,60,8,2,8,20,27,30
  DATA " Lancieri                ",6,4,3,46,1,50,0,0,0,0,40,90,40,50,8,2,9,20,27,30
  DATA " Cavalleria              ",6,4,3,46,1,50,0,0,0,0,40,90,40,50,8,2,13,20,27,30
  DATA " Batteria                ",9,4,3,61,3,30,6,0,0,0,40,90,30,10,11,2,2,40,4,2
  DATA " Batteria Americana      ",9,15,3,61,3,30,6,0,0,0,40,90,30,10,11,16,2,40,1,13
  DATA " Batteria Obusia         ",9,4,3,61,3,30,6,0,0,0,40,90,30,10,11,10,2,40,4,2
  '
italy6:
  DATA Naples & Sicily 1850-62,30,4,15
  DATA " Officers                ",1,2,3,4,5,6,7,8,9,10,5,6,7,8,9,10,5,6,7,8
  DATA " Fanteria di Guardia     ",1,1,3,7,6,150,0,0,0,0,40,90,30,50,8,13,1,30,4,60
  DATA " Fanteria di Linea       ",1,2,3,7,6,150,0,0,0,0,30,80,40,40,8,13,1,30,4,60
  DATA " Cacciatori              ",2,2,3,8,6,150,0,0,0,0,35,80,40,40,8,13,1,40,4,60
  DATA " Tiragliatore            ",2,2,3,8,6,150,0,0,0,0,35,80,40,40,8,13,1,45,4,60
  DATA " Guardia Svizzera        ",1,1,3,7,6,150,0,0,0,0,50,90,20,50,8,13,1,40,2,60
  DATA " Fanteria Estrangea      ",1,15,3,7,6,150,0,0,0,0,50,90,30,50,8,13,1,40,2,60
  DATA " Cavalleria di Guardia   ",7,1,3,45,4,120,0,0,0,1,40,90,30,50,8,147,8,20,4,30
  DATA " Cavalleria di Linea     ",7,2,3,45,4,120,0,0,0,1,30,80,40,40,8,147,8,20,4,30
  DATA " Drageni                 ",7,1,3,45,4,120,0,0,0,0,30,80,40,40,8,147,8,20,4,30
  DATA " Husari                  ",6,1,3,46,4,120,0,0,0,0,30,85,40,50,8,147,8,20,4,30
  DATA " Lancieri                ",6,1,3,46,4,120,0,0,0,0,30,80,40,50,9,147,8,20,4,30
  DATA " Batteria Piedi          ",9,4,3,61,3,30,6,2,108,0,40,90,30,10,11,106,2,40,4,2
  DATA " Batteria Posizioni      ",9,4,3,61,3,30,6,2,108,0,40,90,30,10,11,107,2,40,4,2
  DATA " Batteria a Cavalla      ",10,4,3,61,3,30,6,0,0,0,40,90,30,10,11,106,2,40,4,2
  '
italy7:
  DATA Modena 1840-1860,40,4,8
  DATA " Officers              ",1,2,3,4,5,6,7,8,9,10,5,6,7,8,5,6,7,8,6,7
  DATA " Granatieri            ",1,16,3,7,4,190,0,0,0,0,50,95,20,50,9,3,1,40,4,60
  DATA " Cacciatori            ",2,14,3,8,4,190,0,0,0,0,50,90,30,50,10,147,1,50,4,60
  DATA " Fusilieri             ",1,14,3,7,4,190,0,0,0,0,40,90,30,40,9,3,1,40,4,60
  DATA " Voluntari             ",2,4,3,7,4,120,0,0,0,0,30,100,40,30,10,17,12,40,4,30
  DATA " Guidi                 ",6,4,3,46,1,120,0,0,0,0,30,100,40,60,10,17,8,30,4,30
  DATA " Cavalleria            ",6,3,3,46,4,125,0,0,0,0,40,90,30,50,9,17,8,30,4,60
  DATA " Batteria Piedi        ",9,3,3,61,3,35,6,2,108,0,40,90,30,10,10,106,2,40,4,2
  '
italy8:
  DATA The Papacy 1849-1860,40,4,9
  DATA " Officers              ",1,2,3,4,5,6,7,8,9,10,5,6,7,8,5,6,7,8,6,7
  DATA " Granatieri            ",1,16,3,3,6,140,0,0,0,0,50,95,20,50,9,10,1,40,4,60
  DATA " Zouavi                ",2,14,3,19,6,120,0,0,0,0,50,90,30,50,10,10,1,50,4,60
  DATA " Fusilieri             ",1,14,3,3,6,120,0,0,0,0,40,90,30,40,9,10,1,40,4,60
  DATA " Voluntari             ",2,4,3,31,3,100,0,0,0,0,30,100,40,30,10,1,12,40,4,30
  DATA " Guidi                 ",6,4,3,44,1,120,0,0,0,0,30,100,40,60,10,147,8,30,4,30
  DATA " Drageni               ",7,3,3,43,4,125,0,0,0,0,40,90,30,50,9,147,8,30,4,60
  DATA " Batteria Piedi        ",9,3,3,61,3,35,6,0,0,0,40,90,30,10,10,24,2,40,4,2
  DATA " Batteria a Cavalla    ",9,3,3,61,3,35,6,0,0,0,40,90,30,10,10,24,2,40,4,2
  '
italy9:
  DATA Italians in East Africa 1888-1900,30,4,14
  DATA " Officers                ",1,2,3,4,5,6,7,8,9,10,5,6,7,8,9,10,5,6,7,8
  DATA " Fanteria di Guardia     ",1,1,3,7,6,150,0,0,0,0,50,95,30,50,8,130,1,30,4,60
  DATA " Fanteria di Linea       ",1,2,3,7,6,150,0,0,0,0,40,90,40,40,8,94,1,30,4,60
  DATA " Bessaglieri             ",2,2,3,8,6,150,0,0,0,0,45,90,40,40,8,130,1,40,4,60
  DATA " Fanteria Askari         ",1,2,3,7,6,150,0,0,0,0,40,80,40,40,8,87,1,30,4,60
  DATA " Ausilairios Eritrean    ",2,13,3,11,5,100,0,70,87,0,20,90,55,45,33,108,14,20,11,50
  DATA " Ausilairios Gallas      ",6,20,6,52,5,100,0,90,87,0,30,90,45,55,33,108,9,20,11,50
  DATA " Cavalleria Askeri       ",6,2,3,45,4,120,0,0,0,1,40,80,40,40,8,94,8,20,4,30
  DATA " Drageni                 ",7,1,3,45,4,120,0,0,0,0,40,90,40,40,8,94,8,20,4,30
  DATA " Husari                  ",6,1,3,46,4,120,0,0,0,0,40,95,40,50,8,94,8,20,4,30
  DATA " Lancieri                ",6,1,3,46,4,120,0,0,0,0,40,90,40,50,9,94,8,20,4,30
  DATA " Batteria da Campagna    ",9,4,3,61,3,30,6,2,108,0,40,90,30,10,11,197,2,40,4,2
  DATA " Batteria da Montagna    ",11,4,3,64,3,30,6,0,0,0,40,90,30,10,11,198,2,40,4,2
  DATA " Batteria Askari         ",11,4,3,64,3,30,6,0,0,0,40,90,40,10,11,198,2,30,4,2
  '

SUB putem
 DEF SEG = SSEG(tdat$)
 BSAVE "c:\ecw\bandi3\armies.dat\italy.arm", SADD(tdat$), LEN(tdat$)
END SUB

SUB test
OPEN "A:\armies.dat\italy.arm" FOR INPUT AS #1
x% = LOF(1)
tdat$ = STRING$(x%, " ")
 DEF SEG = SSEG(tdat$)
 BLOAD "A:\armies.dat\italy.arm", SADD(tdat$)
OPEN "A:\armies.nam\italy.nam" FOR INPUT AS #2
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

