DEFINT A-W
DECLARE SUB setupmenu ()
DECLARE SUB skill ()
DECLARE SUB uload ()
DECLARE SUB uniord (unit%)
DECLARE SUB mgfire ()
DECLARE SUB pickamo ()
DECLARE SUB combatants ()
DECLARE SUB grabstats (kk%)
DECLARE SUB header ()
DECLARE SUB officercheck ()
DECLARE SUB ofhed ()
DECLARE SUB orderpr (ff%)
DECLARE SUB rendom ()
DECLARE SUB replacestats (mm%)
DECLARE SUB mme ()
DECLARE SUB sh ()
DECLARE SUB ch ()
DECLARE SUB qu ()
DECLARE SUB ax ()
DECLARE SUB eg ()
DECLARE SUB orderch ()
DECLARE SUB al ()
DECLARE SUB bl ()
DECLARE SUB ul ()
DECLARE SUB start ()
DECLARE SUB uload ()
DECLARE SUB pam ()
DECLARE SUB pom ()
DECLARE SUB colordisplay ()
DECLARE FUNCTION getfilecount% (filespec$)
DECLARE SUB movem ()
DECLARE SUB pdate (m%)
DECLARE SUB sa ()
DECLARE SUB firyng ()
DECLARE SUB setupmenu ()
DECLARE FUNCTION windows% (title$, number%, x$())
DECLARE FUNCTION even% (s%)
DECLARE FUNCTION odd% (s%)
DECLARE SUB ccomp ()
DECLARE FUNCTION max% (x%, y%)
DECLARE FUNCTION MIN% (a%, b%)
DECLARE SUB worp (x$)
DECLARE SUB worps (x$)
DECLARE SUB detailupd ()
DECLARE SUB repair ()
DECLARE SUB watet ()
DECLARE SUB keyclear ()
DECLARE SUB wate ()
DECLARE SUB zero ()
DECLARE SUB points ()
DECLARE SUB fpout ()
DECLARE SUB penetrate ()
DECLARE SUB firer ()
DECLARE SUB checkfirer ()
DECLARE SUB targetunit ()
DECLARE SUB range ()
DECLARE SUB checkdisp ()
DECLARE SUB checkall ()
DECLARE SUB bombard ()
DECLARE SUB firerstats ()
DECLARE SUB targetstats ()
DECLARE SUB infire ()
DECLARE SUB artilleryfire ()
DECLARE SUB extratarg ()
DECLARE SUB wounds (cunit%, casc%)
DECLARE SUB pout (cas%)
DECLARE SUB firebac ()
DECLARE SUB armourf ()
DECLARE SUB prout ()
DECLARE SUB brigmorale ()
DECLARE SUB brighead (tl%)
DECLARE SUB setmarch ()
DECLARE SUB movegen (tl%)
DECLARE SUB apeshit (ape%)
DECLARE SUB rendom ()
DECLARE SUB unitdetails (m%)
DECLARE SUB ordercheck ()
DECLARE SUB movegen1 ()
DECLARE SUB b4move ()
DECLARE SUB meleeing ()
DECLARE SUB movement ()
DECLARE SUB melcalc ()
DECLARE SUB defwon ()
DECLARE SUB atwon ()
DECLARE SUB genlist2 (w)
DECLARE SUB pfc ()
DECLARE SUB ptc ()
DECLARE SUB wc ()
DECLARE SUB brigchange (unit%)
DECLARE SUB brigterchange (unit%)
DECLARE SUB changefor (kk%)
DECLARE SUB genlist1 (w)
DECLARE SUB officercheck ()
DECLARE SUB rallytry ()
DECLARE SUB unitchange (unit%)
DECLARE SUB windy ()
DECLARE SUB a1 ()
DECLARE SUB aused ()
DECLARE SUB header ()
DECLARE SUB loadem ()
DECLARE SUB palert ()
DECLARE SUB pvis ()
DECLARE SUB allupdate ()
DECLARE SUB grabstats (kk)
DECLARE SUB oneupdate (tunit)
DECLARE SUB replacestats (mm)
DECLARE SUB chargedisp ()
DECLARE SUB interp ()
DECLARE SUB morale1 (n)
DECLARE SUB panic ()
DECLARE SUB pcharged ()
DECLARE SUB pcharget ()
DECLARE SUB uncon ()
DECLARE SUB pcharger ()
DECLARE SUB skill ()
DECLARE SUB actodpr ()
DECLARE SUB ofiord (unit)
DECLARE SUB ordercase ()
DECLARE SUB orderpr (ff)
DECLARE SUB uniord (unit)
DECLARE SUB front ()
DECLARE SUB setup ()
DECLARE SUB ofhed ()
DECLARE SUB setupdesktop ()
DECLARE SUB MonoDisplay ()
DECLARE SUB handlemenuevent ()
DECLARE SUB testmenu ()
DECLARE SUB makestrings ()
DECLARE SUB makemen ()
DECLARE SUB fastin ()
DECLARE SUB checkamo ()

