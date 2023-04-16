OPTION BASE 1
DECLARE SUB test ()
DECLARE SUB putem ()
DECLARE SUB test2 ()
COMMON SHARED troopname$(), title$(), tdat$, troopdata%(), offset%, tx$
DIM troopname$(500), title$(15), tdat%(10, 3), troopdata%(500, 18)
OPEN "C:\ecw\bandi3\armies.nam\india.nam" FOR OUTPUT AS #1
offset% = 1
tdat$ = ""
WRITE #1, " Armies of the Indian Subcontinent ", "8"
FOR i% = 1 TO 8
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
'
'
india1:
  DATA Sikhs 1830-1846,30,9,17
  DATA " Officers                 ",1,2,3,4,5,6,7,8,9,10,2,4,6,8,1,3,5,9,5,7
  DATA " Fauj-i-Ain Peletons      ",1,2,3,3,8,120,0,0,0,0,40,90,40,50,10,1,1,30,9,60
  DATA " Gurkha Peletons          ",2,15,3,4,8,120,0,0,0,0,40,95,35,50,10,1,1,30,8,60
  DATA " Bunoori Peletons         ",1,15,3,3,8,120,0,0,0,0,30,80,50,50,10,1,1,30,7,60
  DATA " Garrison Peletons        ",1,10,3,10,6,100,0,0,0,0,30,90,50,30,33,21,3,20,9,60
  DATA " Punjab Bandukhis         ",1,13,3,10,5,200,0,0,0,0,20,90,50,40,33,112,3,20,9,60
  DATA " Akalis                   ",2,10,7,11,5,200,0,50,0,0,10,99,20,65,33,112,3,10,9,60
  DATA " Afgan Jezailchis         ",3,15,3,39,3,200,0,0,0,0,20,80,50,30,33,20,3,25,9,60
  DATA " Fauj-i-Ain Dragoons      ",7,2,3,43,4,120,0,0,0,0,40,90,40,40,8,2,8,20,9,60
  DATA " Groshurras               ",6,10,3,52,3,150,0,0,0,3,30,100,50,50,33,112,18,20,9,60
  DATA " Sorchurras               ",6,11,3,52,3,150,0,0,0,0,20,95,45,40,33,112,18,10,9,60
  DATA " Afgan Jagiris            ",6,15,3,52,3,200,0,0,0,0,10,90,60,30,33,20,18,20,7,60
  DATA " Fauj-i-Ain Aspi 4lb      ",10,2,3,62,4,40,12,0,0,0,30,80,30,10,11,109,3,30,9,1
  DATA " Fauj-i-Ain Aspi 6lb      ",10,2,3,62,2,40,6,0,0,0,30,80,30,10,11,110,3,30,9,1
  DATA " Fauj-i-Ain Jinsi 12lb    ",12,2,3,63,2,30,6,0,0,0,30,80,30,10,11,7,3,30,9,1
  DATA " Fauj-i-Ain Jinsi 18lb    ",14,2,3,63,1,30,3,0,0,0,30,80,30,10,11,8,3,30,9,1
  DATA " Zambukhis                ",16,10,3,73,5,20,20,0,0,0,30,80,40,10,40,139,2,30,9,1
  '
