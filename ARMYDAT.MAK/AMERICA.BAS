OPTION BASE 1
DECLARE SUB test ()
DECLARE SUB putem ()
DECLARE SUB test2 ()
COMMON SHARED troopname$(), title$(), tdat$, troopdata%(), offset%, tx$
DIM troopname$(500), title$(15), tdat%(10, 3), troopdata%(500, 18)
OPEN "C:\ecw\bandi3\armies.nam\namerica.nam" FOR OUTPUT AS #1
offset% = 1
tdat$ = ""
WRITE #1, " Armies of North America", "16"
FOR i% = 1 TO 16
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
'usa1:
  DATA U.S. Army of the Potomac 1861 ,40,1,16
  DATA " Officers                 ",1,2,3,4,5,6,7,8,9,10,2,3,5,7,9,2,4,6,3,5
  DATA " U.S. Infantry            ",2,2,2,26,8,100,0,0,0,0,50,90,30,45,10,27,1,50,1,60
  DATA " New England Volunteers   ",2,4,5,26,8,100,0,80,64,0,40,95,40,40,8,3,1,40,1,60
  DATA " New England Militia      ",2,7,4,26,8,100,0,80,64,0,35,95,40,40,8,3,1,40,1,60
  DATA " New York Irish           ",2,4,5,26,8,100,0,0,0,0,30,95,50,50,8,3,1,40,1,60
  DATA " New York State Militia   ",2,7,4,26,8,100,0,0,0,0,40,95,50,40,8,3,1,40,1,60
  DATA " North Western Volunteers ",2,4,4,26,8,100,0,80,165,0,40,95,40,40,8,3,1,40,1,60
  DATA " Zouaves                  ",2,4,4,26,8,100,0,0,0,0,40,95,40,50,8,65,1,40,1,60
  DATA " Sharpshooters            ",2,4,4,26,8,100,0,0,0,0,40,95,35,50,8,66,1,40,1,60
  DATA " U.S. Cavalry             ",6,2,2,56,2,144,0,0,0,0,50,90,30,50,8,44,8,30,1,60
  DATA " Volunteer Cavalry        ",6,4,4,56,4,152,0,20,0,0,30,90,40,50,8,40,8,30,1,60
  DATA " Volunteer Lancers        ",6,4,4,56,4,152,0,20,0,0,30,90,40,50,8,40,9,30,1,60
  DATA " Marines                  ",2,2,2,26,4,80,0,0,0,0,50,90,25,50,10,64,1,50,1,60
  DATA " Light Battery            ",9,2,3,61,3,35,6,0,0,0,50,90,20,10,11,15,2,50,1,4
  DATA " Rifled Battery           ",9,2,3,61,3,35,6,0,0,0,50,90,20,10,11,162,2,50,1,13
  DATA " Rifled Battery           ",9,2,3,61,3,35,6,0,0,0,50,90,20,10,11,16,2,50,1,13
  '
usa2:
  DATA U.S. Armies of Tennessee & Ohio 1861 ,40,1,12
  DATA " Officers                 ",1,2,3,4,5,6,7,8,9,10,2,3,5,7,9,2,4,6,3,5
  DATA " U.S. Infantry            ",2,2,2,26,8,100,0,0,0,0,50,90,30,45,10,27,1,50,1,60
  DATA " State Volunteers         ",2,4,4,26,8,100,0,80,165,0,40,95,40,40,8,3,1,40,1,60
  DATA " State Militia            ",2,7,4,26,8,100,0,50,1,0,30,95,45,50,8,3,1,40,1,60
  DATA " Zouaves                  ",2,4,4,26,8,100,0,0,0,0,40,95,35,50,8,65,1,40,1,60
  DATA " Sharpshooters            ",2,4,4,26,8,100,0,0,0,0,40,95,40,40,8,65,1,40,1,60
  DATA " U.S. Cavalry             ",6,2,2,56,2,144,0,0,0,0,50,90,30,50,8,44,8,30,1,60
  DATA " Volunteer Cavalry        ",6,4,4,56,2,144,0,10,0,0,30,90,40,50,8,18,8,30,1,60
  DATA " Marines                  ",2,2,2,26,4,80,0,0,0,0,50,90,25,50,10,64,1,50,1,60
  DATA " Rifled Battery           ",9,2,3,61,3,35,6,0,0,0,50,90,20,10,11,162,2,50,1,13
  DATA " Light Battery            ",9,2,3,61,3,35,6,2,147,0,50,90,20,10,11,143,2,50,1,4
  DATA " Mountain Battery         ",11,2,3,62,2,30,4,0,0,0,50,90,20,10,11,148,2,50,1,4
  '
