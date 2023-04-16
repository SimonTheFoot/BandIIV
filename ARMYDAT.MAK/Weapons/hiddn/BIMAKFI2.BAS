DECLARE SUB pts ()
DECLARE SUB ts (x!)
DECLARE SUB hash8 (x$)

COMMON SHARED force$(), force(), force1$(), deleat(), finame$(), faccr$(), far$(), n1$(), language$(), ntype$(), nation$(), mile$(), mile(), mess$(), mess()
COMMON SHARED fate$(), happy$(), prim$(), brave$(), lbase(), able$(), obase(), loyal$(), skill$(), infl$(), death$(), hcase$(), game$(), action$(), action()
COMMON SHARED weather$(), weather(), terrain$(), terrain(), tyme$(), route$(), route()
COMMON SHARED batres$(), batres(), month$(), month(), days$(), supply$(), supply(), repl$(), repl()
COMMON SHARED armour$(), disease$(), disease(), morale$(), ofrale$(), morale(), aftbat$(), aftbat()
COMMON SHARED type$(), band$(), tipe(), chopper$(), chopper(), officer$(), officer(), comand$(), formpos$(), formpos()
COMMON SHARED gun$(), gun(), musket$(), musket(), experience$(), experience(), commit$(), commit(), class$(), class(), who$(), who()
COMMON SHARED guntype$(), gatype$(), mustype$()
COMMON SHARED t$

DIM SHARED force$(30), force(30, 18), force1$(30), deleat(300), finame$(15), faccr$(15), far$(30), n1$(30), language$(30), ntype$(30), nation$(30), mile$(30), mile(30, 1), mess$(4), mess(4)
DIM SHARED fate$(5), happy$(12), prim$(2), brave$(10), lbase(10), able$(10), obase(10), loyal$(10), skill$(10), infl$(10), death$(10), hcase$(13), game$(10), action$(10), action(10, 3)
DIM SHARED weather$(15), weather(15, 4), terrain$(9), terrain(9, 3), tyme$(3), route$(7), route(6, 2)
DIM SHARED batres$(5), batres(5, 2), month$(12), month(12, 1), days$(7), supply$(6), supply(6), repl$(9), repl(9)
DIM SHARED armour$(6), disease$(35), disease(35, 2), morale$(8), ofrale$(8), morale(8, 4), aftbat$(10), aftbat(10, 8)
DIM SHARED type$(21), band$(21, 4), tipe(21, 2), chopper$(20), chopper(20, 2), chop$(20, 2), officer$(61), officer(61, 2), comand$(8), formpos$(40), formpos(75, 12)
DIM SHARED gun$(201), gun(201, 8), musket$(228), musket(228, 6), experience$(7), experience(7, 4), commit$(7), commit(7, 4), class$(26), class(26, 4), who$(15), who(15, 10)
DIM SHARED guntype$(9), gatype$(8), mustype$(9)



'

OPEN "C:\ECW\bandi3\armies.nam\stridat.nam" FOR APPEND AS #8
OPEN "C:\ECW\bandi3\armies.nam\test1.num" FOR APPEND AS #5

'

RESTORE musket

FOR l = 1 TO 228
  READ n
  READ musket$(l)
  FOR m = 1 TO 6
    READ n
    musket(l, m) = n
  CALL ts(n)
  NEXT m
CALL hash8(musket$(l))
NEXT l
'
RESTORE gun

FOR l = 1 TO 201
  READ n
  READ gun$(l)
  FOR m = 1 TO 7
    READ n
    gun(l, m) = n
  CALL ts(n)
  NEXT m
CALL hash8(gun$(l))
NEXT l
REM call pts


END


start:

