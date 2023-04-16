Attribute VB_Name = "Module1"
Option Base 1
DECLARE SUB test ()
DECLARE SUB putem ()
DECLARE SUB test2 ()
COMMON SHARED troopname$(), title$(), tdat$, troopdata%(), offset%, tx$
Dim troopname$(500), title$(15), tdat%(10, 3), troopdata%(500, 18)
Open "C:\ecw\bandi3\armies.nam\british.nam" For Output As #1
offset% = 1
tdat$ = ""
Write #1, " British Armies ", "10"
For i% = 1 To 10
   READ title$, a%, lang%, numtroops%
   Write #1, title$, a%, lang%, numtroops%
   For k% = 1 To numtroops%
     READ x$
     x$ = x$ + "                                                "
     x$ = Left$(x$, 50)
     Print x$
     tdat$ = tdat$ + x$
     For l% = 1 To 20
       READ troopdata%
       x$ = MKI$(troopdata%)
       tdat$ = tdat$ + x$
       Print troopdata%; ",";
       Next l%
     Print
     Next k%
     Next i%
Call putem
Close #1
Rem CALL test
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
brit1:
  DATA British Indian Mutiny 1856-1858,60,1,19
  Data " Officers               ", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 4, 5, 4, 7
  Data " Light Infantry         ", 2, 2, 3, 2, 8, 85, 0, 0, 0, 0, 50, 90, 15, 65, 9, 15, 1, 60, 1, 60
  Data " Rifles                 ", 2, 16, 3, 2, 8, 85, 0, 0, 0, 0, 60, 100, 10, 60, 9, 15, 1, 70, 1, 60
  Data " Highlanders            ", 1, 2, 3, 1, 8, 100, 0, 0, 0, 0, 50, 100, 20, 65, 9, 15, 1, 50, 24, 60
  Data " Line Infantry          ", 1, 2, 3, 1, 8, 85, 0, 0, 0, 0, 50, 90, 15, 55, 9, 15, 1, 50, 1, 60
  Data " H.E.I.C Infantry       ", 1, 2, 3, 1, 8, 90, 0, 0, 0, 0, 50, 90, 20, 50, 10, 15, 1, 50, 1, 60
  Data " H.E.I.C Fusiliers      ", 2, 2, 3, 2, 8, 90, 0, 0, 0, 0, 50, 90, 20, 50, 10, 15, 1, 55, 1, 60
  Data " Marines                ", 2, 2, 3, 2, 6, 85, 0, 0, 0, 0, 50, 100, 15, 65, 9, 11, 1, 60, 1, 60
  Data " Punjab Infantry        ", 1, 2, 3, 1, 8, 90, 0, 0, 0, 0, 40, 85, 35, 40, 10, 3, 1, 40, 1, 60
  Data " Gurkha Infantry        ", 2, 2, 3, 2, 8, 90, 0, 0, 0, 0, 40, 90, 25, 60, 10, 3, 1, 45, 1, 60
  Data " Dragoons               ", 7, 2, 3, 41, 3, 160, 0, 0, 0, 0, 40, 100, 15, 75, 8, 18, 8, 20, 1, 40
  Data " Light Dragoons         ", 6, 2, 3, 42, 3, 160, 0, 0, 0, 0, 40, 110, 15, 75, 8, 18, 8, 20, 1, 40
  Data " Lancers                ", 6, 2, 3, 42, 3, 160, 0, 0, 0, 0, 40, 100, 15, 75, 8, 141, 9, 20, 1, 40
  Data " Sikh Lancers           ", 6, 2, 3, 42, 4, 120, 0, 0, 0, 0, 50, 85, 30, 50, 10, 4, 9, 20, 1, 60
  Data " Silladar Horse         ", 6, 10, 3, 52, 8, 120, 0, 0, 0, 0, 50, 90, 40, 60, 11, 117, 9, 30, 1, 60
  Data " Irregular Horse        ", 6, 4, 3, 54, 3, 80, 0, 50, 100, 0, 30, 100, 25, 70, 31, 44, 13, 30, 1, 40
  Data " Foot Battery           ", 9, 2, 3, 61, 3, 50, 6, 1, 10, 0, 60, 90, 10, 10, 11, 5, 2, 50, 1, 3
  Data " Position Battery       ", 9, 2, 3, 61, 3, 50, 6, 0, 0, 0, 60, 90, 10, 10, 10, 7, 2, 50, 1, 3
  Data " Horse Battery          ", 10, 2, 3, 62, 3, 50, 6, 1, 10, 0, 50, 100, 10, 10, 11, 2, 2, 50, 1, 3
  '
