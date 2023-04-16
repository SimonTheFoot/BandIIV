DECLARE SUB pts ()
DECLARE SUB ts (x!)
DECLARE SUB hash8 (x$)

COMMON SHARED force$(), force(), force1$(), deleat(), finame$(), faccr$(), far$(), n1$(), language$(), ntype$(), nation$(), mile$(), mile(), mess$(), mess()
COMMON SHARED fate$(), happy$(), prim$(), brave$(), lbase(), able$(), obase(), loyal$(), skill$(), infl$(), death$(), hcase$(), game$(), action$(), action()
COMMON SHARED weather$(), weather(), terrain$(), terrain(), tyme$(), route$(), route()
COMMON SHARED batres$(), batres(), month$(), month(), days$(), supply$(), supply(), repl$(), repl()
COMMON SHARED armour$(), disease$(), disease(), morale$(), ofrale$(), morale(), aftbat$(), aftbat()
COMMON SHARED type$(), band$(), tipe(), chopper$(), chopper(), chop$(), officer$(), officer(), comand$(), formpos$(), formpos()
COMMON SHARED gun$(), gun(), musket$(), musket(), experience$(), experience(), commit$(), commit(), class$(), class(), who$(), who()
COMMON SHARED guntype$(), gatype$(), mustype$()
COMMON SHARED t$

DIM SHARED force$(37), force(37, 18), force1$(37), deleat(300), finame$(15), faccr$(15), far$(30), n1$(30), language$(30), ntype$(30), nation$(37), mess$(4), mess(4)
DIM SHARED fate$(5), happy$(12), prim$(2), brave$(10), lbase(10), able$(10), obase(10), loyal$(10), skill$(10), infl$(10), death$(10), hcase$(13), game$(10), action$(10), action(10, 3)
DIM SHARED weather$(15), weather(15, 4), terrain$(9), terrain(9, 3), tyme$(3), route$(7), route(7, 2)
DIM SHARED batres$(5), batres(5, 2), month$(12), month(12, 1), days$(7), supply$(8), supply(8), repl$(9), repl(9)
DIM SHARED armour$(6), disease$(35), disease(35, 2), morale$(8), ofrale$(8), morale(8, 4), aftbat$(10), aftbat(10, 8)
DIM SHARED type$(21), band$(21, 4), tipe(21, 3), chopper$(21), chopper(21, 2), chop$(21, 2), officer$(61), officer(61, 2), comand$(8), formpos$(75), formpos(75, 12)
DIM SHARED gun$(100), gun(100, 8), musket$(219), musket(219, 6), experience$(7), experience(7, 4), commit$(7), commit(7, 4), class$(26), class(26, 4), who$(15), who(15, 10)
DIM SHARED guntype$(9), gatype$(8), mustype$(9)



'

OPEN "C:\ecw\bandi3\armies.nam\stridat.nam" FOR OUTPUT AS #8
OPEN "C:\ecw\bandi3\armies.nam\test1.num" FOR OUTPUT AS #5

'

RESTORE nation
FOR q = 1 TO 37
  READ n, nation$(q)
  CALL hash8(nation$(q))
NEXT q

RESTORE mess
FOR q = 1 TO 4
  READ mess$(q), mess(q)
CALL hash8(mess$(q))
CALL ts(mess(q))
NEXT q

'
fate$(1) = " Immediate Death         "
fate$(2) = " Death by due process    "
fate$(3) = " Hard Labour             "
fate$(4) = " Dishonourable Discharge "
fate$(5) = " A Fine                  "
'
FOR q = 1 TO 5
CALL hash8(fate$(q))
NEXT q

RESTORE happy
FOR q = 1 TO 12
  READ n, happy$(q)
  CALL hash8(happy$(q))
NEXT q
'

'
prim$(1) = " Change Primary Weapon   "
prim$(2) = " Change Secondary Weapon "
'
CALL hash8(prim$(1))
CALL hash8(prim$(2))

RESTORE loyal
FOR l = 1 TO 10
  READ brave$(11 - l), lbase(11 - l), able$(11 - l), obase(11 - l)
NEXT l
FOR l = 1 TO 10
CALL hash8(brave$(l))
CALL hash8(able$(l))
CALL ts(lbase(l))
CALL ts(obase(l))
NEXT l

RESTORE loyalty
FOR l = 1 TO 10
  READ loyal$(11 - l), skill$(11 - l)
NEXT l

FOR l = 1 TO 10
CALL hash8(loyal$(l))
CALL hash8(skill$(l))
NEXT l

RESTORE infl
FOR l = 1 TO 10
  READ infl$(11 - l), death$(11 - l)
NEXT l
FOR l = 1 TO 10
CALL hash8(infl$(l))
CALL hash8(death$(l))
NEXT l
 
RESTORE headc
FOR l = 1 TO 13
  READ hcase$(14 - l)
NEXT l

FOR l = 1 TO 13
CALL hash8(hcase$(l))
NEXT l

RESTORE game

FOR q = 1 TO 10
  READ game$(q)
CALL hash8(game$(q))
NEXT q

RESTORE action
'
' 1 number of marches to be attempted
' 2 km expected per march
' 3 attrition from this action
'

FOR q = 1 TO 10
  READ action$(q)
  FOR a = 1 TO 3
    READ b
    CALL ts(b)
    action(q, a) = b
  NEXT a
CALL hash8(action$(q))
NEXT q
RESTORE weather
'
' 1 effect on whether to march
' 2 effect on march rate
' 3 effecting disease
' 4 effecting normal attrition
'

