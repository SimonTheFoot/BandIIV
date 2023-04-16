OPTION BASE 1
DECLARE SUB test ()
DECLARE SUB putem ()
DECLARE SUB test2 ()
COMMON SHARED troopname$(), title$(), tdat$, troopdata%(), offset%, tx$
DIM troopname$(500), title$(15), tdat%(10, 3), troopdata%(500, 18)
OPEN "C:\ecw\bandi3\armies.nam\russian.nam" FOR OUTPUT AS #1
offset% = 1
tdat$ = ""
WRITE #1, " Imperial Russian Armies ", "9"
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
russ1:
  DATA Russian 1842-1856,40,6,16
  DATA " Officers                    ",1,2,3,4,5,6,7,8,9,10,10,9,8,7,6,5,4,6,6,8
  DATA " Musketeers                  ",1,14,3,9,4,262,0,0,0,0,30,80,15,45,9,3,1,20,6,60
  DATA " Jager                       ",1,14,3,9,4,262,0,90,165,0,30,80,15,45,9,3,1,25,6,60
  DATA " Rifle Battalion             ",2,14,3,25,4,262,0,0,0,0,30,80,15,45,9,165,1,25,6,60
  DATA " Ekipazhi Landing Battalion  ",1,14,3,9,6,48,0,90,165,0,30,80,12,45,11,3,1,30,6,60
  DATA " Cuirassiers                 ",7,14,3,49,6,172,0,90,17,1,35,95,30,45,8,2,8,15,6,60
  DATA " Dragoons                    ",7,14,3,49,10,172,0,90,17,0,35,90,30,40,8,2,8,20,6,60
  DATA " Uhlans                      ",6,14,3,50,8,172,0,87,17,0,30,90,35,40,8,2,9,15,6,60
  DATA " Hussars                     ",6,14,3,50,8,172,0,90,17,0,30,95,35,50,8,2,8,15,6,60
  DATA " Don Cossacks                ",6,10,3,50,6,120,0,0,0,0,25,80,40,40,10,3,9,10,6,60
  DATA " Light Foot Battery          ",9,14,3,61,9,30,12,6,104,0,30,85,15,10,11,119,2,40,6,2
  DATA " Heavy Foot Battery          ",9,14,3,61,9,35,18,6,105,0,30,85,10,10,11,120,2,40,6,2
  DATA " Heavy Horse Battery         ",10,14,3,62,4,35,8,0,0,0,30,90,15,10,11,105,2,40,6,2
  DATA " Light Horse Battery         ",10,14,3,62,4,30,8,4,104,0,30,90,15,10,11,119,2,40,6,2
  DATA " Cossack Battery             ",10,10,3,62,3,30,6,0,0,0,30,80,30,10,12,119,2,30,6,2
  DATA " Rocket Battery              ",13,10,3,62,3,30,6,0,0,0,30,80,30,10,12,138,2,30,6,2
  '
russ2:
  DATA Russian Guard 1842-1856     ,30,6,12
  DATA " Officers                  ",1,2,3,4,5,6,7,8,9,10,10,9,8,7,6,5,4,6,3,5
  DATA " Grenadiers                ",1,16,3,9,4,262,0,0,0,0,50,100,10,60,8,3,1,25,6,60
  DATA " Musketeers                ",1,1,3,9,4,262,0,0,0,0,50,100,10,60,8,3,1,35,6,60
  DATA " Light Infantry            ",2,1,3,9,4,262,0,80,165,0,45,105,15,60,8,3,1,30,6,60
  DATA " Cuirassiers               ",7,1,3,49,6,182,0,90,17,1,45,100,15,50,8,4,8,15,6,60
  DATA " Horse Grenadiers          ",7,1,3,49,6,182,0,90,17,1,45,100,15,50,8,4,8,15,6,60
  DATA " Dragoons                  ",7,1,3,49,10,182,0,90,17,0,45,100,15,45,8,3,8,20,6,60
  DATA " Hussars                   ",6,1,3,50,8,182,0,90,17,0,40,110,20,45,8,4,8,20,6,60
  DATA " Uhlans                    ",6,1,3,50,8,182,0,90,17,0,40,100,20,50,8,4,9,20,6,60
  DATA " Cossacks                  ",6,1,3,50,6,132,0,0,0,0,35,90,35,50,8,3,9,20,6,60
  DATA " Foot Battery              ",9,1,3,61,9,40,18,6,105,0,50,90,10,10,10,120,2,40,6,2
  DATA " Horse Battery             ",10,1,3,62,4,30,8,4,104,0,45,95,15,10,10,119,2,40,6,2
  '