'$INCLUDE: 'H:\BANDI3\qbx\SRC\general.bi'
'$INCLUDE: 'H:\BANDI3\qbx\SRC\mouse.bi'
'$INCLUDE: 'H:\BANDI3\qbx\SRC\menu.bi'
'$INCLUDE: 'H:\BANDI3\qbx\SRC\window.bi'

COMMON SHARED /uitools/ GloMenu           AS MenuMiscType
COMMON SHARED /uitools/ GloTitle()        AS MenuTitleType
COMMON SHARED /uitools/ GloItem()         AS MenuItemType
COMMON SHARED /uitools/ GloWindow()       AS windowType
COMMON SHARED /uitools/ GloButton()       AS buttonType
COMMON SHARED /uitools/ GloEdit()         AS EditFieldType
COMMON SHARED /uitools/ GloStorage        AS WindowStorageType
COMMON SHARED /uitools/ GloWindowStack()  AS INTEGER
COMMON SHARED /uitools/ GloBuffer$()


COMMON SHARED mele$(), armour$(), rally$(), fail$(), fire$(), charge$()
COMMON SHARED rank$(), windfrom$(), weath$(), terrain$(), morale$(), shot$()
COMMON SHARED formpos$(), nat$(), drill$(), od$(), od1$(), priner$()
COMMON SHARED guntype$(), cat$(), filelist$()
COMMON SHARED fmn(), terrain(), morale(), weff(), Order(), comand$(), ammo$()
COMMON SHARED formation$(), rubbish$(), moralpr$(), uname$(), tired$(), org$()

COMMON SHARED unit$, me$, sof$, review$, bat$, pat$, a$, nn1$, nn2$
COMMON SHARED filespec$, report$, x$, phase$
COMMON SHARED back$, back1$, t$, officer$, fyrer$, gtim$, here$, num$, wind$
COMMON SHARED temp$, staf$, asof$, sig$, hold$

COMMON SHARED armour(), fire(), charge(), formpos(), ammo()

