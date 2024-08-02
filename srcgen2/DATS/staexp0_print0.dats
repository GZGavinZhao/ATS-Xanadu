(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
(*
Author: Hongwei Xi
Start Time: June 08th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload
_(*?*) = "./lexing0_print0.dats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
(* ****** ****** *)

#implfun
t0int_fprint
(out, int) =
let
#impltmp
g_print$out<>() = out
in//let
case+ int of
|
T0INTnone(tok) =>
print("T0INTnone(", tok, ")")
|
T0INTsome(tok) =>
print("T0INTsome(", tok, ")")
end (*let*) // end of [t0int_fprint]

(* ****** ****** *)

#implfun
t0chr_fprint
(out, chr) =
let
#impltmp
g_print$out<>() = out
in//let
case+ chr of
|
T0CHRnone(tok) =>
print("T0CHRnone(", tok, ")")
|
T0CHRsome(tok) =>
print("T0CHRsome(", tok, ")")
end (*let*) // end of [t0chr_fprint]

(* ****** ****** *)

#implfun
t0flt_fprint
(out, flt) =
let
#impltmp
g_print$out<>() = out
in//let
case+ flt of
|
T0FLTnone(tok) =>
print("T0FLTnone(", tok, ")")
|
T0FLTsome(tok) =>
print("T0FLTsome(", tok, ")")
end (*let*) // end of [t0flt_fprint]

(* ****** ****** *)

#implfun
t0str_fprint
(out, str) =
let
#impltmp
g_print$out<>() = out
in//let
case+ str of
|
T0STRnone(tok) =>
print("T0STRnone(", tok, ")")
|
T0STRsome(tok) =>
print("T0STRsome(", tok, ")")
end (*let*) // end of [t0str_fprint]

(* ****** ****** *)

#implfun
i0dnt_fprint
(out, id0) =
let
#impltmp
g_print$out<>() = out
in//let
case+
id0.node() of
|
I0DNTnone(tok) =>
print("I0DNTnone(", tok, ")")
|
I0DNTsome(tok) =>
print("I0DNTsome(", tok, ")")
end (*let*) // end of [i0dnt_fprint]

(* ****** ****** *)

#implfun
l0abl_fprint
(out, lab) =
let
#impltmp
g_print$out<>() = out
in//let
case+
lab.node() of
|
L0ABLnone(tok) =>
print("L0ABLnone(", tok, ")")
|
L0ABLsome(lab) =>
print("L0ABLsome(", lab, ")")
end (*let*) // end of [l0abl_fprint]

(* ****** ****** *)

#implfun
s0ymb_fprint
(out, sym) =
let
#impltmp
g_print$out<>() = out
in//let
case+
sym.node() of
|
S0YMBi0dnt(id0) =>
print("S0YMBi0dnt(", id0, ")")
(*
|
S0YMBdtlab of (token, l0abl)
*)
|
S0YMBbrckt(tk1, tk2) =>
print
("S0YMBbrckt(", tk1, ";", tk2, ")")
end (*let*) // end of [s0ymb_fprint]

(* ****** ****** *)

(*
fun
<x0:type>
s0lab_fprint
(out: FILR, lab: s0lab(x0)): void
*)

(* ****** ****** *)
//
#implfun
s0qid_fprint
(out, qid) =
let
#impltmp
g_print$out<>() = out
in//let
case+ qid of
|
S0QIDnone(id0) =>
print("S0QIDnone(", id0, ")")
|
S0QIDsome(tok, id0) =>
print
("S0QIDsome(", tok, ";", id0, ")")
end (*let*) // end of [s0qid_fprint]
//
#implfun
d0qid_fprint
(out, qid) =
let
#impltmp
g_print$out<>() = out
in//let
case+ qid of
|
D0QIDnone(id0) =>
print("D0QIDnone(", id0, ")")
|
D0QIDsome(tok, id0) =>
print
("D0QIDsome(", tok, ";", id0, ")")
end (*let*) // end of [d0qid_fprint]
//
(* ****** ****** *)

#implfun
g0nam_fprint
(out, g0n) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
g0n.node() of
//
|
G0Nid0(id0) =>
print("G0Nid0(", id0, ")")
//
|
G0Nint(tok) =>
print("G0Nint(", tok, ")")
|
G0Nchr(tok) =>
print("G0Nchr(", tok, ")")
|
G0Nflt(tok) =>
print("G0Nflt(", tok, ")")
|
G0Nstr(tok) =>
print("G0Nstr(", tok, ")")
//
|
G0Nlist(tk1, gns, tk2) =>
print
("G0Nlist(", tk1, ";", gns, ";", tk2, ")")
//
(*
|
G0Nnone0(   ) => print("G0Nnone0(", ")")
*)
|
G0Ntkerr(tok) => print("G0Ntkerr(", tok, ")")
//
end (*let*) // end of [g0nam_fprint(g0n)]

(* ****** ****** *)

#implfun
g0exp_fprint
(out, g0e) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
g0e.node() of
|
G0Eid0(id0) =>
print("G0Eid0(", id0, ")")
//
|
G0Eint(tok) =>
print("G0Eint(", tok, ")")
|
G0Echr(tok) =>
print("G0Echr(", tok, ")")
|
G0Eflt(tok) =>
print("G0Eflt(", tok, ")")
|
G0Estr(tok) =>
print("G0Estr(", tok, ")")
//
|
G0Eapps(ges) =>
print("G0Eapps(", ges, ")")
|
G0Elpar(tkb, ges, tke) =>
print
("G0Elpar(", tkb, ";", ges, ",", tke, ")")
//
|
G0Eift0
(tknd,g0e1,g0e2,g0e3,topt) =>
(
print("G0Eift0(",tknd,";");
print(g0e1,";",g0e2,";",g0e3,";",topt,")"))
//
|
G0Etkerr(tok) => print("G0Etkerr(", tok, ")")
//
|
G0Eerrck
(lvl(*err*),ge1) => print("G0Eerrck(",lvl,";",ge1,")")
//
end (*let*) // end of [g0exp_fprint(out,g0e)]

(* ****** ****** *)

#implfun
g0mag_fprint
(out, gma) =
(
case+
gma.node() of
|
G0MAGnone(tok) =>
print("G0MAGnone(",tok,")")
|
G0MAGsarg
(tbeg,g0as,tend) =>
print
("G0MAGsarg("
,tbeg,";",g0as,";",tend,")")
|
G0MAGdarg
(tbeg,g0as,tend) =>
print
("G0MAGdarg("
,tbeg,";",g0as,";",tend,")")
) where
{
  #impltmp g_print$out<>() = out
} (*where*) // end of [g0mag_fprint(out,gma)]

(* ****** ****** *)

#implfun
sort0_fprint
( out, s0t ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
s0t.node() of
|
S0Tid0(id0) =>
print("S0Tid0(",id0,")")
//
|
S0Tint(int) =>
print("S0Tint(",int,")")
//
// HX: qualified
|
S0Tqid(tk1,st2) =>
print("S0Tqid(",tk1,";",st2,")")
//
|
S0Tapps(sts) =>
print("S0Tapps(",sts,")")
//
|
S0Tlpar(tkb,sts,tke) =>
print
("S0Tlpar(",tkb,";",sts,";",tke,")")
//
(*
|
S0Ttype of int(*kind*)
// prop/view/type/tbox/tflt/vwtp/vtbx/vtft
*)
|
S0Ttkerr(tok) => print("S0Ttkerr(",tok,")")
|
S0Terrck
(lvl(*err*),st1) => print("S0Terrck(",lvl,";",st1,")")
//
end (*let*)//end-of-[sort0_fprint(out,s0t)]

(* ****** ****** *)

#implfun
s0tcn_fprint
( out, tcn ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
tcn.node() of
|
S0TCNnode(id0, stq) =>
print("S0TCNnode(",id0,";",stq,")")
end (*let*) // end of [s0tcn_fprint]

(* ****** ****** *)

#implfun
d0tst_fprint
( out, dst ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dst.node() of
|
D0TSTnode(tid0,teq1,topt,stcs) =>
(
print("D0TSTnode(",tid0);
print(";",teq1,";",topt,";",stcs,")"))
end (*let*) // end of [d0tst_fprint]

(* ****** ****** *)

#implfun
s0arg_fprint
( out, s0a ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
s0a.node() of
|
S0ARGnone(tok) =>
print("S0ARGnone(", tok, ")")
|
S0ARGsome(id0, tres) =>
print("S0ARGsome(",id0,";",tres,")")
//
end (*let*) // end of [s0arg_fprint]

(* ****** ****** *)

#implfun
t0arg_fprint
( out, t0a ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
t0a.node() of
|
T0ARGnone(tok) =>
print("T0ARGnone(", tok, ")")
|
T0ARGsome(s0t1, topt) =>
print("T0ARGsome(",s0t1,";",topt,")")
//
end (*let*) // end of [t0arg_fprint(out,t0a)]

(* ****** ****** *)

#implfun
s0mag_fprint
( out, s0m ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
s0m.node() of
|
S0MAGnone(tok) =>
print("S0MAGnone(", tok, ")")
|
S0MAGsing(id0) =>
print("S0MAGsing(", id0, ")")
|
S0MAGlist(tbeg, s0as, tend) =>
print("S0MAGlist(",tbeg,";",s0as,";",tend,")")
//
end (*let*)//end of [s0mag_fprint(out,s0m)]

(* ****** ****** *)

#implfun
t0mag_fprint
( out, t0m ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
t0m.node() of
|
T0MAGnone(tok) =>
print("T0MAGnone(", tok, ")")
(*
|
T0MAGsing(id0) =>
print("T0MAGsing(", id0, ")")
*)
|
T0MAGlist(tbeg, t0as, tend) =>
print("T0MAGlist(",tbeg,";",t0as,";",tend,")")
//
end (*let*)//end of [t0mag_fprint(out,t0m)]

(* ****** ****** *)

#implfun
s0qua_fprint
( out, s0q ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
s0q.node() of
|
S0QUAprop(s0e) =>
print("S0QUAprop(", s0e, ")")
|
S0QUAvars(ids, tres) =>
print("S0QUAvars(", ids, ";", tres, ")")
//
end (*let*)//end of [s0qua_fprint(out,s0q)]

(* ****** ****** *)

#implfun
s0exp_fprint
( out, s0e ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
s0e.node() of
|
S0Eid0(id0) =>
print("S0Eid0(",id0,")")
//
|
S0Eop1(tok) =>
print("S0Eop1(",tok,")")
|
S0Eop2(tok) =>
print("S0Eop2(",tok,")")
|
S0Eop3(tkb,id0,tke) =>
(
print
("S0Eop3(",tkb,";",id0,";",tke,")"))
//
|
S0Eint(int) => print("S0Eint(",int,")")
|
S0Echr(chr) => print("S0Echr(",chr,")")
|
S0Eflt(flt) => print("S0Eflt(",flt,")")
|
S0Estr(str) => print("S0Estr(",str,")")
//
|
S0Eapps(ses) => print("S0Eapps(",ses,")")
//
|
S0Efimp
(tkb,ses,tke) =>
(
print
("S0Efimp(",tkb,";",ses,";",tke,")"))
//
|
S0Elpar
(tkb,ses,srp) =>
(
print
("S0Elist(",tkb,";",ses,";",srp,")"))
//
|
S0Etup1
(tkb,opt,ses,srp) =>
(
print("S0Etup1(");
print(tkb,";",opt,";",ses,";",srp,")"))
//
|
S0Ercd2
(tkb,opt,lses,lsrb) =>
(
print("S0Ercd2(");
print(tkb,";",opt,";",lses,";",lsrb,")"))
//
|
S0Elams
(tlam,s0ms
,tres,arrw,body,tend) =>
(
print("S0Elams(");
print(tlam,";",s0ms,";");
print(tres,";",arrw,";",body,";",tend,")"))
//
|
S0Euni0(tkb,sqs,tbe) =>
(
print
("S0Euni0(",tkb,";",sqs,";",tbe,")"))
|
S0Eexi0(tkb,sqs,tbe) =>
(
print
("S0Eexi0(",tkb,";",sqs,";",tbe,")"))
|
S0Eannot(se1,st2) =>
(
  print("S0Eannot(",se1,";",st2,")"))//HX:annotation
|
S0Equal0(tok,se1) =>
(
  print("S0Equal0(",tok,";",se1,")"))//HX:qual-s0exp
//
|
S0Etkerr(tok) => print("S0Etkerr(",tok,")")//HX:error
|
// HX: [S0Eerrck]: syntax error confirmed by checking
S0Eerrck
(lvl(*err-level*),se1) => print("S0Eerrck(", lvl, ";", se1,")")
//
end (*let*)//end-of-[s0exp_fprint(out,s0e)]

(* ****** ****** *)

#implfun
s0tdf_fprint
( out, stdf ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
stdf.node() of
|
S0TDFsort(s0t1) =>
(
  print("S0TDFsort(",s0t1,")")
)
|
S0TDFtsub
(tbeg,s0a1,tbar,s0es,tend) =>
( print("S0TDFtsub(")
; print(tbeg,";",s0a1,";"); print(tbar,";",s0es,";",tend,")"))
//
end (*let*) // end of [s0tdf_fprint(out,stdf)]

(* ****** ****** *)

#implfun
g0exp_THEN_fprint
  (out, gthn) =
(
case+ gthn of
|
g0exp_THEN(tok, g0e) =>
print("g0exp_THEN(", tok, ";", g0e, ")")
) where
{
#impltmp g_print$out<>() = out
} (*where*) // end of [g0exp_THEN_fprint]
#implfun
g0exp_ELSE_fprint
  (out, gels) =
(
case+ gels of
|
g0exp_ELSE(tok, g0e) =>
print("g0exp_ELSE(", tok, ";", g0e, ")")
) where
{
#impltmp g_print$out<>() = out
} (*where*) // end of [g0exp_ELSE_fprint]

(* ****** ****** *)

#implfun
s0exp_RPAREN_fprint
  (out, srp) =
let
#impltmp
g_print$out<>() = out
in//let
case+ srp of
|
s0exp_RPAREN_cons0(tbar) =>
print("s0exp_RPAREN_cons0(",tbar,")")
|
s0exp_RPAREN_cons1(tok1, s0es, tok2) =>
print("s0exp_RPAREN_cons1(",tok1,";",s0es,";",tok2,")")
end (*let*) // end of [s0exp_RPAREN_fprint]

(* ****** ****** *)

#implfun
l0s0e_RBRACE_fprint
  (out, lsrb) =
let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lsrb of
|
l0s0e_RBRACE_cons0(tbar) =>
print("l0s0e_RBRACE_cons0(",tbar,")")
|
l0s0e_RBRACE_cons1(tok1, lses, tok2) =>
print("l0s0e_RBRACE_cons1(",tok1,";",lses,";",tok2,")")
end (*let*) // end of [l0s0e_RBRACE_fprint]

(* ****** ****** *)

#implfun
s0uni_fprint
  (out, s0u0) =
let
//
#impltmp
g_print$out<>() = out
//
in//let
//
case+
s0u0.node() of
|
S0UNInone(tok) =>
print("S0UNInone(",tok,")")
|
S0UNIsome(tbeg, s0qs, tend) =>
print("S0UNIsome(",tbeg,";",s0qs,";",tend,")")
//
end (*let*) // end of [s0uni_fprint]

(* ****** ****** *)

#implfun
d0tcn_fprint
( out, tcn ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
tcn.node() of
|
D0TCNnode
(s0us, deid, s0is, tres) =>
(
print("D0TCNnode(");
print(s0us,";",deid,";",s0is,";",tres,")"))
end (*let*) // end of [d0tcn_fprint]

(* ****** ****** *)

#implfun
d0typ_fprint
( out, typ ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
typ.node() of
|
D0TYPnode
(deid, tmas, tres, teq1, dtcs) =>
(
print("D0TYPnode(",deid,";");
print(tmas,";",tres,";",teq1,";",dtcs,")"))
end (*let*) // end of [d0typ_fprint]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_staexp0_print0.dats] *)
