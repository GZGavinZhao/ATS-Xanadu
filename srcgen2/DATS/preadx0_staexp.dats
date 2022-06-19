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
Start Time: June 17th, 2022
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
(* ****** ****** *)
#staload "./../SATS/preadx0.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with sort0_get_lctn
#symload node with sort0_get_node
(* ****** ****** *)
#symload lctn with s0exp_get_lctn
#symload node with s0exp_get_node
(* ****** ****** *)
//
fun
sort0_errck_a1
(s0t: sort0): sort0 =
(
sort0
(s0t.lctn(), S0Terrck(1, s0t))
)//end-of-[sort0_errck_a1(_)]
fun
sort0_errck_a2
(lvl: sint
,s0t: sort0): sort0 =
(
sort0
(s0t.lctn(), S0Terrck(lvl, s0t))
)//end-of-[sort0_errck_a2(_,_)]
#symload
sort0_errck with sort0_errck_a1
#symload
sort0_errck with sort0_errck_a2
//
(* ****** ****** *)
fun
sort0_errvl
(s0t: sort0): sint =
(
case+ s0t.node() of
|
S0Terrck
(lvl, _) => lvl | _ => 0
)
#symload errvl with sort0_errvl
(* ****** ****** *)
fun
sort0_errvl_a2
(st1: sort0
,st2: sort0): sint =
max
(errvl(st1),errvl(st2))
#symload errvl with sort0_errvl_a2
(* ****** ****** *)
fun
sort0_errvl_a3
(st1: sort0
,st2: sort0
,st3: sort0): sint =
max
(errvl(st1)
,errvl(st2),errvl(st3))
#symload errvl with sort0_errvl_a3
(* ****** ****** *)
#extern
fun
sort0_errvl_xs
(sts: sort0lst): sint
#symload errvl with sort0_errvl_xs
#implfun
sort0_errvl_xs(sts) =
(
case+ sts of
| list_nil
  ((*nil*)) => 0
| list_cons
  (st1,sts) => max(errvl(st1),errvl(sts))
)
(* ****** ****** *)
//
fun
sort0_apps_errck
( loc
: loc_t
, sts
: sort0lst): sort0 =
let
val lvl = errvl(sts)
in//let
sort0_errck(lvl+1, sort0(loc,S0Tapps(sts)))
end (*let*) // end of [sort0_apps_errck]
//
fun
sort0_lpar_errck
( loc
: loc_t
, tkb
: token
, sts
: sort0lst
, tke
: token   ): sort0 =
let
  val lvl = errvl(sts)