brit2:
  DATA British in the Crimea 1854-1856,60,1,18
  Data " Officers            ", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 4, 5, 4, 7
  Data " Foot Guards         ", 1, 1, 3, 1, 8, 100, 0, 0, 0, 0, 70, 100, 10, 70, 8, 10, 1, 50, 1, 60
  Data " Fusiliers           ", 1, 16, 3, 1, 8, 85, 0, 0, 0, 0, 60, 90, 15, 60, 9, 10, 1, 55, 1, 60
  Data " Light Infantry      ", 2, 2, 3, 2, 8, 85, 0, 0, 0, 0, 50, 90, 15, 65, 9, 10, 1, 60, 1, 60
  Data " Rifles              ", 2, 16, 3, 2, 8, 85, 0, 0, 0, 0, 60, 100, 10, 60, 9, 10, 1, 70, 1, 60
  Data " Highlanders         ", 1, 2, 3, 1, 8, 100, 0, 0, 0, 0, 50, 100, 20, 65, 9, 10, 1, 50, 24, 60
  Data " Line Infantry       ", 1, 2, 3, 1, 8, 85, 0, 0, 0, 0, 50, 90, 15, 55, 9, 10, 1, 50, 1, 60
  Data " Marines             ", 2, 2, 3, 2, 6, 85, 0, 0, 0, 0, 50, 90, 15, 65, 9, 11, 1, 60, 1, 60
  Data " Horse Guards        ", 7, 1, 3, 41, 3, 150, 0, 0, 0, 0, 40, 110, 10, 80, 8, 4, 8, 20, 1, 40
  Data " Dragoons            ", 7, 2, 3, 41, 3, 160, 0, 0, 0, 0, 30, 100, 15, 75, 8, 4, 8, 20, 1, 40
  Data " Light Dragoons      ", 6, 2, 3, 42, 3, 160, 0, 0, 0, 0, 30, 110, 20, 75, 8, 4, 8, 20, 1, 40
  Data " Hussars             ", 6, 2, 3, 42, 3, 160, 0, 0, 0, 0, 30, 110, 20, 75, 8, 4, 8, 20, 1, 40
  Data " Lancers             ", 6, 2, 3, 42, 3, 160, 0, 0, 0, 0, 40, 100, 20, 75, 8, 4, 9, 20, 1, 40
  Data " Foot Battery        ", 9, 2, 3, 61, 3, 50, 6, 1, 10, 0, 60, 90, 10, 10, 11, 5, 2, 50, 1, 3
  Data " Position Battery    ", 9, 2, 3, 61, 1, 50, 2, 0, 0, 0, 60, 90, 10, 10, 11, 8, 2, 50, 1, 3
  Data " Light Horse Battery ", 10, 2, 3, 62, 3, 50, 6, 1, 10, 0, 50, 100, 10, 10, 11, 2, 2, 50, 1, 3
  Data " Heavy Horse Battery ", 10, 2, 3, 62, 3, 50, 6, 1, 10, 0, 50, 100, 10, 10, 11, 5, 2, 50, 1, 3
  Data " Rocket Troop        ", 13, 2, 3, 62, 4, 45, 8, 0, 0, 0, 50, 100, 20, 10, 12, 62, 2, 50, 1, 11
  '