usa3:
  DATA U.S. Army Missouri 1861 ,40,1,13
  DATA " Officers                 ",1,2,3,4,5,6,7,8,9,10,2,3,5,7,9,2,4,6,3,5
  DATA " U.S. Infantry            ",2,2,2,26,8,100,0,0,0,0,50,90,30,45,10,27,1,50,1,60
  DATA " Mid Western Volunteers   ",2,4,4,26,8,100,0,80,165,0,40,95,40,40,8,3,1,40,1,60
  DATA " Rifle Recruits           ",2,4,4,26,8,100,0,0,0,0,40,95,40,50,8,65,1,40,1,60
  DATA " Missouri Home Guard      ",1,7,4,27,6,100,0,90,124,0,40,95,50,40,8,3,1,40,1,60
  DATA " U.S. Cavalry             ",6,2,2,56,2,144,0,0,0,0,50,90,30,50,8,44,8,30,1,60
  DATA " Volunteer Cavalry        ",6,4,4,56,4,152,0,20,2,0,30,90,40,50,8,34,8,30,1,60
  DATA " Kansas Rangers           ",6,4,4,32,4,100,0,30,100,0,30,90,40,50,8,45,13,30,1,60
  DATA " Hussars                  ",6,4,4,56,2,152,0,20,0,0,30,90,40,50,8,49,8,30,1,60
  DATA " Rifled Battery           ",9,2,3,61,3,35,6,0,0,0,50,90,20,10,11,162,2,50,1,13
  DATA " Light Battery            ",9,2,3,61,3,35,6,2,147,0,50,90,20,10,11,143,2,50,1,4
  DATA " Horse Battery            ",9,2,3,61,3,35,6,0,0,0,50,90,20,10,11,143,2,50,1,4
  DATA " Mountain Battery         ",11,2,3,62,2,30,4,0,0,0,50,90,20,10,11,148,2,50,1,4
  '
usa4:
  DATA U.S. Armies of the Potomac & Virginia 1862-3 ,40,1,14
  DATA " Officers                 ",1,2,3,4,5,6,7,8,9,10,2,3,5,7,9,2,4,6,3,5
  DATA " U.S. Infantry            ",2,2,2,26,8,100,0,0,0,0,50,90,30,45,10,27,1,50,1,60
  DATA " Volunteer Infantry       ",2,4,3,26,8,100,0,0,64,0,40,95,35,40,8,28,1,40,1,60
  DATA " New York Irish           ",2,4,3,26,8,100,0,0,0,0,40,95,40,50,8,60,1,40,1,60
  DATA " New York National Guard  ",2,7,3,26,8,100,0,0,0,0,40,95,45,40,8,15,1,40,1,60
  DATA " Zouaves                  ",2,4,3,26,8,100,0,0,0,0,40,95,35,50,8,28,1,40,1,60
  DATA " Sharpshooters            ",2,4,3,26,8,100,0,0,0,0,40,95,30,50,8,61,1,40,1,60
  DATA " U.S. Cavalry             ",6,2,2,56,2,144,0,0,0,0,50,90,30,50,8,44,8,30,1,60
  DATA " Volunteer Cavalry        ",6,2,3,56,4,152,0,0,0,0,40,90,40,50,8,40,8,30,1,60
  DATA " Light Battery            ",9,2,3,61,3,35,6,0,0,0,50,90,20,10,11,15,2,50,1,4
  DATA " Rifled Battery           ",9,2,3,61,3,35,6,0,0,0,50,90,20,10,11,162,2,50,1,13
  DATA " Rifled Battery           ",9,2,3,61,3,35,6,0,0,0,50,90,20,10,11,16,2,50,1,13
  DATA " Rocket Battery           ",13,2,3,62,5,15,10,0,0,0,50,90,20,10,11,63,2,50,1,11
  DATA " Repeater Battery         ",20,2,3,62,3,15,6,0,0,0,50,90,20,10,11,1,2,50,1,11
  '