FOR q = 1 TO 15
  READ weather$(q)
  FOR a = 1 TO 4
    READ b
    CALL ts(b)
    weather(q, a) = b
  NEXT a
CALL hash8(weather$(q))
NEXT q
'

RESTORE terrain

'
' 1 effect on travel
' 2 effect on attrition
' 3 effect on disease
'
FOR q = 1 TO 9
  READ terrain$(q)
  FOR a = 1 TO 3
    READ b
    CALL ts(b)
    terrain(q, a) = b
  NEXT a
CALL hash8(terrain$(q))
NEXT q
RESTORE time

FOR l = 1 TO 3
  READ tyme$(l)
CALL hash8(tyme$(l))
NEXT l
'
RESTORE route
'
' 1 effect on travel in good weather
' 2 effect on travel in bad weather
'
FOR q = 1 TO 7
  READ route$(q)
  FOR a = 1 TO 2
    READ b
    CALL ts(b)
    route(q, a) = b
  NEXT a
CALL hash8(route$(q))
NEXT q
RESTORE repl

FOR l = 1 TO 9
  READ repl$(l), repl(l)
CALL hash8(repl$(l))
CALL ts(repl(l))
NEXT l
RESTORE supply

'
' 1 effect on attrition
'
FOR q = 1 TO 8
  READ supply$(q), supply(q)
CALL hash8(supply$(q))
CALL ts(supply(q))
NEXT q
RESTORE days
 
FOR q = 1 TO 7
  READ days$(q)
CALL hash8(days$(q))
NEXT q
'
RESTORE month
 
FOR q = 1 TO 12
  READ month$(q), month(q, 1)
CALL hash8(month$(q))
CALL ts(month(q, 1))
NEXT q
RESTORE batres
'
' 1
' 2
'

FOR q = 1 TO 5
  READ batres$(q)
  FOR a = 1 TO 2
    READ b
    CALL ts(b)
    batres(q, a) = b
  NEXT a
CALL hash8(batres$(q))
NEXT q
'
RESTORE aftbat
'
' 1 minimum action required by enemy if this
' 2 effect of own action on casualties
' 3 effect of action on enemy casualties
' 4 effect of own action on morale
' 5 effect of action on enemy morale
' 6 effect of own action on gun loss
' 7 effect of action on enemy gun loss
' 8 time taken up doing this
'

FOR q = 1 TO 10
  READ aftbat$(q)
  FOR a = 1 TO 8
    READ b
    CALL ts(b)
    aftbat(q, a) = b
  NEXT a
CALL hash8(aftbat$(q))
NEXT q
'
RESTORE status
'
' 1 best view of battle with this morale
' 2 best order after battle
' 3 effect on casualties
'
 
FOR q = 1 TO 8
  READ morale$(q), ofrale$(q)
  FOR a = 1 TO 3
    READ b
    CALL ts(b)
    morale(q, a) = b
  NEXT a
CALL hash8(morale$(q))
CALL hash8(ofrale$(q))
NEXT q
'
RESTORE dis

l = 0
READ disease$(1)
DO UNTIL disease$(l) = "-1"
  l = l + 1
  READ disease(l, 1), disease(l, 2)
  CALL ts(disease(l, 1))
  CALL ts(disease(l, 2))
  READ disease$(l)
  CALL hash8(disease$(l))
LOOP
RESTORE armour

FOR l = 1 TO 6
  READ armour$(l)
CALL hash8(armour$(l))
NEXT l

RESTORE formpos
'
FOR l = 0 TO 75
  a = 0
  READ n, formpos$(l)
  DO
    a = a + 1
    READ b
    formpos(l, a) = b
  CALL ts(b)
  IF b = -1 THEN
  EXIT DO
  END IF
  LOOP
CALL hash8(formpos$(l))
NEXT l
'
RESTORE comand

FOR q = 1 TO 8
  READ comand$(q)
  CALL hash8(comand$(q))
NEXT q
'

RESTORE officer

FOR n = 1 TO 61
  READ officer$(n), a
  READ officer(n, 1), officer(n, 2)
CALL ts(officer(n, 1))
CALL ts(officer(n, 2))
CALL hash8(officer$(n))
NEXT n
'
RESTORE chopper
 
FOR l = 1 TO 21
  READ w, chopper$(l)
  FOR m = 1 TO 2
    READ n
    chopper(l, m) = n
  CALL ts(n)
  NEXT m
  CALL hash8(chopper$(l))
READ chop$(l, 1), chop$(l, 2)
CALL hash8(chop$(l, 1))
CALL hash8(chop$(l, 2))
NEXT l
RESTORE typ

'
' 1 basic tactical move
' 2 basic strategic move
' 3 basic attrition
'
FOR q = 0 TO 20
  READ n, type$(q), band$(q, 1), band$(q, 2), band$(q, 3), band$(q, 4), tipe(q, 1), tipe(q, 2), tipe(q, 3)
CALL hash8(type$(q))
FOR i = 1 TO 4
CALL hash8(band$(q, i))
NEXT i
CALL ts(tipe(q, 1))
CALL ts(tipe(q, 2))
CALL ts(tipe(q, 3))
NEXT q
'
RESTORE class
'
' 1 confidence
' 2 steadyness
' 3 command control
' 4 fire discipline
'

FOR q = 1 TO 26
  READ n, class$(q)
  FOR a = 1 TO 4
    READ b
    class(q, a) = b
  CALL ts(b)
  NEXT a
CALL hash8(class$(q))
NEXT q
RESTORE commit

FOR l = 1 TO 7
  READ v, commit$(l)
  FOR m = 1 TO 4
    READ n
    commit(l, m) = n
  CALL ts(n)
  NEXT m