brit3:
  DATA British in Abyssinia 1867-1869,60,1,14
  Data " Officers               ", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 4, 5, 4, 7
  Data " Highlanders            ", 1, 2, 3, 17, 8, 100, 0, 0, 0, 0, 50, 100, 20, 65, 9, 70, 1, 50, 24, 60
  Data " Infantry               ", 1, 2, 3, 17, 8, 85, 0, 0, 0, 0, 50, 90, 15, 55, 9, 70, 1, 50, 1, 60
  Data " Native Infantry        ", 1, 2, 3, 17, 8, 90, 0, 0, 0, 0, 40, 85, 35, 40, 10, 3, 1, 40, 1, 60
  Data " Native Light Infantry  ", 2, 2, 3, 17, 8, 90, 0, 0, 0, 0, 40, 90, 35, 60, 10, 3, 1, 45, 1, 60
  Data " Dragoon Guards         ", 7, 2, 3, 55, 3, 160, 0, 0, 0, 0, 40, 100, 15, 75, 8, 84, 8, 20, 1, 40
  Data " Light Dragoons         ", 6, 2, 3, 56, 3, 160, 0, 0, 0, 0, 40, 110, 15, 75, 8, 44, 8, 20, 1, 40
  Data " Bengal Lancers         ", 6, 2, 3, 56, 4, 120, 0, 0, 0, 0, 50, 85, 30, 50, 10, 4, 9, 20, 1, 60
  Data " Scind Horse            ", 6, 10, 3, 54, 8, 120, 0, 0, 0, 0, 50, 90, 40, 60, 11, 117, 9, 30, 1, 60
  Data " Light Battery          ", 11, 2, 3, 64, 3, 50, 6, 0, 0, 0, 60, 90, 10, 10, 11, 39, 2, 50, 1, 7
  Data " Heavy Battery          ", 9, 2, 3, 61, 3, 50, 6, 0, 0, 0, 60, 90, 10, 10, 10, 40, 2, 50, 1, 7
  Data " Naval Rocket Battery   ", 13, 2, 3, 62, 2, 45, 4, 0, 0, 0, 50, 100, 20, 10, 12, 77, 2, 50, 1, 11
  Data " Local Infantry Levy    ", 2, 12, 3, 10, 5, 100, 0, 90, 3, 0, 20, 70, 55, 45, 33, 108, 3, 20, 11, 50
  Data " Local Cavalry Levy     ", 6, 12, 3, 51, 5, 100, 0, 90, 3, 0, 20, 90, 55, 45, 33, 108, 9, 20, 11, 50
  '
brit4:
  DATA British in South Africa 1878-1882,60,1,16
  Data " Officers                ", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 4, 5, 4, 7
  Data " Highlanders             ", 1, 2, 3, 17, 8, 100, 0, 0, 0, 0, 50, 100, 20, 65, 9, 72, 1, 50, 24, 100
  Data " Infantry                ", 1, 2, 3, 17, 8, 85, 0, 0, 0, 0, 50, 90, 15, 55, 9, 72, 1, 50, 1, 100
  Data " Blue Jackets            ", 2, 2, 3, 17, 4, 60, 0, 0, 0, 0, 50, 90, 20, 65, 11, 70, 1, 40, 1, 100
  Data " Natal Native Contingent ", 3, 4, 3, 38, 10, 100, 0, 90, 225, 0, 20, 90, 60, 40, 11, 108, 6, 10, 1, 100
  Data " Dragoon Guards          ", 7, 2, 3, 55, 4, 130, 0, 0, 0, 0, 40, 100, 15, 75, 8, 84, 8, 20, 1, 40
  Data " Lancers                 ", 6, 2, 3, 55, 3, 160, 0, 0, 0, 0, 40, 100, 15, 75, 8, 225, 9, 20, 1, 40
  Data " Natal Mounted Police    ", 3, 18, 3, 37, 1, 110, 0, 0, 0, 0, 40, 90, 30, 40, 11, 225, 2, 50, 1, 100
  Data " Mounted Rifle Corps     ", 3, 4, 3, 38, 2, 100, 0, 0, 0, 0, 40, 90, 30, 40, 11, 70, 13, 50, 1, 100
  Data " Frontier Light Horse    ", 3, 4, 3, 38, 2, 100, 0, 0, 0, 0, 40, 90, 30, 40, 11, 101, 13, 50, 1, 100
  Data " Burgher Kommandos       ", 3, 4, 3, 38, 3, 60, 0, 70, 202, 0, 40, 90, 30, 40, 11, 101, 13, 60, 22, 100
  Data " Natal Native Horse      ", 3, 4, 3, 38, 2, 64, 0, 0, 0, 0, 40, 90, 50, 40, 11, 101, 14, 30, 1, 100
  Data " Light Battery           ", 10, 2, 3, 64, 3, 40, 6, 0, 0, 0, 60, 90, 10, 10, 11, 32, 2, 50, 1, 7
  Data " Medium Battery          ", 9, 2, 3, 64, 3, 45, 6, 0, 0, 0, 60, 90, 10, 10, 11, 33, 2, 50, 1, 7
  Data " Gatling Battery         ", 20, 2, 3, 70, 1, 50, 2, 0, 0, 0, 60, 90, 10, 10, 10, 5, 13, 50, 1, 7
  Data " Rocket Detatchment      ", 13, 2, 3, 62, 1, 45, 2, 0, 0, 0, 50, 100, 20, 10, 12, 77, 13, 50, 1, 11
  '