musket:
 DATA   1," Flintlock musket                   ",1830,3,10,20,75,3
  DATA   2," Flintlock carbine                  ",1830,3,10,15,75,3
  DATA   3," Percussion lock musket             ",1834,3,10,20,85,4
  DATA   4," Percussion lock carbine            ",1835,3,10,15,85,4
  DATA   5," Baker rifle                        ",1830,2,15,40,70,3
  DATA   6," Brunswick rifle                    ",1839,2,20,45,80,4
  DATA   7," Liege fusil M1851                  ",1851,3,28,75,85,4
  DATA   8," Delvigne fusil M1842               ",1838,2,20,50,78,4
  DATA   9," Thouvenin pillie-en-cullasse       ",1846,2,20,60,80,4
  DATA  10," Minie fusil M1851                  ",1849,3,28,75,85,4
  DATA  11," Sea Service rifle                  ",1850,3,28,75,86,4
  DATA  12," Jessen rifle                       ",1850,3,28,80,86,4
  DATA  13," Lorenz gewehr                      ",1850,3,30,80,87,4
  DATA  14," Lidner-Podewils                    ",1867,7,30,90,85,6
  DATA  15," Enfield rifle                      ",1853,3,32,90,90,4
  DATA  16," Jaeger-Schutz karabiner            ",1854,3,28,52,88,4
  DATA  17," Liege carabine                     ",1840,3,18,30,80,4
  DATA  18," Enfield carbine                    ",1853,3,28,60,88,4
  DATA  19," Sappers and miners carbine         ",1855,3,30,90,85,4
  DATA  20," Jezail                             ",1830,2,15,40,70,3
  DATA  21," Trade musket                       ",1830,3,10,15,60,3
  DATA  22," Podewils gewehr                    ",1850,3,29,85,84,4
  DATA  23," Tennessee rifle                    ",1830,2,20,50,75,3
  DATA  24," Oriental musket                    ",1830,3,10,25,65,3
  DATA  25," Enroth rifle                       ",1855,3,28,70,83,4
  DATA  26," Oriental rifle                     ",1855,3,24,50,80,4
  DATA  27," Springfield M1855 rifle            ",1855,4,30,80,90,4
  DATA  28," Springfield M1861 rifle            ",1861,3,30,80,88,4
  DATA  29," CSA dropping-breech carbine        ",1862,6,18,30,70,5
  DATA  30," CSA rising-breech carbine          ",1862,6,18,30,72,5
  DATA  31," Joslyn 1863 carbine                ",1863,8,30,70,80,6
  DATA  32," Jenks Navy rifle                   ",1855,5,20,45,75,5
  DATA  33," Merrill rifle                      ",1858,6,20,60,75,5
  DATA  34," Perry carbine                      ",1855,4,15,30,70,5
  DATA  35," Richmond carbine                   ",1861,3,20,42,85,4
  DATA  36," Fayetteville carbine               ",1862,6,18,30,70,5
  DATA  37," Lidner-Springfield                 ",1867,7,30,100,85,5
  DATA  38," Harpers Ferry M1855 pistol-carbine ",1855,4,12,25,85,4
  DATA  39," Lancaster rifle                    ",1855,2,50,150,75,4
  DATA  40," Burnside carbine                   ",1860,7,22,55,80,6
  DATA  41," Hall carbine M1837                 ",1837,4,10,15,60,5
  DATA  42," Maynard carbine                    ",1859,7,20,52,80,5
  DATA  43," Merrill Latrobe & Thomas carbine   ",1858,6,18,40,75,5
  DATA  44," Sharps carbine                     ",1859,6,20,35,80,5
  DATA  45," Smith carbine                      ",1857,9,18,30,78,5
  DATA  46," Star carbine                       ",1858,5,18,30,68,5
  DATA  47," Spencer carbine                    ",1861,10,15,28,75,6
  DATA  48," Sharps & Hankins carbine           ",1863,7,30,80,85,6
  DATA  49," Wesson carbine                     ",1860,5,18,30,60,5
  DATA  50," Gallagher carbine                  ",1860,5,18,32,75,5
  DATA  51," Joslyn  1855 carbine               ",1855,4,28,76,70,5
  DATA  52," Ballard carbine                    ",1861,8,18,35,75,6
  DATA  53," Ball carbine                       ",1865,9,18,35,70,6
  DATA  54," Cosmopolitan carbine               ",1862,7,18,36,75,6
  DATA  55," Gibbs carbine                      ",1857,5,18,35,65,5
  DATA  56," Peabody carbine                    ",1865,8,18,38,78,6
  DATA  57," Remmington carbine                 ",1865,7,20,50,80,6
  DATA  58," Warner carbine                     ",1864,7,20,42,70,6
  DATA  59," Ballard rifle                      ",1863,7,30,60,85,6
  DATA  60," Henry rifle                        ",1863,9,20,40,70,8
  DATA  61," Sharps rifle                       ",1859,5,20,50,75,5
  DATA  62," Star rifle                         ",1830,2,20,50,75,3
  DATA  63," Spencer rifle                      ",1862,9,30,50,75,8
  DATA  64," Harpers Ferry M1841 rifle          ",1841,2,20,50,75,4
  DATA  65," Harpers Ferry M1841/55 rifle       ",1855,3,28,70,80,4
  DATA  66," Colt rifle                         ",1855,8,15,45,65,7
  DATA  67," Hall rifle                         ",1837,4,15,40,60,5
  DATA  68," Greene rifle                       ",1858,5,32,100,80,5
  DATA  69," Rifled re-bored muskets            ",1852,3,25,70,80,4
  DATA  70," Snider Enfield                     ",1866,7,35,110,90,6
  DATA  71," Snider Enfield carbine             ",1868,7,30,60,90,6
  DATA  72," Martini Henry                      ",1869,7,41,145,95,6
  DATA  73," Martini Peabody                    ",1870,7,40,100,94,6
  DATA  74," Peabody                            ",1862,6,24,50,80,5
  DATA  75," Remmington                         ",1867,7,40,100,92,6
  DATA  76," Mauser G1871                       ",1871,7,40,100,92,6
  DATA  77," Gras                               ",1874,7,41,145,95,6
  DATA  78," Wanzl                              ",1867,7,35,88,85,5
  DATA  79," Werndl                             ",1870,7,40,175,95,6
  DATA  80," Chassepot                          ",1866,7,38,130,85,6
  DATA  81," Dreyse Zundnadelgewehr G1841       ",1841,7,15,40,60,5
  DATA  82," Dreyse Zundnadelkarabiner K1857    ",1857,7,20,40,75,5
  DATA  83," Terry carbine                      ",1856,6,25,60,80,5
  DATA  84," Westley Richards carbine           ",1860,7,35,80,85,6
  DATA  85," Springfield M1873                  ",1873,7,41,150,95,6
  DATA  86," Beaumont                           ",1871,7,35,100,90,6
  DATA  87," Vetterli                           ",1867,7,41,175,95,6
  DATA  88," Guedis                             ",1885,7,45,160,95,6
  DATA  89," Krnka                              ",1871,6,30,50,85,6
  DATA  90," Berden I                           ",1869,6,30,60,85,6
  DATA  91," Berden II                          ",1879,7,42,145,92,6
  DATA  92," Winchester carbine M1866           ",1866,10,20,30,70,8
  DATA  93," Winchester rifle M1866             ",1866,10,20,40,75,8
  DATA  94," Vetterli-Vitali                    ",1870,10,30,125,80,8
  DATA  95," Kropatschek                        ",1878,10,42,165,82,8
  DATA  96," Lebel                              ",1888,10,50,200,95,9
  DATA  97," Lee Metford                        ",1888,10,50,200,99,9
  DATA  98," Revolver                           ",1833,10,5,10,80,5
  DATA  99," Double barrelled gun               ",1845,4,10,20,95,4
  DATA 100," Shotgun                            ",1860,6,3,10,99,4
  DATA 101," Westly Richards rifle              ",1865,7,35,100,85,6
  DATA 102," Tapley carbine                     ",1855,6,18,30,70,5
  DATA 103," Mannlicher G1881                   ",1881,10,50,200,95,9
  DATA 104," Peruvano                           ",1872,7,40,130,90,6
  DATA 105," Comblain                           ",1873,7,40,145,90,6
  DATA 106," Bow                                ",1830,6,5,20,35,1
  DATA 107," Crossbow                           ",1830,1,10,30,50,1
  DATA 108," Javelin                            ",1830,3,5,10,40,0
  DATA 109," Zambuk                             ",1830,1,20,50,60,2
  DATA 110," Snider Springfield                 ",1866,7,30,100,90,6
  DATA 111," Krag-Jorgensen                     ",1888,10,50,200,85,8
  DATA 112," Matchlock                          ",1800,2,5,30,60,2
  DATA 113," Colt carbine                       ",1855,8,10,30,65,7
  DATA 114," Mosin Nagant                       ",1891,9,50,220,90,6
  DATA 115," pistol                             ",1830,4,3,6,75,3
  DATA 116," Jingal                             ",1830,1,20,40,70,3
  DATA 117," Jacobs rifle                       ",1850,3,30,100,85,4
  DATA 118," Martini Metford                    ",1882,7,42,145,98,6
  DATA 119," Lee-Remmington                     ",1879,10,40,145,95,6
  DATA 120," Lidner-Werder                      ",1869,7,35,88,88,5
  DATA 121," Lidner-Drechsler                   ",1869,7,35,80,88,5
  DATA 122," Longbow                            ",1800,6,8,24,45,1
  DATA 123," Minie fusil M1853                  ",1853,3,30,75,84,4
  DATA 124," Harpers Ferry M1842 rifle          ",1842,2,18,40,75,4
  DATA 125," Berthier                           ",1890,10,50,200,95,6
  DATA 126," Lee-Enfield                        ",1898,12,50,220,99,6
  DATA 127," Deutches Kommisariat G1888         ",1888,10,45,200,95,9
  DATA 128," Mauser G1898                       ",1898,10,50,200,98,9
  DATA 129," Roer                               ",1830,3,10,20,95,4
  DATA 130," Mannlicher-Carocano                ",1891,10,50,200,95,6
  DATA 131," Elephant gun                       ",1870,5,40,100,92,6
  DATA 132," Beaumont-Viterli                   ",1890,10,45,190,91,9
  DATA 133," Hontoria rifle                     ",1852,3,27,75,82,4
  DATA 134," American Enfield rifle             ",1855,3,32,85,84,4
  DATA 135," Witton rifle                       ",1853,3,28,72,80,4
  DATA 136," pistol                             ",1840,4,3,6,85,4
  DATA 137," Revolver                           ",1855,10,5,10,90,7
  DATA 138," Pump action shotgun                ",1890,10,3,10,90,8
  DATA 139," Dreyse Zundnadelgewehr G1862       ",1862,7,28,60,78,5
  DATA 140," Double barrel rifle                ",1855,4,20,50,85,4
  DATA 141," Cape carbine                       ",1834,4,25,70,85,4
  DATA 142," Kabul Enfield                      ",1860,3,30,80,80,4
  DATA 143," Kabul carbine                      ",1860,3,25,50,80,4
  DATA 144," Scheel rifle                       ",1839,6,15,40,60,5
  DATA 145," Rifled pistol                      ",1840,4,5,10,85,4
  DATA 146," Amsler gewehr                      ",1850,3,25,80,85,4
  DATA 147," Minie carabine                     ",1852,3,20,40,82,4
  DATA 148," Werder gewehr                      ",1851,3,28,80,83,4
  DATA 149," Drechsler gewehr                   ",1852,3,30,85,84,4
  DATA 150," Fusil Lance                        ",1856,7,25,70,82,6
  DATA 151," Chassepot carabine                 ",1866,7,30,90,85,6
  DATA 152," Fusil tabatiere d'Infantrie        ",1867,7,30,90,85,6
  DATA 153," Fusil tabatiere de Dragon          ",1867,7,24,70,85,6
  DATA 154," Fusil tabatiere de Gendarme        ",1867,7,22,70,85,6
  DATA 155," Fusil tabatiere de Chasseur        ",1867,7,28,90,85,6
  DATA 156," Springfield M1863 T1 rifle         ",1863,3,30,80,87,4
  DATA 157," Springfield M1863 T2 rifle         ",1864,3,30,80,86,4
  DATA 158," Colt SM1863 rifle                  ",1861,3,30,80,89,4
  DATA 159," Turner carbine                     ",1860,7,30,60,85,6
  DATA 160," Braendlin fusil                    ",1851,3,30,80,87,4
  DATA 161," Albini Braendlin                   ",1868,7,35,88,85,5
  DATA 162," Terrsen                            ",1871,7,35,100,90,6
  DATA 163," Carcano                            ",1869,7,28,60,78,5
  DATA 164," Milbank-Amsler                     ",1868,7,35,88,85,5
  DATA 165," Liege fusil M1841                  ",1841,2,18,45,74,4
  DATA 166," Dreyse Zundnadelbusche K1849       ",1849,7,15,40,60,5
  DATA 167," Dreyse Zundnadelbusche G1869       ",1869,7,30,70,80,5
  DATA 168," Jager rifle                        ",1830,2,18,45,80,4
  DATA 169," Jagerbusche                        ",1830,2,15,40,70,3
  DATA 170," Warsaw rifle                       ",1844,2,18,45,74,4
  DATA 171," Jaegerschutze                      ",1830,2,10,30,69,3
  DATA 172," Oriental rifle                     ",1830,2,10,40,50,3
  DATA 173," Kavallerie Schutze                 ",1830,2,8,25,70,3
  DATA 174," Grenzschutze                       ",1830,2,10,30,65,3
  DATA 175," Kabyle musket                      ",1830,3,5,25,60,3
  DATA 176," Kabyle rifle                       ",1830,2,8,30,60,3
  DATA 177," Sestrovsk rifled carbine           ",1830,2,6,30,60,3
  DATA 178," Miguelet mosquete                  ",1830,3,4,20,65,3
  DATA 179," Miguelet trabuco                   ",1830,3,3,12,65,3
  DATA 180," Miguelet carabina                  ",1830,2,8,30,60,3
  DATA 181," Dane gun                           ",1830,3,3,25,65,3
  DATA 182," Romagnol musket                    ",1830,3,4,20,65,3
  DATA 183," Romagnol carbine                   ",1830,3,3,12,65,3
  DATA 184," Romagnol rifle                     ",1830,2,8,32,60,3
  DATA 185," Jessen rifle M1841                 ",1841,2,18,45,74,4
  DATA 186," Mississippi rifle                  ",1830,2,20,50,65,3
  DATA 187," Hall-North carbine M1833           ",1833,4,6,15,55,5
  DATA 188," Hall-North carbine M1838           ",1838,4,10,20,58,5
  DATA 189," Hall rifle M1819                   ",1819,3,8,24,50,3
  DATA 190," Hall rifle M1837                   ",1837,4,12,30,55,5
  DATA 191," Scheel rifle                       ",1838,6,10,30,60,5
  DATA 192," Rifled pistol                      ",1830,4,5,10,85,4
  DATA 193," Colt carbine                       ",1839,8,3,30,50,7
  DATA 194," Jenks musketoon                    ",1837,4,8,15,55,5
  DATA 195," Whitworth rifle                    ",1861,3,50,120,84,4
  DATA 196," Blunderbus                         ",1830,4,8,15,75,3
  DATA 197," Jennings rifle                     ",1849,7,10,20,68,8
  DATA 198," Volcanic rifle                     ",1852,8,10,20,70,8
  DATA 199," Fruwirth rifle                     ",1869,10,30,125,80,8
  DATA 200," Hotchkiss rifle                    ",1880,10,30,125,80,8
  DATA 201," Winchester M1883                   ",1883,10,30,125,85,8
  DATA 202," Winchester 73 rifle                ",1873,10,20,50,80,8
  DATA 203," Springfield M1855 Maynard rifle    ",1855,4,30,80,60,4
  DATA 204," Palmetto M1841 rifle               ",1861,3,18,40,85,4
  DATA 205," Richmond M1842 rifle               ",1861,3,18,40,85,4
  DATA 206," Fayetteville M1861 rifle           ",1861,3,30,80,88,4
  DATA 207," Mauser G1871/1884                  ",1884,10,40,100,90,8
  DATA 208," Dreyse M1874                       ",1874,10,40,100,90,8
  DATA 209," Dreyse G1884                       ",1881,10,50,200,94,9
  DATA 210," Krnka M1886                        ",1886,10,50,200,94,9
  DATA 211," Mauser G1888                       ",1888,10,45,200,96,9
  DATA 212," Murata M1876                       ",1876,7,38,130,85,6
  DATA 213," Immfanger M1868                    ",1883,10,30,85,85,8
  DATA 214," Flicth M1873                       ",1873,10,30,100,85,8
  DATA 215," Dreyse Zundnadelgewehr G1849       ",1849,7,20,50,74,5
  DATA 216," Trade rifle                        ",1830,2,20,60,70,3
  DATA 217," Spencer carbine M1873              ",1873,10,20,50,85,8
  DATA 218," Sling                              ",1830,2,5,15,40,0
  DATA 219," Blowpipe                           ",1830,1,2,5,75,0
  DATA 220," Murata M1884                       ",1884,10,40,100,88,8
  DATA 221," Albini M1896                       ",1896,10,50,200,95,9
  DATA 222," Podewils karabiner                 ",1852,3,20,40,82,4
  DATA 223," Werder karabiner                   ",1852,3,18,40,83,4
  DATA 224," Drechsler karabiner                ",1852,3,20,40,83,4
  DATA 225," Martini Henry carbine              ",1870,7,36,95,95,6
  DATA 226," Enroth carbine                     ",1855,3,20,50,83,4
  DATA 227," Forobah Chassepot                  ",1880,6,30,90,80,6
  DATA 228," Forobah Gras                       ",1884,6,35,100,87,6