usa5:
  DATA U.S. Armies of Tennessee & Ohio 1862-3 ,40,1,13
  DATA " Officers                 ",1,2,3,4,5,6,7,8,9,10,2,3,5,7,9,2,4,6,3,5
  DATA " U.S. Infantry            ",2,2,2,26,8,100,0,0,0,0,50,90,30,45,10,27,1,50,1,60
  DATA " State Volunteers         ",2,4,4,26,8,100,0,0,0,0,40,95,35,40,8,13,1,40,1,60
  DATA " State Militia            ",2,4,4,26,8,100,0,0,1,0,30,95,40,50,8,65,1,40,1,60
  DATA " Zouaves                  ",2,4,4,26,8,100,0,0,0,0,40,95,35,50,8,28,1,40,1,60
  DATA " Sharpshooters            ",2,4,4,26,8,100,0,0,0,0,40,95,30,40,8,60,1,40,1,60
  DATA " U.S. Cavalry             ",6,2,2,56,2,144,0,0,0,0,50,90,30,50,8,44,8,30,1,60
  DATA " Volunteer Cavalry        ",6,2,4,56,2,144,0,10,0,0,40,90,40,50,8,51,8,30,1,60
  DATA " Marines                  ",2,2,2,26,4,80,0,0,0,0,50,90,25,50,10,64,1,50,1,60
  DATA " Rifled Battery           ",9,2,3,61,3,35,6,0,0,0,50,90,20,10,11,162,2,50,1,13
  DATA " Light Battery            ",9,2,3,61,3,35,6,0,0,0,50,90,20,10,11,15,2,50,1,4
  DATA " Mountain Battery         ",11,2,3,62,2,30,4,0,0,0,50,90,20,10,11,148,2,50,1,4
  DATA " Repeater Battery         ",20,2,3,62,1,15,2,0,0,0,50,90,20,10,11,3,2,50,1,11
  '
usa6:
  DATA U.S. Armies 1864-5 ,40,1,13
  DATA " Officers                 ",1,2,3,4,5,6,7,8,9,10,2,3,5,7,9,2,4,6,3,5
  DATA " U.S. Infantry            ",2,2,2,26,8,100,0,0,0,0,50,90,30,45,10,27,1,50,1,60
  DATA " Volunteer Infantry       ",2,4,3,26,8,100,0,0,64,0,40,95,35,40,8,156,1,40,1,60
  DATA " Conscript Infantry       ",2,14,3,26,8,100,0,0,0,0,30,80,40,30,8,157,1,30,1,60
  DATA " Colored Infantry         ",2,4,3,26,8,100,0,0,0,0,45,90,40,50,8,157,1,30,1,60
  DATA " Zouaves                  ",2,4,3,26,8,100,0,0,0,0,40,95,35,50,8,158,1,40,1,60
  DATA " Sharpshooters            ",2,4,3,26,8,100,0,0,0,0,40,95,30,50,8,61,1,40,1,60
  DATA " U.S. Cavalry             ",6,2,2,56,2,144,0,0,0,0,50,90,30,50,8,44,8,30,1,60
  DATA " Volunteer Cavalry        ",6,2,3,56,4,152,0,80,18,0,40,90,40,50,8,47,8,30,1,60
  DATA " Colored Cavalry          ",6,2,3,56,4,152,0,0,0,0,45,90,4,50,8,40,8,30,1,60
  DATA " Light Battery            ",9,2,3,61,3,35,6,0,0,0,50,90,20,10,11,15,2,50,1,4
  DATA " Rifled Battery           ",9,2,3,61,3,35,6,0,0,0,50,90,20,10,11,162,2,50,1,5
  DATA " Rifled Battery           ",9,2,3,61,3,35,6,0,0,0,50,90,20,10,11,150,2,50,1,5
  '
