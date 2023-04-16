DEFINT A-Y
DECLARE SUB noway ()
DECLARE SUB printit ()
DECLARE SUB mgp (count)
DECLARE SUB countup ()
DECLARE SUB die ()
DECLARE SUB sortit (k)
DECLARE SUB ofnal ()
DECLARE SUB header ()
DECLARE SUB owounds ()
DECLARE SUB batrec ()
DECLARE SUB genup ()
DECLARE SUB movem ()
DECLARE SUB deleat (x, y, w)
DECLARE SUB train ()
DECLARE SUB batlpr ()
DECLARE SUB bufq ()
DECLARE SUB campr ()
DECLARE SUB ordal (n)
DECLARE SUB sortit (k)
DECLARE SUB trainit ()
DECLARE SUB untrain ()
DECLARE SUB expch (nv)
DECLARE SUB dayad ()
DECLARE SUB die ()
DECLARE SUB diseaze ()
DECLARE SUB setdate ()
DECLARE SUB modexp ()
DECLARE SUB modlos ()
DECLARE SUB wipeout ()
DECLARE SUB comch (nv)
DECLARE SUB bm1 (buf)
DECLARE SUB bufm ()
DECLARE SUB usave ()
DECLARE SUB uload ()
DECLARE FUNCTION getfilecount (filespec$)
DECLARE SUB revewe ()
DECLARE SUB corpz ()
DECLARE SUB decorate ()
DECLARE SUB equal ()
DECLARE SUB movoff ()
DECLARE SUB offtry ()
DECLARE SUB redef ()
DECLARE SUB setofa ()
DECLARE SUB setofl ()
DECLARE SUB disband ()
DECLARE SUB drafts ()
DECLARE SUB repem ()
DECLARE SUB latlong ()
DECLARE SUB free ()
DECLARE FUNCTION autoname$ (m)
DECLARE SUB nofficer ()
DECLARE SUB promote ()
DECLARE SUB bfchnge (x)
DECLARE SUB troopr ()
DECLARE SUB offch ()
DECLARE SUB commite ()
DECLARE SUB exper ()
DECLARE FUNCTION even (x)
DECLARE SUB checkem ()
DECLARE SUB countup ()
DECLARE SUB zero ()
DECLARE SUB statpr ()
DECLARE SUB changit (xx)
DECLARE SUB wepz ()
DECLARE SUB classs ()
DECLARE SUB classch (x)
DECLARE SUB comch (x)
DECLARE SUB expch (nv)
DECLARE SUB fmtn ()
DECLARE SUB men ()
DECLARE SUB namech ()
DECLARE SUB subu ()
DECLARE SUB ttype ()
DECLARE SUB strength ()
DECLARE SUB unamed ()
DECLARE SUB grabstuff ()
DECLARE SUB ofdet ()
DECLARE SUB natcheck1 ()
DECLARE FUNCTION MAX (x, y)
DECLARE FUNCTION ODD (x)
DECLARE SUB officrs ()
DECLARE SUB genlist (x)
DECLARE SUB mstring ()
DECLARE SUB rendom ()
DECLARE SUB sentence ()
DECLARE SUB replce ()
DECLARE SUB chofal ()
DECLARE SUB chofla ()
DECLARE SUB offnat ()
DECLARE SUB offrank ()
DECLARE SUB sets ()
DECLARE SUB natans ()
DECLARE SUB worp (x$)
DECLARE SUB worps (x$)
DECLARE SUB setofn ()
DECLARE SUB setuname ()
DECLARE SUB wate ()
DECLARE SUB quit ()
DECLARE SUB sap (count)
DECLARE SUB keyclear ()
DECLARE SUB ap (count)
DECLARE FUNCTION MIN (a, b)
DECLARE SUB wepnpr ()
DECLARE FUNCTION trim$ (x$)
DECLARE SUB natchek ()
DECLARE FUNCTION windows (title$, number, x$())
DECLARE SUB copyright ()
DECLARE SUB newarm ()
DECLARE SUB newdiv ()
DECLARE SUB brig ()
DECLARE SUB singu ()
DECLARE SUB wdet ()
DECLARE SUB colordisplay ()
DECLARE SUB setupmenu ()
DECLARE SUB setupdesktop ()
DECLARE SUB MonoDisplay ()
DECLARE SUB handlemenuevent ()
DECLARE SUB testmenu ()
DECLARE SUB makestrings ()
DECLARE SUB makemen ()
DECLARE SUB makestrings ()
DECLARE SUB MonoDisplay ()
DECLARE SUB getdetails ()
DECLARE FUNCTION num ()
DECLARE SUB wepnstats ()
DECLARE SUB infantry ()
DECLARE SUB artillery ()
DECLARE SUB logstats (sbt)
DECLARE FUNCTION Points! ()
DECLARE SUB countpts ()
DECLARE SUB grabstats (xx)
DECLARE SUB po1 ()
DECLARE SUB artpr ()
DECLARE SUB totpr ()