brit15:
  DATA British in Egypt 1882-1883,60,1,21
  Data " Officers                ", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 4, 5, 4, 7
  Data " Highlanders             ", 1, 2, 3, 17, 8, 100, 0, 0, 0, 0, 50, 100, 20, 65, 9, 72, 1, 50, 24, 100
  Data " Infantry                ", 1, 2, 3, 17, 8, 85, 0, 0, 0, 0, 50, 90, 15, 55, 9, 72, 1, 50, 1, 100
  Data " Fusiliers               ", 1, 2, 3, 17, 8, 85, 0, 0, 0, 0, 50, 90, 15, 55, 9, 72, 1, 50, 1, 100
  Data " Rifle Corps             ", 2, 16, 3, 17, 8, 85, 0, 0, 0, 0, 50, 90, 15, 55, 9, 72, 1, 60, 1, 100
  Data " Rifle Volunteers        ", 2, 4, 3, 17, 8, 85, 0, 0, 0, 0, 40, 90, 25, 55, 9, 72, 1, 50, 1, 100
  Data " Blue Jackets            ", 2, 2, 3, 17, 8, 80, 0, 0, 0, 0, 50, 90, 20, 65, 11, 70, 1, 40, 1, 100
  Data " Native Infantry         ", 1, 2, 3, 17, 8, 90, 0, 0, 0, 0, 40, 85, 35, 40, 10, 70, 1, 40, 1, 100
  Data " Native Light Infantry   ", 2, 2, 3, 17, 8, 90, 0, 0, 0, 0, 40, 90, 35, 60, 10, 70, 1, 45, 1, 100
  Data " Household Cavalry       ", 7, 1, 3, 55, 4, 130, 0, 0, 0, 0, 60, 110, 10, 75, 8, 225, 8, 20, 1, 40
  Data " Dragoon Guards          ", 7, 1, 3, 55, 4, 130, 0, 0, 0, 0, 40, 100, 15, 75, 8, 225, 8, 20, 1, 40
  Data " Hussars                 ", 6, 2, 3, 55, 3, 160, 0, 0, 0, 0, 40, 100, 20, 75, 8, 225, 8, 20, 1, 40
  Data " Bengal Lancers          ", 6, 2, 3, 56, 4, 120, 0, 0, 0, 0, 50, 85, 30, 50, 10, 71, 9, 20, 1, 60
  Data " Bengal Cavalry          ", 6, 2, 3, 56, 4, 120, 0, 0, 0, 0, 50, 85, 30, 50, 10, 71, 8, 20, 1, 60
  Data " Mounted Rifle Corps     ", 3, 2, 3, 37, 4, 80, 0, 0, 0, 0, 40, 90, 30, 40, 11, 72, 1, 50, 1, 100
  Data " Mountain Battery        ", 11, 2, 3, 64, 3, 40, 6, 0, 0, 0, 60, 90, 10, 10, 11, 34, 2, 50, 1, 7
  Data " Light Battery           ", 9, 2, 3, 61, 3, 40, 6, 0, 0, 0, 60, 90, 10, 10, 11, 33, 2, 50, 1, 7
  Data " Medium Battery          ", 9, 2, 3, 61, 3, 45, 6, 0, 0, 0, 60, 90, 10, 10, 11, 68, 2, 50, 1, 7
  Data " Heavy Battery           ", 9, 2, 3, 61, 3, 50, 6, 0, 0, 0, 60, 90, 10, 10, 11, 69, 2, 50, 1, 7
  Data " Gatling Battery         ", 20, 2, 3, 70, 1, 50, 2, 0, 0, 0, 60, 90, 10, 10, 10, 5, 13, 50, 1, 7
  Data " Rocket Detatchment      ", 13, 2, 3, 62, 3, 25, 6, 0, 0, 0, 50, 100, 20, 10, 12, 77, 13, 50, 1, 11
  '