usa7:
  DATA U.S. Auxilliaries 1861-5 ,40,1,16
  DATA " Officers                 ",1,2,3,4,5,6,7,8,9,10,2,3,5,7,9,2,4,6,3,5
  DATA " Naval Landing Party      ",2,4,3,32,1,100,0,60,137,0,40,95,35,40,12,32,19,40,1,60
  DATA " U.S. Volunteer Infantry  ",2,22,3,26,6,100,0,0,0,0,30,80,60,30,8,157,1,30,1,60
  DATA " Veteran Reserve Corps    ",2,24,3,26,1,100,0,0,0,0,50,80,30,30,8,3,13,30,1,60
  DATA " Indian Home Guard        ",3,10,3,31,3,100,0,0,0,0,30,85,55,50,10,64,15,40,1,60
  DATA " State Militia            ",1,7,4,27,6,100,0,0,0,0,40,95,50,40,8,157,1,40,1,60
  DATA " Naval Light Battery      ",9,2,3,61,1,25,2,0,0,0,50,90,20,10,11,151,2,50,1,5
  DATA " Heavy Battery            ",12,2,3,61,3,35,6,0,0,0,50,90,20,10,11,17,2,50,1,13
  DATA " 24lb Siege Battery       ",14,2,3,61,1,35,2,0,0,0,50,90,20,10,11,170,2,50,1,4
  DATA " 32lb Siege Battery       ",14,2,3,61,1,35,2,0,0,0,50,90,20,10,11,14,2,50,1,4
  DATA " Dahlgren Siege Battery   ",14,2,3,61,1,35,2,0,0,0,50,90,20,10,11,153,2,50,1,13
  DATA " Parrott Siege Battery    ",14,2,3,61,1,35,2,0,0,0,50,90,20,10,11,18,2,50,1,13
  DATA " Ames Siege Battery       ",14,2,3,61,1,40,2,0,0,0,50,90,20,10,11,169,2,50,1,13
  DATA " Ordnance Siege Battery   ",14,2,3,61,1,35,2,0,0,0,50,90,20,10,11,178,2,50,1,13
  DATA " 8 inch Siege Battery     ",14,2,3,61,1,45,2,0,0,0,50,90,20,10,11,182,2,50,1,4
  DATA " Siege Rocket Battery     ",13,2,3,61,5,20,10,0,0,0,50,90,20,10,11,183,2,50,1,11
  '
usa8:
  DATA C.S. Army of the Potomac 1861 ,50,1,15
  DATA " Officers                   ",1,2,3,4,5,6,7,8,9,10,2,3,5,7,9,2,4,6,3,5
  DATA " North Carolina Volunteers  ",2,4,4,26,8,100,0,90,100,0,40,95,30,50,8,3,1,40,1,60
  DATA " South Carolina Volunteers  ",2,4,4,26,8,100,0,70,204,0,40,95,30,50,8,3,1,40,1,60
  DATA " Virginia Volunteers        ",2,4,4,26,8,100,0,60,27,0,40,95,30,50,8,3,1,40,1,60
  DATA " Louisiana Volunteers       ",2,4,4,26,8,100,0,80,100,0,40,95,30,50,8,3,1,40,1,60
  DATA " Mississippi Volunteers     ",2,4,4,26,8,100,0,70,100,0,40,95,30,50,8,1,1,40,1,60
  DATA " Georgia Volunteers         ",2,4,4,26,8,100,0,60,100,0,40,95,30,50,8,3,1,40,1,60
  DATA " Alabama Volunteers         ",2,4,4,26,8,100,0,60,100,0,40,95,30,50,8,3,1,40,1,60
  DATA " Tennessee Volunteers       ",2,4,4,26,8,100,0,70,100,0,40,95,30,50,8,1,1,40,1,60
  DATA " Zouaves                    ",2,4,4,26,8,60,0,60,3,0,40,95,35,60,8,27,1,50,1,60
  DATA " Legionaires                ",2,4,4,26,8,60,0,0,0,0,40,95,35,50,8,123,1,45,1,60
  DATA " Cavalry                    ",6,2,4,56,5,144,0,50,100,0,50,90,30,60,10,18,13,30,1,60
  DATA " Light Battery              ",9,2,3,61,2,35,4,2,147,0,50,90,20,10,11,143,2,50,1,4
  DATA " Mountain Howitzers         ",11,2,3,62,2,30,4,0,0,0,50,90,20,10,11,148,2,50,1,4
  DATA " Heavy Battery              ",9,2,3,61,2,35,4,2,17,0,50,90,20,10,11,149,2,50,1,4
  '
