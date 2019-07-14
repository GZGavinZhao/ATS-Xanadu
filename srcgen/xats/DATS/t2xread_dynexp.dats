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
// Start Time: September, 2018
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
#staload "./../SATS/xerrory.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing.sats"
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
//
#staload "./../SATS/t2xread.sats"
//
(* ****** ****** *)

#staload
_(*TMP*) = "./../DATS/t2xread_staexp.dats"

(* ****** ****** *)

implement
{}(*tmp*)
t2xread_d2exp
  (d2e0) = let
//
val loc0 = d2e0.loc((*void*))
//
in
//
case+
d2e0.node() of
//
| D2Enone0() =>
  let
    val () =
    t2xerr_add(T2XERRd2exp(d2e0))
  in
    prerrln!(loc0, ": T2XERR(d0exp): ", d2e0);
  end // end of [D0Cnone]
| D2Enone1(_) =>
  let
    val () =
    t2xerr_add(T2XERRd2exp(d2e0))
  in
    prerrln!(loc0, ": T2XERR(d0exp): ", d2e0);
  end // end of [D1Cnone]
//
| _(* rest-of-d2ecl *) =>
  (
    prerrln!(loc0, ": t2xread_d2exp: d2c0 = ", d2e0)
  )
//
end // end of [t2xread_d2exp]

(* ****** ****** *)
//
implement
{}(*tmp*)
t2xread_d2explst(d2es) =
(
list_foreach<d2exp>(d2es)
) where
{
implement(env)
list_foreach$fwork<d2exp><env>(d2e, env) = t2xread_d2exp<>(d2e)
} (* end of [t2xread_d2explst] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
t2xread_d2ecl(d2c0) =
let
//
val loc0 = d2c0.loc()
//
(*
val () =
println!
("t2xread_d2ecl: d2c0 = ", d2c0)
*)
//
in
//
case+
d2c0.node() of
//
| D2Csexpdef(s2c) =>
  {
    val
    def =
    s2cst_get_def(s2c)
    val () =
    assertloc(isneqz(def))
    val
    def = unsome(def)
//
    val () =
    println!
    ("t2xread_d2ecl: D2Cs2expdef: s2c = ", s2c)
    val () =
    println!
    ("t2xread_d2ecl: D2Cs2expdef: s2c.def = ", def)
//
    val () = t2xread_s2exp(def)
  }
//
| D2Cabsimpl
  (knd, d2c, s2e) =>
  {
    val () = t2xread_s2exp<>(s2e)
  }
//
| _(* rest-of-d2ecl *) =>
  (
    prerrln!(loc0, ": t2xread_d2ecl: d2c0 = ", d2c0)
  )
//
end // end of [t2xread_d2ecl]

(* ****** ****** *)
//
implement
{}(*tmp*)
t2xread_d2eclist(d2cs) =
(
list_foreach<d2ecl>(d2cs)
) where
{
implement(env)
list_foreach$fwork<d2ecl><env>(d2c, env) = t2xread_d2ecl<>(d2c)
} (* end of [t2xread_d2eclist] *)
//
(* ****** ****** *)

local

extern
fun{}
the_t2xerrlst_get(): t2xerrlst
extern
fun{}
the_t2xerrlst_set(t2xerrlst): void

implement
{}(*tmp*)
t2xerr_add(xerr) = let
//
val
xerrs = the_t2xerrlst_get()
//
in
  the_t2xerrlst_set(list_cons(xerr, xerrs))
end // end of [t2xerr_add]

in (* in-of-local *)

implement
t2xread_main(d2cs) = let
//
local
//
val
the_t2xerrlst =
ref<t2xerrlst>(list_nil)
//
in(*in-of-local*)
val () =
$tempenver(the_t2xerrlst)
implement
the_t2xerrlst_get<>() = the_t2xerrlst[]
implement
the_t2xerrlst_set<>(xs) = the_t2xerrlst[] := xs
end // end of [local]
//
val () =
t2xread_d2eclist<>(d2cs)
val
xerrs = the_t2xerrlst_get()
val
nxerr = list_length<t2xerr>(xerrs)
//
in
//
if
(nxerr > 0)
then
{
//
val () =
prerrln!
("t2xread_main: nxerr = ", nxerr)
//
val () =
if
(nxerr = 1)
then
prerrln!
("t2xread_main: there is one t2xerr!")
val () =
if
(nxerr > 1)
then
prerrln!
("t2xread_main: there are some t2xerrs!")
//
val () =
(
$raise(XATSOPT_T2XERR_EXN(*void*))
) : void
//
} (* end of [then] *)
else
{
//
val () =
prerrln!
("t2xread_main: there are no t2xerrs!")
//
} (* end of [else] *)
//
end // end of [t2xread_main]

end // end of [local]

(* ****** ****** *)

(* end of [xats_t2xread_dynexp.dats] *)
