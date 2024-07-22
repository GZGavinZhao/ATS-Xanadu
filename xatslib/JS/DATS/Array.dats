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
//
#impltmp
<(*tmp*)>
jsarray_make_1val
  ( x1 ) =
(
XATS2JS_jsarray_make_1val(x1)
) where
{
#extern
fun
XATS2JS_jsarray_make_1val
{ a : t0 }
( x1: (a)): jsarray(a, 1) = $extnam()
}
//
#impltmp
<(*tmp*)>
jsarray_make_2val
  (x1, x2) =
(
XATS2JS_jsarray_make_2val(x1, x2)
) where
{
#extern
fun
XATS2JS_jsarray_make_2val
{ a : t0 }
( x1: (a)
, x2: (a)): jsarray(a, 2) = $extnam()
}
//
#impltmp
<(*tmp*)>
jsarray_make_3val
  (x1, x2, x3) =
(
XATS2JS_jsarray_make_3val(x1, x2, x3)
) where
{
#extern
fun
XATS2JS_jsarray_make_3val
{ a : t0 }
( x1: (a)
, x2: (a)
, x3: (a)): jsarray(a, 3) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_make_nval
  (n, x) =
(
XATS2JS_jsarray_make_nval(n, x)
) where
{
#extern
fun
XATS2JS_jsarray_make_nval
{a:t0}{n:nat}
( n
: sint(n)
, x:( a )): jsarray(a, n) = $extnam()
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
{a:t0}{n:nat}
(jsarray(a, n)):nint(n) = $extnam()
}
//
#impltmp
< a: t0 >
gseq_length
<jsarray(a)><a> = jsarray_length<>{a}
#impltmp
< a: t0 >
gasz_length
<jsarray(a)><a> = jsarray_length<>{a}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
jsarray_forall
  ( A ) =
nint_forall<>
(
jsarray_length<>(A)) where
{
#impltmp
forall$test
<nint>( i0 ) =
forall$test<x0>
(jsarray_get_at<x0>(A, i0))}
*)
//
#impltmp
< a: t0 >
jsarray_forall
  ( A ) =
(
jsarray_forall_c1fr<>
(A
,lam(x)=>forall$test<a>(x)))
//
#impltmp
{ x0:t0 }
gseq_forall0
<jsarray(x0)><x0>(xs) =
(
jsarray_forall<x0>(xs)) where
{
#impltmp
forall$test<x0> = forall0$test<x0>
}
//
#impltmp
{ x0:t0 }
gseq_forall1
<jsarray(x0)><x0>(xs) =
(
jsarray_forall<x0>(xs)) where
{
#impltmp
forall$test<x0> = forall1$test<x0>
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_forall_c1fr
  (A, test) =
(
XATS2JS_jsarray_forall_c1fr(A, test)
) where
{
#extern
fun
XATS2JS_jsarray_forall_c1fr
{ a: t0 }
( A: jsarray(a)
, test: (a)-<cfr>bool): bool = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
jsarray_rforall
  ( A ) =
(
jsarray_rforall_c1fr<>
(A
,lam(x)=>rforall$test<a>(x)))
//
#impltmp
{ x0:t0 }
gseq_rforall0
<jsarray(x0)><x0>(xs) =
(
jsarray_rforall<x0>(xs)) where
{
#impltmp
rforall$test<x0> = rforall0$test<x0>
}
#impltmp
{ x0:t0 }
gseq_rforall1
<jsarray(x0)><x0>(xs) =
(
jsarray_rforall<x0>(xs)) where
{
#impltmp
rforall$test<x0> = rforall1$test<x0>
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_rforall_c1fr
  (A, test) =
(
XATS2JS_jsarray_rforall_c1fr(A, test)
) where
{
#extern
fun
XATS2JS_jsarray_rforall_c1fr
{ a: t0 }
( A: jsarray(a)
, test: (a)-<cfr>bool): bool = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
jsarray_sortref
  ( A ) =
(
jsarray_sortref_c2fr<>
(A
,lam(x,y)=>g_cmp<a>(x,y)))
//
(*
#impltmp
{ x0:t0 }
gasz_sortref
<jsarray(x0)><x0>(xs) =
(
  jsarray_sortref<x0>( xs ))
*)
//
#impltmp
<(*tmp*)>
jsarray_sortref_c2fr
  (A, cmpr) =
(
XATS2JS_jsarray_sortref_c2fr(A, cmpr)
) where
{
#extern
fun
XATS2JS_jsarray_sortref_c2fr
{ a: t0 }
( A: jsarray(a)
, cmpr: (a, a)-<cfr>sint): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_DATS_Array.dats] *)
