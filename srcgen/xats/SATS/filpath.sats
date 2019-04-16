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
// Start Time: May, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
SYM = "./symbol.sats"
//
(* ****** ****** *)
//
fun theDirSep_get(): char
fun theCurDir_get(): string
fun theParDir_get(): string
//
(* ****** ****** *)
//
abstbox
dirpath_type = ptr
typedef
dirpath = dirpath_type
//
(* ****** ****** *)
//
fun
fprint_dirpath: fprint_type(dirpath)
fun
fprintln_dirpath: fprint_type(dirpath)
//
(* ****** ****** *)
//
abstbox
filpath_type = ptr
typedef
filpath = filpath_type
//
(* ****** ****** *)
//
fun
filpath_dirbase
(dir: string, base: string): string
//
(* ****** ****** *)
//
fun
eq_filpath_filpath
(x1: filpath, x2: filpath):<> bool
fun
neq_filpath_filpath
(x1: filpath, x2: filpath):<> bool
//
fun
compare_filpath_filpath
(x1: filpath, x2: filpath):<> (Sgn)
//
overload = with eq_filpath_filpath
overload != with neq_filpath_filpath
//
overload
compare with compare_filpath_filpath
//
(* ****** ****** *)
//
fun
print_filpath_full: print_type(filpath)
fun
prerr_filpath_full: prerr_type(filpath)
fun
fprint_filpath_full: fprint_type(filpath)
fun
fprintln_filpath_full: fprint_type(filpath)
//
(* ****** ****** *)
//
fun
filpath_get_full
  (fp: filpath):<> $SYM.symbol
//
overload .full with filpath_get_full
//
(* ****** ****** *)
//
fun
filpath_get_current((*void*)): filpath
//
(* ****** ****** *)

val the_filpath_dummy : filpath
val the_filpath_stdin : filpath
val the_filpath_string : filpath // text

(* ****** ****** *)
//
fun
filpath_make
(given: string, fname: string): filpath
//
(* ****** ****** *)
//
fun
filpath_is_dummy: filpath -> bool
fun
filpath_isnot_dummy: filpath -> bool
//
(* ****** ****** *)
//
absview the_filpathlst_v
//
(* ****** ****** *)
//
fun
the_filpathlst_pout
  (pf: the_filpathlst_v|(*none*)): void
//
fun
the_filpathlst_push
  (fp0: filpath): (the_filpathlst_v | void)
// end of [the_filpathlst_push]
//
fun
the_filpathlst_pushck
  (fp0: filpath): (the_filpathlst_v | bool)
// end of [the_filpathlst_push_check]
//
fun the_filpathlst_ppout((*void*)): void 
fun the_filpathlst_ppush(fp0: filpath): void
//
(* ****** ****** *)
//
fun
the_filpath_fprint(out: FILEref): void
fun
the_filpathlst_fprint(out: FILEref): void
//
(* ****** ****** *)

(* end of [xats_filpath.sats] *)
