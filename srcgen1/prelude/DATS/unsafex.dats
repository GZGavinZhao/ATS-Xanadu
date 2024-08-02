(* ****** ****** *)
(*
** HX-2020-02:
** for unsafe functions
*)
(* ****** ****** *)
//
#staload UN =
"srcgen1\
/prelude/SATS/unsafex.sats"
//
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
in
$UN.p2tr_set<xs>(p0,list_cons(x0,xs))
end // end of [$UN.p2tr_set_list_cons]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
$UN.p2tr_set_list_vt_nil
  (p0) =
(
$UN.p2tr_set
<list_vt(a)>(p0, list_vt_nil())
)
#impltmp
<a>(*tmp*)
$UN.p2tr_set_list_vt_cons
  (p0, x0) =
let
#vwtpdef
xs = list_vt(a)
val xs = 
$UN.p2tr_get<xs>(p0)
in
$UN.p2tr_set<xs>(p0,list_vt_cons(x0,xs))
end//end-of-[$UN.p2tr_set_list_vt_nil(p0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<xs><x0>
$UN.gseq_last_raw(xs) =
(
gseq_last_ini<xs><x0>(xs, x0)
) where
{
var xs = xs
val x0 =
$UN.gseq_uncons_raw<xs><x0>(xs)}
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
$UN.gseq_uncons_raw(xs) =
(
let
  val () = xs := tl in hd
end
) where
{
val hd =
  $UN.gseq_head_raw<xs><x0>(xs)
val tl =
  $UN.gseq_tail_raw<xs><x0>(xs)
}(*where*)//end(gseq-uncons_raw(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
local
#typedef xs = strn
#typedef x0 = cgtz
in//local
#impltmp
$UN.gseq_head_raw<xs><x0> = $UN.strn_head_raw<>
#impltmp
$UN.gseq_tail_raw<xs><x0> = $UN.strn_tail_raw<>
end//local
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{a:t0}
$UN.gseq_uncons_raw
< list(a) >< a >(xs) =
let
  val x0 = xs.0
  val () = xs := xs.1 in x0
end // end of [gseq_uncons_raw]
//
(* ****** ****** *)
//
#impltmp
{a:type}
$UN.gseq_head_raw<list(a)><a> = $UN.list_head_raw<a>
#impltmp
{a:type}
$UN.gseq_tail_raw<list(a)><a> = $UN.list_tail_raw<a>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
$UN.strm_head_raw(xs) =
$UN.strmcon_head_raw<a>(!xs)
#impltmp
<a>(*tmp*)
$UN.strm_tail_raw(xs) =
$UN.strmcon_tail_raw<a>(!xs)
//
#impltmp
<a>(*tmp*)
$UN.strmcon_head_raw(xs) = xs.0
#impltmp
<a>(*tmp*)
$UN.strmcon_tail_raw(xs) = xs.1
//
(* ****** ****** *)
//
#impltmp
{a:type}
$UN.gseq_head_raw<strm(a)><a> = $UN.strm_head_raw<a>
#impltmp
{a:type}
$UN.gseq_tail_raw<strm(a)><a> = $UN.strm_tail_raw<a>
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_unsafex.dats] *)
