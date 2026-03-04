theory ZiGhRahvOhly_Reductions.

type bitstring.
type key.

op HMAC : bitstring -> bitstring -> bitstring.
op HKDF : bitstring -> string -> bitstring.
op AES  : key -> bitstring -> bitstring.
op PBKDF2 : bitstring -> bitstring -> int -> bitstring.

(* Layer Definitions *)

op ZiGh (x salt : bitstring) =
  HKDF (HMAC x salt) "ZiGh-domain".

op Rahv (x : bitstring) (k : key) =
  AES k x.

op Ohly (p s : bitstring) (w : int) =
  HKDF (PBKDF2 p s w) "Ohly-domain".

op System (input salt : bitstring) (k : key) (w : int) =
  Ohly (Rahv (ZiGh input salt) k) salt w.

(* --- Reduction Lemmas --- *)

lemma ZiGh_PRF_Reduction:
  is_prf HMAC => is_kdf HKDF => is_prf ZiGh.
proof.
  admit.
qed.

lemma Rahv_PRP_Reduction:
  is_prp AES => is_prp Rahv.
proof.
  admit.
qed.

lemma Ohly_KDF_Reduction:
  is_kdf PBKDF2 => is_kdf HKDF => is_kdf Ohly.
proof.
  admit.
qed.

lemma System_Composition_Bound:
  is_prf ZiGh => is_prp Rahv => is_kdf Ohly => secure System.
proof.
  admit.
qed.

end.
