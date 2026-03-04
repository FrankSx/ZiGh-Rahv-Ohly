# Formal Specification

## ZiGh(·)

ZiGh(x, salt) =
    HKDF(HMAC_SHA256(x, salt), "ZiGh-domain")

Security:
Adv_ZiGh ≤ Adv_HMAC + Adv_HKDF

---

## Rahv(·)

Rahv(x, k) =
    AES_CTR(k, x) XOR AES_ECB(k, x)

Security:
Adv_Rahv ≤ c · Adv_AES

---

## Ohly(·)

Ohly(P, S, W) =
    HKDF(PBKDF2(P, S, W), "Ohly-domain")

Security:
Adv_Ohly ≤ Adv_PBKDF2 + Adv_HKDF

---

## Composed Bound

Adv_System ≤
    Adv_HMAC +
    Adv_HKDF +
    Adv_AES +
    Adv_PBKDF2

No additional cryptographic assumptions are introduced.
