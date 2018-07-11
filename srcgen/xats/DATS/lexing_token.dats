(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: May, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

#staload "./../SATS/basics.sats"
#staload "./../SATS/lexing.sats"
#staload "./../SATS/location.sats"

(* ****** ****** *)

local

absimpl
token_tbox = $rec{
token_loc= loc_t, token_node= tnode
} (* token_tbox *)

in (* in-of-local *)

implement
//{}//tmp
token_make_node
  (loc, node) = $rec
{
  token_loc= loc, token_node= node
} (* end of [token_make] *)

implement
//{}//tmp
token_get_loc(tok) = tok.token_loc
implement
//{}//tmp
token_get_node(tok) = tok.token_node

end // end of [local]

(* ****** ****** *)
//
implement
print_tnode
  (tok) =
  fprint_tnode(stdout_ref, tok)
implement
prerr_tnode
  (tok) =
  fprint_tnode(stderr_ref, tok)
//
(* ****** ****** *)
//
implement
fprint_tnode(out, tnd) =
(
case+ tnd of
//
| T_EOF() => fprint(out, "EOF")
| T_ERR() => fprint(out, "ERR")
//
| T_EOL() => fprint(out, "EOL")
//
| T_BLANK(x) =>
  fprint!(out, "BLANK(", x, ")")
//
| T_IDENT_alp(x) =>
  fprint!(out, "IDENT_alp(", x, ")")
| T_IDENT_sym(x) =>
  fprint!(out, "IDENT_sym(", x, ")")
//
| T_IDENT_srp(x) =>
  fprint!(out, "IDENT_srp(", x, ")")
| T_IDENT_dlr(x) =>
  fprint!(out, "IDENT_dlr(", x, ")")
//
| T_IDENT_qual(x) =>
  fprint!(out, "IDENT_qual(", x, ")")
//
| T_INT1(rep) =>
  fprint!(out, "INT(", rep, ")")
| T_INT2(base, rep) =>
  fprint!(out, "INT(", base, ", ", rep, ")")
| T_INT3(base, rep, _(*sfx*)) =>
  fprint!(out, "INT(", base, ", ", rep, ")")
//
| T_FLOAT1(rep) =>
  fprint!(out, "FLOAT(", rep, ")")
| T_FLOAT2(base, rep) =>
  fprint!(out, "FLOAT(", base, ", ", rep, ")")
| T_FLOAT3(base, rep, _(*sfx*)) =>
  fprint!(out, "FLOAT(", base, ", ", rep, ")")
//
(*
| T_CHAR(chr) =>
  let
    val chr = int2char0(chr)
  in
    fprint!(out, "CHAR(", chr, ")")
  end
*)
| T_CHAR_nil(rep) =>
  fprint!(out, "CHAR_nil(", rep, ")")
| T_CHAR_char(rep) =>
  fprint!(out, "CHAR_char(", rep, ")")
| T_CHAR_slash(rep) =>
  fprint!(out, "CHAR_slash(", rep, ")")
//
| T_STRING_quote(str) =>
  fprint!(out, "STRING_quote(", str, ")")
//
(*
| T_CDATA(cdata, asz) => fprint!(out, "CDATA(...)")
*)
//
| T_SPECHAR(c) =>
  fprint!(out, "SPECHAR(", int2char0(c), ")")
//
| T_COMMENT_line
    (init, content) =>
    fprint!(out, "T_COMMENT_line(", init, "; ", "...)")
| T_COMMENT_rest
    (init, content) =>
    fprint!(out, "T_COMMENT_rest(", init, "; ", "...)")
| T_COMMENT_cblock
    (level, content) =>
    fprint!(out, "T_COMMENT_cblock(", level, "; ", "...)")
| T_COMMENT_mlblock
    (level, content) =>
    fprint!(out, "T_COMMENT_mlblock(", level, "; ", "...)")
//
| T_BAR() => fprint(out, "BAR")
| T_DOT() => fprint(out, "DOT")
//
| T_LT() => fprint(out, "LT")
| T_GT() => fprint(out, "GT")
| T_LTEQ() => fprint(out, "LTEQ")
| T_GTEQ() => fprint(out, "GTEQ")
//
| T_COMMA() => fprint(out, "COMMA")
| T_SEMICOLON() => fprint(out, "SEMICOLON")
//
| T_BACKSLASH() => fprint(out, "BACKSLASH")
//
| T_LPAREN() => fprint(out, "LPAREN")
| T_RPAREN() => fprint(out, "RPAREN")
| T_LBRACE() => fprint(out, "LBRACE")
| T_RBRACE() => fprint(out, "RBRACE")
| T_LBRACKET() => fprint(out, "LBRACKET")
| T_RBRACKET() => fprint(out, "RBRACKET")
//
(*
| T_ATLPAREN() => fprint(out, "ATLPAREN")
| T_ATLBRACE() => fprint(out, "ATLBRACE")
| T_ATLBRACKET() => fprint(out, "ATLBRACKET")
*)
//
| T_AS() => fprint(out, "AS")
| T_OF() => fprint(out, "OF")
//
| T_IN() => fprint(out, "IN")
| T_END() => fprint(out, "END")
//
| T_LET() => fprint(out, "LET")
| T_WHERE() => fprint(out, "WHERE")
//
| T_IF() => fprint(out, "IF")
| T_SIF() => fprint(out, "SIF")
| T_THEN() => fprint(out, "THEN")
| T_ELSE() => fprint(out, "ELSE")
//
| T_LAM(knd) =>
  fprint!(out, "LAM(", knd, ")")
| T_FIX(knd) =>
  fprint!(out, "FIX(", knd, ")")
//
| T_LOCAL() => fprint(out, "LOCAL")
//
| T_ABSTYPE(sort) =>
  fprint!(out, "ABSTYPE(", sort, ")")
//
| T_DATASORT() =>
  fprint(out, "DATASORT")
| T_DATATYPE(sort) =>
  fprint!(out, "DATATYPE(", sort, ")")
//
| T_SRP_INCLUDE() => fprint(out, "#INCLUDE")
//
| T_SRP_STALOAD() => fprint(out, "#STALOAD")
| T_SRP_DYNLOAD() => fprint(out, "#DYNLOAD")
//
) (* end of [fprint_tnode] *)
//
(* ****** ****** *)
//
implement
print_token
  (tok) =
  fprint_token(stdout_ref, tok)
implement
prerr_token
  (tok) =
  fprint_token(stderr_ref, tok)
//
implement
fprint_token
  (out, tok) =
(
  fprint(out, tok.node())
(*
  fprint!(out, tok.loc(), ": ", tok.node())
*)
)
//
(* ****** ****** *)
//
implement
print2_tnode
  (tok) =
  fprint2_tnode(stdout_ref, tok)
implement
prerr2_tnode
  (tok) =
  fprint2_tnode(stderr_ref, tok)
//
(* ****** ****** *)

//
implement
fprint2_tnode(out, tnd) =
(
case+ tnd of
//
| T_EOF() => ()
| T_ERR() =>
  fprint(out, "*ERROR*")
//
| T_EOL() => fprint(out, "\n")
//
| T_BLANK(x) => fprint(out, x)
//
| T_IDENT_alp(x) => fprint(out, x)
| T_IDENT_sym(x) => fprint(out, x)
//
| T_IDENT_srp(x) => fprint(out, x)
| T_IDENT_dlr(x) => fprint(out, x)
//
| T_IDENT_qual(x) => fprint(out, x)
//
| T_INT1(rep) => fprint(out, rep)
| T_INT2(base, rep) => fprint(out, rep)
| T_INT3(base, rep, _(*sfx*)) => fprint(out, rep)
//
| T_FLOAT1(rep) => fprint(out, rep)
| T_FLOAT2(base, rep) => fprint(out, rep)
| T_FLOAT3(base, rep, _(*sfx*)) => fprint(out, rep)
//
(*
| T_CHAR(chr) =>
  let
    val chr = int2char0(chr)
  in
    fprint!(out, "CHAR(", chr, ")")
  end
*)
| T_CHAR_nil(rep) => fprint(out, rep)
| T_CHAR_char(rep) => fprint(out, rep)
| T_CHAR_slash(rep) => fprint(out, rep)
//
| T_STRING_quote(str) => fprint(out, str)
//
(*
| T_CDATA(cdata, asz) => fprint!(out, "CDATA(...)")
*)
//
| T_SPECHAR(c) =>
  fprint(out, c) where{val c=int2char0(c)}
//
| T_COMMENT_line
    (init, content) =>
    fprint!(out, init, content)
| T_COMMENT_rest
    (init, content) =>
    fprint!(out, init, content)
| T_COMMENT_cblock
    (level, content) => fprint(out, content)
| T_COMMENT_mlblock
    (level, content) => fprint(out, content)
//
| T_BAR() => fprint(out, "|")
| T_DOT() => fprint(out, ".")
//
| T_LT() => fprint(out, "<")
| T_GT() => fprint(out, ">")
| T_LTEQ() => fprint(out, "<=")
| T_GTEQ() => fprint(out, ">=")
//
| T_COMMA() => fprint(out, ",")
| T_SEMICOLON() => fprint(out, ";")
//
| T_BACKSLASH() => fprint(out, "\\")
//
| T_LPAREN() => fprint(out, "(")
| T_RPAREN() => fprint(out, ")")
| T_LBRACE() => fprint(out, "{")
| T_RBRACE() => fprint(out, "}")
| T_LBRACKET() => fprint(out, "[")
| T_RBRACKET() => fprint(out, "]")
//
(*
| T_ATLPAREN() => fprint(out, "@(")
| T_ATLBRACE() => fprint(out, "@{")
| T_ATLBRACKET() => fprint(out, "@[")
*)
//
| T_AS() => fprint(out, "as")
| T_OF() => fprint(out, "of")
| T_IN() => fprint(out, "in")
| T_END() => fprint(out, "end")
//
| T_LET() => fprint(out, "let")
| T_WHERE() => fprint(out, "where")
//
| T_LAM(knd) =>
  fprint!(out, "lam(", knd, ")")
| T_FIX(knd) =>
  fprint!(out, "fix(", knd, ")")
//
| T_IF() => fprint(out, "if")
| T_SIF() => fprint(out, "sif")
| T_THEN() => fprint(out, "then")
| T_ELSE() => fprint(out, "else")
//
| T_LOCAL() => fprint(out, "local")
//
| T_ABSTYPE(knd) =>
  fprint!(out, "datatype(", knd, ")")
//
| T_DATASORT() =>
  fprint!(out, "datasort")
| T_DATATYPE(knd) =>
  fprint!(out, "datatype(", knd, ")")
//
| T_SRP_INCLUDE() => fprint(out, "#include")
//
| T_SRP_STALOAD() => fprint(out, "#staload")
| T_SRP_DYNLOAD() => fprint(out, "#dynload")
//
) (* end of [fprint2_tnode] *)
//
(* ****** ****** *)

local
//
#define c2i char2int1
//
val
theAsz =
i2sz(128)
val
theMap =
arrayref_make_elt<tnode>
  (theAsz, T_EOF())
//
val () = theMap[c2i(',')] := T_COMMA()
val () = theMap[c2i(';')] := T_SEMICOLON()
//
val () = theMap[c2i('\(')] := T_LPAREN()
val () = theMap[c2i('\)')] := T_RPAREN()
//
val () = theMap[c2i('\\')] := T_BACKSLASH()
//
in (* in-of-local *)

implement
char2tnode(i0) = let
//
typedef AszLt = intBtw(0, 128)
//
in
//
if
(i0 < 128)
then theMap[$UN.cast{AszLt}(i0)] else T_EOF()
//
end // end of [char2tnode]

end // end of [local]

(* ****** ****** *)
//
implement
tnode_is_COMMA
  (node) =
(
  case+ node of
  | T_COMMA() => true | _ => false
)
//
implement
tnode_is_SEMICOLON
  (node) =
(
  case+ node of
  | T_SEMICOLON() => true | _ => false
)
//
(* ****** ****** *)
//
implement
tnode_is_blank
  (node) =
(
case+ node of
| T_EOL _ => true
| T_BLANK _ => true
| _ (* non-T_BLANK_... *) => false
)
implement
tnode_is_comment
  (node) =
(
case+ node of
| T_COMMENT_line _ => true
| T_COMMENT_rest _ => true
| T_COMMENT_cblock _ => true
| T_COMMENT_mlblock _ => true
| _ (* non-T_COMMENT_... *) => false
)
//
implement
tnode_is_skipped
  (node) =
(
if
tnode_is_blank(node)
then true else tnode_is_comment(node)
)
//
(* ****** ****** *)

local
//
#staload
"libats/SATS/hashtbl_linprb.sats"
//
#staload
_(*anon*) = "libats/DATS/hashfun.dats"
#staload
_(*anon*) = "libats/DATS/hashtbl_linprb.dats"
//
typedef key = string and itm = tnode
vtypedef hashtbl = hashtbl(key, itm)
//
val
theCap = 229
val
theHashtbl = 
hashtbl_make_nil<key,itm>(i2sz(theCap))
val
theHashtbl = $UN.castvwtp0{ptr}(theHashtbl)
//
in (* in-of-local *)

implement
tnode_search(name) = let
//
var res: itm?
//
val tbl =
$UN.castvwtp0{hashtbl}(theHashtbl)
val ans =
hashtbl_search<key,itm>(tbl, name, res)
prval ((*void*)) = $UN.cast2void(tbl)
//
in
  if (ans)
  then opt_unsome_get(res)
  else let
    prval () = opt_unnone(res) in T_EOF()
  end // end of [else]
end // end of [tnode_search]

(* ****** ****** *)

implement
tnode_insert
(name, node) = let
//
var res: itm?
val tbl =
$UN.castvwtp0{hashtbl}(theHashtbl)
val ans =
hashtbl_insert<key,itm>(tbl, name, node, res)
//
val ((*void*)) = assertloc(ans = false)
//
prval ((*void*)) = opt_clear(res)
prval ((*void*)) = $UN.cast2void(tbl)
//
in
  // nothing
end // end of [tnode_insert]

end // end of [local]

(* ****** ****** *)

(*
extern val T_DOT : tnode
extern val T_QMARK : tnode
extern val T_PERCENT : tnode
*)
(*
implement T_DOT = T_IDENT_alp "."
implement T_QMARK = T_IDENT_alp "?"
implement T_PERCENT = T_IDENT_alp "%"
*)

(* ****** ****** *)

(*
val () = tnode_insert("@", T_AT)
val () = tnode_insert("!", T_BANG)
*)

(* ****** ****** *)
//
implement
lexing_locatize_node
  (pos0, node) = let
//
#define
locmake
location_make_pos_pos
//
#define
posinc1 position_incby_1
#define
posinceol position_incby_eol
#define
posincneol position_incby_neol
#define
posinctext position_incby_text
//
fun
tnode_trans
(node0: tnode): tnode =
(
case+ node0 of
| T_SPECHAR(c) => let
    val
    node1 = char2tnode(c)
  in
    case+ node1 of
    | T_EOF() => node0 | _(*else*) => node1
  end // end of [T_SPECHAR]
//
| T_IDENT_alp(id) => let
    val
    node1 = tnode_search(id)
  in
    case+ node1 of
    | T_EOF() => node0 | _(*else*) => node1
  end // end of [T_IDENT_alp]
| T_IDENT_sym(id) => let
    val
    node1 = tnode_search(id)
  in
    case+ node1 of
    | T_EOF() => node0 | _(*else*) => node1
  end // end of [T_IDENT_sym]
//
| _ (* rest-of-tnode *) => node0
//
)
//
var pos1: pos_t
val ((*void*)) =
position_copyfrom(pos1, pos0)
//
in
//
(
case+ node of
//
| T_EOF() => ()
| T_ERR() => ()
//
| T_EOL() => posinceol(pos1)
//
| T_BLANK(bs) => posincneol(pos1, bs)
//
| T_SPECHAR(c) => posinc1(pos1)
//
| T_IDENT_alp(id) => posincneol(pos1, id)
| T_IDENT_sym(id) => posincneol(pos1, id)
//
| T_IDENT_dlr(id) => posincneol(pos1, id)
| T_IDENT_srp(id) => posincneol(pos1, id)
//
| T_INT1(rep) => posincneol(pos1, rep)
| T_INT2(_, rep) => posincneol(pos1, rep)
| T_INT3(_, rep, _) => posincneol(pos1, rep)
//
| T_FLOAT1(rep) => posincneol(pos1, rep)
| T_FLOAT2(_, rep) => posincneol(pos1, rep)
| T_FLOAT3(_, rep, _) => posincneol(pos1, rep)
//
| T_CHAR_nil(rep) => posincneol(pos1, rep)
| T_CHAR_char(rep) => posincneol(pos1, rep)
| T_CHAR_slash(rep) => posincneol(pos1, rep)
//
| T_STRING_quote(rep) => posinctext(pos1, rep)
//
| T_COMMENT_line
    (init, content) =>
  (
    posincneol(pos1, init); // initiative
    posincneol(pos1, content) // comment body
  )
| T_COMMENT_rest
    (init, content) =>
  (
    posincneol(pos1, init); // initiative
    posinctext(pos1, content) // comment body
  )
| T_COMMENT_cblock
    (level, content) => posinctext(pos1, content)
| T_COMMENT_mlblock
    (level, content) => posinctext(pos1, content)
//
| _ (* else *) => ()
//
) ; (* end of [case] *)
(
let
  val
  node = tnode_trans(node)
  val
  loc01 = locmake(pos0, pos1)
in
  position_copyfrom
  (
    pos0, pos1
  ) ; token_make_node(loc01, node)
end // end of [let]
)
//
end // end of [lexing_locatize_node]

(* ****** ****** *)

implement
lexing_locatize_nodelst
  (pos, nodes) = let
//
fun
loop
( pos: &pos_t >> _
, nodes: tnodelst
, tokens: tokenlst_vt): tokenlst_vt =
(
case+ nodes of
| list_nil() =>
  list_vt_reverse(tokens)
| list_cons(node, nodes) => let
    val token =
    lexing_locatize_node(pos, node)
  in
    loop(pos, nodes, list_vt_cons(token, tokens))
  end // end of [list_cons]
)
//
in
  loop(pos, nodes, list_vt_nil(*void*))
end // end of [lexing_locatize_tnodelst]

(* ****** ****** *)

implement
lexing_preprocess_tokenlst
  (toks) = let
//
fnx
loop0
( xs0: tokenlst_vt
, res: tokenlst_vt): tokenlst_vt =
(
case+ xs0 of
| ~list_vt_nil() => res
| ~list_vt_cons(x0, xs1) =>
   (loop1(x0, xs1, res))
)
and
loop1
( x0: token
, xs1: tokenlst_vt
, res: tokenlst_vt): tokenlst_vt =
(
case+ xs1 of
| ~list_vt_nil() =>
   list_vt_cons(x0, res)
| ~list_vt_cons(x1, xs2) =>
   (loop2(x0, x1, xs2, res))
)
and
loop2
( x0: token
, x1: token
, xs2: tokenlst_vt
, res: tokenlst_vt): tokenlst_vt =
(
case+ x0.node() of
//
| T_EOL() =>
  loop1(x1, xs2, res)
| T_BLANK _ =>
  loop1(x1, xs2, res)
//
| T_COMMENT_line _ =>
  loop1(x1, xs2, res)
| T_COMMENT_rest _ =>
  loop1(x1, xs2, res)
| T_COMMENT_cblock _ =>
  loop1(x1, xs2, res)
| T_COMMENT_mlblock _ =>
  loop1(x1, xs2, res)
//
| T_IDENT_dlr(id) =>
  (
    case+ x1.node() of
    | T_DOT() => let
        val loc =
        x0.loc()+x1.loc()
        val x01 =
        token_make_node
        (loc, T_IDENT_qual(id+"."))
      in
        loop0(xs2, list_vt_cons(x01, res))
      end // end of [T_DOT]
    | _ (* rest-of-tnode *) =>
        loop1(x1, xs2, list_vt_cons(x0, res))
  ) (* end of [T_IDENT_dlr] *)
//
| _ (* rest-of-tnode *) =>
    loop1(x1, xs2, list_vt_cons(x0, res))
//
)
//
in
//
list_vt_reverse<token>(loop0(toks, list_vt_nil()))
//
end // end of [lexing_preprocess_tokenlst]

(* ****** ****** *)

(* end of [xats_lexing_token.dats] *)