usa9:
  DATA C.S. Army of the Mississippi 1861 ,50,1,17
  DATA " Officers                   ",1,2,3,4,5,6,7,8,9,10,2,3,5,7,9,2,4,6,3,5
  DATA " Missouri Volunteers        ",2,4,4,26,8,100,0,80,100,0,40,95,30,50,8,3,1,40,1,60
  DATA " Mississippi Volunteers     ",2,4,4,26,8,100,0,70,100,0,40,95,30,50,8,1,1,40,1,60
  DATA " Texas Volunteers           ",2,4,4,26,8,100,0,60,100,0,40,95,30,50,8,3,1,40,1,60
  DATA " Louisiana Volunteers       ",2,4,4,26,8,100,0,80,100,0,40,95,30,50,8,3,1,40,1,60
  DATA " Mississippi Volunteers     ",2,4,4,26,8,100,0,70,100,0,40,95,30,50,8,1,1,40,1,60
  DATA " Alabama Volunteers         ",2,4,4,26,8,100,0,60,100,0,40,95,30,50,8,3,1,40,1,60
  DATA " Tennessee Volunteers       ",2,4,4,26,8,100,0,70,100,0,40,95,30,50,8,1,1,40,1,60
  DATA " Arkansas Volunteers        ",2,4,4,26,8,100,0,90,100,0,40,95,30,50,8,3,1,40,1,60
  DATA " Florida Volunteers         ",2,4,4,26,8,100,0,70,204,0,40,95,30,50,8,3,1,40,1,60
  DATA " Zouaves                    ",2,4,4,26,8,60,0,60,3,0,40,95,35,60,8,27,1,50,1,60
  DATA " Response Guards            ",1,7,4,26,8,60,0,50,100,0,30,90,40,50,8,3,1,35,1,60
  DATA " Cavalry                    ",6,2,4,56,5,144,0,50,100,0,50,90,30,60,10,18,13,30,1,60
  DATA " Georgia Dragoons           ",6,2,4,56,2,144,0,50,100,0,50,90,30,60,10,18,13,30,1,60
  DATA " Light Battery              ",9,2,4,61,2,35,4,2,147,0,50,90,20,10,11,143,2,50,1,4
  DATA " Mountain Howitzers         ",11,2,4,62,2,30,4,0,0,0,50,90,20,10,11,148,2,50,1,4
  DATA " Heavy Battery              ",9,2,4,61,2,35,4,2,17,0,50,90,20,10,11,149,2,50,1,4
  '
usa10:
  DATA C.S. Army of the West 1861 ,50,1,17
  DATA " Officers                   ",1,2,3,4,5,6,7,8,9,10,2,3,5,7,9,2,4,6,3,5
  DATA " Missouri Volunteers        ",2,4,4,26,8,100,0,80,100,0,40,95,30,50,8,3,1,40,1,60
  DATA " Mississippi Volunteers     ",2,4,4,26,8,100,0,70,100,0,40,95,30,50,8,1,1,40,1,60
  DATA " Texas Volunteers           ",2,4,4,26,8,100,0,60,100,0,40,95,30,50,8,3,1,40,1,60
  DATA " Louisiana Volunteers       ",2,4,4,26,8,100,0,70,100,0,40,95,30,50,8,1,1,40,1,60
  DATA " Creek Infantry             ",2,11,4,26,5,100,0,70,216,0,20,95,50,50,8,21,14,30,1,60
  DATA " Osage Infantry             ",2,11,4,26,5,100,0,70,216,0,20,95,50,50,8,21,15,30,1,60
  DATA " Cavalry                    ",6,4,4,56,5,144,0,50,100,0,40,90,30,60,10,18,13,30,1,60
  DATA " Arkansas Mounted Rifles    ",6,4,4,56,5,144,0,80,100,0,40,90,30,60,10,64,13,30,1,60
  DATA " Texas Mounted Rifles       ",6,4,4,56,5,144,0,90,100,0,40,90,30,60,10,123,13,30,1,60
  DATA " Cherokee Mounted Rifles    ",6,11,3,56,5,100,0,50,216,0,20,90,40,60,10,64,14,30,1,60
  DATA " Choctaw Mounted Rifles     ",6,11,3,56,3,100,0,50,21,0,20,90,50,60,10,41,15,30,1,60
  DATA " Chickasaw Mounted Rifles   ",6,11,3,56,3,100,0,50,21,0,20,90,50,60,10,216,16,30,1,60
  DATA " Seminole cavalry           ",6,11,3,56,3,120,0,50,21,0,30,90,30,60,10,190,13,30,1,60
  DATA " Light Battery              ",9,2,3,61,2,35,4,2,147,0,50,90,20,10,11,143,2,50,1,4
  DATA " Mountain Howitzers         ",11,2,3,62,2,30,4,0,0,0,50,90,20,10,11,148,2,50,1,4
  DATA " Heavy Battery              ",9,2,3,61,2,35,4,2,17,0,50,90,20,10,11,149,2,50,1,4
  '
