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
"srcgen2\
/prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
#include
"srcgen2\
/prelude/HATS/prelude_JS_dats.hats"
(* ****** ****** *)
#include
"srcgen2\
/prelude/HATS/prelude_NODE_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
val ns = list(10, 1)
val () = prints("ns = ", ns, "\n")
//
val xs =
list
(10, lam(i:sint) => i)
val () = prints("xs = ", xs, "\n")
//
val ys =
map(xs, lam(i:sint) => i*i)
val () = prints("ys = ", ys, "\n")
val zs =
maprev(xs, lam(i:sint) => i*i)
val () = prints("zs = ", zs, "\n")
//
val () =
prints("yszs = ", appends(ys, zs), '\n')
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_TEST_CATS_JS_test06_list000.dats] *)
