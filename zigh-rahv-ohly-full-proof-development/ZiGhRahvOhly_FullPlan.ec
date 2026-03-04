theory ZiGhRahvOhly_FullPlan.

type bitstring.
type key.

axiom HMAC_PRF : bool.
axiom HKDF_KDF : bool.
axiom AES_PRP  : bool.
axiom PBKDF2_KDF : bool.

op ZiGh (x salt : bitstring) =
  HKDF (HMAC x salt) "ZiGh-domain".

op Rahv (x : bitstring) (k : key) =
  AES k x.

op Ohly (p s : bitstring) (w : int) =
  HKDF (PBKDF2 p s w) "Ohly-domain".

op System (input salt : bitstring) (k : key) (w : int) =
  Ohly (Rahv (ZiGh input salt) k) salt w.

(* Proof Tasks:

1. Define adversary advantage formally.
2. Prove ZiGh PRF preservation via hybrid games.
3. Prove Rahv PRP preservation.
4. Prove Ohly KDF security bound.
5. Compose bounds via triangle inequality.

*)

end.
