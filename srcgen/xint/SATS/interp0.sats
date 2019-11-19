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
// HX-2019-11-02: level-1 interpreter
//
(* ****** ****** *)

#define
XATS_targetloc
"./../../xats"

(* ****** ****** *)

#staload
D2E =
"{$XATS}/SATS/dynexp2.sats"

(* ****** ****** *)

#staload
"{$XATS}/SATS/intrep0.sats"

(* ****** ****** *)

typedef d2var = $D2E.d2var
typedef d2con = $D2E.d2con
typedef d2cst = $D2E.d2cst

(* ****** ****** *)

abstype ir0env_tbox = ptr
typedef ir0env = ir0env_tbox

(* ****** ****** *)
//
datatype
ir0val =
//
| IR0Vnil of ()
//
| IR0Vint of int
| IR0Vbtf of bool
| IR0Vchr of char
| IR0Vflt of double
| IR0Vstr of string
//
(*
| IR0Vvar of d2var
| IR0Vcon of d2con
*)
| IR0Vcst of d2cst
//
| IR0Vcon of
  (d2con, ir0valist)
//
| IR0Vfun of ir0valfun
| IR0Vfc2 of (ir0exp, ir0env)
//
| IR0Vnone0 of () | IR0Vnone1 of (ir0exp)
//
where
//
ir0valist = List0(ir0val)
and
ir0valopt = Option(ir0val)
and
ir0valfun = (ir0valist -<cloref1> ir0val)
//
(* ****** ****** *)
//
fun
print_ir0val: print_type(ir0val)
fun
prerr_ir0val: prerr_type(ir0val)
overload print with print_ir0val
overload prerr with prerr_ir0val
//
fun
fprint_ir0val: fprint_type(ir0val)
overload fprint with fprint_ir0val
//
(* ****** ****** *)

absvtype intpenv_vtbox = ptr
vtypedef intpenv = intpenv_vtbox

(* ****** ****** *)
//
fun
ir0env_make_nil(): ir0env
//
fun
intpenv_make_nil(): intpenv
fun
intpenv_make_env(ir0env): intpenv
fun
intpenv_take_env(env: !intpenv): ir0env
//
(* ****** ****** *)
//
fun
intpenv_free_nil(env: intpenv): void
//
(* ****** ****** *)

fun
interp0_search_d2cst
(d2c: d2cst): Option_vt(ir0val)
fun
interp0_search_d2var
( env
: !intpenv
, d2v: d2var): Option_vt(ir0val)

(* ****** ****** *)
//
fun
interp0_insert_d2cst
(d2c: d2cst, irv: ir0val): void
//
fun
interp0_insert_d2var
( env
: !intpenv
, d2v: d2var, irv: ir0val): void
//
(* ****** ****** *)
//
fun
interp0_irdcl
(env: !intpenv, irc: ir0dcl): void
fun
interp0_irdclist
(env: !intpenv, ircs: ir0dclist): void
//
fun
interp0_irexp
(env: !intpenv, ire: ir0exp): ir0val
fun
interp0_irexplst
(env: !intpenv, ires: ir0explst): ir0valist
fun
interp0_irexpopt
(env: !intpenv, opt0: ir0expopt): ir0valopt
//
(* ****** ****** *)
//
fun
interp0_irpat_ck
( env
: !intpenv
, irp: ir0pat, irv: ir0val): void
fun
interp0_irpatlst_ck
( env
: !intpenv
, irps: ir0patlst, irvs: ir0valist): void
//
(* ****** ****** *)

fun
interp0_ir0valdecl
(env: !intpenv, irvd: ir0valdecl): void
fun
interp0_ir0valdeclist
(env: !intpenv, irvds: ir0valdeclist): void

(* ****** ****** *)
//
fun
interp0_initize(): void
//
fun
interp0_initize_gint(): void
//
(* ****** ****** *)

fun
interp0_program(xs: ir0dclist): void

(* ****** ****** *)
//
fun
interp0_main0
{n:int | n >= 1}(int(n), !argv(n)): void
//
(* ****** ****** *)

(* end of [xint_interp0.sats] *)
