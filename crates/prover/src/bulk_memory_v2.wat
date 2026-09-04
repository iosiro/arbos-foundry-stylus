;; Copyright 2026, Offchain Labs, Inc.
;; For license information, see https://github.com/OffchainLabs/nitro/blob/master/LICENSE.md
;; Fixed Stylus V3 implementation: memory.fill uses only the low 8 bits of value.

(module
    (memory (export "memory") 0 0)
    (func $memory_fill (param $dest i32) (param $value i32) (param $size i32)
        (local $value64 i64)
        (i64.add
            (i64.extend_i32_u (local.get $dest))
            (i64.extend_i32_u (local.get $size)))
        (i64.mul
            (i64.extend_i32_u (memory.size))
            (i64.const 0x10000))
        i64.gt_u
        (if (then unreachable))

        (local.tee $value64
            (i64.extend_i32_u (i32.and (local.get $value) (i32.const 0xff))))
        (i64.shl (i64.const 8))
        (i64.or (local.get $value64))
        (i64.shl (i64.const 8))
        (i64.or (local.get $value64))
        (i64.shl (i64.const 8))
        (i64.or (local.get $value64))
        (i64.shl (i64.const 8))
        (i64.or (local.get $value64))
        (i64.shl (i64.const 8))
        (i64.or (local.get $value64))
        (i64.shl (i64.const 8))
        (i64.or (local.get $value64))
        (i64.shl (i64.const 8))
        (i64.or (local.get $value64))
        local.set $value64

        (block $done
            (loop $loop
                (i32.lt_u (local.get $size) (i32.const 8))
                br_if $done
                (i32.sub (local.get $size) (i32.const 8))
                local.tee $size
                local.get $dest
                i32.add
                local.get $value64
                i64.store
                br $loop))

        (loop $loop
            local.get $size
            i32.eqz
            (if (then return))
            (i32.sub (local.get $size) (i32.const 1))
            local.tee $size
            local.get $dest
            i32.add
            local.get $value
            i32.store8
            br $loop)
    )
)