'$INCLUDE: 'general.bi'
'$INCLUDE: 'mouse.bi'
'$INCLUDE: 'menu.bi'
'$INCLUDE: 'window.bi'

COMMON SHARED /uitools/ GloMenu           AS MenuMiscType
COMMON SHARED /uitools/ GloTitle()        AS MenuTitleType
COMMON SHARED /uitools/ GloItem()         AS MenuItemType
COMMON SHARED /uitools/ GloWindow()       AS windowType
COMMON SHARED /uitools/ GloButton()       AS buttonType
COMMON SHARED /uitools/ GloEdit()         AS EditFieldType
COMMON SHARED /uitools/ GloStorage        AS WindowStorageType
COMMON SHARED /uitools/ GloWindowStack()  AS INTEGER
COMMON SHARED /uitools/ GloBuffer$()

REM COMMON SHARED string arrays
COMMON SHARED force$(), force(), force1$(), delet(), finame$(), faccr$(), far$(), n1$(), language$(), ntype$(), nation$(), mess$(), mess()
COMMON SHARED fate$(), happy$(), prim$(), brave$(), lbase(), able$(), obase(), loyal$(), skill$(), infl$(), death$(), hcase$(), game$(), action$(), action()
COMMON SHARED weather$(), weather(), terrain$(), terrain(), tyme$(), route$(), route()
COMMON SHARED batres$(), batres(), month$(), month(), days$(), supply$(), supply(), repl$(), repl()
COMMON SHARED armour$(), disease$(), disease(), morale$(), ofrale$(), morale(), aftbat$(), aftbat()
COMMON SHARED type$(), band$(), tipe(), chopper$(), chopper(), officer$(), officer(), comand$(), formpos$(), formpos()
COMMON SHARED gun$(), gun(), musket$(), musket(), experience$(), experience(), commit$(), commit(), class$(), class()
COMMON SHARED buffer$(), tt$(), wch$(), hm$(), uname$(), wtypem$(), wtypea$()
COMMON SHARED detail$(), tit$(), tat$(), tot$(), na1$(), na2$(), na3$(), tirt$(), ttx$()
COMMON SHARED filelist$(), ttll$(), ttlox$(), gatling$(), gatling(), who$()
COMMON SHARED guntype$(), gatype$(), mustype$(), chop$(), who()

REM COMMON SHARED  variables                  
COMMON SHARED oftyp, numan, arm, trype, tc, te, mo, stead, fd, cc, mvb, nsu
COMMON SHARED ogf, fm, wp, mw, omf, amo, cmt, wm, mr, gf, mf, pw, ag, cf, gf2
COMMON SHARED dayth, month, year, dayt, buffer, starbite, nlang, nat, eta
COMMON SHARED x, ok, yeal, area, priner, montl, daytl, yearl, ntype, army
COMMON SHARED con, stpr, pv!, upv!, tpv!, clang, latlon, apoints, numtroops
COMMON SHARED dt, rf, er, lr, ef, tpw, se, dt2, rf2, er2, lr2, ef2, tpw2, se2
COMMON SHARED posw, west, posn, north, lo, ofa, ofl, ofr, pt!, pww!, ofrank
COMMON SHARED typ, troop, uch, opv!, mpv!, lowpv!, leavegame, wipeote, wp2
COMMON SHARED tnb, tnbo, tnh, tnho, tng, tna, tnao, offname, uname, units
COMMON SHARED numel, ortot, cas, tcas, tpris, prisoner, gscalesc2, sc3, tgt
COMMON SHARED lpvu, goody, rep, bgdewm, pointz, unit, odr, genable, plst
COMMON SHARED sp, wa, menlos, allnat, counts, middle, bfr, ext, tr, del
COMMON SHARED softyp, bgde, divn, corps, geninf, genr, fate, ofn, count
COMMON SHARED sighs, std, ofp, ofi, displaytype, pointshow, allofa, alltry
COMMON SHARED chofa, chofl, allofl, sl, n, n2, bl, g, genpest, cs
COMMON SHARED morlos, morec, enmact, tact, gunlos, gres
COMMON SHARED pres, bres, armywm, actwm, act, erf, targpv!, pvm!, pmv!
COMMON SHARED pofa, pofi, pofl, pofc, deaf, tp, wd, pest
COMMON SHARED fdue, ted, tem, tea, ofw, wepn, dc, targtyp, cut, nut, nuts
COMMON SHARED mgs, tmgs, amot, pw2, nte


REM COMMON SHARED strings
COMMON SHARED m$, chap$, cr$, pat$, lat$, r$, uname$, happy$, n1$, review$
COMMON SHARED cdate$, moved$, gen$, back$, back1$, cmd$, report$, aname$

COMMON SHARED md AS SINGLE, xs AS SINGLE, x1 AS SINGLE, x2 AS SINGLE
COMMON SHARED z AS SINGLE, waste AS SINGLE, xlos AS SINGLE
COMMON SHARED pw1 AS SINGLE