russ3:
  DATA The Army of the Caucasus 1842-1856,40,6,11
  DATA " Officers                  ",1,2,3,4,5,6,7,8,9,10,10,9,8,7,6,5,4,6,6,4
  DATA " Musketeers                ",1,14,2,9,4,262,0,0,0,0,30,80,12,45,9,3,1,25,6,60
  DATA " Jager                     ",1,14,2,9,4,262,0,90,165,0,30,80,12,45,9,2,3,30,6,60
  DATA " Rifle Battalion           ",2,14,2,25,4,262,0,0,0,0,30,80,12,45,9,165,1,30,6,60
  DATA " Dragoons                  ",7,14,2,49,11,172,0,90,17,0,35,90,30,40,8,4,8,20,6,60
  DATA " Frontier Cossacks         ",6,10,2,31,6,120,0,0,0,0,25,80,40,40,10,3,9,10,6,60
  DATA " Light Foot Battery        ",9,14,2,61,2,30,4,0,0,0,30,85,15,10,11,119,2,40,6,2
  DATA " Heavy Foot Battery        ",9,14,2,61,2,35,4,0,0,0,30,85,10,10,11,120,2,40,6,2
  DATA " Howitzer Battery          ",9,14,2,61,2,30,4,0,0,0,30,85,15,10,11,104,2,40,6,2
  DATA " Cossack Battery           ",10,10,2,62,3,30,6,0,0,0,30,80,30,10,12,119,2,30,6,2
  DATA " Rocket Battery            ",13,10,2,62,3,30,6,0,0,0,30,80,30,10,12,138,2,30,6,11
  '
russ4:
  DATA Russian 1856-1871,40,6,14
  DATA " Officers                    ",1,2,3,4,5,6,7,8,9,10,10,9,8,7,6,5,4,6,6,8
  DATA " Infantry Battalion          ",1,14,3,24,4,262,0,0,0,0,30,80,15,45,9,25,1,20,6,60
  DATA " Converged Rifle Battalion   ",2,14,3,25,4,262,0,0,0,0,30,80,15,45,9,25,1,20,6,60
  DATA " Independent Rifle Battalion ",2,14,3,25,4,210,0,0,0,0,30,80,15,45,9,25,1,25,6,60
  DATA " Caucasus Rifle Battalion    ",2,14,3,25,4,258,0,0,0,0,30,80,15,45,9,25,1,30,6,60
  DATA " Dragoons                    ",7,14,3,59,4,148,0,0,0,0,35,90,30,40,8,25,8,20,6,60
  DATA " Uhlans                      ",6,14,3,59,4,148,0,50,98,0,30,90,35,40,8,226,9,15,6,60
  DATA " Hussars                     ",6,14,3,59,4,148,0,50,98,0,30,95,35,50,8,226,8,15,6,60
  DATA " Don Cossacks                ",6,10,3,60,6,120,0,0,0,0,25,80,40,40,10,25,9,10,6,60
  DATA " Foot Battery                ",9,14,3,61,4,35,8,0,0,0,30,85,10,10,11,43,2,40,6,13
  DATA " Reserve Battery             ",12,14,3,61,4,45,8,2,105,0,30,85,10,10,11,120,2,40,6,2
  DATA " Horse Battery               ",10,14,3,62,4,30,8,0,0,0,30,90,15,10,11,43,2,40,6,13
  DATA " Cossack Battery             ",10,10,3,62,4,30,8,0,0,0,30,80,30,10,12,119,2,30,6,2
  DATA " Mountain Battery            ",11,10,3,64,4,30,8,0,0,0,30,80,30,10,12,201,2,30,6,13
  '
russ5:
  DATA Russian Guard 1856-1868     ,30,6,13
  DATA " Officers                  ",1,2,3,4,5,6,7,8,9,10,10,9,8,7,6,5,4,6,3,5
  DATA " Grenadier Battalion       ",1,16,3,24,4,262,0,0,0,0,50,100,10,60,8,25,1,25,6,60
  DATA " Infantry Battalion        ",1,1,3,24,4,262,0,0,0,0,50,100,10,60,8,25,1,30,6,60
  DATA " Rifle Battalion           ",2,1,3,25,4,262,0,80,165,0,45,105,15,60,8,25,1,30,6,60
  DATA " Chevalier Guard           ",7,1,3,59,6,172,0,0,0,1,45,100,15,50,8,226,8,15,6,60
  DATA " Life Guard Horse          ",7,1,3,59,6,172,0,0,0,1,45,100,15,50,8,226,8,15,6,60
  DATA " Cuirassiers               ",7,1,3,59,6,172,0,0,0,1,45,100,15,50,8,226,8,15,6,60
  DATA " Dragoons                  ",7,1,3,59,6,172,0,0,0,0,45,100,15,45,8,25,8,20,6,60
  DATA " Hussars                   ",6,1,3,59,6,172,0,50,98,0,40,110,20,45,8,226,8,20,6,60
  DATA " Uhlans                    ",6,1,3,59,6,172,0,50,98,0,40,100,20,50,8,226,9,20,6,60
  DATA " Cossacks                  ",6,1,3,60,6,132,0,0,0,0,35,90,35,50,8,25,9,20,6,60
  DATA " Foot Battery              ",9,1,3,61,4,40,8,0,0,0,50,90,10,10,10,43,2,40,6,13
  DATA " Horse Battery             ",10,1,3,62,4,30,8,0,0,0,45,95,15,10,10,43,2,40,6,13
  '