india2:
  DATA Afghans 1830-1848,20,7,15
  DATA " Officers                      ",1,2,3,4,5,6,7,8,9,10,10,10,9,8,7,6,7,8,5,7
  DATA " Ghullamchis                   ",6,19,3,52,3,100,0,0,0,3,40,100,50,40,37,24,9,20,7,30
  DATA " Qezelbash Sipahis             ",6,20,3,52,3,100,0,0,0,3,30,100,40,50,33,24,9,20,7,30
  DATA " Qezelbash Bandukhis           ",2,20,3,10,5,100,0,0,0,0,30,100,40,50,33,112,2,20,7,50
  DATA " Kabul Bandukhis               ",1,10,3,10,5,100,0,0,0,0,30,100,40,50,33,112,3,20,7,50
  DATA " Arabs                         ",2,20,3,11,3,100,0,0,0,0,40,90,30,50,51,112,3,30,13,50
  DATA " Jagir Chaharis                ",6,10,3,52,5,100,0,0,0,3,25,90,50,50,48,20,18,25,7,30
  DATA " Jagir Sipahis                 ",6,11,3,52,5,100,0,0,0,0,25,90,50,40,48,20,18,25,7,30
  DATA " Jagir Jezailchis              ",2,11,3,11,5,100,0,0,0,0,25,90,50,40,48,20,3,25,7,30
  DATA " Ghairi Sipahis                ",6,12,3,52,5,100,0,0,0,0,15,90,55,40,49,20,18,25,7,30
  DATA " Ghairi Chorachis              ",2,12,3,11,5,100,0,30,0,0,10,90,60,40,49,20,3,25,7,30
  DATA " Ghazi Sipahis                 ",6,11,7,52,5,100,0,0,0,0,20,100,20,60,49,20,18,25,7,30
  DATA " Ghazi Chorachis               ",2,11,7,11,5,100,0,50,0,0,20,100,20,60,49,20,3,25,7,30
  DATA " Kabul Badmashis               ",1,13,3,10,5,100,0,20,0,0,10,90,70,40,33,112,3,25,7,30
  DATA " Zambukhis                     ",16,10,3,73,5,20,20,0,0,0,30,80,40,10,40,139,2,30,7,1
  '
india3:
  DATA Baloochis 1830-1848,20,7,12
  DATA " Officers                      ",1,2,3,4,5,6,7,8,9,10,10,10,9,8,7,6,7,8,5,7
  DATA " Baloochi Jezailchis           ",2,10,3,11,5,100,0,0,0,0,25,90,50,40,48,20,3,25,7,30
  DATA " Scindhi Bandukhis             ",1,10,3,10,5,100,0,0,0,0,30,100,40,50,33,112,3,20,7,50
  DATA " Arab Bandukhis                ",2,20,3,11,3,100,0,0,0,0,40,90,30,50,51,112,3,30,13,50
  DATA " Ghazi Chorachis               ",2,11,7,11,5,100,0,50,0,0,20,100,20,60,49,112,3,25,7,30
  DATA " Badmashis                     ",1,13,3,10,5,100,0,20,0,0,10,90,70,40,33,112,3,25,7,30
  DATA " Baloochi Sipahis              ",6,11,3,52,5,100,0,0,0,0,25,90,50,40,48,20,18,25,7,30
  DATA " Scindhi Sipahis               ",6,12,3,52,5,100,0,0,0,0,15,90,55,40,49,112,18,25,7,30
  DATA " Ghazi Sipahis                 ",6,11,7,52,5,100,0,0,0,0,20,100,20,60,49,112,9,25,7,30
  DATA " Zambukhis                     ",16,10,3,73,5,20,20,0,0,0,30,80,40,10,40,139,2,30,7,1
  DATA " Aspi battery                  ",12,10,3,63,1,40,4,0,0,0,30,80,30,10,11,199,2,20,7,1
  DATA " Jinsi battery                 ",12,10,3,63,1,30,4,0,0,0,30,80,30,10,11,200,3,20,7,1
  '