usa11:
  DATA C.S. Army of Virginia 1862-65 ,50,1,11
  DATA " Officers                ",1,2,3,4,5,6,7,8,9,10,2,3,5,7,9,2,4,6,3,5
  DATA " Infantry                ",2,4,2,26,8,100,0,90,3,0,50,95,30,50,8,15,1,55,1,60
  DATA " Zouaves                 ",2,4,2,26,8,60,0,50,15,0,50,95,30,60,8,123,1,60,1,60
  DATA " Sharpshooters           ",2,4,2,26,8,60,0,90,195,0,50,95,30,50,8,15,1,65,1,60
  DATA " Cavalry                 ",6,2,2,56,5,144,0,70,36,0,50,95,30,60,10,18,13,50,1,60
  DATA " Light Battery           ",9,2,2,61,2,35,4,2,147,0,50,90,20,10,11,143,2,50,1,4
  DATA " Heavy Battery           ",9,2,2,61,2,35,4,2,17,0,50,90,20,10,11,15,2,50,1,4
  DATA " Mountain Howitzers      ",11,2,2,62,2,30,4,0,0,0,50,90,20,10,11,148,2,50,1,4
  DATA " Rifled Battery          ",9,2,2,61,2,35,4,2,164,0,50,90,20,10,11,158,2,50,1,5
  DATA " Rifled Light Battery    ",9,2,2,61,1,20,2,0,0,0,50,90,20,10,11,36,2,50,1,10
  DATA " Repeater Battery        ",20,2,3,62,1,15,2,0,0,0,50,90,20,10,11,19,13,50,1,11
  '
usa12:
  DATA Other C.S. Armies 1862-65 ,50,1,15
  DATA " Officers                ",1,2,3,4,5,6,7,8,9,10,2,3,5,7,9,2,4,6,3,5
  DATA " Infantry                ",2,4,2,26,8,100,0,90,3,0,50,95,30,50,8,15,1,55,1,60
  DATA " Zouaves                 ",2,4,2,26,8,60,0,50,15,0,50,95,30,60,8,123,1,60,1,60
  DATA " Sharpshooters           ",2,4,2,26,8,60,0,90,195,0,50,95,30,50,8,15,1,65,1,60
  DATA " Cavalry                 ",6,2,2,56,5,144,0,70,30,0,50,95,30,60,10,18,20,50,1,60
  DATA " Light Battery           ",9,2,2,61,2,35,4,2,147,0,50,90,20,10,11,143,2,50,1,4
  DATA " Mountain Howitzers      ",11,2,2,62,2,30,4,0,0,0,50,90,20,10,11,148,2,50,1,4
  DATA " Heavy Battery           ",9,2,2,61,2,35,4,2,149,0,50,90,20,10,11,149,2,50,1,4
  DATA " Rifled Battery          ",9,2,2,61,2,35,4,0,0,0,50,90,20,10,11,163,2,50,1,5
  DATA " Creek Infantry          ",2,11,4,26,5,100,0,70,27,0,20,95,50,50,8,21,14,30,1,60
  DATA " Osage Infantry          ",2,11,4,26,5,100,0,70,64,0,20,95,50,50,8,21,15,30,1,60
  DATA " Cherokee Cavalry        ",6,11,3,56,5,100,0,50,65,0,20,90,40,60,11,64,14,30,1,60
  DATA " Choctaw Cavalry         ",6,11,3,56,3,100,0,50,21,0,20,90,50,60,11,41,15,30,1,60
  DATA " Chickasaw Cavalry       ",6,11,3,56,3,100,0,50,21,0,20,90,50,60,11,216,16,30,1,60
  DATA " Seminole cavalry        ",6,11,3,56,3,120,0,50,21,0,30,90,30,60,11,190,13,30,1,60
  '
