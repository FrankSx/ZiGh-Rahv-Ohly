# NIST-Aligned Compliance Mapping
## ZiGh · Rahv · Ohly Architecture
Last Updated: 2026-03-04

---

## SP 800-56C (KDFs)
ZiGh and Ohly align with HKDF and PBKDF2 guidance.

## SP 800-38A (Block Cipher Modes)
Rahv aligns with AES usage recommendations.

## FIPS 140-3
All primitives must be FIPS-validated modules.
No custom cryptographic primitive is introduced.

## Post-Quantum Alignment
Migration roadmap aligns with NIST PQC standardization process (CRYSTALS-Kyber, Ascon, etc.).

---

## Compliance Strategy

1. Use FIPS-validated implementations.
2. Maintain documented reduction arguments.
3. Maintain algorithm agility.
4. Archive deprecated primitives.