brit16:
  DATA British in Egypt 1883-1886,60,1,18
  Data " Officers                ", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 4, 5, 4, 7
  Data " Guards                  ", 1, 1, 3, 17, 8, 100, 0, 0, 0, 0, 70, 110, 10, 65, 9, 72, 1, 40, 1, 100
  Data " Highlanders             ", 1, 2, 3, 17, 8, 100, 0, 0, 0, 0, 50, 100, 20, 65, 9, 72, 1, 50, 24, 100
  Data " Infantry                ", 1, 2, 3, 17, 8, 85, 0, 0, 0, 0, 50, 90, 15, 55, 9, 72, 1, 50, 1, 100
  Data " Fusiliers               ", 1, 2, 3, 17, 8, 85, 0, 0, 0, 0, 50, 90, 15, 55, 9, 72, 1, 50, 1, 100
  Data " Rifle Corps             ", 2, 16, 3, 17, 8, 85, 0, 0, 0, 0, 50, 90, 15, 55, 9, 72, 1, 60, 1, 100
  Data " Blue Jackets            ", 2, 2, 3, 17, 8, 80, 0, 0, 0, 0, 50, 90, 20, 65, 11, 72, 1, 40, 1, 100
  Data " Hussars                 ", 6, 2, 3, 55, 3, 160, 0, 0, 0, 0, 40, 100, 20, 75, 8, 225, 8, 20, 1, 40
  Data " Lancers                 ", 6, 2, 3, 55, 3, 160, 0, 0, 0, 0, 40, 100, 20, 75, 8, 225, 9, 20, 1, 40
  Data " Guards Camel Corps      ", 4, 2, 3, 37, 2, 60, 0, 0, 0, 0, 40, 90, 30, 40, 11, 72, 1, 30, 1, 100
  Data " Camel Corps             ", 4, 2, 3, 37, 2, 60, 0, 0, 0, 0, 40, 90, 30, 40, 11, 72, 1, 30, 1, 100
  Data " Camel Rifle Corps       ", 4, 2, 3, 37, 2, 60, 0, 0, 0, 0, 40, 90, 30, 40, 11, 72, 1, 50, 1, 100
  Data " Abyssinian Scouts       ", 6, 11, 3, 52, 1, 100, 0, 0, 0, 0, 30, 80, 50, 50, 11, 71, 5, 30, 1, 50
  Data " Mountain Battery        ", 11, 2, 3, 64, 3, 40, 6, 0, 0, 0, 60, 90, 10, 10, 11, 34, 2, 50, 1, 7
  Data " Light Battery           ", 9, 2, 3, 61, 3, 40, 6, 0, 0, 0, 60, 90, 10, 10, 11, 33, 2, 50, 1, 7
  Data " Gatling Battery         ", 20, 2, 3, 70, 1, 50, 2, 0, 0, 0, 60, 90, 10, 10, 10, 5, 13, 50, 1, 7
  Data " Naval Battery           ", 20, 2, 3, 64, 1, 50, 2, 0, 0, 0, 60, 90, 10, 10, 10, 10, 13, 50, 1, 7
  Data " Rocket Detatchment      ", 13, 2, 3, 62, 3, 25, 6, 0, 0, 0, 50, 100, 20, 10, 12, 77, 13, 50, 1, 11
  '
