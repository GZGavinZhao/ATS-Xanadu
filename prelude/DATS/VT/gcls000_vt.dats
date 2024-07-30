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
Mon 29 Jul 2024 06:15:29 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload UN = 
"./../../SATS/unsfx00.sats"
//
(* ****** ****** *)
//
#staload
"./../../SATS/gcls000.sats"
#staload
"./../../SATS/VT/gcls000_vt.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<xs : vt>
<x0 : vt>
GLSEQ_unmk0
(  gseq  ) =
(
  $UN.castlinxy(gseq))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<xs : vt>
<x0 : vt>
GLSEQ_forall0
  (gseq) =
(
gseq_forall0
<xs><x0>(GLSEQ_unmk0(gseq)))
//
(* ****** ****** *)
//
#impltmp
<xs : vt>
<x0 : vt>
GLSEQ_forall0_c1fr
  (gseq, test) =
(
gseq_forall0_c1fr
<xs><x0>(GLSEQ_unmk0(gseq), test))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
GLSEQ_make0_list_vt
{ x0:vt }(  xs  ) =
let
#vwtpdef xs = list_vt(x0)
in//let
$UN.castlinxy{xs}{GLSEQ(xs,x0)}(xs)
end//let//end-of-[GLSEQ_make0_list_vt]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_gcls000_vt.dats] *)