CALL hash8(commit$(l))
NEXT l
' change to confidence
' change to steadyness
' change to command control
' change to fire discipline
'
RESTORE experience

FOR l = 1 TO 7
  READ v, experience$(l)
  FOR m = 1 TO 4
    READ n
    experience(l, m) = n
  CALL ts(n)
  NEXT m
CALL hash8(experience$(l))
NEXT l

'
  RESTORE gatling
  DIM gatling$(24), gatling(24, 7)
  FOR q = 1 TO 24
    READ a, gatling$(q)
    FOR m = 1 TO 7
      READ n
        CALL ts(n)
    NEXT m
CALL hash8(gatling$(q))
  NEXT q


 RESTORE who
 FOR q = 1 TO 15
    READ a, who$(q)
a = 0
 DO
    a = a + 1
    READ b
    formpos(l, a) = b
  CALL ts(b)
  IF b = -1 THEN
  EXIT DO
  END IF
  LOOP
CALL hash8(who$(q))
NEXT q

  RESTORE guntype
 
  FOR q = 0 TO 9
    READ n, guntype$(q)
CALL hash8(guntype$(q))
NEXT q
  '
    RESTORE gatype
  FOR q = 1 TO 8
    READ gatype$(q), a
  CALL hash8(gatype$(q))
  NEXT q
 
  RESTORE mustype
  FOR q = 0 TO 9
    READ a, mustype$(q)
  CALL hash8(mustype$(q))
  NEXT q
  '
  '


CLOSE #8
PRINT LEN(t$)


END


start:
nation:
  DATA  1," English               "
  DATA  2," German                "
  DATA  3," French                "
  DATA  4," Italian               "
  DATA  5," Spanish               "
  DATA  6," Russian               "
  DATA  7," Muslim Indian         "
  DATA  8," Hindoostani           "
  DATA  9," Sikh                  "
  DATA 10," Ottoman               "
  DATA 11," West African          "
  DATA 12," Chinese               "
  DATA 13," Arab                  "
  DATA 14," South African          "
  DATA 15," American Indian       "
  DATA 16," Greek                 "
  DATA 17," Serbian               "
  DATA 18," Polish                "
  DATA 19," Kandyan               "
  DATA 20," Danish                "
  DATA 21," Swedish               "
  DATA 22," Dutch                 "
  DATA 23," Muslim African        "
  DATA 24," Scottish              "
  DATA 25," Welsh                 "
  DATA 26," Irish                 "
  DATA 27," Hungarian             "
  DATA 28," Bohemian              "
  DATA 29," Roumanian             "
  DATA 30," Bulgarian             "
  DATA 31," Portuguese            "
  DATA 32," European              "
  DATA 33," Armenian              "
  DATA 34," Iranian               "
  DATA 35," Burman                "
  DATA 36," Japanese              "
  DATA 37," Maori                 "
  '

mess:
DATA " 1 to 400  (Suitable for 25mm)                      ",300
DATA " 1 to 600  (Suitable for 15mm or large 25mm games)  ",500
DATA " 1 to 1200 (Suitable for 5/6mm or large 15mm games) ",1000
DATA " A scale of your own choice (1:200 to 1:3000)       ",0
'
happy:
DATA 1," Accept, unchanged        "
DATA 2," the number of men        "
DATA 3," the number of sub units  "
DATA 4," the weapons              "
DATA 5," the experience           "
DATA 6," the committment level    "
DATA 7," the Troop Type           "
DATA 8," the Troop class          "
DATA 9," the formations available "
DATA 10," the Officer              "
DATA 11," the unit's name          "
DATA 12," Reject/delete            "
'
loyal:
DATA " The Rock of loyalty        ",110," An Alexander of Macedon ",120
DATA " Expeditious and courageous ",90," A Great Strategist      ",100
DATA " Fideleous and gallant      ",80," A Competent Stategist   ",92
DATA " Brave and loyal            ",70," Highly competent        ",84
DATA " Trustworthy and brave      ",60," A skilled tactician     ",76
DATA " Dependable enough          ",55," A good enough Soldier   ",65
DATA " Somewhat untrustworthy     ",45," No great Military Skill ",55
DATA " A poor Patriot             ",39," Little Martial Skill    ",45
DATA " A cowardly Scrub           ",28," No Military Inclination ",35
DATA " Worse still                ",20," A clod                  ",25
'
loyalty:
DATA " the utmost Rock of loyalty and valour ","He seems a veritable Alexander of Macedon"
DATA " both expeditious and courageous in his duty ","He is an aknowledged master of the Science Military"
DATA " excelling in fidelity and gallantry ","He seems highly competent in the Military Arts"
DATA " noteworthy in bravery and loyalty ","He seems to be highly competent in the Arts of War"
DATA " trustworthy and dependable and brave ","He seems to be a skilled tactician"
DATA " dependable enough ","He has the look of a good enough Soldier"
DATA " somewhat untrustworthy ","He seems somewhat lacking in Military Skills"
DATA " a poor and backward Patriot ","He has little Martial Skill"
DATA " an unreliable and cowardly Scrub ","The charlatan has no Military Inclination whatsoever"
DATA " a very Poltrone and a Coward ","The clod has the Military Skills of a poor baker"
'
infl:
DATA "he is at the very apogee of War Office esteem.","met his death with the dignity of a true hero. "
DATA "he has prodigious influence at the War Office.","met his death with grave dignity and noble countenance. "
DATA "he has the ear of important men at the War Office.","met his death with a soldier's dignity. "
DATA "he is exceedingly popular at the War Office.","went to his death like a soldier. "
DATA "he is well known at the War Office.","met his end like a man. "
DATA "he is not entirely unknown at the War Office.","made a passing fair death. "
DATA "he is not exactly well known at the the War Office.","was carried swooning to his death. "
DATA "he is not at all well thought of at the War Office.","met his death howling and blaspheming. "
DATA "he is completely without influence at the War Office.","was dragged to his death screaming for mercy. "
DATA "mention of his name at the War Office is complete anathma.","died like a cringing yellow dog. "
'
headc:
DATA "is a very rash Devil."
DATA "is exceedingly rash."
DATA "is perhaps too daring, almost rash."
DATA "is rather headstrong."
DATA "is extremely bold and daring."
DATA "is a bold yet careful commander."
DATA "is a thoughtful and methodical soldier."
DATA "is a methodical and careful planner."
DATA "is methodical in his deliberations."
DATA "is perhaps a little over cautious."
DATA "is the very soul of caution."
DATA "is pedantic to a fault."
DATA "is the very model of pedantry."
'
'
game:
DATA " is excersizing his hounds and is unavailable. "
DATA " is entertaining a young lady and may not be disturbed. "
DATA " is attending an important soiree some distance from the camp. "
DATA " is indisposed, indeed closeted with his physisian even now. "
DATA " is gone shooting in the hills and will not be back for some days. "
DATA " is in pursuit of the Noble Fox. "
DATA " is visiting his stables. "
DATA " is convinced that his men have reached the peak of efficiency and need no further training. "
DATA " feels that training and that sort of thing is best left to the Junior and Non-Commissioned Officers. "
DATA " is far too busy for Hard Pounding on the Barrack Square. "
'
action:

 DATA " retreat rapidly           ",7,40,30
  DATA " retire slowly             ",4,25,12
  DATA " remain in situ            ",0,0,10
  DATA " advance cautiously        ",4,20,12
  DATA " advance by normal marches ",5,25,15
  DATA " advance by forced marches ",7,40,30
  DATA " besiege                   ",0,0,50
  DATA " defend the position       ",0,0,20
  DATA " engage enemy vedettes     ",0,0,30
  DATA " surrender                 ",0,0,10
  '