india4:
  DATA Gwalior 1830-1846,20,8,14
  DATA " Officers                 ",1,2,3,4,5,6,7,8,9,10,10,10,9,8,7,6,7,8,8,9
  DATA " Khasgi Pagas             ",6,16,3,52,5,100,0,0,0,3,30,90,40,40,41,112,18,20,8,30
  DATA " Silhadars                ",6,11,3,52,5,100,0,0,0,3,20,80,50,40,41,112,18,20,8,30
  DATA " Ekandas                  ",6,11,3,52,5,100,0,0,0,0,20,90,50,40,41,112,9,20,8,30
  DATA " Gardi Peletons           ",1,2,3,1,6,100,0,0,0,0,30,70,40,40,42,21,1,30,8,60
  DATA " Arab Bandukhis           ",2,20,3,11,3,100,0,0,0,0,30,90,30,50,51,112,3,30,13,60
  DATA " Maratha Bandukhis        ",1,10,3,10,10,100,0,0,0,0,30,80,45,40,42,112,3,20,8,50
  DATA " Afghan Jezailchis        ",2,20,3,11,5,100,0,0,0,0,20,90,50,50,33,20,18,25,7,50
  DATA " Ghoshais                 ",2,11,7,10,5,100,0,0,0,0,10,100,20,70,42,112,3,10,8,30
  DATA " Shamshiris               ",1,13,3,10,10,200,0,10,0,0,10,50,60,30,42,112,2,10,8,10
  DATA " Aspi battery             ",12,10,3,63,1,40,4,0,0,0,30,80,30,10,11,199,3,30,8,1
  DATA " Jinsi battery            ",12,10,3,63,1,30,4,0,0,0,30,80,30,10,11,200,3,30,8,1
  DATA " Rocketeers               ",13,10,3,69,5,20,10,0,0,0,30,80,40,20,40,86,3,20,8,11
  DATA " Zambukhis                ",16,10,3,73,10,5,25,0,0,0,30,80,40,10,40,139,2,30,8,1
  '
india5:
  DATA Indian Mutineers 1857,70,1,12
  DATA " Officers                   ",1,2,3,4,5,6,7,8,9,10,5,6,6,7,7,8,8,9,9,10
  DATA " Hindoo Mutineer Sepoys     ",1,10,3,1,8,90,0,0,0,0,25,80,40,40,10,3,1,40,8,60
  DATA " Muslim Mutineer Sepoys     ",1,10,3,1,8,90,0,0,0,0,25,80,40,40,10,3,1,40,7,60
  DATA " Bandukhis                  ",1,10,3,1,8,90,0,0,0,0,20,80,50,40,11,112,1,40,8,60
  DATA " Gujaris                    ",2,26,3,10,5,100,0,0,0,0,10,80,50,50,11,112,3,20,8,50
  DATA " Badmashes                  ",2,26,3,10,5,100,0,30,0,0,30,80,50,50,11,112,3,10,8,50
  DATA " Ghazis                     ",2,26,3,10,5,100,0,10,0,0,30,80,50,50,11,112,3,30,7,50
  DATA " Hindoo Mutineer Sowars     ",6,2,3,42,4,120,0,0,0,0,20,80,45,50,10,4,8,20,8,60
  DATA " Muslim Mutineer Sowars     ",6,2,3,42,4,120,0,0,0,0,20,80,45,50,10,4,8,20,7,60
  DATA " Barkandajis                ",6,7,3,52,8,90,0,0,0,0,30,80,50,50,11,112,18,30,8,50
  DATA " Wilayatis                  ",6,25,3,52,3,100,0,0,0,0,20,80,50,50,11,112,9,30,7,50
  DATA " Mutineer Battery           ",9,2,3,61,3,40,6,0,0,0,50,80,20,10,12,2,2,20,8,3
  '
