(* ****** ****** *)
(*
** HX-2020-02:
** for unsafe functions
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsfx00.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
$UN.p2tr_get
(p0) = $eval(p0)
#impltmp
<a>(*tmp*)
$UN.p2tr_set
(p0, x0) = $eval(p0) := x0
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
$UN.p2tr_ret
(p0, x0) =
let
val x0 = $UN.delinear(x0) in ()
endlet // end of [$UN.p2tr_ret]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
$UN.p2tr_set_list_nil
  (p0) =
(
$UN.p2tr_set
<list(a)>(p0, list_nil())
)
//
#impltmp
<a>(*tmp*)
$UN.p2tr_set_list_cons
  (p0, x0) =
let
#typedef
xs = list(a)
val xs = 
$UN.p2tr_get<xs>(p0)
in//let
$UN.p2tr_set<xs>(p0,list_cons(x0,xs))
end//end-of-[$UN.p2tr_set_list_cons(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#impltmp
{xs:t0}
{x0:t0}
$UN.gasz_get$at$raw
  (xs, i0) =
let
prval() =
(
  owed_t0_elim0(pf)) in x0 end
where
{ val (pf | x0) =
  $UN.gasz_lget$at$raw<xs><x0>(xs, i0)
}(*where*)//end-of-[$UN.gasz_get$at$raw(...)]
//
(* ****** ****** *)
//
#impltmp
{xs:t0}
{x0:t0}
$UN.gasz_set$at$raw
  (xs, i0, x0) =
let
prval pf = owed_t0_make()
in//let
$UN.gasz_lset$at$raw<xs><x0>(pf|xs,i0,x0)
end(*let*)//end-of-[$UN.gasz_set$at$raw(...)]
//
(* ****** ****** *)
//
#impltmp
{xs:t0}
{x0:vt}
$UN.gasz_cget$at$raw
  (xs, i0) =
let
//
val x1 = g_copy<x0>(x0)
//
prval() =
(
owed_vt_return0(pf, x1)) in x0 end
where
{
val (pf | x0) =
(
  $UN.gasz_lget$at$raw<xs><x0>(xs, i0))
}(*where*)//end-of-[$UN.gasz_cget$at$raw(...)]
//
(* ****** ****** *)
//
(*
HX:
[gasz_setf]
is not efficient
as it involves two "trips"!
We can eliminate the inefficiency
by employing pointer arithmetic!!!
*)
#impltmp
{xs:t0}
{x0:vt}
$UN.gasz_setf$at$raw
  (xs, i0, x0) =
let
//
val (pf | x1) =
(
  $UN.gasz_lget$at$raw<xs><x0>(xs, i0))
//
in//let
//
let
val ((*void*)) = g_free<x0>(x1)
in//let
$UN.gasz_lset$at$raw<xs><x0>(pf|xs,i0,x0)
end//let
//
end(*let*)//end-of-[$UN.gasz_set$at$raw(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./VT/unsfx00_vt.dats" // HX: no need for explicit inclusion
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_unsfx00_and_unsfx00_vt.dats] *)
