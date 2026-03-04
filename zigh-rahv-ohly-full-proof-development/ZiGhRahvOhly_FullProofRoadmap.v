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

(* Proof Roadmap:

- Formalize probabilistic adversary model.
- Define distinguishing advantage.
- Bound ZiGh advantage by HMAC + HKDF.
- Bound Rahv by AES PRP.
- Bound Ohly by PBKDF2 + HKDF.
- Combine bounds.

*)