india6:
  DATA Afghans 1870-1882,20,7,20
  DATA " Officers                      ",1,2,3,4,5,6,7,8,9,10,10,10,9,8,7,6,7,8,5,7
  DATA " Amir's Guard                  ",3,1,3,37,4,125,0,0,0,0,30,90,40,40,10,70,1,40,7,60
  DATA " Kabul Peletons                ",1,10,3,1,6,115,0,0,0,0,25,80,40,40,10,142,1,40,7,60
  DATA " Herat Peletons                ",1,10,3,1,6,115,0,0,0,0,25,80,40,40,10,6,1,40,7,60
  DATA " Balkh Peletons                ",1,10,3,1,6,115,0,0,0,0,20,80,40,40,10,3,1,40,7,60
  DATA " Depot Peletons                ",1,10,3,1,6,115,0,0,0,0,20,80,40,40,10,1,1,40,7,60
  DATA " Sowar Peletons                ",6,2,3,42,4,125,0,0,0,0,20,80,45,50,10,2,8,20,7,60
  DATA " Bullock Battery               ",9,2,3,63,3,50,6,0,0,0,50,80,20,10,12,7,2,20,8,1
  DATA " Horse Battery                 ",10,2,3,62,3,50,6,0,0,0,50,80,20,10,12,2,2,20,8,1
  DATA " Field Battery                 ",9,2,3,63,3,50,6,0,0,0,50,80,20,10,12,40,2,20,8,8
  DATA " Mule Battery                  ",11,2,3,64,3,25,6,2,52,0,50,80,20,10,12,51,2,20,8,1
  DATA " Elephant Battery              ",12,10,3,63,2,60,4,0,0,0,40,80,30,10,12,47,2,20,8,8
  DATA " Jagir Sipahis                 ",6,11,3,52,5,100,0,0,0,0,25,90,50,40,48,20,18,25,7,30
  DATA " Jagir Jezailchis              ",2,11,3,11,5,100,0,0,0,0,25,90,50,40,48,20,3,25,7,30
  DATA " Ghairi Sipahis                ",6,12,3,52,5,100,0,0,0,0,15,90,55,40,49,20,18,25,7,30
  DATA " Ghairi Chorachis              ",2,12,3,11,5,100,0,30,0,0,10,90,60,40,49,20,3,25,7,30
  DATA " Ghazi Sipahis                 ",6,11,7,52,5,100,0,0,0,0,20,100,20,60,49,20,18,25,7,30
  DATA " Ghazi Chorachis               ",2,11,7,11,5,100,0,50,0,0,20,100,20,60,49,20,3,25,7,30
  DATA " Kabul Badmashis               ",1,13,3,10,5,100,0,20,0,0,10,90,70,40,33,112,3,25,7,30
  DATA " Zambukhis                     ",16,10,3,73,5,20,20,0,0,0,30,80,40,10,40,139,2,30,7,1
  '
india7:
  DATA The Northwest Frontier 1848-82,20,7,18
  DATA " Officers                      ",1,2,3,4,5,6,7,8,9,10,10,10,9,8,7,6,7,8,8,9
  DATA " Ghazi Sipahis                 ",6,11,7,52,3,100,0,0,0,0,20,100,20,60,49,20,18,25,7,30
  DATA " Ghazi Mujehadin               ",2,11,7,11,5,100,0,50,0,0,20,100,20,60,49,20,3,25,7,30
  DATA " Sitana Ghoshais               ",2,10,7,10,5,100,0,0,0,0,10,100,20,70,42,3,3,10,8,30
  DATA " Afridi Sipahis                ",6,11,3,52,1,100,0,0,0,0,25,90,50,40,48,20,18,25,7,30
  DATA " Afridi Jezailchis             ",2,11,3,11,5,100,0,0,0,0,25,90,50,40,48,20,3,25,7,30
  DATA " Utman Khel Sipahis            ",6,11,3,52,1,100,0,0,0,0,15,90,55,40,49,20,18,25,7,30
  DATA " Utman Khel Chorachis          ",2,11,3,11,5,100,0,30,0,0,10,90,60,40,49,20,3,25,7,30
  DATA " Mohmand Sipahis               ",6,11,3,52,1,100,0,0,0,0,25,90,50,40,48,20,18,25,7,30
  DATA " Mohmand Jezailchis            ",2,11,3,11,5,100,0,0,0,0,25,90,50,40,48,20,3,25,7,30
  DATA " Khudu Khel Sipahis            ",6,11,3,52,1,100,0,0,0,0,15,90,55,40,49,20,18,25,7,30
  DATA " Khudu Khel Chorachis          ",2,11,3,11,5,100,0,30,0,0,10,90,60,40,49,20,3,25,7,30
  DATA " Bunerwal Sipahis              ",6,11,3,52,1,100,0,0,0,0,25,90,50,40,48,20,18,25,7,30
  DATA " Bunerwal Jezailchis           ",2,11,3,11,5,100,0,0,0,0,25,90,50,40,48,20,3,25,7,30
  DATA " Waziri Sipahis                ",6,11,3,52,1,100,0,0,0,0,15,90,55,40,49,20,18,25,7,30
  DATA " Waziri Jezailchis             ",2,11,3,11,5,100,0,0,0,0,25,90,50,40,48,20,3,25,7,30
  DATA " Mahsud Sipahis                ",6,11,3,52,1,100,0,0,0,0,15,90,55,40,49,20,18,25,7,30
  DATA " Mahsud Jezailchis             ",2,11,3,11,5,100,0,0,0,0,25,90,50,40,48,20,3,25,7,30
  '