brit7:
  DATA British in Egypt 1892-1900,60,1,13
  Data " Officers                ", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 4, 5, 4, 7
  Data " Guards                  ", 1, 1, 3, 17, 8, 100, 0, 0, 0, 0, 70, 110, 10, 65, 9, 97, 1, 40, 1, 100
  Data " Highlanders             ", 1, 2, 3, 17, 8, 100, 0, 0, 0, 0, 50, 100, 20, 65, 9, 97, 1, 50, 24, 100
  Data " Infantry                ", 1, 2, 3, 17, 8, 85, 0, 0, 0, 0, 50, 90, 15, 55, 9, 97, 1, 50, 1, 100
  Data " Blue Jackets            ", 2, 2, 3, 17, 8, 80, 0, 0, 0, 0, 50, 90, 20, 65, 11, 72, 1, 40, 1, 100
  Data " Camel Corps             ", 4, 2, 3, 37, 2, 60, 0, 0, 0, 0, 40, 90, 30, 40, 11, 97, 1, 50, 1, 100
  Data " Hussars                 ", 6, 2, 3, 55, 3, 160, 0, 0, 0, 0, 40, 100, 20, 75, 8, 97, 8, 20, 1, 40
  Data " Lancers                 ", 6, 2, 3, 55, 3, 160, 0, 0, 0, 0, 40, 100, 20, 75, 8, 97, 9, 20, 1, 40
  Data " Native Scouts           ", 6, 11, 3, 52, 3, 100, 0, 0, 0, 0, 30, 80, 50, 50, 11, 225, 8, 30, 1, 50
  Data " Mountain Battery        ", 11, 2, 3, 64, 3, 40, 6, 0, 0, 0, 60, 90, 10, 10, 11, 54, 2, 50, 1, 10
  Data " Field Battery           ", 9, 2, 3, 61, 3, 40, 6, 0, 0, 0, 60, 90, 10, 10, 11, 96, 2, 50, 1, 10
  Data " Heavy Battery           ", 9, 2, 3, 61, 3, 50, 6, 0, 0, 0, 60, 90, 10, 10, 11, 100, 2, 50, 1, 10
  Data " Galloping Battery       ", 20, 2, 3, 70, 1, 50, 2, 0, 0, 0, 60, 90, 10, 10, 10, 16, 13, 50, 1, 15
  '