russ6:
  DATA Russian 1871-1877,40,6,15
  DATA " Officers                    ",1,2,3,4,5,6,7,8,9,10,10,9,8,7,6,5,4,6,6,8
  DATA " Infantry Battalion          ",1,14,3,24,4,262,0,0,0,0,30,80,15,45,9,89,1,20,6,60
  DATA " Converged Rifle Battalion   ",2,14,3,25,4,262,0,0,0,0,30,80,15,45,9,89,1,20,6,60
  DATA " Independent Rifle Battalion ",2,14,3,25,4,210,0,0,0,0,30,80,15,45,9,89,1,25,6,60
  DATA " Caucasus Rifle Battalion    ",2,14,3,25,4,258,0,0,0,0,30,80,15,45,9,89,1,30,6,60
  DATA " Dragoons                    ",7,14,3,59,4,148,0,0,0,0,35,90,30,40,8,90,8,20,6,60
  DATA " Uhlans                      ",6,14,3,59,4,148,0,0,0,0,30,90,35,40,8,90,9,15,6,60
  DATA " Hussars                     ",6,14,3,59,4,148,0,0,0,0,30,95,35,50,8,90,8,15,6,60
  DATA " Don Cossacks                ",6,10,3,60,6,120,0,0,0,0,25,80,40,40,10,90,9,10,6,60
  DATA " Light Foot Battery          ",9,14,3,61,4,35,8,0,0,0,30,85,10,10,11,43,2,40,6,13
  DATA " Heavy Foot Battery          ",12,14,3,61,4,45,8,0,0,0,30,85,10,10,11,44,2,40,6,13
  DATA " Horse Battery               ",10,14,3,62,4,30,8,0,0,0,30,90,15,10,11,43,2,40,6,13
  DATA " Cossack Battery             ",10,10,3,62,4,30,8,0,0,0,30,80,30,10,12,119,2,30,6,13
  DATA " Mountain Battery            ",11,10,3,64,4,30,8,0,0,0,30,80,30,10,12,201,2,30,6,13
  DATA " Repeater Battery            ",20,14,3,62,1,15,2,0,0,0,50,90,20,10,11,8,2,30,6,11
  '
russ7:
  DATA Russian 1877-1881,40,6,13
  DATA " Officers                    ",1,2,3,4,5,6,7,8,9,10,10,9,8,7,6,5,4,6,6,8
  DATA " Infantry Battalion          ",1,14,3,24,4,261,0,0,0,0,30,80,15,45,9,90,1,20,6,60
  DATA " Rifle Battalion             ",2,14,3,25,4,261,0,0,0,0,30,80,15,45,9,90,1,25,6,60
  DATA " Independent Rifle Battalion ",2,14,3,25,4,210,0,0,0,0,30,80,15,45,9,90,1,25,6,60
  DATA " Caucasus Rifle Battalion    ",2,14,3,25,4,258,0,0,0,0,30,80,15,45,9,90,1,30,6,60
  DATA " Dragoons                    ",7,14,3,59,4,148,0,0,0,0,35,90,30,40,8,90,8,20,6,60
  DATA " Don Cossacks                ",6,10,3,60,6,120,0,0,0,0,25,80,40,40,10,90,9,10,6,60
  DATA " Light Foot Battery          ",9,14,3,61,4,35,8,0,0,0,30,85,10,10,11,43,2,40,6,13
  DATA " Heavy Foot Battery          ",12,14,3,61,4,45,8,0,0,0,30,85,10,10,11,44,2,40,6,13
  DATA " Horse Battery               ",10,14,3,62,4,30,8,0,0,0,30,90,15,10,11,43,2,40,6,13
  DATA " Cossack Battery             ",10,10,3,62,4,30,8,0,0,0,30,80,30,10,12,119,2,30,6,13
  DATA " Mountain Battery            ",11,10,3,64,4,30,8,0,0,0,30,80,30,10,12,201,2,30,6,13
  DATA " Repeater Battery            ",20,14,3,62,1,15,2,0,0,0,50,90,20,10,11,8,2,30,6,11
  '
