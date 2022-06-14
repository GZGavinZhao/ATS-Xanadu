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
Start Time: June 14th, 2022
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
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
//
fun
EOLq
(ch: char): bool = (ch = '\n')
//
(* ****** ****** *)

local

datavwtp
pstn1 =
PSTN1 of
( sint(*ntot*)
, sint(*nrow*), sint(*ncol*))

in//local

(* ****** ****** *)

fun
pstn1_inc1_nc
( pos:
! pstn1 ): void =
let
val+
@PSTN1
(!nt0, !nr1, !nc2) = pos
in//in
( nt0 := nt0+1
//nr1 := nr1+0
; nc2 := nc2+1; $fold(pos))
endlet // end of [pstn1_inc1]

fun
pstn1_inc1_nr
( pos:
! pstn1 ): void =
let
val+
@PSTN1
(!nt0, !nr1, !nc2) = pos
in//in
( nc2 := 0
; nt0 := nt0+1
; nr1 := nr1+1; $fold(pos))
endlet // end of [pstn1_inc1_nr]

fun
pstn1_inc1_if
( pos:
! pstn1
, chr: char): void =
let
val+
@PSTN1
(!nt0, !nr1, !nc2) = pos
in//in
if
EOLq(chr)
then pstn1_inc1_nr(pos)
else pstn1_inc1_nc(pos)
endlet // end of [pstn1_inc1_if]

(* ****** ****** *)

fun
pstn1_incs_if
( pos:
! pstn1
, cs0: strn): void =
gseq_foreach_env1<strn><char>(cs0, pos) where
{
#impltmp
foreach_env1$work<char><pstn1>(chr, pos) = pstn1_inc1_if(pos, chr)
} (*where*) // end of [pstn1_incs(pstn1, strn)]

(* ****** ****** *)
//
fun
lexing_lctniz_tnode
( pos:
! pstn1
, tnd: tnode): void =
(
case+ tnd of
//
| T_EOF() => ()
| T_ERR() => ()
//
| T_EOL() => pstn1_inc1_nr(pos)
//
| T_BLANK(bs) => pstn1_incs_if(pos, bs)
//
| T_CLNLT(cs) => pstn1_incs_if(pos, cs)
| T_DOTLT(cs) => pstn1_incs_if(pos, cs)
//
| T_SPCHR(c1) => pstn1_inc1_if(pos, char(c1))
//
| T_IDALP(rep) => pstn1_incs_if(pos, rep)
| T_IDSYM(rep) => pstn1_incs_if(pos, rep)
| T_IDDLR(rep) => pstn1_incs_if(pos, rep)
| T_IDSRP(rep) => pstn1_incs_if(pos, rep)
| T_IDQUA(rep) => pstn1_incs_if(pos, rep)
//
| T_INT01(rep) => pstn1_incs_if(pos, rep)
| T_INT02(_, rep) => pstn1_incs_if(pos, rep)
| T_INT03(_, rep, _) => pstn1_incs_if(pos, rep)
//
| T_FLT01(rep) => pstn1_incs_if(pos, rep)
| T_FLT02(_, rep) => pstn1_incs_if(pos, rep)
| T_FLT03(_, rep, _) => pstn1_incs_if(pos, rep)
//
| T_CHAR1_nil0(rep) => pstn1_incs_if(pos, rep)
| T_CHAR2_char(rep) => pstn1_incs_if(pos, rep)
| T_CHAR3_blsh(rep) => pstn1_incs_if(pos, rep)
//
| T_STRN1_clsd(rep, _) => pstn1_incs_if(pos, rep)
| T_STRN2_ncls(rep, _) => pstn1_incs_if(pos, rep)
//
|
T_CMNT1_line(ini, txt) =>
(pstn1_incs_if(pos, ini);pstn1_incs_if(pos, txt))
|
T_CMNT2_rest(ini, txt) =>
(pstn1_incs_if(pos, ini);pstn1_incs_if(pos, txt))
//
|
T_CMNT3_ccbl(lvl, txt) => pstn1_incs_if(pos, txt)
|
T_CMNT4_mlbl(lvl, txt) => pstn1_incs_if(pos, txt)
//
| _ (*   otherwise   *) =>
  (
    assert(false) ) where
  { val () =
    prerrln("lexing_lctniz_tnode: tnd = ", tnd) }
//
) (*case*) // end-of-(lexing_lctniz_tnode(pos,tnd))
//
(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_lexing0_lctniz.dats] *)
