(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS\
/prelude_dats.hats"
//
#staload
"./../DATS/rand000.dats"
//
#include
"./../HATS\
/CATS/Xint/prelude_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
val N = 10
(* ****** ****** *)
#typedef int0 = sint
#typedef ints = list(int0)
(* ****** ****** *)
(* ****** ****** *)
(*
//
#impltmp
g_rand<sint>()=(0)//HX:dummy!
//
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:type>
myfun_rand_test
(f0: c1fr(a,bool)): void =
N.repeat_cfr
(
lam() =>
if // if
f0(g_rand<a>())
then () else $raise AssertExn())
//
(* ****** ****** *)

val () =
myfun_rand_test
(
lam(
xs:ints)=>
( length(xs)
= length(reverse(xs))) )

(* ****** ****** *)

val () =
myfun_rand_test
(
lam@(
xs:ints,ys:ints)=>
( length(append(xs,ys))
= length(xs)+length(ys)) )

(* ****** ****** *)

val () =
myfun_rand_test
(
lam(xs:ints)=>
(xs = reverse(reverse(xs))))

(* ****** ****** *)

val () =
myfun_rand_test
(
lam@(
xs:ints,ys:ints,zs:ints)=>
( append(append(xs,ys),zs)
= append(xs,append(ys,zs))))

(* ****** ****** *)

val () =
myfun_rand_test
(
lam@(
xs:ints,ys:ints)=>
( reverse(append(xs,ys))
= append(reverse(ys), reverse(xs))))

(* ****** ****** *)

val () =
myfun_rand_test
(
lam(
xss: list(ints)) =>
(
length(concat(xss)) =
xss.foldl_cfr
( 0(*init*)
, lam(r0:int0, xs:ints) => r0+length(xs))))

(* ****** ****** *)
//
val () =
myfun_rand_test
(
lam (xs:ints) =>
let
val n0 = length(xs)
and ys = reverse(xs) in
n0.forall_cfr(lam i => xs[i] = ys[n0-1-i]) end)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_TEST_list000_test000.dats] *)
