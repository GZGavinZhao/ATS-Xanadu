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
// Start Time: November, 2019
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
#staload "./../SATS/basics.sats"
//
#staload "./../SATS/lexing.sats"
//
#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)
//
implement
fprint_val<d2con> = fprint_d2con
implement
fprint_val<d2cst> = fprint_d2cst
implement
fprint_val<d2var> = fprint_d2var
//
(* ****** ****** *)

implement
fprint_val<ir0pat> = fprint_ir0pat
implement
fprint_val<ir0arg> = fprint_ir0arg
implement
fprint_val<ir0exp> = fprint_ir0exp
implement
fprint_val<ir0dcl> = fprint_ir0dcl

(* ****** ****** *)
//
implement
print_ir0pat(x0) =
fprint_ir0pat(stdout_ref, x0)
implement
prerr_ir0pat(x0) =
fprint_ir0pat(stderr_ref, x0)
//
implement
fprint_ir0pat
  (out, x0) =
(
case- x0.node() of
//
| IR0Pint(tok) =>
  fprint!(out, "IR0Pint(", tok, ")")
| IR0Pbtf(tok) =>
  fprint!(out, "IR0Pbtf(", tok, ")")
//
| IR0Pany() =>
  fprint!(out, "IR0Pany(", ")")
| IR0Pvar(d2v) =>
  fprint!(out, "IR0Pvar(", d2v, ")")
//
| IR0Ptuple(knd, irps) =>
  fprint!
  ( out
  , "IR0Ptuple(", knd, "; ", irps, ")")
//
| IR0Pnone0() =>
  fprint!(out, "IR0Pnone0(", ")")
| IR0Pnone1(d3p) =>
  fprint!(out, "IR0Pnone1(", d3p, ")")
//
)
//
(* ****** ****** *)
//
implement
print_ir0arg(x0) =
fprint_ir0arg(stdout_ref, x0)
implement
prerr_ir0arg(x0) =
fprint_ir0arg(stderr_ref, x0)
//
implement
fprint_ir0arg
  (out, x0) =
let
val+IR0ARGsome(npf, irps) = x0
in
fprint!
(out, "IR0ARGsome(", npf, "; ", irps, ")")
end // end of [fprint_ir0arg]
//
(* ****** ****** *)
//
implement
print_ir0exp(x0) =
fprint_ir0exp(stdout_ref, x0)
implement
prerr_ir0exp(x0) =
fprint_ir0exp(stderr_ref, x0)
//
implement
fprint_ir0exp
  (out, x0) =
(
case+
x0.node() of
//
| IR0Eint(tok) =>
  fprint!(out, "IR0Eint(", tok, ")")
| IR0Ebtf(tok) =>
  fprint!(out, "IR0Ebtf(", tok, ")")
(*
| IR0Eflt(tok) =>
  fprint!(out, "IR0Eflt(", tok, ")")
*)
| IR0Estr(tok) =>
  fprint!(out, "IR0Estr(", tok, ")")
//
| IR0Evar(d2v) =>
  fprint!(out, "IR0Evar(", d2v, ")")
//
| IR0Econ1(d2c) =>
  fprint!(out, "IR0Econ1(", d2c, ")")
| IR0Ecst1(d2c) =>
  fprint!(out, "IR0Ecst1(", d2c, ")")
//
| IR0Efcst(d2c) =>
  fprint!(out, "IR0Efcst(", d2c, ")")
//
| IR0Edapp
  (irf0, npf1, ires) =>
  fprint!
  ( out
  , "IR0Edapp("
  , irf0, "; ", npf1, "; ", ires, ")")
//
| IR0Elet(irds, ire1) =>
  fprint!
  ( out
  , "IR0Elet(", irds, "; ", ire1, ")")
| IR0Ewhere(ire1, irds) =>
  fprint!
  ( out
  , "IR0Ewhere(", ire1, "; ", irds, ")")
//
| IR0Eif0
  (ire1, ire2, opt3) =>
  fprint!
  ( out, "IR0Eif0("
  , ire1, "; ", ire2, "; ", opt3, ")")
//
| IR0Elam
  (knd0, farg, body) =>
  fprint!
  ( out, "IR0Elam("
  , knd0, "; ", farg, "; ", body, ")")
| IR0Efix
  (knd0, d2v0, farg, body) =>
  fprint!
  ( out, "IR0Efix("
  , knd0, "; "
  , d2v0, "; ", farg, "; ", body, ")")
//
| IR0Enone0() =>
  (
    fprint!(out, "IR0Enone0(", ")")
  )
| IR0Enone1(d3e1) =>
  (
    fprint!(out, "IR0Enone1(", d3e1, ")")
  )
//
)
//
(* ****** ****** *)
//
implement
print_ir0dcl(x0) =
fprint_ir0dcl(stdout_ref, x0)
implement
prerr_ir0dcl(x0) =
fprint_ir0dcl(stderr_ref, x0)
//
local

implement
fprint_val<ir0valdecl> = fprint_ir0valdecl

in(*in-of-local*)

implement
fprint_ir0dcl
  (out, x0) =
(
case- x0.node() of
//
| IR0Cstatic
  (tok, irc1) =>
  fprint!
  ( out
  , "IR0Cstatic("
  , tok, "; ", irc1, ")")
| IR0Cextern
  (tok, irc1) =>
  fprint!
  ( out
  , "IR0Cextern("
  , tok, "; ", irc1, ")")
//
| IR0Clocal
  (head, body) =>
  fprint!
  ( out
  , "IR0Clocal("
  , head, "; ", body, ")")
//
| IR0Cvaldecl
  (knd, mopt, irds) =>
  fprint!
  ( out
  , "IR0Cvaldecl("
  , knd, "; ", mopt, "; ", irds, ")")
//
| IR0Cnone0() =>
    fprint!(out, "IR0Cnone0(", ")")
| IR0Cnone1(d3cl) =>
    fprint!(out, "IR0Cnone1(", d3cl, ")")
//
)
//
end // end of [local]
//
(* ****** ****** *)
//
implement
print_ir0valdecl(x0) =
fprint_ir0valdecl(stdout_ref, x0)
implement
prerr_ir0valdecl(x0) =
fprint_ir0valdecl(stderr_ref, x0)
//
implement
fprint_ir0valdecl
  (out, x0) = let
//
val+IR0VALDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "IR0VALDECL@{"
  , ", pat=", rcd.pat
  , ", def=", rcd.def, "}")
end // end of [fprint_ir0valdecl]
//
(* ****** ****** *)

(* end of [intrep0_print.dats] *)
