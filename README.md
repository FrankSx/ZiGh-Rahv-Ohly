
# ZiGh · Rahv · Ohly

A research framework exploring **geometric topology as computation**.

This repository implements the core pipeline:

SVG Geometry → ZiGh → Braid Extraction → Rahv → Braid Evolution → Ohly → Topological Invariants

## Core Idea

Geometric curves can be interpreted as strands evolving in time. When curves cross,
they form braid generators. These braids can be evolved and analyzed using topology
and knot invariants.

The system explores whether geometric interaction can produce invariant structures
useful for cryptography, physics simulation, and visual computation.

## Operators

ZiGh  
Extracts braid words from geometric systems.

Rahv  
Evolves braid structures under rule systems.

Ohly  
Computes topological invariants.

## Quick Start

Install dependencies:

```
npm install
```

Run braid extraction on an SVG:

```
node engine/zigh.js examples/sample.svg
```

Output example:

```
σ1 σ2 σ1⁻¹ σ3
```

## Repository Structure

```
docs/          theory and experiment design
engine/        core operators
visual/        simple topology viewer
examples/      example SVG geometries
proofs/        formal verification scaffolding
```

## Status

Research prototype.