usa13:
  DATA C.S. Auxilliaries 1861-5 ,40,1,14
  DATA " Officers                 ",1,2,3,4,5,6,7,8,9,10,2,3,5,7,9,2,4,6,3,5
  DATA " President's Guard        ",2,24,3,26,1,100,0,0,0,0,50,90,30,30,8,29,13,30,1,60
  DATA " Invalid Corps            ",2,24,3,26,1,100,0,0,0,0,50,80,30,30,9,3,13,30,1,60
  DATA " Foriegn Battalions       ",2,22,3,26,6,100,0,0,0,0,30,80,60,30,9,65,1,30,1,60
  DATA " Colored Battalions       ",2,19,3,26,2,100,0,0,0,0,30,80,60,30,9,1,1,30,1,60
  DATA " Infantry Home Guards     ",1,7,4,27,6,100,0,50,3,0,40,85,50,40,8,15,1,40,1,60
  DATA " Cavalry Home Guards      ",6,7,4,27,2,100,0,70,100,0,40,85,50,40,8,35,13,40,1,60
  DATA " Partisan Raiders         ",6,25,4,27,3,50,0,70,30,0,30,95,50,60,8,18,20,40,1,60
  DATA " 24lb Siege Battery       ",14,2,3,61,1,35,2,0,0,0,50,90,20,10,11,170,2,50,1,4
  DATA " 32lb Siege Battery       ",14,2,3,61,1,35,2,0,0,0,50,90,20,10,11,14,2,50,1,4
  DATA " Reed Siege Battery       ",14,2,3,61,1,35,2,0,0,0,50,90,20,10,11,179,2,50,1,13
  DATA " Brook Siege Battery      ",14,2,3,61,1,35,2,1,185,0,50,90,20,10,11,186,2,50,1,5
  DATA " 8 inch Siege Battery     ",14,2,3,61,1,45,2,0,0,0,50,90,20,10,11,182,2,50,1,4
  DATA " Rocket Battery           ",13,2,3,61,5,20,10,0,0,0,50,90,20,10,11,62,2,50,1,11
  '
usa14:
  DATA United States Army 1866-74 ,40,1,13
  DATA " Officers                 ",1,2,3,4,5,6,7,8,9,10,2,3,5,7,9,2,4,6,3,5
  DATA " Infantry                 ",2,4,3,26,8,100,0,0,64,0,40,95,35,40,8,37,1,40,1,60
  DATA " Colored Infantry         ",2,4,3,26,8,100,0,0,0,0,45,90,40,50,8,37,1,30,1,60
  DATA " State Militia            ",2,7,4,26,8,100,0,0,0,0,30,95,45,50,8,37,1,40,1,60
  DATA " Marines                  ",2,4,3,26,8,100,0,0,64,0,45,95,30,40,8,37,1,40,1,60
  DATA " U.S. Cavalry             ",6,2,2,56,4,152,0,0,0,0,50,90,30,50,8,48,8,30,1,60
  DATA " Colored Cavalry          ",6,2,3,56,4,152,0,0,0,0,45,90,4,50,8,44,8,30,1,60
  DATA " Militia Cavalry          ",6,7,3,56,4,120,0,0,0,0,45,90,4,50,8,92,8,30,1,60
  DATA " Light Battery            ",9,2,3,61,3,35,6,0,0,0,50,90,20,10,11,162,2,50,1,5
  DATA " Horse Battery            ",10,2,3,61,3,25,6,0,0,0,50,90,20,10,11,162,2,50,1,5
  DATA " Mountain Battery         ",11,2,3,61,1,20,2,0,0,0,50,90,20,10,11,151,2,50,1,5
  DATA " Heavy Battery            ",12,2,3,61,3,35,6,0,0,0,50,90,20,10,11,17,2,50,1,5
  DATA " Repeater Battery         ",20,2,3,62,1,15,2,0,0,0,50,90,20,10,11,4,2,50,1,15
  '
