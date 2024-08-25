(* ****** ****** *)
(*
HX-2024-08-09:
For testing xatslib/JS!
*)
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"prelude/DATS/gdbg000.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1\
/prelude/HATS/prelude_dats.hats"
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
#include
"srcgen2\
/prelude/HATS/prelude_JS_dats.hats"
(* ****** ****** *)
#include
"srcgen1\
/prelude/HATS/CATS/JS/prelude_dats.hats"
(* ****** ****** *)
#staload _ =
"srcgen1\
/prelude/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact(n: nint): sint =
if
(n > 0)
then n * fact(n-1) else 1
//
(* ****** ****** *)
(* ****** ****** *)
//
val
fact = trace("fact", fact)
//
val (  ) =
(20).foritm
(lam(n:nint)=>g_void(fact(n)))
//
(* ****** ****** *)
(* ****** ****** *)
//
val
strn_append =
trace("strn_append", strn_append<>)
val strn_abc = strn_append("a", "bc")
val strn_xyz = strn_append("x", "yz")
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_TEST_CATS_JS_test05_gdbg000.dats] *)