'
weather:
 DATA " uncommon hot        ",5,8,41,15
  DATA " passing hot         ",8,9,31,12
  DATA " pleasantly warm     ",10,10,21,11
  DATA " cool and bracing    ",10,11,2,9
  DATA " very cold           ",10,10,13,12
  DATA " freezing cold       ",8,8,33,15
  DATA " hot and humid       ",7,8,51,15
  DATA " torrential rain     ",2,6,31,12
  DATA " stormy              ",3,7,2,10
  DATA " heavy rain          ",4,8,2,11
  DATA " light rain          ",8,10,2,10
  DATA " misty               ",9,9,2,11
  DATA " foggy               ",6,7,2,12
  DATA " snow                ",3,4,15,15
  DATA " windy               ",9,10,2,9
  ''
terrain:
DATA " plains           ",10,10,10
DATA " river valley     ",9,9,20
DATA " hills            ",8,11,5
DATA " mountains        ",5,20,3
DATA " marshes          ",6,15,35
DATA " jungle           ",5,25,25
DATA " forest           ",6,15,12
DATA " bush             ",8,12,15
DATA " desert           ",8,25,5
'
time:
DATA " Exit             "
DATA " Next week        "
DATA " Next month       "
'
route:

DATA " by metalled road        ",10,10
DATA " by unmetalled road      ",9,4
DATA " cross country           ",5,3
DATA " across a river          ",2,0
DATA " by sail or oar          ",15,0
DATA " by steamer              ",30,10
DATA " by locomotive train     ",50,50

