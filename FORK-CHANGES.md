# Fork Changes

This document tracks changes made to this repository relative to the upstream
[Offchain Labs Nitro](https://github.com/OffchainLabs/nitro) repository.

## Upstream Base

- **Upstream Repository**: https://github.com/OffchainLabs/nitro
- **Current Base Tag**: v3.9.5

## Overview

This repository is a lightweight fork containing only the Stylus-related crates
from Nitro. The goal is to provide a focused, minimal dependency set for Stylus
VM development and integration.

## Included Crates

All crates are required dependencies of `stylus`:

| Crate | Description |
|-------|-------------|
| `arbutil` | Core utilities and types |
| `brotli` | Brotli compression with Stylus dictionaries |
| `caller-env` | Caller environment for host functions |
| `prover` | WASM parsing, config, and machine execution |
| `stylus` | Main Stylus VM implementation |

## Excluded Crates

The following upstream crates are intentionally excluded:

| Crate | Reason |
|-------|--------|
| `bench` | Benchmarking binary, not needed |
| `jit` | JIT compilation layer, not needed |
| `langs` | Language binding examples |
| `validator` | Validation service |
| `wasm-testsuite` | Test suite |

## Vendored Dependencies

### brotli

- **Location**: `brotli/`
- **Upstream Repository**: https://github.com/google/brotli

The Google Brotli C library is vendored for use by `crates/brotli` which provides
Brotli compression with Stylus-specific dictionaries.

### wasmer

- **Location**: `crates/tools/wasmer/`
- **Upstream Repository**: https://github.com/OffchainLabs/wasmer.git (stylus branch)

The Wasmer runtime is vendored directly into this repository rather than included
as a git submodule for simpler dependency management.

## Excluded from Workspace

These directories are excluded from the workspace but still required:

- `crates/tools/wasmer/` - Wasmer runtime (vendored)
- `crates/wasm-libraries/user-host-trait/` - Required by stylus
- `crates/wasm-libraries/forward/` - Build dependency of prover

Upstream wasm-libraries not needed (deleted):
arbcompress, host-io, program-exec, soft-float, user-host, user-test, wasi-stub

## Fork-Specific Files

- `FORK-CHANGES.md` - This file
- `README.md` - Fork documentation
- `crates/prover/build.rs` - Build script to generate forward_stub.wat

## Maintenance Log

### Vendor brotli into repository

- Vendored Google Brotli C library from https://github.com/google/brotli
- Required by `crates/brotli` for compression support

### Update wasmer for newer Rust versions

- Updated wasmer to support newer Rust versions (probestack fix)

### Vendor wasmer into repository

- Converted wasmer from git submodule to vendored code
- Fork of https://github.com/OffchainLabs/wasmer.git (stylus branch)

### 893424b8e - Generate forward_stub at compile time

- Added build script to prover that generates `forward_stub.wat` at compile time
- Converted `forward` crate to a library exposing `forward_stub()` function
- Removed dependency on pre-built `target/machines/latest/forward_stub.wasm`
- The WAT is now parsed directly instead of requiring a separate WASM build step

### v3.9.5 (Initial Fork)

- Initial fork from Nitro v3.9.5
- Extracted Stylus crates into standalone repository

---

*Last updated: 2026-01-22*
