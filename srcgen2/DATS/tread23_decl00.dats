(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Sun 26 Feb 2023 10:22:43 AM EST
*)
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
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/tread23.sats"
(* ****** ****** *)
//
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload sexp with d2con_get_sexp
#symload sexp with d2cst_get_sexp
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
#symload lctn with d3valdcl_get_lctn
#symload lctn with d3vardcl_get_lctn
#symload lctn with d3fundcl_get_lctn
(* ****** ****** *)
// 
(* ****** ****** *)
//
fun
d3ecl_errck
(lvl0: sint
,d3cl: d3ecl): d3ecl =
let
val loc0 = d3cl.lctn()
in//let
d3ecl_make_node
(loc0, D3Cerrck(lvl0, d3cl))
end (*let*) // end-of(d3ecl_errck)
//
(* ****** ****** *)
//
fun
d3ecl_static_errck
( loc0: loc_t
, tknd: token
, dcl1: d3ecl): d3ecl =
let
val lvl = 0
in//let
d3ecl_errck
( lvl+1
, d3ecl(loc0, D3Cstatic(tknd, dcl1)) )
end (*let*)//end-of-[d3ecl_static_errck]
//
fun
d3ecl_extern_errck
( loc0: loc_t
, tknd: token
, dcl1: d3ecl): d3ecl =
let
val lvl = 0
in//let
d3ecl_errck
( lvl+1
, d3ecl(loc0, D3Cextern(tknd, dcl1)) )
end (*let*)//end-of-[d3ecl_extern_errck]
//
(* ****** ****** *)
//
fun
d3ecl_local0_errck
( loc0
: loc_t
, dcs1
: d3eclist
, dcs2
: d3eclist): d3ecl =
let
val lvl = 0
in//let
d3ecl_errck
(lvl+1,d3ecl(loc0,D3Clocal0(dcs1,dcs2)))
end (*let*) // end of [d3ecl_local0_errck]
//
(* ****** ****** *)
//
fun
d3ecl_valdclst_errck
( loc0
: loc_t
, tknd
: token
, d3vs
: d3valdclist): d3ecl =
let
val lvl = 0
in//let
d3ecl_errck
(lvl+1, d3ecl(loc0,D3Cvaldclst(tknd,d3vs)))
end (*let*) // end of [d3ecl_valdclst_errck]
//
(* ****** ****** *)
//
fun
d3ecl_vardclst_errck
( loc0
: loc_t
, tknd
: token
, d3vs
: d3vardclist): d3ecl =
let
val lvl = 0
in//let
d3ecl_errck
(lvl+1, d3ecl(loc0,D3Cvardclst(tknd,d3vs)))
end (*let*) // end of [d3ecl_vardclst_errck]
//
(* ****** ****** *)

#implfun
tread23_d3ecl
  (d3cl, err) =
(
case+
d3cl.node() of
//
|
D3Cd2ecl _ => d3cl
//
|
D3Cstatic _ => f0_static(d3cl, err)
|
D3Cextern _ => f0_extern(d3cl, err)
//
|
D3Clocal0 _ => f0_local0(d3cl, err)
//
|
D3Cvaldclst _ => f0_valdclst(d3cl, err)
(*
|
D3Cvardclst _ => f0_vardclst(d3cl, err)
|
D3Cfundclst _ => f0_fundclst(d3cl, err)
*)
//
|
_(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err := err+1; d3ecl_errck(lvl0, d3cl))
endlet // end of [  _(* otherwise *)  ]
//
) where// end of [ case+(d3cl.node()) ]
{
//
(* ****** ****** *)
//
fun
f0_static
( dcl: d3ecl
, err: &sint >> _): d3ecl =
let
//
val e00 = err
//
val-
D3Cstatic
( tknd, dcl1) = dcl.node()
//
val dcl1 = tread23_d3ecl(dcl1, err)
//
in
if
(e00=err)
then dcl else
d3ecl_static_errck(dcl.lctn(),tknd,dcl1)
end (*let*) // end of [ f0_static(dcl,err) ]
//
fun
f0_extern
( dcl: d3ecl
, err: &sint >> _): d3ecl =
let
//
val e00 = err
//
val-
D3Cextern
( tknd, dcl1) = dcl.node()
//
val dcl1 = tread23_d3ecl(dcl1, err)
//
in
if
(e00=err)
then dcl else
d3ecl_extern_errck(dcl.lctn(),tknd,dcl1)
end (*let*) // end of [ f0_extern(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_local0
( dcl: d3ecl
, err: &sint >> _): d3ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D3Clocal0
(dcs1, dcs2) = dcl.node()
//
val dcs1 =
tread23_d3eclist(dcs1, err)
val dcs2 =
tread23_d3eclist(dcs2, err)
//
in
if
(e00=err)
then dcl else
d3ecl_local0_errck( loc, dcs1, dcs2 )
end (*let*) // end of [ f0_local0(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_valdclst
( dcl: d3ecl
, err: &sint >> _): d3ecl =
let
//
val e00 = err
//
val-
D3Cvaldclst
(tknd, d3vs) = dcl.node()
//
val d3vs =
tread23_d3valdclist(d3vs, err)
//
in//let
if
(e00=err)
then (dcl) else
d3ecl_valdclst_errck(dcl.lctn(),tknd,d3vs)
end (*let*) // end of [f0_valdclst(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( dcl: d3ecl
, err: &sint >> _): d3ecl =
let
//
val e00 = err
//
val-
D3Cvardclst
(tknd, d3vs) = dcl.node()
//
val d3vs =
tread23_d3vardclist(d3vs, err)
//
in//let
if
(e00=err)
then (dcl) else
d3ecl_vardclst_errck(dcl.lctn(),tknd,d3vs)
end (*let*) // end of [f0_vardclst(dcl,err)]
//
(* ****** ****** *)
//
} (*where*) // end of [tread23_d3ecl(d3cl,err)]

(* ****** ****** *)
#implfun
tread23_d3eclist
  (  dcls, err  ) =
list_tread23_fnp(dcls, err, tread23_d3ecl)
(* ****** ****** *)
#implfun
tread23_d3valdclist
  (  d3vs, err  ) =
list_tread23_fnp(d3vs, err, tread23_d3valdcl)
(* ****** ****** *)
#implfun
tread23_d3vardclist
  (  d3vs, err  ) =
list_tread23_fnp(d3vs, err, tread23_d3vardcl)
(* ****** ****** *)
#implfun
tread23_d3fundclist
  (  d3fs, err  ) =
list_tread23_fnp(d3fs, err, tread23_d3fundcl)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread23_decl00.dats] *)