brit8:
  DATA British in South Africa 1896-1902,60,1,17
  Data " Officers                ", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 4, 5, 4, 7
  Data " Guards                  ", 1, 1, 3, 17, 8, 100, 0, 0, 0, 0, 70, 110, 10, 65, 9, 126, 1, 40, 1, 100
  Data " Highlanders             ", 1, 2, 3, 17, 8, 100, 0, 0, 0, 0, 50, 100, 20, 65, 9, 126, 1, 50, 24, 100
  Data " Infantry                ", 1, 2, 3, 17, 8, 85, 0, 0, 0, 0, 50, 90, 15, 55, 9, 126, 1, 50, 1, 100
  Data " Imperial Infantry       ", 1, 4, 3, 17, 8, 85, 0, 0, 0, 0, 40, 95, 20, 55, 9, 97, 1, 55, 1, 100
  Data " Volunteer Infantry      ", 1, 4, 3, 17, 8, 85, 0, 0, 0, 0, 45, 90, 25, 55, 9, 97, 1, 40, 1, 100
  Data " Mounted Infantry        ", 3, 2, 3, 37, 4, 85, 0, 0, 0, 0, 50, 90, 15, 55, 9, 126, 1, 50, 1, 100
  Data " Infantry                ", 3, 2, 3, 37, 4, 85, 0, 0, 0, 0, 50, 90, 15, 55, 9, 97, 1, 50, 1, 100
  Data " Hussars                 ", 6, 2, 3, 55, 3, 160, 0, 0, 0, 0, 40, 100, 20, 97, 8, 97, 8, 20, 1, 40
  Data " Lancers                 ", 6, 2, 3, 55, 3, 160, 0, 0, 0, 0, 40, 100, 20, 97, 8, 97, 9, 20, 1, 40
  Data " Mountain Battery        ", 11, 2, 3, 64, 3, 40, 6, 0, 0, 0, 60, 90, 10, 10, 11, 54, 2, 50, 1, 10
  Data " Field Battery           ", 9, 2, 3, 61, 3, 40, 6, 0, 0, 0, 60, 90, 10, 10, 11, 50, 2, 50, 1, 10
  Data " Heavy Battery           ", 10, 2, 3, 61, 3, 50, 6, 0, 0, 0, 60, 90, 10, 10, 11, 100, 2, 50, 1, 10
  Data " Howitzer Battery        ", 9, 2, 3, 61, 3, 40, 6, 0, 0, 0, 60, 90, 10, 10, 11, 191, 2, 50, 1, 10
  Data " Heavy Howitzer Battery  ", 10, 2, 3, 61, 3, 50, 6, 0, 0, 0, 60, 90, 10, 10, 11, 192, 2, 50, 1, 10
  Data " Naval Battery           ", 10, 2, 3, 61, 3, 50, 6, 0, 0, 0, 60, 90, 10, 10, 11, 66, 2, 50, 1, 10
  Data " Galloping Battery       ", 20, 2, 3, 70, 1, 50, 2, 0, 0, 0, 60, 90, 10, 10, 10, 16, 13, 50, 1, 15
  '
brit9:
  DATA British in West Africa 1890-1900,60,1,14
  Data " Officers               ", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 4, 5, 4, 7
  Data " Infantry               ", 1, 2, 3, 17, 8, 85, 2, 0, 16, 0, 50, 90, 15, 55, 9, 97, 1, 50, 1, 100
  Data " Royal Marines          ", 2, 2, 3, 17, 8, 85, 0, 0, 0, 0, 50, 90, 15, 55, 10, 97, 1, 50, 1, 100
  Data " Blue Jackets           ", 2, 2, 3, 17, 4, 60, 0, 0, 0, 0, 50, 90, 20, 65, 11, 72, 1, 40, 1, 100
  Data " Sikh Infantry          ", 2, 2, 3, 17, 8, 90, 0, 0, 0, 0, 40, 90, 35, 60, 10, 97, 1, 45, 1, 100
  Data " West India Regiment    ", 1, 2, 3, 17, 8, 90, 0, 0, 0, 0, 40, 85, 40, 50, 10, 72, 1, 35, 1, 60
  Data " Hausa Corps            ", 1, 2, 3, 17, 8, 90, 2, 0, 15, 0, 40, 95, 40, 50, 10, 72, 1, 35, 1, 60
  Data " West African Rifles    ", 1, 2, 3, 17, 8, 90, 0, 0, 0, 0, 40, 85, 45, 40, 10, 72, 1, 30, 1, 60
  Data " Central African Rifles ", 1, 2, 3, 17, 8, 90, 0, 0, 0, 0, 40, 85, 45, 40, 10, 72, 1, 30, 1, 60
  Data " Local Artillery        ", 11, 2, 3, 64, 1, 50, 2, 0, 0, 0, 60, 90, 10, 10, 11, 34, 2, 50, 1, 7
  Data " Bush Battery           ", 11, 2, 3, 64, 3, 40, 6, 0, 0, 0, 60, 90, 10, 10, 11, 54, 2, 50, 1, 10
  Data " Field Battery          ", 9, 2, 3, 61, 3, 40, 6, 0, 0, 0, 60, 90, 10, 10, 11, 50, 2, 50, 1, 10
  Data " Maxim Battery          ", 20, 2, 3, 64, 1, 50, 2, 0, 0, 0, 60, 90, 10, 10, 10, 16, 13, 50, 1, 15
  Data " Local Auxilliaries     ", 2, 10, 3, 11, 5, 100, 0, 0, 0, 0, 30, 90, 50, 50, 36, 225, 2, 20, 11, 60
  '