in//let
sort0_errck(lvl+1, sort0(loc,S0Tlpar(tkb,sts,tke)))
end (*let*) // end of [sort0_lpar_errck]
//
(* ****** ****** *)
//
#implfun
preadx0_sort0(s0t, err) =
(
case+
s0t.node() of
|
S0Tid0 _ => s0t
|
S0Tint _ => s0t
|
S0Tqid _ => f0_qid(s0t, err)
|
S0Tapps _ => f0_apps(s0t, err)
//
|
S0Tlpar _ => f0_lpar(s0t, err)
//
|
S0Ttkerr _ =>
(err := err+1; sort0_errck(s0t))
//
|
S0Terrck _ =>
(err := err+1; sort0_errck(s0t))
) where//end-of(case(s0t.node()))
{
//
fun
f0_qid
( s0t
: sort0
, err
: &sint >> _): sort0 =
( err := err+1; sort0_errck(s0t) )
//
fun
f0_apps
( s0t
: sort0
, err
: &sint >> _): sort0 =
let
val e00 = err
val-
S0Tapps(sts) = s0t.node()
val sts = preadx0_sort0lst(sts, err)
in//let
if
(err = e00)
then s0t else sort0_apps_errck(s0t.lctn(), sts)
end (*let*) // end of [f0_apps]
//
fun
f0_lpar
( s0t
: sort0
, err
: &sint >> _): sort0 =
let
//
val e00 = err
//
val-
S0Tlpar
(tkb,sts,tke) = s0t.node()
//
val sts =
preadx0_sort0lst(sts, err)
//
val ( ) = // tke: T_RPAREN
(
case+
tke.node() of
| T_RPAREN() => ()
| _(* else *) => (err := err+1)
)
in//let
if
(err = e00)
then s0t else sort0_lpar_errck(s0t.lctn(),tkb,sts,tke)
end (*let*) // end of [f0_lpar]
//
} (*where*) // end of [preadx0_sort0]
//
(* ****** ****** *)
//
fun
s0exp_errck_a1
(s0e: s0exp): s0exp =
(
s0exp
(s0e.lctn(), S0Eerrck(1, s0e))
)//end-of-[s0exp_errck_a1(_)]
fun
s0exp_errck_a2
(lvl: sint
,s0e: s0exp): s0exp =
(
s0exp
(s0e.lctn(), S0Eerrck(lvl, s0e))
)//end-of-[s0exp_errck_a2(_,_)]
#symload
s0exp_errck with s0exp_errck_a1
#symload
s0exp_errck with s0exp_errck_a2
//
(* ****** ****** *)
fun
s0exp_errvl
(s0e: s0exp): sint =
(
case+ s0e.node() of
|
S0Eerrck
(lvl, _) => lvl | _ => 0
)
#symload errvl with s0exp_errvl
(* ****** ****** *)
fun
s0exp_errvl_a2
(st1: s0exp
,st2: s0exp): sint =
max
(errvl(st1),errvl(st2))
#symload errvl with s0exp_errvl_a2
(* ****** ****** *)
fun
s0exp_errvl_a3
(st1: s0exp
,st2: s0exp
,st3: s0exp): sint =
max
(errvl(st1)
,errvl(st2),errvl(st3))
#symload errvl with s0exp_errvl_a3
(* ****** ****** *)
#extern
fun
s0exp_errvl_xs
(sts: s0explst): sint
#symload errvl with s0exp_errvl_xs
#implfun
s0exp_errvl_xs(sts) =
(
case+ sts of
| list_nil
  ((*nil*)) => 0
| list_cons
  (st1,sts) => max(errvl(st1),errvl(sts))
)
(* ****** ****** *)
//
fun
s0exp_op1_errck
( loc
: loc_t
, tok
: token): s0exp =
let
val lvl = 0 in
s0exp_errck(lvl+1, s0exp(loc,S0Eop1(tok)))
end (*let*) // end of [s0exp_op1_errck]
//
fun
s0exp_op2_errck
( loc
: loc_t
, tok
: token): s0exp =
let
val lvl = 0 in
s0exp_errck(lvl+1, s0exp(loc,S0Eop2(tok)))
end (*let*) // end of [s0exp_op2_errck]
//
fun
s0exp_op3_errck
( loc
: loc_t
, tkb
: token
, id0
: i0dnt
, tke
: token): s0exp =
let
val lvl = 0
in//let
s0exp_errck
(lvl+1, s0exp(loc, S0Eop3(tkb, id0, tke)))
end (*let*) // end of [s0exp_op3_errck]
//
(* ****** ****** *)
//
fun
s0exp_apps_errck
( loc
: loc_t
, ses
: s0explst): s0exp =
let
val lvl = errvl(ses)
in//let
s0exp_errck(lvl+1, s0exp(loc,S0Eapps(ses)))
end (*let*) // end of [s0exp_apps_errck]
//
(* ****** ****** *)
//
fun
s0exp_lpar_errck
( loc
: loc_t
, tkb
: token
, ses
: s0explst
, srp
: s0exp_RPAREN): s0exp =
let
  val lvl = errvl(ses)
in//let
s0exp_errck(lvl+1, s0exp(loc,S0Elpar(tkb,ses,srp)))
end (*let*) // end of [s0exp_lpar_errck]
//
(* ****** ****** *)
//
#implfun
preadx0_s0exp(s0e, err) =
(
//
case+
s0e.node() of
//
| S0Eid0 _ => s0e
//
| S0Eint _ => s0e
| S0Echr _ => s0e
| S0Eflt _ => s0e
| S0Estr _ => s0e
//
|
S0Eop1 _ => f0_op1(s0e, err)
|
S0Eop2 _ => f0_op2(s0e, err)
|
S0Eop3 _ => f0_op3(s0e, err)
//
|
S0Eapps _ => f0_apps(s0e, err)
|
S0Elpar _ => f0_lpar(s0e, err)
//
|
S0Etkerr _ =>
(err := err+1; s0exp_errck(s0e))
//
|
S0Eerrck _ =>
(err := err+1; s0exp_errck(s0e))
//
) where//end-of(case(s0e.node()))
{
//
fun
f0_op1
( s0e
: s0exp
, err
: &sint >> _): s0exp =
let
val-
S0Eop1(tok) = s0e.node()
in//let
//
s0exp_op1_errck(s0e.lctn(), tok)
//
end(*let*)//end-of(f0_op1(s0e,err))
//
fun
f0_op2
( s0e
: s0exp
, err
: &sint >> _): s0exp =
let
val e00 = err
val-
S0Eop2(tok) = s0e.node()
in//let
//
case+
tok.node() of
|
T_IDSYM _ => s0e
|
_(*else*) => // HX: invalid
s0exp_op2_errck(s0e.lctn(), tok)
//
end(*let*)//end-of(f0_op2(s0e,err))
//
fun
f0_op3
( s0e
: s0exp
, err
: &sint >> _): s0exp =
let
val e00 = err
val-
S0Eop3
(tkb, id0, tke) = s0e.node()
//
val ( ) =
(
case+
id0.node() of
| ID0NTsome _ => ()
| _(* else *) => (err := err+1)
)
//
val ( ) =
(
case+
tke.node() of
| T_RPAREN() => ()
| _(* else *) => (err := err+1)
)
in//let
//
if
(err = e00)
then s0e else
s0exp_op3_errck(s0e.lctn(), tkb, id0, tke)
//
end(*let*)//end-of(f0_op3(s0e,err))
//
fun
f0_apps
( s0e
: s0exp
, err
: &sint >> _): s0exp =
let
val e00 = err
val-
S0Eapps(sts) = s0e.node()
val sts = preadx0_s0explst(sts, err)
in//let
if
(err = e00)
then s0e else s0exp_apps_errck(s0e.lctn(), sts)
end (*let*) // end of [f0_apps]
//
fun
f0_lpar
( s0e
: s0exp
, err
: &sint >> _): s0exp =
let
//
val e00 = err
val-
S0Elpar
(tkb,ses,srp) = s0e.node()
//
val ses =
preadx0_s0explst(ses, err)
val srp =
preadx0_s0exp_RPAREN(srp, err)
in//let
if
(err = e00)
then s0e else s0exp_lpar_errck(s0e.lctn(),tkb,ses,srp)
end (*let*) // end of [f0_lpar]
//
} (*where*) // end of [preadx0_s0exp]
//
(* ****** ****** *)
//
#implfun
preadx0_sort0opt
  (opt, err) =