usa15:
  DATA United States Army 1874-98 ,40,1,14
  DATA " Officers                 ",1,2,3,4,5,6,7,8,9,10,2,3,5,7,9,2,4,6,3,5
  DATA " Infantry                 ",2,4,3,26,8,100,0,0,64,0,40,95,35,40,8,85,1,40,1,60
  DATA " Colored Infantry         ",2,4,3,26,8,100,0,0,0,0,45,90,40,50,8,85,1,30,1,60
  DATA " State Militia            ",2,7,4,26,8,100,0,0,0,0,30,95,45,50,8,37,1,40,1,60
  DATA " Marines                  ",2,4,3,26,8,100,0,0,64,0,50,95,30,40,8,85,1,40,1,60
  DATA " U.S. Cavalry             ",6,2,2,56,4,152,0,0,0,0,50,90,30,50,8,217,13,30,1,60
  DATA " Colored Cavalry          ",6,2,3,56,4,152,0,0,0,0,45,90,4,50,8,217,13,30,1,60
  DATA " Militia Cavalry          ",6,7,3,56,4,120,0,0,0,0,45,90,4,50,8,202,13,30,1,60
  DATA " Light Battery            ",9,2,3,61,3,35,6,0,0,0,50,90,20,10,11,162,2,50,1,10
  DATA " Horse Battery            ",10,2,3,61,3,25,6,0,0,0,50,90,20,10,11,162,2,50,1,10
  DATA " Mountain Battery         ",11,2,3,61,1,20,2,0,0,0,50,90,20,10,11,151,2,50,1,10
  DATA " Heavy Battery            ",12,2,3,61,3,35,6,0,0,0,50,90,20,10,11,17,2,50,1,10
  DATA " Repeater Battery         ",20,2,3,62,1,15,2,0,0,0,50,90,20,10,11,5,2,50,1,15
  DATA " Marine Battery           ",20,2,3,62,1,15,2,0,0,0,50,95,20,10,11,7,2,50,1,15
  '
usa16:
  DATA American Plains Indians 1860-1895,50,15,10
  DATA " Officers                ",1,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,2,3
  DATA " Sioux Warriors          ",6,11,3,39,5,50,0,50,106,0,30,90,40,50,33,40,21,30,15,30
  DATA " Blackfoot Warriors      ",6,11,3,39,5,50,0,50,108,0,25,95,45,50,33,42,21,30,15,30
  DATA " Paioute Warriors        ",6,11,3,39,5,50,0,50,106,0,20,85,45,50,33,44,21,30,15,30
  DATA " Crow Warriors           ",6,11,3,39,5,50,0,50,108,0,25,90,45,50,33,45,21,30,15,30
  DATA " Arapaho Warriors        ",6,11,3,39,5,50,0,50,106,0,20,90,50,50,33,46,21,30,15,30
  DATA " Comanche Warriors       ",6,11,3,39,5,50,0,50,108,0,25,95,45,50,33,47,21,30,15,30
  DATA " Cheyanne Dog Soldiers   ",6,11,3,39,5,50,0,50,106,0,30,90,40,50,33,49,21,30,15,30
  DATA " Apache Warriors         ",6,11,3,39,5,50,0,50,108,0,30,90,40,50,33,60,21,30,15,30
  DATA " Comancheros             ",6,11,3,39,5,50,0,50,106,0,30,80,50,50,33,92,13,30,15,30
  '

SUB putem
 DEF SEG = SSEG(tdat$)
 BSAVE "C:\ecw\bandi3\armies.dat\namerica.arm", SADD(tdat$), LEN(tdat$)
END SUB

SUB test
OPEN "A:\armies.dat\namerica.arm" FOR INPUT AS #1
x% = LOF(1)
tdat$ = STRING$(x%, " ")
 DEF SEG = SSEG(tdat$)
 BLOAD "A:\armies.dat\namerica.arm", SADD(tdat$)
OPEN "A:\armies.nam\namerica.nam" FOR INPUT AS #2
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

