# Stylus

A lightweight fork of the Stylus crates from [Arbitrum Nitro](https://github.com/OffchainLabs/nitro).

## Overview

This repository contains the core Stylus VM components extracted from Nitro,
providing a minimal dependency set for Stylus development and integration.

### Included Crates

All crates are required dependencies of `stylus`:

| Crate | Description |
|-------|-------------|
| `arbutil` | Core utilities and types |
| `brotli` | Brotli compression |
| `caller-env` | Caller environment for host functions |
| `validation` | Shared validation types |
| `prover` | WASM parsing, config, machine execution |
| `prover-ffi` | Native prover interface |
| `stylus` | Main Stylus VM implementation |
| `user-host-trait` | Stylus host interface |

## Building

```bash
cargo build --release --features cc_brotli
```

## Testing

```bash
cargo test --features cc_brotli
```

## Fork Maintenance

### Upstream Information

- **Repository**: https://github.com/OffchainLabs/nitro
- **Source Path**: `crates/`
- **Current Base**: v3.11.0 (`a618155919315241665356fe60f3cd00d66d5e46`)

### Merging Upstream Changes

#### 1. Add Upstream Remote (First Time Only)

```bash
git remote add upstream https://github.com/OffchainLabs/nitro.git
git fetch upstream --tags
```

#### 2. Review Changes

```bash
# See what changed between tags
git diff v3.11.0..vX.Y.Z -- crates/
```

#### 3. Apply Changes

```bash
# Import the complete included crate trees from the selected Nitro tag,
# then reapply only the standalone workspace and native-build adaptations.
```

#### 4. Update Documentation

After merging:
1. Update `FORK-CHANGES.md` with the new base tag
2. Add entry to the Maintenance Log

#### 5. Commit

```bash
git commit -m "chore: vendor Stylus runtime from Nitro vX.Y.Z"
```

### Crates NOT to Merge

- `bench/` - Benchmarking binary
- `jit/` - JIT compilation layer
- `langs/` - Language binding examples
- `validator/` - Validation service
- `wasm-testsuite/` - Test suite

### Verification After Merge

```bash
cargo build --release --features cc_brotli
cargo test --features cc_brotli
```

## Directory Structure

```
stylus/
├── Cargo.toml
├── Cargo.lock
├── README.md
├── FORK-CHANGES.md
└── crates/
    ├── arbutil/
    ├── brotli/
    ├── caller-env/
    ├── prover/
    ├── stylus/
    ├── tools/wasmer/               # Wasmer runtime
    └── wasm-libraries/
        ├── forward/                # Build tool for prover
        └── user-host-trait/        # Host trait for stylus
```

## License

BSL (Business Source License)

## Links

- [Upstream Nitro Repository](https://github.com/OffchainLabs/nitro)
- [Arbitrum Documentation](https://docs.arbitrum.io/)
- [Stylus Documentation](https://docs.arbitrum.io/stylus/stylus-gentle-introduction)
