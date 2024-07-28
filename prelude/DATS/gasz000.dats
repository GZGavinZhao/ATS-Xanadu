(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun 21 Jul 2024 02:34:24 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gasz_get_at
 ( xs,i0 ) =
let
val n0 =
gasz_length<xs><x0>(xs)
in//let
if
(i0 >= n0)
then
get_at$exn<xs><x0>(xs, i0)
else
let
val (pf | x0) =
gasz_get_at_raw<xs><x0>(xs, i0)
in//let
let
prval () = owed_t0_elim0(pf) in x0
end//let
end//let//end-of-[gasz_get_at(xs,i0)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gasz_set_at
(xs, i0, x0) =
let
val n0 =
gasz_length<xs><x0>(xs)
in//let
if
(i0 >= n0)
then
set_at$exn<xs><x0>(xs,i0,x0)
else
let
prval
pf = owed_intr0{x0}()
in//let
  gasz_set_at_raw<xs><x0>(pf|xs,i0,x0)
end//let
end//let//end-of-[gasz_set_at(xs,i0,x0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gasz000.dats] *)
