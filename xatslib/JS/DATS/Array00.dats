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
Sun 21 Jul 2024 01:21:25 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/Array.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#typedef
jsa(a:vt) = jsarray(a)
#typedef
jsa(a:vt,n:i0) = jsarray(a,n)
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_print<jsa(a)>
  ( xs ) =
let
//
#vwtpdef x0 = (a)
#typedef xs = jsa(a)
//
#impltmp
gseq$sep<xs><x0>() = ","
#impltmp
gseq$beg<xs><x0>() = "jsarray("
#impltmp
gseq$end<xs><x0>() = ")"
in//let
  gseq_print1<xs><x0>(xs)
end//end-of-[g_print<jsa(a)>]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_make_nval
  (n, x) =
(
XATS2JS_jsarray_make_nval
  (n, x)) where
{
#extern
fun
XATS2JS_jsarray_make_nval
 {a:t0}{n:nat}
( n
: sint(n)
, x:( a )): jsa(a, n) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_make0_1val
  ( x1 ) =
(
XATS2JS_jsarray_make0_1val
  (x1)) where
{
#extern
fun
XATS2JS_jsarray_make0_1val
 {a:vt}
( x1: (a)): jsa(a, 1) = $extnam()
}
//
#impltmp
<(*tmp*)>
jsarray_make0_2val
  (x1, x2) =
(
XATS2JS_jsarray_make0_2val
  (x1, x2)) where
{
#extern
fun
XATS2JS_jsarray_make0_2val
 {a:vt}
( x1: (a)
, x2: (a)): jsa(a, 2) = $extnam()
}
//
#impltmp
<(*tmp*)>
jsarray_make0_3val
  (x1, x2, x3) =
(
XATS2JS_jsarray_make0_3val
  (x1, x2, x3)) where
{
#extern
fun
XATS2JS_jsarray_make0_3val
 {a:vt}
( x1: (a)
, x2: (a)
, x3: (a)): jsa(a, 3) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_length
  ( A ) =
(
XATS2JS_jsarray_length(A)
) where
{
#extern
fun
XATS2JS_jsarray_length
 {a:vt}{n:nat}
(A: jsa(a, n)):sint(n) = $extnam()
}
//
#impltmp
{ x0:t0 }
gseq_length
<jsa(x0)><x0> = jsarray_length<>{x0}
#impltmp
{ x0:vt }
gasz_length
<jsa(x0)><x0> = jsarray_length<>{x0}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-24:
Wed 24 Jul 2024 09:09:12 PM EDT
*)
//
#impltmp
<(*tmp*)>
jsarray_get_at
  {a}(A, i) =
(
XATS2JS_jsarray_get_at
  (A, i)) where
{
#extern
fun
XATS2JS_jsarray_get_at
{a:t0}{n:nat}
(A: jsa(a, n), i: nint): (a) = $extnam()
}
//
#impltmp
<(*tmp*)>
jsarray_set_at
  {a}(A, i, x) =
(
XATS2JS_jsarray_set_at
  (A, i, x)) where
{
#extern
fun
XATS2JS_jsarray_set_at
{a:t0}{n:nat}
(A: jsa(a, n), i:nint, x:a): void = $extnam()
}
//
#impltmp
{ x0:t0 }
gasz_get_at
<jsa(x0)><x0> = jsarray_get_at<>{x0}
#impltmp
{ x0:t0 }
gasz_set_at
<jsa(x0)><x0> = jsarray_set_at<>{x0}
//
#impltmp
{ x0:t0 }
gasz_get_at_raw
<jsa(x0)><x0> = jsarray_get_at<>{x0}//safe
#impltmp
{ x0:t0 }
gasz_set_at_raw
<jsa(x0)><x0> = jsarray_set_at<>{x0}//safe
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_strmize
<jsa(x0)><x0> = gasz_strmize<jsa(x0)><x0>
#impltmp
{ x0:vt }
gseq_strmize0
<jsa(x0)><x0> = gasz_strmize<jsa(x0)><x0>
#impltmp
{ x0:vt }
gseq_strmize1
<jsa(x0)><x0> = gasz_strmize<jsa(x0)><x0>
//
#impltmp
{ x0:t0 }
gseq_rstrmize
<jsa(x0)><x0> = gasz_rstrmize<jsa(x0)><x0>
#impltmp
{ x0:vt }
gseq_rstrmize0
<jsa(x0)><x0> = gasz_rstrmize<jsa(x0)><x0>
#impltmp
{ x0:vt }
gseq_rstrmize1
<jsa(x0)><x0> = gasz_rstrmize<jsa(x0)><x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< x0:vt >
jsarray_forall
  ( A ) =
nint_forall<>
(
jsarray_length<>(A)) where
{
#impltmp
forall$test
<nint>( i0 ) =
forall$test0<x0>
(jsarray_get_at<x0>(A, i0))}
*)
//
#impltmp
< a: vt >
jsarray_forall
  ( A ) =