repl:
DATA " Reservists                   ",100
DATA " Trained volunteers           ",10
DATA " Partially Trained volunteers ",4
DATA " Untrained volunteers         ",2
DATA " Trained conscripts           ",8
DATA " Partially Trained conscripts ",3
DATA " Untrained conscripts         ",1
DATA " Warrior volunteers           ",10
DATA " Warrior levies               ",1
'
supply:
DATA " extravagant supply               ",9
DATA " adequate supply                  ",10
DATA " common supply                    ",11
DATA " faltering supply                 ",13
DATA " barely adequate supply           ",15
DATA " failing supply                   ",18
DATA " occasional supply                ",24
DATA " no re - supply                   ",40
'
days:
DATA Monday
DATA Tuesday
DATA Wednesday
DATA Thursday
DATA Friday
DATA Saturday
DATA Sunday
'
month:
DATA " January             ",31
DATA " February            ",28
DATA " March               ",31
DATA " April               ",30
DATA " May                 ",31
DATA " June                ",30
DATA " July                ",31
DATA " August              ",31
DATA " September           ",30
DATA " October             ",31
DATA " November            ",30
DATA " December            ",31
'
batres:
DATA " Decisive victory      ",1,20
DATA " Marginal victory      ",2,25
DATA " Indecisive engagement ",4,50
DATA " Marginal defeat       ",5,90
DATA " Comprehensive defeat  ",6,200
'
aftbat:
DATA " do nothing           ",0,0,0,0,0,0,0,0
DATA " pursue relentlessly  ",8,90,100,0,100,0,6,10
DATA " pursue vigourously   ",7,80,70,0,75,0,5,5
DATA " pursue cautiously    ",6,70,40,0,30,0,3,5
DATA " pursue locally       ",5,65,30,0,20,0,2,3
DATA " halt and reform      ",0,60,0,50,0,0,0,2
DATA " retire               ",0,80,0,60,0,1,0,2
DATA " retreat              ",0,100,0,100,0,4,0,5
DATA " retreat headlong     ",0,120,0,120,0,6,0,7
DATA " rout                 ",0,140,0,150,0,8,0,10
DATA " scatter in rout      ",0,150,0,200,0,100,0,14
'
status:
DATA "are bold and full of confidence. ","is in the very best of spirits. ",1,1,10
DATA "are steadfast and confident. ","is most resolute and unwavering. ",1,2,20
DATA "are holding steady. ","is tired but undaunted. ",1,3,30
DATA "are somewhat worn and weary. ","remains attentive to his duty, but is a little anxious. ",2,5,50
DATA "are rather shaken by the wear of battle. ","is at best, troubled and uncertain. ",3,5,75
DATA "are worn and demoralised. ","looks haggard and fearful. ",3,6,100
DATA "are fitful and demoralised. ","is sadly shattered and defeated. ",4,7,150
DATA "are entirely panic stricken. ","is panic stricken. ",5,8,200
'
dis:
DATA " No specific ill ",0,10
DATA " No specific ill ",0,10
DATA " yellow fever          ",90,90
DATA " enterric fever        ",50,40
DATA " blackwater fever      ",55,45
DATA " a mild dysentery      ",200,20
DATA " dysentery             ",90,30
DATA " a severe Dysentery    ",30,40
DATA " a mild camp fever     ",300,15
DATA " camp fever            ",110,25
DATA " a fierce camp fever   ",80,35
DATA " a bloody flux         ",120,35
DATA " the black flux        ",120,25
DATA " gaol fever            ",240,50
DATA " marsh fever           ",100,30
DATA " trench fever          ",100,25
DATA " Wallcheron fever      ",100,30
DATA " Guardiana fever       ",100,25
DATA " putrid fever          ",100,20
DATA " malarial fever        ",110,40
DATA " malaria               ",150,40
DATA " a virulent malaria    ",135,60
DATA " typhus fever          ",130,70
DATA " typhoid               ",120,80
DATA " cholera               ",130,90
DATA " bubonic plague        ",125,100
DATA " scurvey               ",140,20
DATA " measles               ",230,20
DATA " smallpox              ",200,25
DATA " diptheria             ",110,25
DATA " scarlet fever         ",115,20
DATA " influenza             ",500,20
DATA "-1",-1,-1
'
armour:
DATA " None                  "
DATA " Cuirass               "
DATA " Half Cuirass          "
DATA " Chain Mail            "
DATA " Mail & Quilt          "
DATA " Quilt                 "
'
formpos:
 DATA 00," staff                       ",0,1,-1
  DATA 01," 1830 British Line Infantry  ",0,1,3,19,4,-1
  DATA 02," 1830 British Light Infantry ",0,1,3,19,5,6,4,-1
  DATA 03," 1830 French Line Infantry   ",0,7,8,19,9,-1
  DATA 04," 1830 French Light Infantry  ",0,7,8,5,6,19,9,-1
  DATA 05," 1830 Prussian Line Infantry ",0,7,17,19,9,-1
  DATA 06," 1830 Prussian Jaeger        ",0,7,17,19,5,6,9,-1
  DATA 07," 1830 Austrian Line Infantry ",0,7,12,13,19,9,15,-1
  DATA 08," 1830 Austrian Light Infantry",0,7,13,19,5,6,9,15,-1
  DATA 09," 1830 Russian Line Infantry  ",0,19,20,21,9,15,-1
  DATA 10," 1830 Native Foot            ",0,25,15,-1
  DATA 11," 1830 Native Light Infantry  ",0,22,23,25,26,-1
  DATA 12," 1830 Native Skirmishers     ",0,23,26,27,-1
  DATA 13," 1830 Sikh Infantry          ",0,7,8,9,16,-1
  DATA 14," 1830 Sikh Light Infantry    ",0,7,8,9,5,6,16,-1
  DATA 15," 1830 Chinese Infantry       ",0,23,24,25,15,-1
  DATA 16," 1830 American Infantry      ",0,1,8,5,6,4,-1
  DATA 17," 1855 British Infantry       ",0,1,2,3,5,6,4,-1
  DATA 18," 1855 French Line Infantry   ",0,7,8,9,-1
  DATA 19," 1855 French Light Infantry  ",0,7,8,5,6,9,-1
  DATA 20," 1862 Prussian Line Infantry ",0,7,17,18,9,-1
  DATA 21," 1862 Prussian Jaeger        ",0,7,17,18,5,6,9,-1
  DATA 22," 1855 Austrian Line Infantry ",0,7,12,9,-1
  DATA 23," 1855 Austrian Light Infantry",0,7,13,5,6,9,-1
  DATA 24," 1870 Russian Line Infantry  ",0,7,11,9,15,-1
  DATA 25," 1870 Russian Light Infantry ",0,7,11,5,9,-1
  DATA 26," 1852 American Infantry      ",0,1,2,3,10,6,9,-1
  DATA 27," 1852 American Militia       ",0,1,2,3,10,6,-1
  DATA 28," 1860 African Regulars       ",0,-1
  DATA 29," 1870 Chinese Regulars       ",0,-1
  DATA 30," 1830 The Mob                ",0,-1
  DATA 31," 1830 Irregulars             ",0,-1
  DATA 32," 1860 Irregulars             ",0,-1
  DATA 33," 1830 Chinese Light Infantry ",0,-1
  DATA 34," 1855 British Light Infantry ",0,-1
  DATA 35," 1870 British Infantry       ",0,-1
  DATA 36," 1870 British Light Infantry ",0,-1
  DATA 37," 1830 Mounted Regulars       ",0,48,49,50,1,5,6,4,-1
  DATA 38," 1830 Mounted Irregulars     ",0,48,49,50,5,6,-1
  DATA 39," 1830 Mounted natives        ",0,45,46,26,27,-1
  DATA 40," 1860 Camel Corps            ",0,-1
  DATA 41," 1830 British Cavalry        ",0,28,30,31,34,35,-1
  DATA 42," 1830 British Light Cavalry  ",0,29,30,31,32,33,34,35,-1
  DATA 43," 1830 French Cavalry         ",0,28,37,38,34,35,-1
  DATA 44," 1830 French Light Cavalry   ",0,29,37,38,32,33,34,35,-1
  DATA 45," 1830 Austrian Cavalry       ",0,28,37,38,-1
  DATA 46," 1830 Austrian Light Cavalry ",0,29,37,38,32,33,34,35,-1
  DATA 47," 1830 Prussian Cavalry       ",0,28,36,37,38,-1
  DATA 48," 1830 Prussian Light Cavalry ",0,29,36,37,38,32,33,34,35,-1
  DATA 49," 1830 Russian Cavalry        ",0,28,36,37,-1
  DATA 50," 1830 Russian Light Cavalry  ",0,29,36,37,-1
  DATA 51," 1830 Native Cavalry ",0,-1
  DATA 52," 1830 Native Light Cavalry ",0,-1
  DATA 53," 1830 Irregular Cavalry      ",0,44,45,46,-1
  DATA 54," 1830 Irregular Light Cavalry",0,43,46,47,71,34,35,-1
  DATA 55," 1860 British Cavalry        ",0,-1
  DATA 56," 1860 British Light Cavalry  ",0,-1
  DATA 57," 1860 French Cavalry         ",0,-1
  DATA 58," 1860 French Light Cavalry   ",0,-1
  DATA 59," 1860 Russian Dragoons       ",0,28,30,34,35,-1
  DATA 60," 1860 Russian Cossacks       ",0,29,30,34,35,-1
  DATA 61," 1830 Foot Artillery         ",0,51,52,53,-1
  DATA 62," 1830 Horse Artillery        ",0,51,52,53,54,-1
  DATA 63," 1830 Native Artillery       ",0,55,56,-1
  DATA 64," 1830 Mountain Artillery     ",0,-1
  DATA 65," 1830 Heavy Artillery        ",0,-1
  DATA 66," 1830 Siege Artillery        ",0,-1
  DATA 67," 1830 Irregular Artillery    ",0,-1
  DATA 68," 1830 Militia Artillery      ",0,-1
  DATA 69," 1830 Rocket Artillery       ",0,-1
  DATA 70," 1860 Machine guns           ",0,51,52,53,-1
  DATA 71," 1830 Camelry                ",0,43,44,45,46,34,35,-1
  DATA 72," 1830 Elephantry             ",0,60,61,62,-1
  DATA 73," 1830 Zambukhis              ",-1
  DATA 74," 1830 Baggage Train          ",0,-1
  DATA 75," 1830 Baggage Train          ",0,-1
  '
