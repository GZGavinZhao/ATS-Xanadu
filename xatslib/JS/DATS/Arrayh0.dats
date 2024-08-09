(* ****** ****** *)
(* ****** ****** *)
#staload
"./../SATS/Array.sats"
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
#typedef
jsa(a:vt) = jsarray(a)
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_ptype
< jsa(a) >
( (*void*) ) =
(
pstrn"jsarray(";
g_ptype<a>();pstrn")")
//
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_foritm<jsa(a)> =
gseq_foritm1<jsa(a)><a>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-27:
*)
//
#extern
fun<>
jsarray_listize
{a:vt}
( xs: jsa(a)): list_vt(a)
#impltmp
<(*tmp*)>
jsarray_listize
 {a:vt} =
(
  gasz_listize<jsa(a)><a>)//impltmp
#symload
listize with jsarray_listize of 1000
//
#impltmp
{ a: t0 }
gseq_listize0<jsa(a)><a> = jsarray_listize<>{a}
#impltmp
{ a: vt }
gseq_listize1<jsa(a)><a> = jsarray_listize<>{a}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-27:
*)
//
#extern
fun<a:vt>
jsarray_strmize
( A: jsa(a) ): strm_vt(a)
#impltmp
< a: vt >
jsarray_strmize =
(
  gasz_strmize<jsa(a)><a>)//impltmp
#symload
strmize with jsarray_strmize of 1000
//
#impltmp
{ a: t0 }
gseq_strmize0<jsa(a)><a> = jsarray_strmize<a>
#impltmp
{ a: vt }
gseq_strmize1<jsa(a)><a> = jsarray_strmize<a>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-27:
*)
//
#extern
fun<a:vt>
jsarray_append
(xs: jsa(a), ys: jsa(a)): jsa(a)
//
#impltmp
< a: vt >
jsarray_append =
(
  gseq_append00<jsa(a)><a><jsa(a)>)
//
#impltmp
{ a: vt }
g_append<jsa(a)> = jsarray_append<a>
//
#symload append with jsarray_append of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-27:
*)
//
#extern
fun<a:vt>
jsarray_prepend
(xs: jsa(a), ys: jsa(a)): jsa(a)
#impltmp
< a: vt >
jsarray_prepend =
(
  gseq_prepend00<jsa(a)><a><jsa(a)>)
#symload prepend with jsarray_prepend of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-27:
*)
//
#extern
fun<a:vt>
jsarray_rappend
(xs: jsa(a), ys: jsa(a)): jsa(a)
#impltmp
< a: vt >
jsarray_rappend =
(
  gseq_rappend00<jsa(a)><a><jsa(a)>)
#symload rappend with jsarray_rappend of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-202-07-29:
Mon 29 Jul 2024 07:59:38 AM EDT
*)
//
#extern
fun<a:vt>
jsarray_sum(A: jsa(a)): (a)
#impltmp
< a: vt >
jsarray_sum = gseq_sum0<jsa(a)><a>
#symload sum with jsarray_sum of 1000
//
#extern
fun<a:vt>
jsarray_prod(A: jsa(a)): (a)
#impltmp
< a: vt >
jsarray_prod = gseq_prod0<jsa(a)><a>
#symload prod with jsarray_prod of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-29:
Mon 29 Jul 2024 01:40:18 PM EDT
*)
//
#extern
fun
<a:vt>
<b:t0>
jsarray_map_list_f1un
( A: jsa(a)
, fopr: (a) -> b): list(b)
#extern
fun
<a:vt>
<b:vt>
jsarray_map_llist_f1un
( A: jsa(a)
, fopr: (a) -> b): list_vt(b)
//
#impltmp
< a: vt >
< b: t0 >
jsarray_map_list_f1un
  (A, fopr) =
list_vt2t{b}
(jsarray_map_llist_f1un<a><b>(A, fopr))
#impltmp
< a: vt >
< b: vt >
jsarray_map_llist_f1un
  (A, fopr) =
(
gseq_map1_llist<jsa(a)><a><b>(A)
) where
{
#impltmp map$fopr1<a><b>(x) = fopr(x)
}
//
#symload
map_list with jsarray_map_list_f1un of 1000
#symload
map_llist with jsarray_map_llist_f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_DATS_Arrayh0.dats] *)
