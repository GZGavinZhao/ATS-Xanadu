(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
//
#include
"prelude/HATS/CATS/Xint/prelude_dats.hats"
//
(* ****** ****** *)
var x: int = 10
(* ****** ****** *)
val () = (x:=x+1)
(* ****** ****** *)
val xx = ( x * x )
(* ****** ****** *)
//
fun
foo0
(x:
 !sint): sint = x + 1
//
fun
foo1
(x:
 &sint): void = x := x+1
and
foo2
(x:
 &sint >> sint): void = x := x+1
//
(* ****** ****** *)
val y1 = foo1( x )
and y2 = foo2( x )
val y3 = foo0( x )
(* ****** ****** *)
////
(* ****** ****** *)
//
#extern
fun
<a:t0>
mylength
( xs
: list(a)): sint
//
#impltmp
<a>(*tmp*)
mylength(xs) =
(
  loop(xs, 0)) where
{
//
fnx
loop
{i,j:int}
( xs
: list(a,i)
, j0
: sint( j )): sint(i+j) =
(
case+ xs of
|
list_nil
((*nil*)) => j0
|
list_cons
( x1,
list_nil _ ) => loop(xs, j0+1)
|
list_cons
( x1,
list_cons
( x2, xs ) ) => loop(xs, j0+2)
)(*case+*)//end-of-(loop(xs,j0))
}(*where*)//end-of-(mylength(xs))
//
(* ****** ****** *)
(* ****** ****** *)
val mylist10 =
(
  list(0,1,2,3,4,5,6,7,8,9) )
val length10 = length(mylist10)
val mylength10 = mylength(mylist10)
(* ****** ****** *)
val mylist26 =
list_vt2t
(
strn_listize
( "ABCDEFGHIJKLMNOPQRSTUVWXYZ"))
(*
val mylist26 =
gseq_foldr
<strn><c><r>
( "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
, list_nil()) where
{
#typedef c = char
#typedef r = list(char)
#impltmp
foldr$fopr<c><r>(c, r) = list_cons(c, r)
}
*)
val length26 = length(mylist26)
val mylength26 = mylength(mylist26)
(* ****** ****** *)
////
(* ****** ****** *)
//
FUN
isevn(x: nint): bool =
if x > 0
then isodd(x-1) else true
and
isodd(x: nint): bool =
if x > 0
then isevn(x-1) else false
//
val
isevn10=isevn(10) and isodd10=isodd(10)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [(* end of [ATS3/XATSOPT_BOOT_JS_DATA_mytest02.dats] *)