'
comand:
DATA "The Army of "
DATA "The Army of "
DATA "The Corps of "
DATA "The Division of "
DATA "The Brigade of "
DATA "The Unit of "
DATA "The Unit of "
DATA "The Unit of "
'
officer:
  DATA " Marshal                ",1,11,60
  DATA " Field Marshal          ",2,11,60
  DATA " General                ",3,12,50
  DATA " Lieutenant General     ",4,13,48
  DATA " Major General          ",5,14,45
  DATA " Brigadier General      ",6,15,42
  DATA " Brigadier              ",7,16,40
  DATA " Colonel                ",8,17,36
  DATA " Lieutenant Colonel     ",9,18,30
  DATA " Major                  ",10,20,28
  DATA " Captain                ",11,21,26
  DATA " Lieutenant             ",12,22,24
  DATA " Subaltern              ",13,23,22
  DATA " Ensign                 ",14,24,20
  DATA " Sergeant Major         ",15,31,20
  DATA " Sergeant               ",16,32,5
  DATA " Corporal               ",17,33,5
  DATA " Commandant             ",18,21,10
  DATA " Commander              ",19,20,30
  DATA " Adjutant               ",20,20,30
  DATA " Emperor                ",21,1,100
  DATA " King                   ",22,2,90
  DATA " Prince                 ",23,3,80
  DATA " Duke                   ",24,4,75
  DATA " Lord                   ",25,5,70
  DATA " Count                  ",26,6,65
  DATA " Baron                  ",27,7,50
  DATA " Mayor                  ",28,21,20
  DATA " Father                 ",29,21,30
  DATA " Governor               ",30,21,30
  DATA " Commisioner            ",31,22,25
  DATA " Paramount Chief        ",32,6,40
  DATA " Chief                  ",33,7,30
  DATA " Chieftain              ",34,8,20
  DATA " Sultan                 ",35,1,100
  DATA " Emir                   ",36,3,70
  DATA " Sheikh                 ",37,5,60
  DATA " Mullah                 ",38,5,50
  DATA " Iman                   ",39,5,50
  DATA " Bakaski                ",40,21,20
  DATA " Sipahadar              ",41,21,20
  DATA " Mokumdar               ",42,21,20
  DATA " Momba                  ",43,9,20
  DATA " Induna                 ",44,21,20
  DATA " Ndoda                  ",45,21,20
  DATA " Cuadillo Don           ",46,9,30
  DATA " Hetmen                 ",47,21,10
  DATA " Jagirdar               ",48,21,20
  DATA " Zemandar               ",49,9,30
  DATA " Dissawa                ",50,9,30
  DATA " Aquib                  ",51,21,10
  DATA " Prince Bisop           ",52,3,60
  DATA " Graf                   ",53,5,60
  DATA " Herzog                 ",54,4,70
  DATA " Voivode                ",55,5,60
  DATA " Pulkownik              ",56,17,30
  DATA " Rotmeistrz             ",57,18,30
  DATA " Styrer                 ",58,9,30
  DATA " Vizier                 ",59,3,50
  DATA " Grand Vizier           ",60,2,60
  DATA " Margraf                ",61,5,60
