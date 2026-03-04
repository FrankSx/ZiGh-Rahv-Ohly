Require Import Coq.Strings.String.

Parameter bitstring : Type.
Parameter key : Type.

Parameter HMAC : bitstring -> bitstring -> bitstring.
Parameter HKDF : bitstring -> string -> bitstring.
Parameter AES : key -> bitstring -> bitstring.
Parameter PBKDF2 : bitstring -> bitstring -> nat -> bitstring.

Definition ZiGh (x salt : bitstring) : bitstring :=
  HKDF (HMAC x salt) "ZiGh-domain".

Definition Rahv (x : bitstring) (k : key) : bitstring :=
  AES k x.

Definition Ohly (p s : bitstring) (w : nat) : bitstring :=
  HKDF (PBKDF2 p s w) "Ohly-domain".

Definition System (input salt : bitstring) (k : key) (w : nat) : bitstring :=
  Ohly (Rahv (ZiGh input salt) k) salt w.

(* --- Proof Obligations --- *)

Axiom HMAC_PRF : Prop.
Axiom HKDF_KDF : Prop.
Axiom AES_PRP : Prop.
Axiom PBKDF2_KDF : Prop.

Theorem ZiGh_secure :
  HMAC_PRF -> HKDF_KDF -> True.
Proof.
  intros. (* Proof to be constructed *)
Admitted.

Theorem Rahv_secure :
  AES_PRP -> True.
Proof.
  intros.
Admitted.

Theorem Ohly_secure :
  PBKDF2_KDF -> HKDF_KDF -> True.
Proof.
  intros.
Admitted.

Theorem System_secure :
  HMAC_PRF -> HKDF_KDF -> AES_PRP -> PBKDF2_KDF -> True.
Proof.
  intros.
Admitted.