'
gun:
 DATA   1," 3lb Gun                            ",1830,30,3,8,90,3,4
  DATA   2," 6lb Gun                            ",1830,28,4,10,90,3,8
  DATA   3," 4lb Gun                            ",1830,28,3,10,90,3,6
  DATA   4," 8lb Gun                            ",1830,22,4,11,90,3,11
  DATA   5," 9lb Gun                            ",1830,21,5,12,90,3,13
  DATA   6," 6lb Light Gun                      ",1830,20,4,8,90,3,8
  DATA   7," 12lb Gun                           ",1830,18,5,15,90,3,16
  DATA   8," 18lb Gun                           ",1830,16,6,22,90,3,25
  DATA   9," 7pd Haubitz                        ",1830,29,4,12,90,6,24
  DATA  10," 5.5 inch Howitzer                  ",1830,20,4,19,90,3,25
  DATA  11," 12lb Howitzer                      ",1830,25,4,16,90,6,16
  DATA  12," 15lb Howitzer                      ",1830,21,4,19,90,6,25
  DATA  13," 24lb Howitzer                      ",1830,20,5,22,90,6,33
  DATA  14," 32lb Howitzer                      ",1830,14,5,24,90,6,44
  DATA  15," 12lb Napoleon                      ",1855,25,6,18,92,6,16
  DATA  16," 10lb M1861 Parrot Rifle            ",1860,22,10,30,82,4,18
  DATA  17," 20lb M1861 Parrot Rifle            ",1860,21,12,32,81,4,36
  DATA  18," 30lb M1861 Parrot Rifle            ",1860,18,12,35,80,4,55
  DATA  19," 3 inch Griffen Rifle               ",1861,22,10,30,85,4,22
  DATA  20," 3 inch Skoda Rifle                 ",1861,22,10,30,90,4,22
  DATA  21," 4lb Skoda Rifle                    ",1861,22,10,33,90,4,12
  DATA  22," 8lb Skoda Rifle                    ",1861,20,10,35,90,4,24
  DATA  23," 3 inch Hotchkiss Rifle             ",1861,22,10,35,91,4,10
  DATA  24," 4lvr deBeaulieu                    ",1856,22,10,30,91,4,15
  DATA  25," 8lvr deBeaulieu                    ",1869,18,10,32,91,4,29
  DATA  26," 6lb Waird Rifle                    ",1861,27,8,16,75,4,11
  DATA  27," 10lb Waird Rifle                   ",1861,25,10,32,75,4,18
  DATA  28," 3 inch Rodman Rifle                ",1861,22,10,30,85,4,22
  DATA  29," 12lb James Rifle                   ",1861,22,10,28,75,4,22
  DATA  30," 24lb James Rifle                   ",1861,20,10,30,73,4,44
  DATA  31," 12lb Blakely Rifle                 ",1861,22,8,17,78,4,22
  DATA  32," 7lb Mountain Rifle                 ",1864,25,8,25,83,4,13
  DATA  33," 9lb Woolwich Rifle                 ",1867,27,9,35,93,4,22
  DATA  34," 7lb Screw Gun                      ",1871,32,10,35,95,4,13
  DATA  35," 1.5 inch Joslyn                    ",1861,32,10,30,85,4,13
  DATA  36," 3lb Whitworth                      ",1861,35,12,32,75,5,6
  DATA  37," 6lb Whitworth                      ",1861,35,12,34,75,5,11
  DATA  38," 12lb Whitworth                     ",1861,34,12,32,75,5,22
  DATA  39," 7lb Armstrong                      ",1858,36,12,30,70,5,13
  DATA  40," 12lb Armstrong                     ",1858,30,12,30,70,5,22
  DATA  41," 4pfd Krupp                         ",1859,38,12,34,75,5,17
  DATA  42," 6pfd Krupp                         ",1859,30,12,38,75,5,25
  DATA  43," 4pd St.Petersberg                  ",1871,35,8,25,70,5,22
  DATA  44," 9pd St.Petersberg                  ",1871,26,8,28,70,5,39
  DATA  45," 7lvr Meudon                        ",1871,40,12,50,74,5,29
  DATA  46," 4lvr Meudon                        ",1871,42,12,40,74,5,15
  DATA  47," 40lb Armstrong                     ",1859,25,12,38,70,5,18
  DATA  48," 37mm Maxim-Nordenfeldt             ",1890,100,8,20,76,9,2
  DATA  49," 43mm Maxim-Nordenfeldt             ",1890,85,12,30,76,9,4
  DATA  50," 15lb Quick Firer                   ",1892,60,12,80,77,9,27
  DATA  51," 3lb Mountain gun                   ",1830,35,5,10,80,3,6
  DATA  52," 3lb Mountain howitzer              ",1830,35,5,10,70,6,6
  DATA  53," 9lb Armstrong                      ",1858,32,12,32,70,5,16
  DATA  54," 2.5 inch Mountain Gun              ",1880,40,12,36,75,5,18
  DATA  55," Soixante-quanze                    ",1896,65,15,100,78,9,29
  DATA  56," 75mm Krupp                         ",1892,60,12,80,75,9,28
  DATA  57," 8pfd Schenkl Rakete                ",1830,15,2,12,70,8,12
  DATA  58," 6lb Mortar                         ",1830,25,2,12,85,7,11
  DATA  59," 12lb Mortar                        ",1830,25,3,12,85,7,22
  DATA  60," 24lb Mortar                        ",1830,20,4,12,85,7,44
  DATA  61," 6lb Congreave Rocket               ",1830,20,2,15,50,8,11
  DATA  62," 12lb Congreave Rocket              ",1830,15,2,15,50,8,22
  DATA  63," 24lb Hales Rocket                  ",1849,22,3,20,70,8,44
  DATA  64," 12pfd Schenkl Rakete               ",1816,15,2,12,70,8,18
  DATA  65," 9lvr Hotchkiss Roquette            ",1830,18,3,18,65,8,18
  DATA  66," 4.7 inch Naval Gun                 ",1896,35,15,250,78,8,58
  DATA  67," 16lvr Obusier                      ",1830,21,5,15,90,6,60
  DATA  68," 13lb Woolwich Rifle                ",1861,22,12,35,92,4,29
  DATA  69," 16lb Woolwich Rifle                ",1861,21,12,35,92,4,44
  DATA  70," 12lb Mountain Howitzer             ",1830,25,4,10,90,6,22
  DATA  71," 24lb Gun                           ",1830,16,6,22,90,3,33
  DATA  72," 36lb Howitzer                      ",1830,10,5,24,90,6,65
  DATA  73," 42lb Howitzer                      ",1830,8,5,24,90,6,76
  DATA  74," 48lb Howitzer                      ",1830,6,5,24,90,6,87
  DATA  75," 8 inch Howitzer                    ",1830,8,5,24,90,6,63
  DATA  76," 24lb Congreave Rocket              ",1830,15,2,15,50,8,44
  DATA  77," 2.5 inch Hales Rocket              ",1849,22,3,20,70,8,27
  DATA  78," 68lb Carronade                     ",1830,8,4,8,90,3,60
  DATA  79," 42lb Carronade                     ",1830,10,4,8,90,3,38
  DATA  80," 12lb Carronade                     ",1830,28,3,7,90,3,11
  DATA  81," 10 inch Mortar                     ",1830,4,4,18,90,7,180
  DATA  82," 13 inch Mortar                     ",1830,2,4,18,90,7,256
  DATA  83," 8 inch Mortar                      ",1830,6,3,17,90,7,87
  DATA  84," 4pd Skoda                          ",1869,38,12,35,72,5,18
  DATA  85," 6pd Skoda                          ",1870,28,12,40,72,5,29
  DATA  86," Oriental Rocket                    ",1830,10,0,10,30,8,9
  DATA  87," 12lvr deBeaulieu                   ",1859,18,10,32,91,4,46
  DATA  88," 16cm Obusier                       ",1828,5,5,25,90,6,43
  DATA  89," 22cm Obusier                       ",1828,5,5,28,90,6,64
  DATA  90," 14cm Marine M1864/67               ",1867,10,12,56,85,5,74
  DATA  91," 16cm Marine M1864/66               ",1866,8,12,72,85,5,124
  DATA  92," 19cm Marine M1864/66               ",1866,6,12,70,85,5,209
  DATA  93," 14cm Marine M1870                  ",1870,11,12,72,85,5,84
  DATA  94," 16cm Marine M1870                  ",1870,9,12,85,85,5,153
  DATA  95," 19cm Marine M1870                  ",1870,7,12,100,85,5,250
  DATA  96," 12lb Quick Firer                   ",1892,64,12,100,95,9,20
  DATA  97," 13lb Quick Firer                   ",1899,64,12,100,98,9,22
  DATA  98," 9lb Maxim-Nordenfeldt              ",1882,36,12,48,92,5,14
  DATA  99," 12lb Maxim-Nordenfeldt             ",1882,32,12,50,94,5,19
  DATA 100," 60lb BL gun                        ",1880,28,12,60,95,5,96
  DATA 101," 4.5inch BL howitzer                ",1880,30,12,56,95,5,56
  DATA 102," 12lv Obus de Montagne              ",1830,24,5,7,94,6,22
  DATA 103," 10pfd Haubitze                     ",1830,18,5,7,90,6,36
  DATA 104," 9pd Licorne                        ",1830,25,5,7,90,6,18
  DATA 105," 18pd Licorne                       ",1830,18,6,9,90,6,36
  DATA 106," Weiner 6pfd Kanone                 ",1830,28,4,5,95,3,7
  DATA 107," Weiner 12pfd Kanone                ",1830,16,5,7,95,3,15
  DATA 108," Weiner 7pfd Haubitze               ",1830,24,5,7,90,6,25
  DATA 109," 4lv Canon                          ",1830,28,3,7,97,3,8
  DATA 110," 6lv Canon                          ",1830,28,4,8,95,3,12
  DATA 111," 8lv Canon                          ",1830,21,5,8,97,3,16
  DATA 112," 12lv Canon                         ",1830,15,5,9,97,3,24
  DATA 113," 15cm. Canon Obusier                ",1830,16,6,7,90,6,41
  DATA 114," Potsdamer 6pfd Leichtkanone        ",1830,28,4,5,93,3,9
  DATA 115," Potsdamer 6pfd Schwerkanone        ",1830,25,4,6,95,3,9
  DATA 116," Potsdamer 12pfd Kanone             ",1830,16,5,9,95,3,16
  DATA 117," Potsdamer 7pfd Haubitze            ",1830,26,5,7,90,6,25
  DATA 118," Potsdamer 10pfd Haubitze           ",1830,18,5,7,90,6,36
  DATA 119," Sestrovsk 6pd Gun                  ",1830,28,4,8,93,3,11
  DATA 120," Sestrovsk 12pd Gun                 ",1830,14,5,9,93,3,22
  DATA 121," Dresdener 6pfd Kanone              ",1830,26,4,5,95,3,11
  DATA 122," Dresdener 8pfd Haubitze            ",1830,20,5,7,90,3,33
  DATA 123," Svergise 6lb Gun                   ",1830,28,4,8,95,3,9
  DATA 124," Svergise 5.5 inch Howitzer         ",1830,25,5,7,90,6,27
  DATA 125," Sestrovsk 8pd Gun                  ",1830,22,4,8,90,3,14
  DATA 126," Woolwich 4.4 inch Howitzer         ",1830,28,4,10,95,6,18
  DATA 127," Svergise 12lb Gun                  ",1830,16,5,9,95,3,16
  DATA 128," 14lb Gun                           ",1830,10,4,10,80,3,20
  DATA 129," Leather Gun                        ",1830,28,1,4,50,2,2
  DATA 130," Jingal                             ",1830,32,1,5,80,3,2
  DATA 131," Dresdener 12pfd Kanone             ",1830,16,5,9,95,3,20
  DATA 132," Dresdener 16pfd Haubitze           ",1830,10,6,8,92,6,60
  DATA 133," Danske 10lb Howitzer               ",1830,18,5,7,90,6,36
  DATA 134," Danske 6lb Gun                     ",1830,28,4,8,96,3,9
  DATA 135," Danske 12lb Gun                    ",1830,16,5,9,95,3,18
  DATA 136," Bamboo Gun                         ",1830,20,1,3,40,2,2
  DATA 137," Wooden Gun                         ",1830,18,1,3,30,2,2
  DATA 138," 8pd Sestrovsk Rocket               ",1830,15,2,12,70,8,13
  DATA 139," Zamburek                           ",1830,32,1,5,80,3,1
  DATA 140," Lantaka                            ",1830,32,1,5,80,3,1
  DATA 141," 6lv Canon-obusier                  ",1851,25,6,18,92,6,9
  DATA 142," 12lv Canon-obusier                 ",1851,25,6,18,92,6,19
  DATA 143," 6lb M1841                          ",1841,25,6,15,92,3,9
  DATA 144," 6lb James Rifle                    ",1848,22,8,17,80,4,9
  DATA 145," 9lb M1838                          ",1838,22,5,12,95,3,14
  DATA 146," 12lb M1841                         ",1841,20,5,12,95,3,18
  DATA 147," 12lb M1841 Howitzer                ",1841,22,5,10,95,6,18
  DATA 148," 12lb M1841 Mountain Howitzer       ",1841,22,5,10,95,6,18
  DATA 149," 24lb M1841 Howitzer                ",1841,18,5,12,95,6,36
  DATA 150," 10lb M1863 Parrot Rifle            ",1860,22,10,30,84,4,10
  DATA 151," 12lb Rifled Howitzer               ",1860,22,8,17,92,6,18
  DATA 152," 20lb Rifled Howitzer               ",1860,16,9,19,92,6,29
  DATA 153," 30lb Dahlgren Rifle                ",1860,12,9,19,90,6,44
  DATA 154," 12lb Boat Howitzer                 ",1841,22,5,10,94,6,18
  DATA 155," 12lb Armstrong                     ",1860,22,10,22,95,4,18
  DATA 156," 20lb Armstrong                     ",1860,18,10,24,95,4,29
  DATA 157," 40lb Armstrong                     ",1869,12,12,28,95,4,58
  DATA 158," 18lb Blakely Rifle                 ",1860,20,10,22,90,4,27
  DATA 159," 12lb Whitworth                     ",1860,22,10,24,95,4,18
  DATA 160," 32lb Whitworth                     ",1861,15,12,30,95,4,45
  DATA 161," 9lb Dyer Rifle                     ",1860,24,9,20,88,4,14
  DATA 162," 9lb Ordnance Rifle                 ",1860,24,8,18,88,4,15
  DATA 163," CSA Ordnance Rifle                 ",1861,24,8,18,87,4,16
  DATA 164," Cameron 14lb Rifle                 ",1861,20,8,20,85,4,22
  DATA 165," 18lb Dyer Rifle                    ",1861,16,10,22,84,4,25
  DATA 166," 14lb Reed Rifle                    ",1861,18,8,20,85,4,22
  DATA 167," 14lb James Rifle                   ",1861,20,8,20,84,4,22
  DATA 168," 18lb Reed Rifle                    ",1861,18,9,20,84,4,27
  DATA 169," 50lb Ames Rifle                    ",1862,12,8,20,80,4,67
  DATA 170," 24lb Gun                           ",1830,18,6,12,95,3,33
  DATA 171," 32lb Gun                           ",1830,16,6,12,95,3,44
  DATA 172," 42lb Gun                           ",1830,12,6,12,95,3,55
  DATA 173," 24pd Gun                           ",1830,18,6,12,95,3,33
  DATA 174," 32pd Gun                           ",1830,16,6,12,95,3,44
  DATA 175," 42pd Gun                           ",1830,12,6,12,95,3,55
  DATA 176," 8 inch Columbiad                   ",1844,10,6,24,90,3,82
  DATA 177," 6.4 inch Parrot Rifle              ",1861,10,12,24,80,4,91
  DATA 178," 4.5 inch Dyer Rifle                ",1861,10,12,24,80,4,46
  DATA 179," 4.8 inch Reed Rifle                ",1861,10,12,24,80,4,40
  DATA 180," 5.8 inch Sawyer Rifle              ",1861,10,12,30,80,4,82
  DATA 181," 6.4 inch Dimick Rifle              ",1861,10,12,30,80,4,93
  DATA 182," 8 inch Gun                         ",1848,10,6,16,95,3,82
  DATA 183," 3.25 inch Hales Rocket             ",1849,22,3,20,70,8,55
  DATA 184," 6.4 inch Brook Rifle               ",1861,10,12,24,82,4,91
  DATA 185," 4.6 inch Brook Rifle               ",1861,10,12,24,82,4,46
  DATA 186," 43mm Hotchkiss                     ",1876,41,12,38,76,5,6
  DATA 187," 78mm Hotchkiss                     ",1876,37,12,40,76,5,11
  DATA 188," 150mm Cruseot                      ",1890,32,16,100,97,6,160
  DATA 189," 120mm Krupp                        ",1890,36,15,100,98,9,72
  DATA 190," 18lb Quick Firer                   ",1904,64,12,100,98,9,40
  DATA 191," 4 inch Quick Firer                 ",1898,56,12,100,97,9,40
  DATA 192," 6 inch Quick Firer                 ",1898,48,12,100,97,9,160
  DATA 193," 6 inch Howitzer                    ",1882,32,12,80,95,5,200
  DATA 194," 77mm Krupp                         ",1899,60,15,100,98,9,25
  DATA 195," 65mm Hotchkiss                     ",1876,42,12,38,96,5,21
  DATA 196," 120mm Cruseot                      ",1890,32,12,56,97,9,72
  DATA 197," 90mm Barretta                      ",1886,40,12,48,96,5,40
  DATA 198," 70mm Barretta                      ",1886,48,12,38,96,5,22
  DATA 199," Zarb-zan                           ",1830,10,4,10,80,3,20
  DATA 200," Zamm-zamma                         ",1830,5,4,10,80,3,60
  DATA 201," 3pd St. Petersberg                 ",1871,35,8,18,80,5,22

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