'
chopper:
  DATA 01," Bayonet               ",10,6,"bayonet","bayonet"
  DATA 02," Sword                 ",10,3,"sword","sword"
  DATA 03," Sword and shield      ",12,5,"sword and shield","sword and shield"
  DATA 04," Assegei and shield    ",12,5,"assegei and shield","assegei and shield"
  DATA 05," Spear and shield      ",8,10,"spear and shield","spear and shield"
  DATA 06," War-club and shield   ",8,4,"warclub and shield","warclub and shield"
  DATA 07," Pike & sword          ",12,20,"sword","pike and sword"
  DATA 08," Sabre & pistol        ",10,10,"sabre and pistol","sabre and pistol"
  DATA 09," Lance & sabre         ",12,9,"lance and sabre","lance and sabre"
  DATA 10," Halberd & sword       ",12,8,"sword","halberd and sword"
  DATA 11," War-axe and shield    ",10,4,"tommahawk and shield","tommahawk and shield"
  DATA 12," Improvised Weapons    ",6,4,"clubs and knives","hatchets and daggers"
  DATA 13," Revolver              ",10,10,"revolver","revolver"
  DATA 14," Spear                 ",7,10,"spear and sword","spear and sword"
  DATA 15," War-axe               ",9,4,"tommahawk","tommahawk"
  DATA 16," War-club              ",8,4,"warclub","warclub"
  DATA 12," Peasant Weapons       ",8,6,"clubs and knives","scythes and pitchfalks"
  DATA 18," Sabre                 ",12,8,"sabre","sabre"
  DATA 19," Naval weapons         ",12,6,"boarding axe","cutlas and pistol"
  DATA 20," Shotgun and pistol    ",10,11,"shotgun and pistol","shotgun and pistol"
  DATA 21," Lance & tommahawk      ",11,9,"lance and tommahawk","lance and tommahawk" 
  '

typ:
  DATA 00,Staff,c,c,c,c,20,20,20
  DATA 01,Infantry,company,companies,band,bands,10,10,10
  DATA 02,Light Infantry,company,companies,band,bands,12,10,8
  DATA 03,Mounted Infantry,company,companies,band,bands,12,14,15
  DATA 04,Camel Mounted Infantry,company,companies,band,bands,12,13,14
  DATA 05,Mule Mounted Infantry,company,companies,band,bands,12,12,13
  DATA 06,Light Cavalry,squadron,squadrons,band,bands,10,15,18
  DATA 07,Cavalry,squadron,squadrons,band,bands,9,18,18
  DATA 08,Camelry,squadron,squadrons,band,bands,9,18,18
  DATA 09,Artillery,detatchment,detatchments,detatchment,detatchments,8,5,12
  DATA 10,Horse Artillery,detatchment,detatchments,detatchment,detatchments,9,15,18
  DATA 11,Mountain Artillery,detatchment,detatchments,detatchment,detatchments,10,14,12
  DATA 12,Heavy Artillery,detatchment,detatchments,detatchment,detatchments,6,18,20
  DATA 13,Rocket Artillery,detetchment,detatchments,detatchment,detatchments,9,14,12
  DATA 14,Siege Artillery,detatchment,detatchments,detatchment,detatchments,4,20,20
  DATA 15,Elephantry,squadron,squadrons,squadron,squadrons,8,25,18
  DATA 16,Mounted Artillery,detatchment,detatchments,band,bands,8,15,15
  DATA 17,Mounted Artillery,detatchment,detatchments,band,bands,8,15,15
  DATA 18,Mounted Artillery,detatchment,detatchments,band,bands,8,15,15
  DATA 19,Mounted Artillery,detatchment,detatchments,band,bands,8,15,15
  DATA 20,Machine Guns,detatchment,detatchments,band,bands,8,15,12
  '
'
class:
 DATA 01," Guard                ",12,7,11,13
  DATA 02," Regular              ",10,8,12,12
  DATA 03," Reserve              ",9,8,10,11
  DATA 04," Volunteer            ",12,11,10,8
  DATA 05," 1st Line             ",10,10,10,10
  DATA 06," 2nd Line             ",9,11,9,9
  DATA 07," Militia              ",8,15,10,8
  DATA 08," Garrison             ",8,11,8,9
  DATA 09," Depot                ",9,9,9,9
  DATA 10," Soldier              ",10,12,8,8
  DATA 11," Warrior              ",12,12,10,7
  DATA 12," Tribal               ",10,14,9,6
  DATA 13," Levy                 ",5,20,5,5
  DATA 14," Conscript            ",10,10,10,10
  DATA 15," Foreign              ",10,9,10,10
  DATA 16," Elite                ",12,7,12,12
  DATA 17," Emigree              ",10,8,10,10
  DATA 18," Provost              ",9,11,9,9
  DATA 19," Slave Soldier        ",10,10,10,10
  DATA 20," Mercenary            ",10,10,10,10
  DATA 21," Female Soldier       ",12,12,8,10
  DATA 22," Prisoner of War      ",8,15,8,8
  DATA 23," Deserter             ",10,15,9,9
  DATA 24," Invalid              ",9,9,8,10
  DATA 25," Freebooter           ",10,18,10,6
  DATA 26," Brigand              ",10,20,10,4
