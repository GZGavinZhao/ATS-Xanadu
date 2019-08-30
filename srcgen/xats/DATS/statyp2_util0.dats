(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: August, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload
STM = "./../SATS/stamp0.sats"
#staload
SYM = "./../SATS/symbol.sats"
//
overload
= with $STM.eq_stamp_stamp
overload
= with $SYM.eq_symbol_symbol
//
(* ****** ****** *)
//
#staload "./../SATS/basics.sats"
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
//
(* ****** ****** *)

implement
s2exp_erase(s2e0) =
let
//
val
s2t0 = s2e0.sort()
val
impred =
sort2_is_impred(s2t0)
//
fun
auxs2vs
(s2vs
: s2varlst
)
: s2varlst =
(
case+ s2vs of
| list_nil() =>
  list_nil()
| list_cons
  (s2v0, s2vs) =>
  (
  if
  impred
  then
  list_cons(s2v0, s2vs) else s2vs
  ) where
  {
    val s2t0 = s2v0.sort()
    val s2vs = auxs2vs(s2vs)
    val impred = sort2_is_impred(s2t0)
  }
) (* end of [auxs2vs] *)
//
fun
auxmain
(s2e0: s2exp): t2ype =
(
case+
s2e0.node() of
//
| S2Ecst(s2c) => t2ype_cst(s2c)
| S2Evar(s2v) => t2ype_var(s2v)
//
| S2Eexi
  (s2vs, s2ps, body) =>
  let
    val s2vs = auxs2vs(s2vs)
  in
    t2ype_exi(s2vs, s2exp_erase(body))
  end
| S2Euni
  (s2vs, s2ps, body) =>
  let
    val s2vs = auxs2vs(s2vs)
  in
    t2ype_uni(s2vs, s2exp_erase(body))
  end
//
| S2Efun
  (fc2, lin, npf, s2es, s2e1) =>
  let
    val fcr = fcr_new1(fc2)
    val t2p1 = s2exp_erase(s2e1)
    val t2ps = s2explst_erase(s2es)
  in
    t2ype_make_node
    (s2t0, T2Pfun(fcr, npf, t2ps, t2p1))
  end
//
| S2Eapp(s2e1, s2es) =>
  let
    val t2p1 = s2exp_erase(s2e1)
    val t2ps = s2explst_erase(s2es)
  in
    t2ype_make_node(s2t0, T2Papp(t2p1, t2ps))
  end
//
| S2Elam(s2vs, s2e1) =>
  let
    val t2p1 = s2exp_erase(s2e1)
  in
    t2ype_make_node(s2t0, T2Plam(s2vs, t2p1))
  end
//
| S2Etyrec(knd, npf, ls2es) =>
  let
    val lt2ps = labs2explst_erase(ls2es)
  in
    t2ype_make_node(s2t0, T2Ptyrec(knd, npf, lt2ps))
  end
//
| _(*rest-of-s2exp*) => t2ype_none1(s2e0)
//
)
//
in
if impred then auxmain(s2e0) else the_t2ype_none0
end // end of [s2exp_erase]

(* ****** ****** *)

implement
t2ype_subst
(t2p0, s2v0, tsub) =
(
let
var flag: int = 0
in
  auxt2p(t2p0, flag)
end
) where
{
//
fun
auxt2p
( t2p0: t2ype
, flag: &int >> int
) : t2ype = let
//
val fini = flag
val s2t0 = t2p0.sort()
//
in
case+
t2p0.node() of
//
| T2Pbas _ => t2p0
| T2Pcst _ => t2p0
//
| T2Pvar(s2v1) =>
  (
    if s2v0=s2v1
    then t2p0
    else (flag := flag+1; tsub)
  )
//
| T2Papp
  (t2p1, t2ps) => let
    val
    t2p1 = auxt2p(t2p1, flag)
    val
    t2ps = auxt2ps(t2ps, flag)
  in
    if
    flag=fini
    then t2p0
    else
    t2ype_make_node
    (s2t0, T2Papp(t2p1, t2ps))
  end
//
| T2Pfun
  (fcr, npf, t2ps, t2p1) =>
  let
    val
    t2p1 = auxt2p(t2p1, flag)
    val
    t2ps = auxt2ps(t2ps, flag)
  in
    if
    flag=fini
    then t2p0
    else
    t2ype_make_node
    (s2t0, T2Pfun(fcr, npf, t2ps, t2p1))
  end
//
| T2Pexi(s2vs, t2p1) => let
    val
    t2p1 = auxt2p(t2p1, flag)
  in
    if
    flag=fini
    then t2p0
    else
    t2ype_make_node(s2t0, T2Pexi(s2vs, t2p1))
  end
| T2Puni(s2vs, t2p1) => let
    val
    t2p1 = auxt2p(t2p1, flag)
  in
    if
    flag=fini
    then t2p0
    else
    t2ype_make_node(s2t0, T2Puni(s2vs, t2p1))
  end
//
| T2Ptyrec(knd, npf, lt2ps) =>
  let
    val
    lt2ps = auxlt2ps(lt2ps, flag)
  in
    if
    flag=fini
    then t2p0
    else
    t2ype_make_node(s2t0, T2Ptyrec(knd, npf, lt2ps))
  end
//
| _ (* rest-of-t2ype *) => t2p0
//
end // end of [auxt2p]
//
and
auxt2ps
( t2ps
: t2ypelst
, flag
: &int >> int
) : t2ypelst =
(
case+ t2ps of
| list_nil() =>
  list_nil()
| list_cons
  (t2p1, t2ps1) => let
    val fini = flag
    val
    t2p1 = auxt2p(t2p1, flag)
    val
    t2ps1 = auxt2ps(t2ps1, flag)
  in
    if
    flag = fini
    then t2ps else list_cons(t2p1, t2ps1)
  end
)
//
and
auxlt2ps
( lt2ps
: labt2ypelst
, flag
: &int >> int
) : labt2ypelst =
(
case+ lt2ps of
| list_nil() => list_nil()
| list_cons(lt2p0, lt2ps1) =>
  let
//
    val fini = flag
//
    val+
    TLABELED(l0, t2p0) = lt2p0
    val t2p0 = auxt2p(t2p0, flag)
    val lt2p0 =
    (
    if
    flag = fini
    then lt2p0 else TLABELED(l0, t2p0)
    ) : labt2ype // end of [val]
//
    val lt2ps1 = auxlt2ps(lt2ps1, flag)
//
  in
    if
    flag = fini
    then lt2ps else list_cons(lt2p0, lt2ps)
  end
)
//
} (* end of [t2ype_subst] *)

(* ****** ****** *)

implement
t2ype_substs
(t2p0, s2vs, tsub) =
(
let
var flag: int = 0
in
  auxt2p(t2p0, flag)
end
) where
{
//
fun
auxs2v
( t2p0
: t2ype
, flag
: &int >> int
) : t2ype = let
//
val-
T2Pvar
(s2v0) = t2p0.node()
//
fun
auxlst
( s2vs
: s2varlst
, t2ps
: t2ypelst
, flag
: &int >> int
): t2ype =
(
case+ s2vs of
| list_nil() => t2p0
| list_cons
  (s2v1, s2vs) =>
  let
  val-
  list_cons(t2p1, t2ps) = t2ps
  in
    if
    s2v0 = s2v1
    then (flag := flag+1; t2p1)
    else auxlst(s2vs, t2ps, flag)
  end
)
//
in
  auxlst(s2vs, tsub, flag)
end // end of [auxs2v]
//
fun
auxt2p
( t2p0
: t2ype
, flag
: &int >> int
) : t2ype = let
//
val fini = flag
val s2t0 = t2p0.sort()
//
in
case+
t2p0.node() of
//
| T2Pbas _ => t2p0
| T2Pcst _ => t2p0
//
| T2Pvar _ =>
  (
    auxs2v(t2p0, flag)
  )
//
| T2Papp
  (t2p1, t2ps) => let
    val
    t2p1 = auxt2p(t2p1, flag)
    val
    t2ps = auxt2ps(t2ps, flag)
  in
    if
    flag=fini
    then t2p0
    else
    t2ype_make_node
    (s2t0, T2Papp(t2p1, t2ps))
  end
//
| T2Pfun
  (fcr, npf, t2ps, t2p1) =>
  let
    val
    t2p1 = auxt2p(t2p1, flag)
    val
    t2ps = auxt2ps(t2ps, flag)
  in
    if
    flag=fini
    then t2p0
    else
    t2ype_make_node
    (s2t0, T2Pfun(fcr, npf, t2ps, t2p1))
  end
//
| T2Pexi(s2vs, t2p1) => let
    val
    t2p1 = auxt2p(t2p1, flag)
  in
    if
    flag=fini
    then t2p0
    else
    t2ype_make_node(s2t0, T2Pexi(s2vs, t2p1))
  end
| T2Puni(s2vs, t2p1) => let
    val
    t2p1 = auxt2p(t2p1, flag)
  in
    if
    flag=fini
    then t2p0
    else
    t2ype_make_node(s2t0, T2Puni(s2vs, t2p1))
  end
//
| T2Ptyrec(knd, npf, lt2ps) =>
  let
    val
    lt2ps = auxlt2ps(lt2ps, flag)
  in
    if
    flag=fini
    then t2p0
    else
    t2ype_make_node(s2t0, T2Ptyrec(knd, npf, lt2ps))
  end
//
| _ (* rest-of-t2ype *) => t2p0
//
end // end of [auxt2p]
//
and
auxt2ps
( t2ps
: t2ypelst
, flag
: &int >> int
) : t2ypelst =
(
case+ t2ps of
| list_nil() =>
  list_nil()
| list_cons
  (t2p1, t2ps1) => let
    val fini = flag
    val
    t2p1 = auxt2p(t2p1, flag)
    val
    t2ps1 = auxt2ps(t2ps1, flag)
  in
    if
    flag = fini
    then t2ps else list_cons(t2p1, t2ps1)
  end
)
//
and
auxlt2ps
( lt2ps
: labt2ypelst
, flag
: &int >> int
) : labt2ypelst =
(
case+ lt2ps of
| list_nil() => list_nil()
| list_cons(lt2p0, lt2ps1) =>
  let
//
    val fini = flag
//
    val+
    TLABELED(l0, t2p0) = lt2p0
    val t2p0 = auxt2p(t2p0, flag)
    val lt2p0 =
    (
    if
    flag = fini
    then lt2p0 else TLABELED(l0, t2p0)
    ) : labt2ype // end of [val]
//
    val lt2ps1 = auxlt2ps(lt2ps1, flag)
//
  in
    if
    flag = fini
    then lt2ps else list_cons(lt2p0, lt2ps)
  end
)
//
} (* end of [t2ype_substs] *)

(* ****** ****** *)

local

fun
auxcst
( t2p0: t2ype
, flag
: &int >> int): t2ype =
let
val-
T2Pcst
(s2c0) = t2p0.node()
val def0 =
s2cst_get_type(s2c0)
in
//
case+
def0.node() of
| T2Pnone0() => t2p0 | _ => def0
//
end // end of [appcst]

and
auxxtv
( t2p0: t2ype
, flag
: &int >> int): t2ype =
let
val-
T2Pxtv
(xtv0) = t2p0.node()
in
//
case+
t2p0.node() of
| T2Pxtv(xtv) =>
  let
  val
  t2p1 = xtv.type()
  in
    case+
    t2p1.node() of
    | T2Pnone0() => t2p0
    | _ (*non-T2Pnone0*) =>
      (flag := flag+1; t2ype_hnfize(t2p1))
  end
| _(* non-T2Pxtv *) => (t2p0)
//
end // end of [auxxtv]

and
auxapp
( t2p0: t2ype
, flag
: &int >> int): t2ype =
let
//
val-
T2Papp
(t2p1, t2ps) = t2p0.node()
//
val fini = flag
//
val t2p1 = auxt2p(t2p1, flag)
val t2ps = auxt2ps(t2ps, flag)
in
//
case+
t2p1.node() of
| T2Plam
  (s2vs, t2p2) =>
  let
    val () = flag := flag + 1
  in
    t2ype_hnfize
    (
    t2ype_substs(t2p2, s2vs, t2ps)
    )
  end
| _ (*non-T2Plam*) =>
  if
  fini=flag
  then t2p0
  else
  t2ype_make_node
  (t2p0.sort(), T2Papp(t2p1, t2ps))
//
end // end of [auxapp]

and
auxt2p
( t2p0: t2ype
, flag
: &int >> int): t2ype =
(
case+
t2p0.node() of
| T2Pbas _ => t2p0
| T2Pvar _ => t2p0
| T2Pcst _ =>
  auxcst(t2p0, flag)
| T2Pxtv _ =>
  auxxtv(t2p0, flag)
| T2Papp _ =>
  auxapp(t2p0, flag)
| _ (*rest-of-t2ype*) => t2p0
)

and
auxt2ps
( t2ps
: t2ypelst
, flag
: &int >> int): t2ypelst =
(
case+ t2ps of
| list_nil() =>
  list_nil()
| list_cons(t2p1, t2ps2) =>
  let
  val fini = flag
  val t2p1 = auxt2p(t2p1, flag)
  val t2ps2 = auxt2ps(t2ps2, flag)
  in
    if
    fini = flag
    then t2ps else list_cons(t2p1, t2ps2)
  end
)


in (*in-of-local*)

implement
t2ype_hnfize
  (t2p0) = let
//
val () =
println!
("t2ype_hnfize: t2p0 = ", t2p0)
//
in
//
let
var flag: int = 0 in auxt2p(t2p0, flag)
end
//
end // end of [t2ype_hnfize]

end // end of [local]

(* ****** ****** *)

implement
s2explst_erase
  (s2es) =
list_vt2t
(
list_map<s2exp><t2ype>(s2es)
) where
{
implement
list_map$fopr<s2exp><t2ype>(s2e) = s2exp_erase(s2e)
}

(* ****** ****** *)

implement
labs2explst_erase
  (ls2es) =
list_vt2t
(
list_map<labs2exp><labt2ype>(ls2es)
) where
{
  implement
  list_map$fopr<labs2exp><labt2ype>(ls2e) =
  let
  val+SLABELED(l0, s2e) = ls2e in TLABELED(l0, s2exp_erase(s2e))
  end
}

(* ****** ****** *)

(* end of [xats_statyp2_util0.dats] *)