COMMON SHARED skil, cshow, ttype, mr, mf, unit, od, officer, pwl, pw, stafof
COMMON SHARED rally, ralres, tries, ofp, ofpad, nod, ofef, ofchan, flag
COMMON SHARED mef, stafef, sofa, sat, cod, comcon, ofa, action, tod, move
COMMON SHARED brigu, numsub, oftyp, offin, noff, ns, nutot, nua, cl, fires
COMMON SHARED orpos, ortyp, bestod, spm, wp, wp2, death, pen3, movebase
COMMON SHARED ogn, fp, mw, omf, morlos, gunlos, am, menlos, fm, mov
COMMON SHARED disorg, wm, gf, msince, tr, ag, targ, chrge, typew, arm
COMMON SHARED cas, fwin, mins, dex1, rallyxx, gf1, gf2, gf3, displaytype
COMMON SHARED rf, lr, er, ef, tp, se, rf2, lr2, er2, ef2, tp2, gft
COMMON SHARED mi, mc, shot, tmr, mtr, gs, grs, tablz, gff, htim
COMMON SHARED nu, sf, weath, weff, vis, lena, cancel, mo, nord, agr, ofl
COMMON SHARED oldgame, loded, tf, btype, std, aw, tallyho, rushoff
COMMON SHARED hangaround, bbof, bofa, chtype, ltype, countu, k, scn
COMMON SHARED rm, aquire, target, gunsout, expl, suf
COMMON SHARED formp, cform, fyrer, hits, kk, tl, fireback, a
COMMON SHARED guns, gunexp, cat, gunf, pfn, shot1, shot2, fwop
COMMON SHARED fwm, fe, te, r, xs AS SINGLE, x, x1 AS SINGLE, shots, hit1, hit2
COMMON SHARED sud, amtp, firet, mcas, casdiv, wasp, me, odr, wcs
COMMON SHARED tunit, trn, winodr, excas, defodr, guncap, chasp, colours
COMMON SHARED priner, count, moving, tbomb, tbomb1, tbomb2, headcase, hq
COMMON SHARED wmb, nx, priout, ofw, uw, neword, nsub, bad, brigfear, check
COMMON SHARED charger, m, choice, chwm, chargecat, redo, shooters, ftype
COMMON SHARED firetype, casatcause, caspos, lasp, vf, timeh
COMMON SHARED pointshow, pc, gll, men, mecas, hor, gunlost, prinon
COMMON SHARED casl, horcas, guners, gunercas, ng, windir, origtarg, firemod
COMMON SHARED pf, pexit, c1, lv, nst, tu, ofr, numan, stead, mensub
COMMON SHARED windst, pw2, f, movef, sharp, amtp2, eft, eft2
COMMON SHARED elephants, pest1, defcon, st, deffi, attype, mweap, numel
COMMON SHARED pest2, fv, cc, fire, defmen, rank, deffighters, morale, defcount, forced
COMMON SHARED disdef, atdis, atform, atrn, armef, atype, c, protat, atarm
COMMON SHARED typedef, atwep, atcc, atmen, atfi, atfighters, atfc, atcount
COMMON SHARED protdef, defwep, deftr, deftrn, defact, defch, upd, char
COMMON SHARED comdisp, morp, mx, mv1, rx, mm1, mp, tfi, wefap, ndis, meleeup
COMMON SHARED deform, defad, definf, defcav, deftype, ell, targart
COMMON SHARED assat, asmr, atinf, atcav, atall, defall, trecover, exitp
COMMON SHARED targmen, targfe, targte, erf, pt, otpm, ofod, toc, tom
COMMON SHARED turn, recoil, cast, ofpm, reciprocal, arl, x2 AS SINGLE, origfire, unitstore
COMMON SHARED tr1, q, xr2, xr, retfire, se2, casdefcause, defarm
COMMON SHARED rst, disp, pan, sharp1, pen1, targcas, adone, bestodr
COMMON SHARED sl, sln, n, n1, n2, bly, con, v, w, y, z, mgs, gunwoble
COMMON SHARED amot, mg1, mg2, explode

COMMON SHARED leave AS SINGLE, upv  AS SINGLE, pww AS SINGLE, pv AS SINGLE, uchan  AS SINGLE, tpv AS SINGLE, modcon AS SINGLE, modconm AS SINGLE
COMMON SHARED shooters1 AS SINGLE, shooters2 AS SINGLE, casm AS SINGLE, casf AS SINGLE, casp AS SINGLE, fear AS SINGLE, uchanc AS SINGLE, casr AS SINGLE
COMMON SHARED rff AS SINGLE, rff2 AS SINGLE, imp1 AS SINGLE, imp2 AS SINGLE
COMMON SHARED r1 AS SINGLE, r2 AS SINGLE, acc AS SINGLE, atwm AS SINGLE, defwm AS SINGLE
COMMON SHARED rs AS SINGLE, firedis AS SINGLE
COMMON SHARED cas1 AS SINGLE, cas2 AS SINGLE, cas3 AS SINGLE, cas4 AS SINGLE