'
commit:
DATA 1," Over confident  ",12,11,8,10
DATA 2," Enthusiastic    ",11,10,10,10
DATA 3," Confident       ",10,10,10,10
DATA 4," Diffident       ",9,11,9,10
DATA 5," Disheartened    ",8,11,9,10
DATA 6," Neglected       ",8,11,9,8
DATA 7," Scared          ",6,12,8,9
'
experience:
DATA 1," Veteran       ",9,5,11,12
DATA 2," Seasoned      ",10,7,11,11
DATA 3," Experienced   ",10,10,10,11
DATA 4," Inexperienced ",11,15,9,8
DATA 5," Untrained     ",10,20,7,5
DATA 6," Dissaffected  ",7,25,10,2
DATA 7," Fanatical     ",15,8,8,10
'


who:
  DATA 1," poorly equipped smoothbores ",1,3,-1
  DATA 2," better equipped smoothbores ",1,2,3,12,-1
  DATA 3," British smoothbores         ",1,3,5,6,13,-1
  DATA 4," American smoothbores        ",1,2,3,5,6,12,-1
  DATA 5," American ml rifles          ",2,3,4,5,6,12,-1
  DATA 6," American bl rifles          ",3,5,11,-1
  DATA 7," British rifles              ",5,6,7,13,-1
  DATA 8," Irregular rifles            ",2,3,4,-1
  DATA 9," French rifles               ",2,3,5,6,12,-1
  DATA 10," Prussian rifles            ",3,11,-1
  DATA 11," rockets                    ",8,9,-1
  DATA 12," mortars                    ",10,-1
  DATA 13," early contact shell rifles ",3,14,-1
  DATA 14," later contact shell rifles ",-1
  DATA 15," machine guns               ",-1
  '
gatling:
  DATA 1," Agar Gun                            ",1860,6,20,50,50,2,100
  DATA 2," Requa Battery Gun                   ",1860,10,10,30,70,4,100
  DATA 3," Gatling Gun M1862                   ",1862,12,30,80,55,5,100
  DATA 4," Gatling Gun M1865                   ",1865,20,40,100,65,6,120
  DATA 5," Gatling Gun M1874                   ",1874,20,45,100,75,6,150
  DATA 6," Gatling Gun M1886                   ",1886,20,45,100,85,6,150
  DATA 7," Gatling 'Camel' Gun                 ",1875,15,45,100,75,6,150
  DATA 8," Gorlov Gun                          ",1870,20,45,100,70,6,100
  DATA 9," Mitrailleuse Reffye                 ",1869,25,30,180,75,6,180
  DATA 10," Gardner 5 barrel                   ",1879,20,50,150,88,6,150
  DATA 11," Gardner 3 barrel                   ",1881,15,50,150,89,6,150
  DATA 12," Gardner light gun                  ",1881,10,45,130,88,6,150
  DATA 13," Nordenfelt 4 barrel                ",1873,22,50,150,90,6,150
  DATA 14," Nordenfelt 2 barrel                ",1873,18,50,150,91,6,150
  DATA 15," Maxim M1888                        ",1887,50,60,150,92,8,250
  DATA 16," Maxim M1892                        ",1892,50,60,250,95,8,250
  DATA 17," Hotchkiss M1897                    ",1897,30,60,250,94,8,250
  DATA 18," Schwartzlos                        ",1899,50,60,200,93,8,250
  DATA 19," Williams Gun                       ",1862,7,30,50,50,2,250
  DATA 20," Mitrailleuse Chevalier             ",1870,16,30,180,80,6,180
  DATA 21," Mitrailleuse Bollee                ",1870,30,30,190,75,6,180
  DATA 22," Mitrailleuse Gabert                ",1870,12,30,160,85,6,180
  DATA 23," Browning Colt M1895                ",1895,50,60,250,90,8,250
  DATA 24," Mitrailleuse Montigny              ",1868,37,30,120,70,6,180
  '
guntype:
  DATA 0," tension weapon           "
  DATA 1," syphon weapon            "
  DATA 2," primitive smoothbore     "
  DATA 3," muzzle loaded smoothbore "
  DATA 4," rifled muzzle loader     "
  DATA 5," rifled breechloader      "
  DATA 6," muzzle loaded howitzer   "
  DATA 7," muzzle loaded mortar     "
  DATA 8," rocket                   "
  DATA 9," quick firer              "
  '
 '
gatype:
  DATA " dummy                        ",1
  DATA " Funnel Magazine gun          ",2
  DATA " dummy                        ",3
  DATA " Battery gun                  ",4
  DATA " Early hand-cranked gun       ",5
  DATA " Hand cranked machine gun     ",6
  DATA " dummy                        ",7
  DATA " Gas-operated machine gun     ",8

mustype:
  DATA 0," manual weapon                      "
  DATA 1," tension weapon                     "
  DATA 2," matchlock                          "
  DATA 3," flintlock                          "
  DATA 4," percussionlock                     "
  DATA 5," early breechloader                 "
  DATA 6," breechloader                       "
  DATA 7," early repeater                     "
  DATA 8," tube magazine rifle                "
  DATA 9," box magazine rifle                "

SUB hash8 (x$)
WRITE #8, x$
PRINT x$

END SUB

SUB pts
DEF SEG = SSEG(t$)
BSAVE "A:\armies.dat\arraydat.num", SADD(t$), LEN(t$)
END SUB

SUB ts (x)
WRITE #5, x
END SUB