brit10:
  DATA British in East Africa 1890-1900,60,1,14
  Data " Officers               ", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 4, 5, 4, 7
  Data " Infantry               ", 1, 2, 3, 17, 8, 85, 2, 0, 16, 0, 50, 90, 15, 55, 9, 97, 1, 50, 1, 100
  Data " Royal Marines          ", 2, 2, 3, 17, 8, 85, 0, 0, 0, 0, 50, 90, 15, 55, 10, 97, 1, 50, 1, 100
  Data " Blue Jackets           ", 2, 2, 3, 17, 4, 60, 0, 0, 0, 0, 50, 90, 20, 65, 11, 72, 1, 40, 1, 100
  Data " Sikh Infantry          ", 2, 2, 3, 17, 8, 90, 0, 0, 0, 0, 40, 90, 35, 60, 10, 97, 1, 45, 1, 100
  Data " East African Rifles    ", 1, 2, 3, 17, 8, 90, 0, 0, 0, 0, 40, 85, 45, 40, 10, 72, 1, 30, 1, 60
  Data " Central African Rifles ", 1, 2, 3, 17, 8, 90, 0, 0, 0, 0, 40, 85, 45, 40, 10, 72, 1, 30, 1, 60
  Data " Mounted Infantry       ", 3, 2, 3, 37, 4, 85, 0, 0, 0, 0, 50, 90, 15, 55, 9, 126, 1, 50, 1, 100
  Data " Hussars                ", 6, 2, 3, 55, 3, 160, 0, 0, 0, 0, 40, 100, 20, 97, 8, 97, 8, 20, 1, 40
  Data " Lancers                ", 6, 2, 3, 55, 3, 160, 0, 0, 0, 0, 40, 100, 20, 97, 8, 97, 9, 20, 1, 40
  Data " Mountain Battery       ", 11, 2, 3, 64, 3, 40, 6, 0, 0, 0, 60, 90, 10, 10, 11, 54, 2, 50, 1, 10
  Data " Field Battery          ", 9, 2, 3, 61, 3, 40, 6, 0, 0, 0, 60, 90, 10, 10, 11, 50, 2, 50, 1, 10
  Data " Maxim Battery          ", 20, 2, 3, 64, 1, 50, 2, 0, 0, 0, 60, 90, 10, 10, 10, 16, 13, 50, 1, 10
  Data " Local Auxilliaries     ", 2, 10, 3, 11, 5, 100, 0, 0, 0, 0, 30, 90, 50, 50, 36, 225, 2, 20, 11, 60
'

Sub putem()
 DEF SEG = SSEG(tdat$)
 BSAVE "c:/ecw/bandi3/armies.dat/british.arm", SADD(tdat$), Len(tdat$)
End Sub

Sub test()
Open "A:\armies.dat\british.arm" For Input As #1
x% = LOF(1)
tdat$ = String$(x%, " ")
 DEF SEG = SSEG(tdat$)
 BLOAD "A:/armies.dat/british.arm", SADD(tdat$)
Open "A:\armies.nam\british.nam" For Input As #2
offs% = -89
For i% = 1 To 15
Cls
Print "Troop replay listing now "
SLEEP
Input #2, title$, a%, lang%, numtroops%
  Print title$, a%, lang%, numtroops%
  For k% = 1 To numtroops%
     offs% = offs% + 90
     x$ = Mid$(tdat$, offs%, 50)
     Print x$;
    For l% = 1 To 35 Step 2
     x% = CVI(Mid$(tdat$, offs% + 50 + l% - 1))
     Print x%; ",";
       Next l%
       If k% = 6 Then
     SLEEP
     End If
     Next k%
     Print
     SLEEP
     Cls
Next i%
Close #1
Close #2
End Sub

