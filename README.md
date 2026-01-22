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
| `prover` | WASM parsing, config, machine execution |
| `stylus` | Main Stylus VM implementation |

## Building

```bash
cargo build --release
```

## Testing

```bash
cargo test
```

## Fork Maintenance

### Upstream Information

- **Repository**: https://github.com/OffchainLabs/nitro
- **Source Path**: `crates/`
- **Current Base**: v3.9.5

### Merging Upstream Changes

#### 1. Add Upstream Remote (First Time Only)

```bash
git remote add upstream https://github.com/OffchainLabs/nitro.git
git fetch upstream --tags
```

#### 2. Review Changes

```bash
# See what changed between tags
git diff v3.9.5..v3.9.6 -- crates/
```

#### 3. Apply Changes

```bash
# Create a branch for the merge
git checkout -b merge-upstream-v3.9.6

# Cherry-pick or manually apply relevant changes
```

#### 4. Update Documentation

After merging:
1. Update `FORK-CHANGES.md` with the new base tag
2. Add entry to the Maintenance Log

#### 5. Commit

```bash
git commit -m "Merge upstream tag 'vX.Y.Z'"
```

### Crates NOT to Merge

- `bench/` - Benchmarking binary
- `jit/` - JIT compilation layer
- `langs/` - Language binding examples
- `validator/` - Validation service
- `wasm-testsuite/` - Test suite

### Verification After Merge

```bash
cargo build --release
cargo test
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