russ8:
  DATA Russian Guard 1869-1879     ,30,6,15
  DATA " Officers                  ",1,2,3,4,5,6,7,8,9,10,10,9,8,7,6,5,4,6,3,5
  DATA " Grenadier Battalion       ",1,16,3,24,4,262,0,0,0,0,50,100,10,60,8,90,1,25,6,60
  DATA " Infantry Battalion        ",1,1,3,24,4,262,0,0,0,0,50,100,10,60,8,90,1,30,6,60
  DATA " Rifle Battalion           ",2,1,3,25,4,262,0,0,0,0,45,105,15,60,8,90,1,30,6,60
  DATA " Chevalier Guard           ",7,1,3,59,6,172,0,0,0,1,45,100,15,50,8,90,8,15,6,60
  DATA " Life Guard Horse          ",7,1,3,59,6,172,0,0,0,1,45,100,15,50,8,90,8,15,6,60
  DATA " Cuirassiers               ",7,1,3,59,6,172,0,0,0,1,45,100,15,50,8,90,8,15,6,60
  DATA " Dragoons                  ",7,1,3,59,6,172,0,0,0,0,45,100,15,45,8,90,8,20,6,60
  DATA " Hussars                   ",6,1,3,59,6,172,0,0,0,0,40,110,20,45,8,90,8,20,6,60
  DATA " Uhlans                    ",6,1,3,59,6,172,0,0,0,0,40,100,20,50,8,90,9,20,6,60
  DATA " Cossacks                  ",6,1,3,60,6,132,0,0,0,0,35,90,35,50,8,90,9,20,6,60
  DATA " Light Foot Battery        ",9,1,3,61,4,40,8,0,0,0,50,90,10,10,10,43,2,40,6,13
  DATA " Heavy Foot Battery        ",9,1,3,61,4,45,8,0,0,0,50,90,10,10,10,44,2,40,6,13
  DATA " Horse Battery             ",10,1,3,62,4,30,8,0,0,0,45,95,15,10,10,43,2,40,6,13
  DATA " Repeater Battery          ",20,1,3,62,1,15,2,0,0,0,50,100,20,10,11,8,2,30,6,11
  '
russ9:
  DATA Roumiania 1876-1881,40,29,10
  DATA " Officers                    ",1,2,3,4,5,6,7,8,9,10,10,9,8,7,6,5,4,6,6,8
  DATA " Infantry Battalion          ",1,14,3,18,4,188,0,0,0,0,40,90,25,50,9,73,1,20,29,60
  DATA " Rifle Battalion             ",2,14,3,19,4,188,0,0,0,0,40,90,25,50,9,73,1,25,29,60
  DATA " Dorobantz Battalion         ",2,7,3,18,4,188,0,0,0,0,30,85,30,55,9,74,1,30,29,60
  DATA " Roshiori                    ",6,14,3,59,4,148,0,0,0,0,40,90,30,50,8,56,8,20,29,60
  DATA " Kalarashi                   ",6,7,3,60,6,120,0,0,0,0,30,85,40,50,10,56,9,10,29,60
  DATA " Foot Battery                ",9,14,3,61,4,35,8,0,0,0,40,85,10,10,11,41,2,40,29,10
  DATA " Heavy Battery               ",12,14,3,61,4,35,8,0,0,0,40,85,10,10,11,42,2,40,29,10
  DATA " Horse Battery               ",10,14,3,62,4,30,8,0,0,0,40,90,15,10,11,41,2,40,29,10
  DATA " Repeater Battery            ",20,14,3,62,1,15,2,0,0,0,50,90,20,10,11,4,2,30,29,11
  '

SUB putem
 DEF SEG = SSEG(tdat$)
 BSAVE "C:\ecw\bandi3\armies.dat\russian.arm", SADD(tdat$), LEN(tdat$)
END SUB

SUB test
OPEN "A:\armies.dat\russian.arm" FOR INPUT AS #1
x% = LOF(1)
tdat$ = STRING$(x%, " ")
 DEF SEG = SSEG(tdat$)
 BLOAD "A:\armies.dat\russian.arm", SADD(tdat$)
OPEN "A:\armies.nam\russian.nam" FOR INPUT AS #2
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