(
case+ opt of
|
optn_nil() =>
optn_nil()
|
optn_cons(st1) =>
let
val e00 = err
val st1 = preadx0_sort0(st1, err)
in//let
if err = e00 then opt else optn_cons(st1)
endlet // end of [optn_cons(st1)]
) (*case*)//end-of-[preadx0_sort0opt(opt,err)]
//
#implfun
preadx0_s0expopt
  (opt, err) =
(
case+ opt of
|
optn_nil() =>
optn_nil()
|
optn_cons(se1) =>
let
val e00 = err
val se1 = preadx0_s0exp(se1, err)
in//let
if err = e00 then opt else optn_cons(se1)
endlet // end of [optn_cons(se1)]
) (*case*)//end-of-[preadx0_s0expopt(opt,err)]
//
(* ****** ****** *)
//
#implfun
preadx0_sort0lst
  (s0ts, err) =
(
case+ s0ts of
|
list_nil() =>
list_nil()
|
list_cons(s0t1, sts1) =>
let
val e00 = err
val s0t1 = preadx0_sort0(s0t1, err)
val sts1 = preadx0_sort0lst(sts1, err)
in//let
if err = e00 then s0ts else list_cons(s0t1, sts1)
endlet // end of [list_cons(st01,sts1)]
) (*case*)//end-of-[preadx0_sort0lst(s0ts,err)]
//
#implfun
preadx0_s0explst
  (s0es, err) =
(
case+ s0es of
|
list_nil() =>
list_nil()
|
list_cons(s0e1, ses1) =>
let
val e00 = err
val s0e1 = preadx0_s0exp(s0e1, err)
val ses1 = preadx0_s0explst(ses1, err)
in//let
if err = e00 then s0es else list_cons(s0e1, ses1)
endlet // end of [list_cons(s0e1,s0es)]
) (*case*)//end-of-[preadx0_s0explst(s0es,err)]
//
(* ****** ****** *)

#implfun
preadx0_s0exp_RPAREN
  (srp0, err) =
(
case+ srp0 of
|
s0exp_RPAREN_cons0
(      tend      ) =>
(
case+
tend.node() of
|
T_RPAREN() => srp0
|
_(*non-T_RPAREN*) => (err := err+1; srp0)
)
|
s0exp_RPAREN_cons1
(tbar, s0es, tend) =>
let
//
val e00 = err
//
val s0es =
preadx0_s0explst(s0es, err)
in//let
//
case+
tend.node() of
|
T_RPAREN() =>
(
  if
  (err=e00)
  then srp0
  else s0exp_RPAREN_cons1(tbar, s0es, tend)
)
|
_(*non-T_RPAREN*) =>
(err := err+1; s0exp_RPAREN_cons1(tbar, s0es, tend))
//
endlet // end of [s0exp_RPAREN_cons1]
) (*case*) // end of [preadx0_s0exp_RPAREN]
(* ****** ****** *)

(* end of [ATS3/XATSOPT_preadx0_staexp.dats] *)