india8:
  DATA The Northwest Frontier 1882-1900,20,7,19
  DATA " Officers                      ",1,2,3,4,5,6,7,8,9,10,10,10,9,8,7,6,7,8,8,9
  DATA " Ghazi Sipahis                 ",6,11,7,52,3,100,0,0,0,0,20,100,20,60,49,72,18,25,7,30
  DATA " Ghazi Mujehadin               ",2,11,7,11,5,100,0,60,70,0,20,100,20,60,49,20,3,25,7,30
  DATA " Afridi Sipahis                ",6,11,3,52,1,100,0,60,72,0,25,90,50,40,48,70,18,25,7,30
  DATA " Afridi Mujehadin             ",2,11,3,11,5,100,0,80,72,0,25,90,50,40,48,70,3,25,7,30
  DATA " Orakzai Sipahis               ",6,11,3,52,1,100,0,0,0,0,15,90,55,40,49,72,18,25,7,30
  DATA " Orakzai Jezailchis            ",2,11,3,11,5,100,0,70,72,0,25,90,50,40,48,20,3,25,7,30
  DATA " Mohmand Sipahis               ",6,11,3,52,1,100,0,0,0,0,25,90,50,40,48,89,18,25,7,30
  DATA " Mohmand Jezailchis            ",2,11,3,11,5,100,0,60,89,0,25,90,50,40,48,20,3,25,7,30
  DATA " Hazara Sipahis                ",6,11,3,52,1,100,0,0,0,0,15,90,55,40,49,20,18,25,7,30
  DATA " Hazara Jezailchis             ",2,11,3,11,5,100,0,30,0,0,10,90,60,40,49,20,3,25,7,30
  DATA " Bunerwal Sipahis              ",6,11,3,52,1,100,0,0,0,0,25,90,50,40,48,70,18,25,7,30
  DATA " Bunerwal Jezailchis           ",2,11,3,11,5,100,0,50,70,0,25,90,50,40,48,20,3,25,7,30
  DATA " Waziri Sipahis                ",6,11,3,52,1,100,0,50,70,0,15,90,55,40,49,20,18,25,7,30
  DATA " Waziri Jezailchis             ",2,11,3,11,5,100,0,70,70,0,25,90,50,40,48,20,3,25,7,30
  DATA " Mahsud Sipahis                ",6,11,3,52,1,100,0,0,0,0,15,90,55,40,49,72,18,25,7,30
  DATA " Mahsud Mujehadin             ",2,11,3,11,5,100,0,90,72,0,25,90,50,40,48,70,3,25,7,30
  DATA " Chitrali Sipahis              ",6,11,3,52,1,100,0,50,72,0,15,90,55,40,49,70,18,25,7,30
  DATA " Chitrali Jezailchis           ",2,11,3,11,5,100,0,50,70,0,25,90,50,40,48,20,3,25,7,30
  '

SUB putem
 DEF SEG = SSEG(tdat$)
 BSAVE "C:\ecw\bandi3\armies.dat\india.arm", SADD(tdat$), LEN(tdat$)
END SUB

SUB test
OPEN "A:\armies.dat\india.arm" FOR INPUT AS #1
x% = LOF(1)
tdat$ = STRING$(x%, " ")
 DEF SEG = SSEG(tdat$)
 BLOAD "A:\armies.dat\india.arm", SADD(tdat$)
OPEN "A:\armies.nam\india.nam" FOR INPUT AS #2
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

