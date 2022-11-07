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
(*
Sun 11 Sep 2022 05:10:48 PM EDT
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
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans12.sats"
(* ****** ****** *)
//
#staload _ = "./xsymmap_stkmap.dats"
#staload _ = "./staexp2_print0.dats"
//
(* ****** ****** *)
#symload name with s2cst_get_name
#symload name with s2var_get_name
(* ****** ****** *)
#symload name with d2var_get_name
(* ****** ****** *)

local

#typedef key = sym_t
#typedef itm = s2tex

in//local

datavwtp
sortenv =
SORTENV of
(topmap(itm), stkmap(itm))

(* ****** ****** *)

fun
sortenv_make_nil
  ( (*void*) ): sortenv =
SORTENV(topmap, stkmap) where
{
  val topmap = topmap_make_nil()
  val stkmap = stkmap_make_nil()
} (*where*) // end of [sortenv_make_nil()]

(* ****** ****** *)

fun
sortenv_free_top
(tenv : sortenv) =
(
stkmap_free_nil(stkmap)) where
{
val+
~SORTENV(topmap, stkmap) = tenv
} (*where*)//end-of(sortenv_free_top(tenv))

(* ****** ****** *)
//
fun
sortenv_poplam0
(tenv: !sortenv) = let
//
val+
@SORTENV
(topmap, !stkmap) = tenv
//
in//let
//
let
val nerr =
stkmap_poplam0(stkmap) in $fold(tenv)
end (*let*)
//
end (*let*)//end-of-(sortenv_poplam0(tenv))
//
fun
sortenv_pshlam0
(tenv: !sortenv) = let
val+
@SORTENV
(topmap, !stkmap) = tenv
//
in//let
//
let
val nerr =
stkmap_pshlam0(stkmap) in $fold(tenv)
end (*let*)
//
end (*let*)//end-of-(sortenv_pshlam0(tenv))
//
(* ****** ****** *)
//
fun
sortenv_poplet0
(tenv: !sortenv) = let
//
val+
@SORTENV
(topmap, !stkmap) = tenv
//
in//let
//
let
val nerr =
stkmap_poplet0(stkmap) in $fold(tenv)
end (*let*)
//
end (*let*)//end-of-(sortenv_poplet0(tenv))
//
fun
sortenv_pshlet0
(tenv: !sortenv) = let
val+
@SORTENV
(topmap, !stkmap) = tenv
//
in//let
//
let
val nerr =
stkmap_pshlet0(stkmap) in $fold(tenv)
end (*let*)
//
end (*let*)//end-of-(sortenv_pshlet0(tenv))
//
(* ****** ****** *)
//
fun
sortenv_pshloc1
(tenv: !sortenv) = let
val+
@SORTENV
(topmap, !stkmap) = tenv
//
in//let
//
let
val nerr =
stkmap_pshloc1(stkmap) in $fold(tenv)
end (*let*)
//
end (*let*)//end-of-(sortenv_pshloc1(tenv))
//
fun
sortenv_pshloc2
(tenv: !sortenv) = let
//
val+
@SORTENV
(topmap, !stkmap) = tenv
//
in//let
//
let
val nerr =
stkmap_pshloc2(stkmap) in $fold(tenv)
end (*let*)
//
end (*let*)//end-of-(sortenv_pshloc2(tenv))
//
(* ****** ****** *)
//
fun
sortenv_locjoin
(tenv: !sortenv) = let
//
val+
@SORTENV
(topmap, !stkmap) = tenv
//
in//let
//
$fold(tenv) where
{
//
val
(nerr, kxs) =
stkmap_poploc0(stkmap)
//
(*
val () =
prerrln1
("sortenv_locjoin:nerr=", nerr)
val () =
prerrln1(
"sortenv_locjoin:stkmap(aft)=\n", stkmap
)(*prerrln1*)
*)
//
val
((*void*)) =
if
stkmap_nilq(stkmap)
then topmap_insert_kxs(topmap, kxs)
else stkmap_insert_kxs(stkmap, kxs) }
//
end (*let*)//end-of-(sortenv_locjoin(tenv))
//
(* ****** ****** *)

fun
sortenv_search_opt
( tenv:
  sortenv, k0: key) =
let
//
val+
SORTENV
(topmap, stkmap) = tenv
//
val opt =
stkmap_search_opt(stkmap, k0)
//
in//let
//
case+ opt of
| !
optn_vt_cons _ => opt
| ~
optn_vt_nil( ) => topmap_search_opt(topmap,k0)
//
end (*let*)//end-of-[sortenv_search_opt(tenv,k0)]

(* ****** ****** *)
//
fun
sortenv_insert_any
( tenv
: sortenv
, k0: key, x0: itm) = let
//
val+
@SORTENV
(topmap, !stkmap) = tenv
//
in//let
//
if
stkmap_nilq(stkmap)
then
topmap_insert_any(topmap, k0, x0)//top
else
stkmap_insert_any(stkmap, k0, x0)//inner
//
end (*let*)//end-of(sortenv_insert_any(tenv,k0,x0))
//
(* ****** ****** *)

end (*local*) // end of [ local(sortenv) ]

(* ****** ****** *)

local

#typedef key = sym_t
#typedef itm = s2itm

in//local

datavwtp
sexpenv =
SEXPENV of
(topmap(itm), stkmap(itm))

(* ****** ****** *)

fun
sexpenv_make_nil
  ( (*void*) ): sexpenv =
SEXPENV(topmap, stkmap) where
{
  val topmap = topmap_make_nil()
  val stkmap = stkmap_make_nil()
} (*where*) // end of [sexpenv_make_nil()]

(* ****** ****** *)

fun
sexpenv_free_top
(senv : sexpenv) =
(
stkmap_free_nil(stkmap)) where
{
val+
~SEXPENV(topmap, stkmap) = senv
} (*where*)//end-of(sexpenv_free_top(senv))

(* ****** ****** *)
//
fun
sexpenv_poplam0
(senv: !sexpenv) = let
//
val+
@SEXPENV
(topmap, !stkmap) = senv
//
in//let
//
let
val nerr =
stkmap_poplam0(stkmap) in $fold(senv)
end (*let*)
//
end (*let*)//end-of-(sexpenv_poplam0(senv))
//
fun
sexpenv_pshlam0
(senv: !sexpenv) = let
val+
@SEXPENV
(topmap, !stkmap) = senv
//
in//let
//
let
val nerr =
stkmap_pshlam0(stkmap) in $fold(senv)
end (*let*)
//
end (*let*)//end-of-(sexpenv_pshlam0(senv))
//
(* ****** ****** *)
//
fun
sexpenv_poplet0
(senv: !sexpenv) = let
//
val+
@SEXPENV
(topmap, !stkmap) = senv
//
in//let
//
let
val nerr =
stkmap_poplet0(stkmap) in $fold(senv)
end (*let*)
//
end (*let*)//end-of-(sexpenv_poplet0(senv))
//
fun
sexpenv_pshlet0
(senv: !sexpenv) = let
val+
@SEXPENV
(topmap, !stkmap) = senv
//
in//let
//
let
val nerr =
stkmap_pshlet0(stkmap) in $fold(senv)
end (*let*)
//
end (*let*)//end-of-(sexpenv_pshlet0(senv))
//
(* ****** ****** *)
//
fun
sexpenv_pshloc1
(senv: !sexpenv) = let
//
val+
@SEXPENV
(topmap, !stkmap) = senv
//
in//let
//
let
val nerr =
stkmap_pshloc1(stkmap) in $fold(senv)
end (*let*)
//
end (*let*)//end-of-(sexpenv_pshloc1(senv))
//
fun
sexpenv_pshloc2
(senv: !sexpenv) = let
//
val+
@SEXPENV
(topmap, !stkmap) = senv
//
in//let
//
let
val nerr =
stkmap_pshloc2(stkmap) in $fold(senv)
end (*let*)
//
end (*let*)//end-of-(sexpenv_pshloc2(senv))
//
(* ****** ****** *)
//
fun
sexpenv_locjoin
(senv: !sexpenv) = let
//
val+
@SEXPENV
(topmap, !stkmap) = senv
//
in//let
//
$fold(senv) where
{
//
val
(nerr, kxs) =
stkmap_poploc0(stkmap)
//
(*
val () =
prerrln1
("sexpenv_locjoin:nerr=", nerr)
val () =
prerrln1(
"sexpenv_locjoin:stkmap(aft)=\n", stkmap
)(*prerrln1*)
*)
//
val
((*void*)) =
if
stkmap_nilq(stkmap)
then topmap_insert_kxs(topmap, kxs)
else stkmap_insert_kxs(stkmap, kxs) }
//
end (*let*)//end-of-(sexpenv_locjoin(senv))
//
(* ****** ****** *)

fun
sexpenv_search_opt
( senv:
  sexpenv, k0: key) = let
//
val+
SEXPENV
(topmap, stkmap) = senv
//
val opt =
stkmap_search_opt(stkmap, k0)
//
in//let
//
case+ opt of
| !
optn_vt_cons _ => opt
| ~
optn_vt_nil( ) => topmap_search_opt(topmap,k0)
//
end (*let*)//end-of-[sexpenv_search_opt(senv,k0)]

(* ****** ****** *)
//
fun
sexpenv_insert_any
( senv
: sexpenv
, k0: key, x0: itm) = let
//
val+
@SEXPENV
(topmap, !stkmap) = senv
//
in//let
//
if
stkmap_nilq(stkmap)
then
topmap_insert_any(topmap, k0, x0)//top
else
stkmap_insert_any(stkmap, k0, x0)//inner
//
end (*let*)//end-of(sexpenv_insert_any(senv,k0,x0))
//
(* ****** ****** *)

end (*local*) // end of [ local(sexpenv) ]

(* ****** ****** *)

local

#typedef key = sym_t
#typedef itm = d2itm

in//local

datavwtp
dexpenv =
DEXPENV of
(topmap(itm), stkmap(itm))

(* ****** ****** *)

fun
dexpenv_make_nil
  ( (*void*) ): dexpenv =
DEXPENV(topmap, stkmap) where
{
  val topmap = topmap_make_nil()
  val stkmap = stkmap_make_nil()
} (*where*) // end of [dexpenv_make_nil()]

(* ****** ****** *)

fun
dexpenv_free_top
(denv : dexpenv) =
(
stkmap_free_nil(stkmap)) where
{
val+
~DEXPENV(topmap, stkmap) = denv
} (*where*)//end-of(dexpenv_free_top(denv))

(* ****** ****** *)
//
fun
dexpenv_poplam0
(denv: !dexpenv) = let
//
val+
@DEXPENV
(topmap, !stkmap) = denv
//
in//let
//
let
val nerr =
stkmap_poplam0(stkmap) in $fold(denv)
end (*let*)
//
end (*let*)//end-of-(dexpenv_poplam0(denv))
//
fun
dexpenv_pshlam0
(denv: !dexpenv) = let
val+
@DEXPENV
(topmap, !stkmap) = denv
//
in//let
//
let
val nerr =
stkmap_pshlam0(stkmap) in $fold(denv)
end (*let*)
//
end (*let*)//end-of-(dexpenv_pshlam0(denv))
//
(* ****** ****** *)
//
fun
dexpenv_poplet0
(denv: !dexpenv) = let
//
val+
@DEXPENV
(topmap, !stkmap) = denv
//
in//let
//
let
val nerr =
stkmap_poplet0(stkmap) in $fold(denv)
end (*let*)
//
end (*let*)//end-of-(dexpenv_poplet0(denv))
//
fun
dexpenv_pshlet0
(denv: !dexpenv) = let
val+
@DEXPENV
(topmap, !stkmap) = denv
//
in//let
//
let
val nerr =
stkmap_pshlet0(stkmap) in $fold(denv)
end (*let*)
//
end (*let*)//end-of-(dexpenv_pshlet0(denv))
//
(* ****** ****** *)
//
fun
dexpenv_pshloc1
(denv: !dexpenv) = let
val+
@DEXPENV
(topmap, !stkmap) = denv
//
in//let
//
let
val nerr =
stkmap_pshloc1(stkmap) in $fold(denv)
end (*let*)
//
end (*let*)//end-of-(dexpenv_pshloc1(denv))
//
fun
dexpenv_pshloc2
(denv: !dexpenv) = let
val+
@DEXPENV
(topmap, !stkmap) = denv
//
in//let
//
let
val nerr =
stkmap_pshloc2(stkmap) in $fold(denv)
end (*let*)
//
end (*let*)//end-of-(dexpenv_pshloc2(denv))
//
(* ****** ****** *)
//
fun
dexpenv_locjoin
(denv: !dexpenv) = let
//
val+
@DEXPENV
(topmap, !stkmap) = denv
//
in//let
//
$fold(denv) where
{
//
val
(nerr, kxs) =
stkmap_poploc0(stkmap)
//
(*
val () =
prerrln1
("dexpenv_locjoin:nerr=", nerr)
val () =
prerrln1 (
"dexpenv_locjoin:stkmap(aft)=\n", stkmap
) (*prerrln1*)
*)
//
val
((*void*)) =
if
stkmap_nilq(stkmap)
then topmap_insert_kxs(topmap, kxs)
else stkmap_insert_kxs(stkmap, kxs) }
//
end (*let*)//end-of-(dexpenv_locjoin(denv))
//
(* ****** ****** *)

fun
dexpenv_search_opt
( denv:
  dexpenv, k0: key) = let
//
val+
DEXPENV
(topmap, stkmap) = denv
//
val opt =
stkmap_search_opt(stkmap, k0)
//
in//let
//
case+ opt of
| !
optn_vt_cons _ => opt
| ~
optn_vt_nil( ) => topmap_search_opt(topmap,k0)
//
end (*let*)//end-of-[dexpenv_search_opt(denv,k0)]

(* ****** ****** *)
//
fun
dexpenv_insert_any
( denv
: dexpenv
, k0: key, x0: itm) = let
//
val+
@DEXPENV
(topmap, !stkmap) = denv
//
in//let
//
if
stkmap_nilq(stkmap)
then
topmap_insert_any(topmap, k0, x0)//top
else
stkmap_insert_any(stkmap, k0, x0)//inner
//
end (*let*)//end-of(dexpenv_insert_any(denv,k0,x0))
//
(* ****** ****** *)

end (*local*) // end of [ local(dexpenv) ]

(* ****** ****** *)

local

datavwtp
tr12env =
TR12ENV of
(
sortenv, sexpenv, dexpenv)
#absimpl tr12env_vtbx = tr12env

in//local

(* ****** ****** *)
//
#implfun
tr12env_make_nil() =
TR12ENV(tenv,senv,denv) where
{
  val tenv = sortenv_make_nil()
  val senv = sexpenv_make_nil()
  val denv = dexpenv_make_nil()
} (*where*) // end of [tr12env_make_nil()]
//
(* ****** ****** *)
//
#implfun
tr12env_free_top
  (  env0  ) =
(
sortenv_free_top(tenv);
sexpenv_free_top(senv);
dexpenv_free_top(denv)) where
{
val+
~TR12ENV(tenv, senv, denv) = env0
} (*where*)//end-of(tr12env_free_top(tenv))
//
(* ****** ****** *)
//
#implfun
tr12env_poplam0
  ( env0 ) = let
//
val+
TR12ENV
(tenv, senv, denv) = env0
//
val () = sortenv_poplam0(tenv)
val () = sexpenv_poplam0(senv)
val () = dexpenv_poplam0(denv)
//
in//let
  // HX-2022-10-23: nothing
end (*let*)//end-of-[tr12env_poplam0(env0)]
//
//
#implfun
tr12env_pshlam0
  ( env0 ) = let
//
val+
TR12ENV
(tenv, senv, denv) = env0
//
val () = sortenv_pshlam0(tenv)
val () = sexpenv_pshlam0(senv)
val () = dexpenv_pshlam0(denv)
//
in//let
  // HX-2022-10-23: nothing
end (*let*)//end-of-[tr12env_pshlam0(env0)]
//
(* ****** ****** *)
//
#implfun
tr12env_poplet0
  ( env0 ) = let
//
val+
TR12ENV
(tenv, senv, denv) = env0
//
val () = sortenv_poplet0(tenv)
val () = sexpenv_poplet0(senv)
val () = dexpenv_poplet0(denv)
//
in//let
  // HX-2022-10-23: nothing
end (*let*)//end-of-[tr12env_poplet0(env0)]
//
//
#implfun
tr12env_pshlet0
  ( env0 ) = let
//
val+
TR12ENV
(tenv, senv, denv) = env0
//
val () = sortenv_pshlet0(tenv)
val () = sexpenv_pshlet0(senv)
val () = dexpenv_pshlet0(denv)
//
in//let
  // HX-2022-10-23: nothing
end (*let*)//end-of-[tr12env_pshlet0(env0)]
//
(* ****** ****** *)
//
#implfun
tr12env_pshloc1
  ( env0 ) = let
//
val+
TR12ENV
(tenv, senv, denv) = env0
//
val () = sortenv_pshloc1(tenv)
val () = sexpenv_pshloc1(senv)
val () = dexpenv_pshloc1(denv)
//
in//let
  // HX-2022-10-23: nothing
end (*let*)//end-of-[tr12env_pshloc1(env0)]
//
#implfun
tr12env_pshloc2
  ( env0 ) = let
//
val+
TR12ENV
(tenv, senv, denv) = env0
//
val () = sortenv_pshloc2(tenv)
val () = sexpenv_pshloc2(senv)
val () = dexpenv_pshloc2(denv)
//
in//let
  // HX-2022-10-23: nothing
end (*let*)//end-of-[tr12env_pshloc2(env0)]
//
(* ****** ****** *)

#implfun
tr12env_locjoin
  ( env0 ) = let
//
val+
TR12ENV
(tenv, senv, denv) = env0
//
val () = sortenv_locjoin(tenv)
val () = sexpenv_locjoin(senv)
val () = dexpenv_locjoin(denv)
//
in//let
  // HX-2022-10-23: nothing
end (*let*)//end-of-[tr12env_locjoin(env0)]

(* ****** ****** *)

#implfun
tr12env_add0_s2tex
( env0 , k0 , x0 ) =
let
//
val+
TR12ENV
(tenv, senv, denv) = env0
//
val () =
sortenv_insert_any(tenv, k0, x0)
//
(*
val () =
the_sortenv_toplst_add0( k0, x0 )
val () =
the_sortenv_toplst_prerr((*void*))
*)
//
in//let
end where
{
(*
  val () =
  prerrln("tr12env_add0_s2tex: k0 = ", k0)
  val () =
  prerrln("tr12env_add0_s2tex: x0 = ", x0)
*)
} (*where*)//end-[tr12env_add0_s2tex(env0,k0,x0)]

(* ****** ****** *)

#implfun
tr12env_add0_s2itm
( env0 , k0 , x0 ) =
let
//
val+
TR12ENV
(tenv, senv, denv) = env0
//
val () =
sexpenv_insert_any(senv, k0, x0)
//
(*
val () =
the_sexpenv_toplst_add0( k0, x0 )
val () =
the_sexpenv_toplst_prerr((*void*))
*)
//
in//let
end where
{
(*
val () =
prerrln("tr12env_add0_s2itm: k0 = ", k0)
val () =
prerrln("tr12env_add0_s2itm: x0 = ", x0)
*)
} (*where*)//end-[tr12env_add0_s2itm(env0,k0,x0)]

(* ****** ****** *)

#implfun
tr12env_add0_d2itm
( env0, k0 , x0 ) =
let
//
val+
TR12ENV
(tenv, senv, denv) = env0
//
val () =
dexpenv_insert_any(denv, k0, x0)
//
(*
val () =
the_dexpenv_toplst_add0( k0, x0 )
val () =
the_dexpenv_toplst_prerr((*void*))
*)
//
in//let
end where
{
(*
  val () =
  prerrln("tr12env_add0_d2itm: k0 = ", k0)
  val () =
  prerrln("tr12env_add0_d2itm: x0 = ", x0)
*)
} (*where*)//end-[tr12env_add0_d2itm(env0,k0,x0)]

(* ****** ****** *)

#implfun
tr12env_find_s2tex
  ( env0, k0 ) =
(
sortenv_search_opt(tenv, k0)) where
{
//
  val+TR12ENV(tenv, senv, denv) = env0
//
} (*where*) // end of [tr12env_find_s2tex(env0,k0)]

(* ****** ****** *)

#implfun
tr12env_find_s2itm
  ( env0, k0 ) =
(
sexpenv_search_opt(senv, k0)) where
{
//
  val+TR12ENV(tenv, senv, denv) = env0
//
} (*where*) // end of [tr12env_find_s2itm(env0,k0)]

(* ****** ****** *)

#implfun
tr12env_find_d2itm
  ( env0, k0 ) =
(
dexpenv_search_opt(denv, k0)) where
{
//
  val+TR12ENV(tenv, senv, denv) = env0
//
} (*where*) // end of [tr12env_find_d2itm(env0,k0)]

(* ****** ****** *)

endloc (*local*) // end of [ local(tr12env) ]

(* ****** ****** *)

#implfun
tr12env_add1_s2cst
  (env0, s2c0) =
let
val sym0 = s2c0.name()
val sopt =
tr12env_find_s2itm(env0, sym0)
in//let
//
case+ sopt of
| ~
optn_vt_nil() =>
tr12env_add0_s2itm
(env0, sym0, sitm) where
{
val
sitm = S2ITMcst(list_sing(s2c0))
}
| ~
optn_vt_cons(sitm) =>
(
case+ sitm of
|
S2ITMcst(s2cs) =>
let
val
sitm =
S2ITMcst
(list_cons(s2c0, s2cs)) in
tr12env_add0_s2itm(env0, sym0, sitm)
end//let
| _(*non-S2ITMcst*) =>
let
val
sitm =
S2ITMcst(list_sing(s2c0)) in
tr12env_add0_s2itm(env0, sym0, sitm)
end//let
) (*case+*)//end-of-[optn_vt_cons(...)]
//
end (*let*)//end[tr12env_add0_s2cst(env0,s2c0)]

(* ****** ****** *)
//
#implfun
tr12env_add0_s2var
  (env0, s2v0) =
let
val sym0 =
s2var_get_name(s2v0)
val sitm = S2ITMvar(s2v0)
in//let
tr12env_add0_s2itm(env0, sym0, sitm)
end (*let*)//end[tr12env_add0_s2var(env0,s2v0)]
//
#implfun
tr12env_add0_s2varlst
  (env0, s2vs) =
(
case+ s2vs of
|
list_nil((*void*)) => ()
|
list_cons(s2v1, s2vs) =>
let
val () =
tr12env_add0_s2var(env0, s2v1)
in//let
  tr12env_add0_s2varlst(env0, s2vs)
end (*let*)//end-of-[list_cons]
) (*case+*)//end-of-[tr12env_add0_s2varlst(...)]
//
(* ****** ****** *)
//
#implfun
tr12env_add0_d2var
  (env0, d2v0) =
let
val sym0 =
d2var_get_name(d2v0)
val ditm = D2ITMvar(d2v0)
in//let
tr12env_add0_d2itm(env0, sym0, ditm)
end (*let*)//end[tr12env_add0_d2var(env0,d2v0)]
//
(* ****** ****** *)
//
#implfun
tr12env_add0_d2pat
  (env0, d2p0) =
(
case+
d2p0.node() of
//
|D2Pnil() => ((*void*))
|D2Pany() => ((*void*))
|D2Parg() => ((*void*))
//
|
D2Pvar(d2v1) =>
tr12env_add0_d2var(env0, d2v1)
//
|D2Pint _ => ((*void*))
|D2Pbtf _ => ((*void*))
|D2Pchr _ => ((*void*))
|D2Pflt _ => ((*void*))
|D2Pstr _ => ((*void*))
//
|
D2Pbang(d2p1) =>
tr12env_add0_d2pat(env0, d2p1)
|
D2Pflat(d2p1) =>
tr12env_add0_d2pat(env0, d2p1)
|
D2Pfree(d2p1) =>
tr12env_add0_d2pat(env0, d2p1)
//
|
D2Psapp
(d2p1, s2vs) =>
tr12env_add0_d2pat(env0, d2p1)
//
|
D2Pdap0(d2p1) =>
tr12env_add0_d2pat(env0, d2p1)
|
D2Pdap1(d2p1) =>
tr12env_add0_d2pat(env0, d2p1)
//
|
D2Pdapp
(d2f0, npf1, d2ps) =>
(
tr12env_add0_d2pat(env0, d2f0);
tr12env_add0_d2patlst(env0, d2ps)
)
//
|
D2Ptup1
(tknd, npf1, d2ps) =>
tr12env_add0_d2patlst(env0, d2ps)
|
D2Prcd2
(tknd, npf1, ldps) =>
tr12env_add0_l2d2plst(env0, ldps)
//
|
D2Panno
(d2p1, s1e2, s2e2) =>
(
  tr12env_add0_d2pat(env0, d2p1) )
//
| _(* rest-of-d2pat *) => ( (*skipped*) )
//
) (*case+*)//end[tr12env_add0_d2var(env0,d2p0)]
//
(* ****** ****** *)
//
#implfun
tr12env_add0_f2arg
  (env0, f2a0) =
(
case+
f2a0.node() of
|
F2ARGdyn0
(npf1, d2ps) =>
tr12env_add0_d2patlst(env0, d2ps)
| F2ARGsta0 _ => () | F2ARGmet0 _ => ()
) (*case+*)//end[tr12env_add0_f2arg(env0,f2a0)]

(* ****** ****** *)
//
#implfun
tr12env_add0_d2patlst
  (env0, d2ps) =
(
list_foreach_e1nv
<   x0  ><  e1   >(d2ps, env0)) where
{
#typedef x0 = d2pat
#vwtpdef e1 = tr12env
#impltmp
foreach$work_e1nv
< x0 ><e1>(x0, e1) = tr12env_add0_d2pat(e1, x0)
} (*where*)//end(tr12env_add0_d2patlst(env0,...))
//
(* ****** ****** *)
//
#implfun
tr12env_add0_f2arglst
  (env0, f2as) =
(
list_foreach_e1nv
<   x0  ><  e1   >(f2as, env0)) where
{
#typedef x0 = f2arg
#vwtpdef e1 = tr12env
#impltmp
foreach$work_e1nv
< x0 ><e1>(x0, e1) = tr12env_add0_f2arg(e1, x0)
} (*where*)//end(tr12env_add0_f2arglst(env0,...))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans12_myenv0.dats] *)