(
jsarray_forall_c1fr<>
(A
,lam(x)=>forall$test1<a>(x)))
//
#impltmp
{ x0:t0 }
gseq_forall
<jsa(x0)><x0> = jsarray_forall<x0>
//
#impltmp
{ x0:vt }
gseq_forall1
<jsa(x0)><x0> = jsarray_forall<x0>
//
#impltmp
{ x0:t0 }
gseq_forall0
<jsa(x0)><x0>
 ( xs ) =
(
jsarray_forall<x0>(xs)) where
{
#impltmp
forall$test1<x0> = forall$test0<x0>
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_forall_c1fr
  (A, test) =
(
XATS2JS_jsarray_forall_c1fr
  (A, test)) where
{
#extern
fun
XATS2JS_jsarray_forall_c1fr
 {a:vt}
( A: jsa(a)
, test: (!a)-<cfr>bool): bool = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: vt >
jsarray_rforall
  ( A ) =
(
jsarray_rforall_c1fr<>
(A
,lam(x)=>rforall$test1<a>(x)))
//
#impltmp
{ x0:t0 }
gseq_rforall0
<jsa(x0)><x0>
 ( xs ) =
(
jsarray_rforall<x0>(xs)) where
{
#impltmp
rforall$test1<x0> = rforall$test0<x0>
}
#impltmp
{ x0:vt }
gseq_rforall1
<jsa(x0)><x0> = jsarray_rforall<x0>
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_rforall_c1fr
  (A, test) =
(
XATS2JS_jsarray_rforall_c1fr
  (A, test)) where
{
#extern
fun
XATS2JS_jsarray_rforall_c1fr
 {a:vt}
( A: jsa(a)
, test: (a)-<cfr>bool): bool = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: vt >
jsarray_mapref
  ( A ) =
(
jsarray_mapref_c1fr<>
(A, lam(x)=>mapref$fopr0<a>(x)))
//
#impltmp
<(*tmp*)>
jsarray_mapref_c1fr
  (A, fopr) =
(
XATS2JS_jsarray_mapref_c1fr
  (A, fopr)) where
{
#extern
fun
XATS2JS_jsarray_mapref_c1fr
 {a:vt}
( A: jsa(a)
, fopr: (~a)-<cfr>(a)): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: vt >
jsarray_sortref
  ( A ) =
(
jsarray_sortref_c2fr<>
(A, lam(x,y)=>g_cmp11<a>(x, y)))
//
(*
#impltmp
{ x0:vt }
gasz_sortref
<jsa(x0)><x0> = jsarray_sortref<x0>
#impltmp
{ x0:vt }
gasz_sortref0
<jsa(x0)><x0> = jsarray_sortref<x0>
#impltmp
{ x0:vt }
gasz_sortref1
<jsa(x0)><x0> = jsarray_sortref<x0>
*)
//
#impltmp
<(*tmp*)>
jsarray_sortref_c2fr
  (A, cmpr) =
(
XATS2JS_jsarray_sortref_c2fr
  (A, cmpr)) where
{
#extern
fun
XATS2JS_jsarray_sortref_c2fr
 {a:vt}
( A: jsa(a)
, cmpr
: (!a, !a)-<cfr>sint): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-25:
Thu 25 Jul 2024 03:08:18 PM EDT
*)
//
#impltmp
<(*tmp*)>
jsarray_make0_lstrm
  {a:vt}( xs ) =
(
jsarray_make0_fwork<>
(lam(work) => xs.foritm0(work)))
//
#impltmp
{ x0:vt }
g_make0_lstrm
<x0><jsa(x0)>(xs) =
(
  jsarray_make0_lstrm<>{x0}(xs))
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_make0_fwork
  (fwork) =
(
XATS2JS_jsarray_make0_fwork
  (fwork)) where
{
#extern
fun
XATS2JS_jsarray_make0_fwork
 {a:vt}
(fwork: ~fwork(a)): jsa(a) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_DATS_Array00.dats] *)
