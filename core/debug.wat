(module
 (type $0 (func (param i32 i32)))
 (type $1 (func (param i32) (result i32)))
 (type $2 (func (param i32 i32) (result i32)))
 (type $3 (func (param i32 i32 i32)))
 (type $4 (func (param i32 i32 i32) (result i32)))
 (type $5 (func (param i32)))
 (type $6 (func))
 (type $7 (func (param i32 i32) (result f64)))
 (type $8 (func (param i32 i32 i32 i32)))
 (type $9 (func (param i32 i32 i64) (result i32)))
 (type $10 (func (param i32 i32 f64)))
 (type $11 (func (param f64 f64 f64) (result f64)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (global $~lib/shared/runtime/Runtime.Stub i32 (i32.const 0))
 (global $~lib/shared/runtime/Runtime.Minimal i32 (i32.const 1))
 (global $~lib/shared/runtime/Runtime.Incremental i32 (i32.const 2))
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/native/ASC_LOW_MEMORY_LIMIT i32 (i32.const 0))
 (global $~lib/rt/tcms/fromSpace (mut i32) (i32.const 0))
 (global $~lib/rt/tcms/white (mut i32) (i32.const 0))
 (global $~lib/rt/tcms/total (mut i32) (i32.const 0))
 (global $~lib/native/ASC_RUNTIME i32 (i32.const 1))
 (global $~lib/rt/tcms/pinSpace (mut i32) (i32.const 0))
 (global $~lib/rt/tcms/toSpace (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 1120))
 (global $~lib/memory/__heap_base i32 (i32.const 1160))
 (memory $0 1)
 (data $0 (i32.const 12) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e\00\00\00\00\00\00\00\00\00")
 (data $1 (i32.const 76) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s\00\00\00")
 (data $2 (i32.const 124) "|\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $3 (i32.const 252) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\18\00\00\00u\00[\000\00]\00 \00i\00s\00 \00n\00u\00l\00l\00\00\00\00\00")
 (data $4 (i32.const 300) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1a\00\00\00s\00r\00c\00/\00f\00a\00c\00t\00o\00r\00.\00t\00s\00\00\00")
 (data $5 (i32.const 348) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data $6 (i32.const 396) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e\00\00\00\00\00")
 (data $7 (i32.const 460) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00c\00m\00s\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $8 (i32.const 524) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $9 (i32.const 592) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $10 (i32.const 620) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00n\00o\00 \00c\00o\00n\00v\00e\00r\00g\00e\00n\00c\00e\00")
 (data $11 (i32.const 668) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\14\00\00\00s\00r\00c\00/\00s\00v\00d\00.\00t\00s\00\00\00\00\00\00\00\00\00")
 (data $12 (i32.const 716) "|\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00^\00\00\00U\00n\00e\00x\00p\00e\00c\00t\00e\00d\00 \00\'\00n\00u\00l\00l\00\'\00 \00(\00n\00o\00t\00 \00a\00s\00s\00i\00g\00n\00e\00d\00 \00o\00r\00 \00f\00a\00i\00l\00e\00d\00 \00c\00a\00s\00t\00)\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $13 (i32.const 844) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\006\00\00\00N\00e\00e\00d\00 \00m\00o\00r\00e\00 \00r\00o\00w\00s\00 \00t\00h\00a\00n\00 \00c\00o\00l\00u\00m\00n\00s\00\00\00\00\00\00\00")
 (data $14 (i32.const 924) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00*\00\00\00O\00b\00j\00e\00c\00t\00 \00a\00l\00r\00e\00a\00d\00y\00 \00p\00i\00n\00n\00e\00d\00\00\00")
 (data $15 (i32.const 992) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $16 (i32.const 1020) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00O\00b\00j\00e\00c\00t\00 \00i\00s\00 \00n\00o\00t\00 \00p\00i\00n\00n\00e\00d\00\00\00\00\00")
 (data $17 (i32.const 1088) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $18 (i32.const 1120) "\t\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00\02\1a\00\00\02A\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (table $0 1 1 funcref)
 (elem $0 (i32.const 1))
 (export "factor" (func $src/factor/factor))
 (export "svd" (func $src/svd/svd))
 (export "__new" (func $~lib/rt/tcms/__new))
 (export "__pin" (func $~lib/rt/tcms/__pin))
 (export "__unpin" (func $~lib/rt/tcms/__unpin))
 (export "__collect" (func $~lib/rt/tcms/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "memory" (memory $0))
 (start $~start)
 (func $~lib/array/Array<~lib/array/Array<f64>>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/array/Array<f64>>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<~lib/array/Array<f64>>#get:length_
  return
 )
 (func $~lib/array/Array<~lib/array/Array<f64>>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/array/Array<f64>>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/array/Array<f64>>#get:length_
  i32.ge_u
  if
   i32.const 32
   i32.const 96
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  call $~lib/array/Array<~lib/array/Array<f64>>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $value
  i32.const 1
  drop
  i32.const 0
  i32.eqz
  drop
  local.get $value
  i32.eqz
  if
   i32.const 144
   i32.const 96
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  return
 )
 (func $~lib/array/Array<f64>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<f64>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<f64>#get:length_
  return
 )
 (func $~lib/rt/tlsf/Root#set:flMap (param $this i32) (param $flMap i32)
  local.get $this
  local.get $flMap
  i32.store
 )
 (func $~lib/rt/common/BLOCK#get:mmInfo (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/rt/common/BLOCK#set:mmInfo (param $this i32) (param $mmInfo i32)
  local.get $this
  local.get $mmInfo
  i32.store
 )
 (func $~lib/rt/tlsf/Block#set:prev (param $this i32) (param $prev i32)
  local.get $this
  local.get $prev
  i32.store offset=4
 )
 (func $~lib/rt/tlsf/Block#set:next (param $this i32) (param $next i32)
  local.get $this
  local.get $next
  i32.store offset=8
 )
 (func $~lib/rt/tlsf/Block#get:prev (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/rt/tlsf/Block#get:next (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $~lib/rt/tlsf/Root#get:flMap (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/rt/tlsf/removeBlock (param $root i32) (param $block i32)
  (local $blockInfo i32)
  (local $size i32)
  (local $fl i32)
  (local $sl i32)
  (local $6 i32)
  (local $7 i32)
  (local $boundedSize i32)
  (local $prev i32)
  (local $next i32)
  (local $root|11 i32)
  (local $fl|12 i32)
  (local $sl|13 i32)
  (local $root|14 i32)
  (local $fl|15 i32)
  (local $sl|16 i32)
  (local $head i32)
  (local $root|18 i32)
  (local $fl|19 i32)
  (local $slMap i32)
  (local $root|21 i32)
  (local $fl|22 i32)
  (local $slMap|23 i32)
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $blockInfo
  i32.const 1
  drop
  local.get $blockInfo
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 544
   i32.const 268
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $blockInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.set $size
  i32.const 1
  drop
  local.get $size
  i32.const 12
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 544
   i32.const 270
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $size
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $fl
   local.get $size
   i32.const 4
   i32.shr_u
   local.set $sl
  else
   local.get $size
   local.tee $6
   i32.const 1073741820
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_u
   select
   local.set $boundedSize
   i32.const 31
   local.get $boundedSize
   i32.clz
   i32.sub
   local.set $fl
   local.get $boundedSize
   local.get $fl
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $sl
   local.get $fl
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $fl
  end
  i32.const 1
  drop
  local.get $fl
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $sl
   i32.const 16
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 544
   i32.const 284
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $block
  call $~lib/rt/tlsf/Block#get:prev
  local.set $prev
  local.get $block
  call $~lib/rt/tlsf/Block#get:next
  local.set $next
  local.get $prev
  if
   local.get $prev
   local.get $next
   call $~lib/rt/tlsf/Block#set:next
  end
  local.get $next
  if
   local.get $next
   local.get $prev
   call $~lib/rt/tlsf/Block#set:prev
  end
  local.get $block
  block $~lib/rt/tlsf/GETHEAD|inlined.0 (result i32)
   local.get $root
   local.set $root|11
   local.get $fl
   local.set $fl|12
   local.get $sl
   local.set $sl|13
   local.get $root|11
   local.get $fl|12
   i32.const 4
   i32.shl
   local.get $sl|13
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
   br $~lib/rt/tlsf/GETHEAD|inlined.0
  end
  i32.eq
  if
   local.get $root
   local.set $root|14
   local.get $fl
   local.set $fl|15
   local.get $sl
   local.set $sl|16
   local.get $next
   local.set $head
   local.get $root|14
   local.get $fl|15
   i32.const 4
   i32.shl
   local.get $sl|16
   i32.add
   i32.const 2
   i32.shl
   i32.add
   local.get $head
   i32.store offset=96
   local.get $next
   i32.eqz
   if
    block $~lib/rt/tlsf/GETSL|inlined.0 (result i32)
     local.get $root
     local.set $root|18
     local.get $fl
     local.set $fl|19
     local.get $root|18
     local.get $fl|19
     i32.const 2
     i32.shl
     i32.add
     i32.load offset=4
     br $~lib/rt/tlsf/GETSL|inlined.0
    end
    local.set $slMap
    local.get $root
    local.set $root|21
    local.get $fl
    local.set $fl|22
    local.get $slMap
    i32.const 1
    local.get $sl
    i32.shl
    i32.const -1
    i32.xor
    i32.and
    local.tee $slMap
    local.set $slMap|23
    local.get $root|21
    local.get $fl|22
    i32.const 2
    i32.shl
    i32.add
    local.get $slMap|23
    i32.store offset=4
    local.get $slMap
    i32.eqz
    if
     local.get $root
     local.get $root
     call $~lib/rt/tlsf/Root#get:flMap
     i32.const 1
     local.get $fl
     i32.shl
     i32.const -1
     i32.xor
     i32.and
     call $~lib/rt/tlsf/Root#set:flMap
    end
   end
  end
 )
 (func $~lib/rt/tlsf/insertBlock (param $root i32) (param $block i32)
  (local $blockInfo i32)
  (local $block|3 i32)
  (local $right i32)
  (local $rightInfo i32)
  (local $block|6 i32)
  (local $block|7 i32)
  (local $left i32)
  (local $leftInfo i32)
  (local $size i32)
  (local $fl i32)
  (local $sl i32)
  (local $13 i32)
  (local $14 i32)
  (local $boundedSize i32)
  (local $root|16 i32)
  (local $fl|17 i32)
  (local $sl|18 i32)
  (local $head i32)
  (local $root|20 i32)
  (local $fl|21 i32)
  (local $sl|22 i32)
  (local $head|23 i32)
  (local $root|24 i32)
  (local $fl|25 i32)
  (local $root|26 i32)
  (local $fl|27 i32)
  (local $slMap i32)
  i32.const 1
  drop
  local.get $block
  i32.eqz
  if
   i32.const 0
   i32.const 544
   i32.const 201
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $blockInfo
  i32.const 1
  drop
  local.get $blockInfo
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 544
   i32.const 203
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  block $~lib/rt/tlsf/GETRIGHT|inlined.0 (result i32)
   local.get $block
   local.set $block|3
   local.get $block|3
   i32.const 4
   i32.add
   local.get $block|3
   call $~lib/rt/common/BLOCK#get:mmInfo
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   br $~lib/rt/tlsf/GETRIGHT|inlined.0
  end
  local.set $right
  local.get $right
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $rightInfo
  local.get $rightInfo
  i32.const 1
  i32.and
  if
   local.get $root
   local.get $right
   call $~lib/rt/tlsf/removeBlock
   local.get $block
   local.get $blockInfo
   i32.const 4
   i32.add
   local.get $rightInfo
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.tee $blockInfo
   call $~lib/rt/common/BLOCK#set:mmInfo
   block $~lib/rt/tlsf/GETRIGHT|inlined.1 (result i32)
    local.get $block
    local.set $block|6
    local.get $block|6
    i32.const 4
    i32.add
    local.get $block|6
    call $~lib/rt/common/BLOCK#get:mmInfo
    i32.const 3
    i32.const -1
    i32.xor
    i32.and
    i32.add
    br $~lib/rt/tlsf/GETRIGHT|inlined.1
   end
   local.set $right
   local.get $right
   call $~lib/rt/common/BLOCK#get:mmInfo
   local.set $rightInfo
  end
  local.get $blockInfo
  i32.const 2
  i32.and
  if
   block $~lib/rt/tlsf/GETFREELEFT|inlined.0 (result i32)
    local.get $block
    local.set $block|7
    local.get $block|7
    i32.const 4
    i32.sub
    i32.load
    br $~lib/rt/tlsf/GETFREELEFT|inlined.0
   end
   local.set $left
   local.get $left
   call $~lib/rt/common/BLOCK#get:mmInfo
   local.set $leftInfo
   i32.const 1
   drop
   local.get $leftInfo
   i32.const 1
   i32.and
   i32.eqz
   if
    i32.const 0
    i32.const 544
    i32.const 221
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $root
   local.get $left
   call $~lib/rt/tlsf/removeBlock
   local.get $left
   local.set $block
   local.get $block
   local.get $leftInfo
   i32.const 4
   i32.add
   local.get $blockInfo
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.tee $blockInfo
   call $~lib/rt/common/BLOCK#set:mmInfo
  end
  local.get $right
  local.get $rightInfo
  i32.const 2
  i32.or
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $blockInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.set $size
  i32.const 1
  drop
  local.get $size
  i32.const 12
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 544
   i32.const 233
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 1
  drop
  local.get $block
  i32.const 4
  i32.add
  local.get $size
  i32.add
  local.get $right
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 544
   i32.const 234
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $right
  i32.const 4
  i32.sub
  local.get $block
  i32.store
  local.get $size
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $fl
   local.get $size
   i32.const 4
   i32.shr_u
   local.set $sl
  else
   local.get $size
   local.tee $13
   i32.const 1073741820
   local.tee $14
   local.get $13
   local.get $14
   i32.lt_u
   select
   local.set $boundedSize
   i32.const 31
   local.get $boundedSize
   i32.clz
   i32.sub
   local.set $fl
   local.get $boundedSize
   local.get $fl
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $sl
   local.get $fl
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $fl
  end
  i32.const 1
  drop
  local.get $fl
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $sl
   i32.const 16
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 544
   i32.const 251
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  block $~lib/rt/tlsf/GETHEAD|inlined.1 (result i32)
   local.get $root
   local.set $root|16
   local.get $fl
   local.set $fl|17
   local.get $sl
   local.set $sl|18
   local.get $root|16
   local.get $fl|17
   i32.const 4
   i32.shl
   local.get $sl|18
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
   br $~lib/rt/tlsf/GETHEAD|inlined.1
  end
  local.set $head
  local.get $block
  i32.const 0
  call $~lib/rt/tlsf/Block#set:prev
  local.get $block
  local.get $head
  call $~lib/rt/tlsf/Block#set:next
  local.get $head
  if
   local.get $head
   local.get $block
   call $~lib/rt/tlsf/Block#set:prev
  end
  local.get $root
  local.set $root|20
  local.get $fl
  local.set $fl|21
  local.get $sl
  local.set $sl|22
  local.get $block
  local.set $head|23
  local.get $root|20
  local.get $fl|21
  i32.const 4
  i32.shl
  local.get $sl|22
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.get $head|23
  i32.store offset=96
  local.get $root
  local.get $root
  call $~lib/rt/tlsf/Root#get:flMap
  i32.const 1
  local.get $fl
  i32.shl
  i32.or
  call $~lib/rt/tlsf/Root#set:flMap
  local.get $root
  local.set $root|26
  local.get $fl
  local.set $fl|27
  block $~lib/rt/tlsf/GETSL|inlined.1 (result i32)
   local.get $root
   local.set $root|24
   local.get $fl
   local.set $fl|25
   local.get $root|24
   local.get $fl|25
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=4
   br $~lib/rt/tlsf/GETSL|inlined.1
  end
  i32.const 1
  local.get $sl
  i32.shl
  i32.or
  local.set $slMap
  local.get $root|26
  local.get $fl|27
  i32.const 2
  i32.shl
  i32.add
  local.get $slMap
  i32.store offset=4
 )
 (func $~lib/rt/tlsf/addMemory (param $root i32) (param $start i32) (param $endU64 i64) (result i32)
  (local $end i32)
  (local $root|4 i32)
  (local $tail i32)
  (local $tailInfo i32)
  (local $size i32)
  (local $leftSize i32)
  (local $left i32)
  (local $root|10 i32)
  (local $tail|11 i32)
  local.get $endU64
  i32.wrap_i64
  local.set $end
  i32.const 1
  drop
  local.get $start
  i64.extend_i32_u
  local.get $endU64
  i64.le_u
  i32.eqz
  if
   i32.const 0
   i32.const 544
   i32.const 382
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $start
  i32.const 4
  i32.add
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  i32.const 4
  i32.sub
  local.set $start
  local.get $end
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  local.set $end
  block $~lib/rt/tlsf/GETTAIL|inlined.0 (result i32)
   local.get $root
   local.set $root|4
   local.get $root|4
   i32.load offset=1568
   br $~lib/rt/tlsf/GETTAIL|inlined.0
  end
  local.set $tail
  i32.const 0
  local.set $tailInfo
  local.get $tail
  if
   i32.const 1
   drop
   local.get $start
   local.get $tail
   i32.const 4
   i32.add
   i32.ge_u
   i32.eqz
   if
    i32.const 0
    i32.const 544
    i32.const 389
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $start
   i32.const 16
   i32.sub
   local.get $tail
   i32.eq
   if
    local.get $start
    i32.const 16
    i32.sub
    local.set $start
    local.get $tail
    call $~lib/rt/common/BLOCK#get:mmInfo
    local.set $tailInfo
   else
   end
  else
   i32.const 1
   drop
   local.get $start
   local.get $root
   i32.const 1572
   i32.add
   i32.ge_u
   i32.eqz
   if
    i32.const 0
    i32.const 544
    i32.const 402
    i32.const 5
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $end
  local.get $start
  i32.sub
  local.set $size
  local.get $size
  i32.const 4
  i32.const 12
  i32.add
  i32.const 4
  i32.add
  i32.lt_u
  if
   i32.const 0
   return
  end
  local.get $size
  i32.const 2
  i32.const 4
  i32.mul
  i32.sub
  local.set $leftSize
  local.get $start
  local.set $left
  local.get $left
  local.get $leftSize
  i32.const 1
  i32.or
  local.get $tailInfo
  i32.const 2
  i32.and
  i32.or
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $left
  i32.const 0
  call $~lib/rt/tlsf/Block#set:prev
  local.get $left
  i32.const 0
  call $~lib/rt/tlsf/Block#set:next
  local.get $start
  i32.const 4
  i32.add
  local.get $leftSize
  i32.add
  local.set $tail
  local.get $tail
  i32.const 0
  i32.const 2
  i32.or
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $root
  local.set $root|10
  local.get $tail
  local.set $tail|11
  local.get $root|10
  local.get $tail|11
  i32.store offset=1568
  local.get $root
  local.get $left
  call $~lib/rt/tlsf/insertBlock
  i32.const 1
  return
 )
 (func $~lib/rt/tlsf/initialize
  (local $rootOffset i32)
  (local $pagesBefore i32)
  (local $pagesNeeded i32)
  (local $root i32)
  (local $root|4 i32)
  (local $tail i32)
  (local $fl i32)
  (local $root|7 i32)
  (local $fl|8 i32)
  (local $slMap i32)
  (local $sl i32)
  (local $root|11 i32)
  (local $fl|12 i32)
  (local $sl|13 i32)
  (local $head i32)
  (local $memStart i32)
  i32.const 0
  drop
  global.get $~lib/memory/__heap_base
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  local.set $rootOffset
  memory.size
  local.set $pagesBefore
  local.get $rootOffset
  i32.const 1572
  i32.add
  i32.const 65535
  i32.add
  i32.const 65535
  i32.const -1
  i32.xor
  i32.and
  i32.const 16
  i32.shr_u
  local.set $pagesNeeded
  local.get $pagesNeeded
  local.get $pagesBefore
  i32.gt_s
  if (result i32)
   local.get $pagesNeeded
   local.get $pagesBefore
   i32.sub
   memory.grow
   i32.const 0
   i32.lt_s
  else
   i32.const 0
  end
  if
   unreachable
  end
  local.get $rootOffset
  local.set $root
  local.get $root
  i32.const 0
  call $~lib/rt/tlsf/Root#set:flMap
  local.get $root
  local.set $root|4
  i32.const 0
  local.set $tail
  local.get $root|4
  local.get $tail
  i32.store offset=1568
  i32.const 0
  local.set $fl
  loop $for-loop|0
   local.get $fl
   i32.const 23
   i32.lt_u
   if
    local.get $root
    local.set $root|7
    local.get $fl
    local.set $fl|8
    i32.const 0
    local.set $slMap
    local.get $root|7
    local.get $fl|8
    i32.const 2
    i32.shl
    i32.add
    local.get $slMap
    i32.store offset=4
    i32.const 0
    local.set $sl
    loop $for-loop|1
     local.get $sl
     i32.const 16
     i32.lt_u
     if
      local.get $root
      local.set $root|11
      local.get $fl
      local.set $fl|12
      local.get $sl
      local.set $sl|13
      i32.const 0
      local.set $head
      local.get $root|11
      local.get $fl|12
      i32.const 4
      i32.shl
      local.get $sl|13
      i32.add
      i32.const 2
      i32.shl
      i32.add
      local.get $head
      i32.store offset=96
      local.get $sl
      i32.const 1
      i32.add
      local.set $sl
      br $for-loop|1
     end
    end
    local.get $fl
    i32.const 1
    i32.add
    local.set $fl
    br $for-loop|0
   end
  end
  local.get $rootOffset
  i32.const 1572
  i32.add
  local.set $memStart
  i32.const 0
  drop
  local.get $root
  local.get $memStart
  memory.size
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  drop
  local.get $root
  global.set $~lib/rt/tlsf/ROOT
 )
 (func $~lib/rt/tlsf/computeSize (param $size i32) (result i32)
  local.get $size
  i32.const 12
  i32.le_u
  if (result i32)
   i32.const 12
  else
   local.get $size
   i32.const 4
   i32.add
   i32.const 15
   i32.add
   i32.const 15
   i32.const -1
   i32.xor
   i32.and
   i32.const 4
   i32.sub
  end
  return
 )
 (func $~lib/rt/tlsf/prepareSize (param $size i32) (result i32)
  local.get $size
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 416
   i32.const 544
   i32.const 461
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  local.get $size
  call $~lib/rt/tlsf/computeSize
  return
 )
 (func $~lib/rt/tlsf/roundSize (param $size i32) (result i32)
  local.get $size
  i32.const 536870910
  i32.lt_u
  if (result i32)
   local.get $size
   i32.const 1
   i32.const 27
   local.get $size
   i32.clz
   i32.sub
   i32.shl
   i32.add
   i32.const 1
   i32.sub
  else
   local.get $size
  end
  return
 )
 (func $~lib/rt/tlsf/searchBlock (param $root i32) (param $size i32) (result i32)
  (local $fl i32)
  (local $sl i32)
  (local $requestSize i32)
  (local $root|5 i32)
  (local $fl|6 i32)
  (local $slMap i32)
  (local $head i32)
  (local $flMap i32)
  (local $root|10 i32)
  (local $fl|11 i32)
  (local $root|12 i32)
  (local $fl|13 i32)
  (local $sl|14 i32)
  (local $root|15 i32)
  (local $fl|16 i32)
  (local $sl|17 i32)
  local.get $size
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $fl
   local.get $size
   i32.const 4
   i32.shr_u
   local.set $sl
  else
   local.get $size
   call $~lib/rt/tlsf/roundSize
   local.set $requestSize
   i32.const 4
   i32.const 8
   i32.mul
   i32.const 1
   i32.sub
   local.get $requestSize
   i32.clz
   i32.sub
   local.set $fl
   local.get $requestSize
   local.get $fl
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $sl
   local.get $fl
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $fl
  end
  i32.const 1
  drop
  local.get $fl
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $sl
   i32.const 16
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 544
   i32.const 334
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  block $~lib/rt/tlsf/GETSL|inlined.2 (result i32)
   local.get $root
   local.set $root|5
   local.get $fl
   local.set $fl|6
   local.get $root|5
   local.get $fl|6
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=4
   br $~lib/rt/tlsf/GETSL|inlined.2
  end
  i32.const 0
  i32.const -1
  i32.xor
  local.get $sl
  i32.shl
  i32.and
  local.set $slMap
  i32.const 0
  local.set $head
  local.get $slMap
  i32.eqz
  if
   local.get $root
   call $~lib/rt/tlsf/Root#get:flMap
   i32.const 0
   i32.const -1
   i32.xor
   local.get $fl
   i32.const 1
   i32.add
   i32.shl
   i32.and
   local.set $flMap
   local.get $flMap
   i32.eqz
   if
    i32.const 0
    local.set $head
   else
    local.get $flMap
    i32.ctz
    local.set $fl
    block $~lib/rt/tlsf/GETSL|inlined.3 (result i32)
     local.get $root
     local.set $root|10
     local.get $fl
     local.set $fl|11
     local.get $root|10
     local.get $fl|11
     i32.const 2
     i32.shl
     i32.add
     i32.load offset=4
     br $~lib/rt/tlsf/GETSL|inlined.3
    end
    local.set $slMap
    i32.const 1
    drop
    local.get $slMap
    i32.eqz
    if
     i32.const 0
     i32.const 544
     i32.const 347
     i32.const 18
     call $~lib/builtins/abort
     unreachable
    end
    block $~lib/rt/tlsf/GETHEAD|inlined.2 (result i32)
     local.get $root
     local.set $root|12
     local.get $fl
     local.set $fl|13
     local.get $slMap
     i32.ctz
     local.set $sl|14
     local.get $root|12
     local.get $fl|13
     i32.const 4
     i32.shl
     local.get $sl|14
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load offset=96
     br $~lib/rt/tlsf/GETHEAD|inlined.2
    end
    local.set $head
   end
  else
   block $~lib/rt/tlsf/GETHEAD|inlined.3 (result i32)
    local.get $root
    local.set $root|15
    local.get $fl
    local.set $fl|16
    local.get $slMap
    i32.ctz
    local.set $sl|17
    local.get $root|15
    local.get $fl|16
    i32.const 4
    i32.shl
    local.get $sl|17
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=96
    br $~lib/rt/tlsf/GETHEAD|inlined.3
   end
   local.set $head
  end
  local.get $head
  return
 )
 (func $~lib/rt/tlsf/growMemory (param $root i32) (param $size i32)
  (local $pagesBefore i32)
  (local $root|3 i32)
  (local $pagesNeeded i32)
  (local $5 i32)
  (local $6 i32)
  (local $pagesWanted i32)
  (local $pagesAfter i32)
  i32.const 0
  drop
  local.get $size
  i32.const 256
  i32.ge_u
  if
   local.get $size
   call $~lib/rt/tlsf/roundSize
   local.set $size
  end
  memory.size
  local.set $pagesBefore
  local.get $size
  i32.const 4
  local.get $pagesBefore
  i32.const 16
  i32.shl
  i32.const 4
  i32.sub
  block $~lib/rt/tlsf/GETTAIL|inlined.1 (result i32)
   local.get $root
   local.set $root|3
   local.get $root|3
   i32.load offset=1568
   br $~lib/rt/tlsf/GETTAIL|inlined.1
  end
  i32.ne
  i32.shl
  i32.add
  local.set $size
  local.get $size
  i32.const 65535
  i32.add
  i32.const 65535
  i32.const -1
  i32.xor
  i32.and
  i32.const 16
  i32.shr_u
  local.set $pagesNeeded
  local.get $pagesBefore
  local.tee $5
  local.get $pagesNeeded
  local.tee $6
  local.get $5
  local.get $6
  i32.gt_s
  select
  local.set $pagesWanted
  local.get $pagesWanted
  memory.grow
  i32.const 0
  i32.lt_s
  if
   local.get $pagesNeeded
   memory.grow
   i32.const 0
   i32.lt_s
   if
    unreachable
   end
  end
  memory.size
  local.set $pagesAfter
  local.get $root
  local.get $pagesBefore
  i32.const 16
  i32.shl
  local.get $pagesAfter
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  drop
 )
 (func $~lib/rt/tlsf/prepareBlock (param $root i32) (param $block i32) (param $size i32)
  (local $blockInfo i32)
  (local $remaining i32)
  (local $spare i32)
  (local $block|6 i32)
  (local $block|7 i32)
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $blockInfo
  i32.const 1
  drop
  local.get $size
  i32.const 4
  i32.add
  i32.const 15
  i32.and
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 544
   i32.const 361
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $blockInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.get $size
  i32.sub
  local.set $remaining
  local.get $remaining
  i32.const 4
  i32.const 12
  i32.add
  i32.ge_u
  if
   local.get $block
   local.get $size
   local.get $blockInfo
   i32.const 2
   i32.and
   i32.or
   call $~lib/rt/common/BLOCK#set:mmInfo
   local.get $block
   i32.const 4
   i32.add
   local.get $size
   i32.add
   local.set $spare
   local.get $spare
   local.get $remaining
   i32.const 4
   i32.sub
   i32.const 1
   i32.or
   call $~lib/rt/common/BLOCK#set:mmInfo
   local.get $root
   local.get $spare
   call $~lib/rt/tlsf/insertBlock
  else
   local.get $block
   local.get $blockInfo
   i32.const 1
   i32.const -1
   i32.xor
   i32.and
   call $~lib/rt/common/BLOCK#set:mmInfo
   block $~lib/rt/tlsf/GETRIGHT|inlined.3 (result i32)
    local.get $block
    local.set $block|7
    local.get $block|7
    i32.const 4
    i32.add
    local.get $block|7
    call $~lib/rt/common/BLOCK#get:mmInfo
    i32.const 3
    i32.const -1
    i32.xor
    i32.and
    i32.add
    br $~lib/rt/tlsf/GETRIGHT|inlined.3
   end
   block $~lib/rt/tlsf/GETRIGHT|inlined.2 (result i32)
    local.get $block
    local.set $block|6
    local.get $block|6
    i32.const 4
    i32.add
    local.get $block|6
    call $~lib/rt/common/BLOCK#get:mmInfo
    i32.const 3
    i32.const -1
    i32.xor
    i32.and
    i32.add
    br $~lib/rt/tlsf/GETRIGHT|inlined.2
   end
   call $~lib/rt/common/BLOCK#get:mmInfo
   i32.const 2
   i32.const -1
   i32.xor
   i32.and
   call $~lib/rt/common/BLOCK#set:mmInfo
  end
 )
 (func $~lib/rt/tlsf/allocateBlock (param $root i32) (param $size i32) (result i32)
  (local $payloadSize i32)
  (local $block i32)
  local.get $size
  call $~lib/rt/tlsf/prepareSize
  local.set $payloadSize
  local.get $root
  local.get $payloadSize
  call $~lib/rt/tlsf/searchBlock
  local.set $block
  local.get $block
  i32.eqz
  if
   local.get $root
   local.get $payloadSize
   call $~lib/rt/tlsf/growMemory
   local.get $root
   local.get $payloadSize
   call $~lib/rt/tlsf/searchBlock
   local.set $block
   i32.const 1
   drop
   local.get $block
   i32.eqz
   if
    i32.const 0
    i32.const 544
    i32.const 499
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
  end
  i32.const 1
  drop
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.get $payloadSize
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 544
   i32.const 501
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $root
  local.get $block
  call $~lib/rt/tlsf/removeBlock
  local.get $root
  local.get $block
  local.get $payloadSize
  call $~lib/rt/tlsf/prepareBlock
  i32.const 0
  drop
  local.get $block
  return
 )
 (func $~lib/rt/tlsf/__alloc (param $size i32) (result i32)
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   call $~lib/rt/tlsf/initialize
  end
  global.get $~lib/rt/tlsf/ROOT
  local.get $size
  call $~lib/rt/tlsf/allocateBlock
  i32.const 4
  i32.add
  return
 )
 (func $~lib/rt/tcms/Object#set:rtId (param $this i32) (param $rtId i32)
  local.get $this
  local.get $rtId
  i32.store offset=12
 )
 (func $~lib/rt/tcms/Object#set:rtSize (param $this i32) (param $rtSize i32)
  local.get $this
  local.get $rtSize
  i32.store offset=16
 )
 (func $~lib/rt/tcms/Object#set:nextWithColor (param $this i32) (param $nextWithColor i32)
  local.get $this
  local.get $nextWithColor
  i32.store offset=4
 )
 (func $~lib/rt/tcms/Object#set:prev (param $this i32) (param $prev i32)
  local.get $this
  local.get $prev
  i32.store offset=8
 )
 (func $~lib/rt/tcms/initLazy (param $space i32) (result i32)
  local.get $space
  local.get $space
  call $~lib/rt/tcms/Object#set:nextWithColor
  local.get $space
  local.get $space
  call $~lib/rt/tcms/Object#set:prev
  local.get $space
  return
 )
 (func $~lib/rt/tcms/Object#get:prev (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $~lib/rt/tcms/Object#get:nextWithColor (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/rt/tcms/Object#set:next (param $this i32) (param $obj i32)
  local.get $this
  local.get $obj
  local.get $this
  call $~lib/rt/tcms/Object#get:nextWithColor
  i32.const 3
  i32.and
  i32.or
  call $~lib/rt/tcms/Object#set:nextWithColor
 )
 (func $~lib/rt/tcms/Object#linkTo (param $this i32) (param $list i32) (param $withColor i32)
  (local $prev i32)
  local.get $list
  call $~lib/rt/tcms/Object#get:prev
  local.set $prev
  local.get $this
  local.get $list
  local.get $withColor
  i32.or
  call $~lib/rt/tcms/Object#set:nextWithColor
  local.get $this
  local.get $prev
  call $~lib/rt/tcms/Object#set:prev
  local.get $prev
  local.get $this
  call $~lib/rt/tcms/Object#set:next
  local.get $list
  local.get $this
  call $~lib/rt/tcms/Object#set:prev
 )
 (func $~lib/rt/tcms/Object#get:size (param $this i32) (result i32)
  i32.const 4
  local.get $this
  call $~lib/rt/common/BLOCK#get:mmInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  i32.add
  return
 )
 (func $~lib/rt/tcms/__new (param $size i32) (param $id i32) (result i32)
  (local $obj i32)
  local.get $size
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 416
   i32.const 480
   i32.const 125
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 16
  local.get $size
  i32.add
  call $~lib/rt/tlsf/__alloc
  i32.const 4
  i32.sub
  local.set $obj
  local.get $obj
  local.get $id
  call $~lib/rt/tcms/Object#set:rtId
  local.get $obj
  local.get $size
  call $~lib/rt/tcms/Object#set:rtSize
  local.get $obj
  global.get $~lib/rt/tcms/fromSpace
  global.get $~lib/rt/tcms/white
  call $~lib/rt/tcms/Object#linkTo
  global.get $~lib/rt/tcms/total
  local.get $obj
  call $~lib/rt/tcms/Object#get:size
  i32.add
  global.set $~lib/rt/tcms/total
  local.get $obj
  i32.const 20
  i32.add
  return
 )
 (func $~lib/rt/tcms/__link (param $parentPtr i32) (param $childPtr i32) (param $expectMultiple i32)
 )
 (func $~lib/array/Array<f64>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/tcms/__link
 )
 (func $~lib/array/Array<f64>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<f64>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<f64>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<f64>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 4
   call $~lib/rt/tcms/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<f64>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<f64>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<f64>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<f64>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 3
  i32.shr_u
  i32.gt_u
  if
   i32.const 368
   i32.const 96
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 3
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/tcms/__new
  local.set $buffer
  i32.const 1
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<f64>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<f64>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<f64>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<f64>#set:length_
  local.get $this
 )
 (func $~lib/array/Array<f64>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<f64>#__get (param $this i32) (param $index i32) (result f64)
  (local $value f64)
  local.get $index
  local.get $this
  call $~lib/array/Array<f64>#get:length_
  i32.ge_u
  if
   i32.const 32
   i32.const 96
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  call $~lib/array/Array<f64>#get:dataStart
  local.get $index
  i32.const 3
  i32.shl
  i32.add
  f64.load
  local.set $value
  i32.const 0
  drop
  local.get $value
  return
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:byteLength (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/rt/tcms/Object#get:rtId (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/rt/tcms/Object#get:rtSize (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $~lib/rt/tlsf/checkUsedBlock (param $ptr i32) (result i32)
  (local $block i32)
  local.get $ptr
  i32.const 4
  i32.sub
  local.set $block
  local.get $ptr
  i32.const 0
  i32.ne
  if (result i32)
   local.get $ptr
   i32.const 15
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  if (result i32)
   local.get $block
   call $~lib/rt/common/BLOCK#get:mmInfo
   i32.const 1
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 544
   i32.const 562
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  local.get $block
  return
 )
 (func $~lib/rt/tlsf/freeBlock (param $root i32) (param $block i32)
  i32.const 0
  drop
  local.get $block
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  i32.const 1
  i32.or
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $root
  local.get $block
  call $~lib/rt/tlsf/insertBlock
 )
 (func $~lib/rt/tlsf/moveBlock (param $root i32) (param $block i32) (param $newSize i32) (result i32)
  (local $newBlock i32)
  local.get $root
  local.get $newSize
  call $~lib/rt/tlsf/allocateBlock
  local.set $newBlock
  local.get $newBlock
  i32.const 4
  i32.add
  local.get $block
  i32.const 4
  i32.add
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  memory.copy
  local.get $block
  global.get $~lib/memory/__heap_base
  i32.ge_u
  if
   i32.const 0
   drop
   local.get $root
   local.get $block
   call $~lib/rt/tlsf/freeBlock
  end
  local.get $newBlock
  return
 )
 (func $~lib/rt/tlsf/reallocateBlock (param $root i32) (param $block i32) (param $size i32) (result i32)
  (local $payloadSize i32)
  (local $blockInfo i32)
  (local $blockSize i32)
  (local $block|6 i32)
  (local $right i32)
  (local $rightInfo i32)
  (local $mergeSize i32)
  local.get $size
  call $~lib/rt/tlsf/prepareSize
  local.set $payloadSize
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $blockInfo
  local.get $blockInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.set $blockSize
  local.get $payloadSize
  local.get $blockSize
  i32.le_u
  if
   local.get $root
   local.get $block
   local.get $payloadSize
   call $~lib/rt/tlsf/prepareBlock
   i32.const 0
   drop
   local.get $block
   return
  end
  block $~lib/rt/tlsf/GETRIGHT|inlined.4 (result i32)
   local.get $block
   local.set $block|6
   local.get $block|6
   i32.const 4
   i32.add
   local.get $block|6
   call $~lib/rt/common/BLOCK#get:mmInfo
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   br $~lib/rt/tlsf/GETRIGHT|inlined.4
  end
  local.set $right
  local.get $right
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $rightInfo
  local.get $rightInfo
  i32.const 1
  i32.and
  if
   local.get $blockSize
   i32.const 4
   i32.add
   local.get $rightInfo
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.set $mergeSize
   local.get $mergeSize
   local.get $payloadSize
   i32.ge_u
   if
    local.get $root
    local.get $right
    call $~lib/rt/tlsf/removeBlock
    local.get $block
    local.get $blockInfo
    i32.const 3
    i32.and
    local.get $mergeSize
    i32.or
    call $~lib/rt/common/BLOCK#set:mmInfo
    local.get $root
    local.get $block
    local.get $payloadSize
    call $~lib/rt/tlsf/prepareBlock
    i32.const 0
    drop
    local.get $block
    return
   end
  end
  local.get $root
  local.get $block
  local.get $size
  call $~lib/rt/tlsf/moveBlock
  return
 )
 (func $~lib/rt/tlsf/__realloc (param $ptr i32) (param $size i32) (result i32)
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   call $~lib/rt/tlsf/initialize
  end
  local.get $ptr
  global.get $~lib/memory/__heap_base
  i32.lt_u
  if (result i32)
   global.get $~lib/rt/tlsf/ROOT
   local.get $ptr
   call $~lib/rt/tlsf/checkUsedBlock
   local.get $size
   call $~lib/rt/tlsf/moveBlock
  else
   global.get $~lib/rt/tlsf/ROOT
   local.get $ptr
   call $~lib/rt/tlsf/checkUsedBlock
   local.get $size
   call $~lib/rt/tlsf/reallocateBlock
  end
  i32.const 4
  i32.add
  return
 )
 (func $~lib/rt/tcms/Object#get:next (param $this i32) (result i32)
  local.get $this
  call $~lib/rt/tcms/Object#get:nextWithColor
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  return
 )
 (func $~lib/rt/tcms/__renew (param $oldPtr i32) (param $size i32) (result i32)
  (local $oldObj i32)
  (local $newPtr i32)
  (local $4 i32)
  (local $5 i32)
  (local $newPtr|6 i32)
  (local $newObj i32)
  local.get $oldPtr
  i32.const 20
  i32.sub
  local.set $oldObj
  local.get $oldPtr
  global.get $~lib/memory/__heap_base
  i32.lt_u
  if
   local.get $size
   local.get $oldObj
   call $~lib/rt/tcms/Object#get:rtId
   call $~lib/rt/tcms/__new
   local.set $newPtr
   local.get $newPtr
   local.get $oldPtr
   local.get $size
   local.tee $4
   local.get $oldObj
   call $~lib/rt/tcms/Object#get:rtSize
   local.tee $5
   local.get $4
   local.get $5
   i32.lt_u
   select
   memory.copy
   local.get $newPtr
   return
  end
  local.get $size
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 416
   i32.const 480
   i32.const 143
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/tcms/total
  local.get $oldObj
  call $~lib/rt/tcms/Object#get:size
  i32.sub
  global.set $~lib/rt/tcms/total
  local.get $oldPtr
  i32.const 16
  i32.sub
  i32.const 16
  local.get $size
  i32.add
  call $~lib/rt/tlsf/__realloc
  i32.const 16
  i32.add
  local.set $newPtr|6
  local.get $newPtr|6
  i32.const 20
  i32.sub
  local.set $newObj
  local.get $newObj
  local.get $size
  call $~lib/rt/tcms/Object#set:rtSize
  local.get $newObj
  call $~lib/rt/tcms/Object#get:next
  local.get $newObj
  call $~lib/rt/tcms/Object#set:prev
  local.get $newObj
  call $~lib/rt/tcms/Object#get:prev
  local.get $newObj
  call $~lib/rt/tcms/Object#set:next
  global.get $~lib/rt/tcms/total
  local.get $newObj
  call $~lib/rt/tcms/Object#get:size
  i32.add
  global.set $~lib/rt/tcms/total
  local.get $newPtr|6
  return
 )
 (func $~lib/array/ensureCapacity (param $array i32) (param $newSize i32) (param $alignLog2 i32) (param $canGrow i32)
  (local $oldCapacity i32)
  (local $oldData i32)
  (local $6 i32)
  (local $7 i32)
  (local $newCapacity i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $newData i32)
  local.get $array
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  local.set $oldCapacity
  local.get $newSize
  local.get $oldCapacity
  local.get $alignLog2
  i32.shr_u
  i32.gt_u
  if
   local.get $newSize
   i32.const 1073741820
   local.get $alignLog2
   i32.shr_u
   i32.gt_u
   if
    i32.const 368
    i32.const 96
    i32.const 19
    i32.const 48
    call $~lib/builtins/abort
    unreachable
   end
   local.get $array
   call $~lib/arraybuffer/ArrayBufferView#get:buffer
   local.set $oldData
   local.get $newSize
   local.tee $6
   i32.const 8
   local.tee $7
   local.get $6
   local.get $7
   i32.gt_u
   select
   local.get $alignLog2
   i32.shl
   local.set $newCapacity
   local.get $canGrow
   if
    local.get $oldCapacity
    i32.const 1
    i32.shl
    local.tee $9
    i32.const 1073741820
    local.tee $10
    local.get $9
    local.get $10
    i32.lt_u
    select
    local.tee $11
    local.get $newCapacity
    local.tee $12
    local.get $11
    local.get $12
    i32.gt_u
    select
    local.set $newCapacity
   end
   local.get $oldData
   local.get $newCapacity
   call $~lib/rt/tcms/__renew
   local.set $newData
   i32.const 1
   global.get $~lib/shared/runtime/Runtime.Incremental
   i32.ne
   drop
   local.get $newData
   local.get $oldCapacity
   i32.add
   i32.const 0
   local.get $newCapacity
   local.get $oldCapacity
   i32.sub
   memory.fill
   local.get $newData
   local.get $oldData
   i32.ne
   if
    local.get $array
    local.get $newData
    i32.store
    local.get $array
    local.get $newData
    i32.store offset=4
    local.get $array
    local.get $newData
    i32.const 0
    call $~lib/rt/tcms/__link
   end
   local.get $array
   local.get $newCapacity
   i32.store offset=8
  end
 )
 (func $~lib/array/Array<f64>#__set (param $this i32) (param $index i32) (param $value f64)
  local.get $index
  local.get $this
  call $~lib/array/Array<f64>#get:length_
  i32.ge_u
  if
   local.get $index
   i32.const 0
   i32.lt_s
   if
    i32.const 32
    i32.const 96
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   i32.const 3
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   call $~lib/array/Array<f64>#set:length_
  end
  local.get $this
  call $~lib/array/Array<f64>#get:dataStart
  local.get $index
  i32.const 3
  i32.shl
  i32.add
  local.get $value
  f64.store
  i32.const 0
  drop
 )
 (func $src/mm/flatten (param $m i32) (result i32)
  (local $rows i32)
  (local $cols i32)
  (local $out i32)
  (local $i i32)
  (local $row i32)
  (local $j i32)
  local.get $m
  call $~lib/array/Array<~lib/array/Array<f64>>#get:length
  local.set $rows
  local.get $rows
  i32.const 0
  i32.gt_s
  if (result i32)
   local.get $m
   i32.const 0
   call $~lib/array/Array<~lib/array/Array<f64>>#__get
   call $~lib/array/Array<f64>#get:length
  else
   i32.const 0
  end
  local.set $cols
  i32.const 0
  local.get $rows
  local.get $cols
  i32.mul
  call $~lib/array/Array<f64>#constructor
  local.set $out
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $rows
   i32.lt_s
   if
    local.get $m
    local.get $i
    call $~lib/array/Array<~lib/array/Array<f64>>#__get
    local.set $row
    i32.const 0
    local.set $j
    loop $for-loop|1
     local.get $j
     local.get $cols
     i32.lt_s
     if
      local.get $out
      local.get $i
      local.get $cols
      i32.mul
      local.get $j
      i32.add
      local.get $row
      local.get $j
      call $~lib/array/Array<f64>#__get
      call $~lib/array/Array<f64>#__set
      local.get $j
      i32.const 1
      i32.add
      local.set $j
      br $for-loop|1
     end
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $out
  return
 )
 (func $~lib/array/Array<f64>#__uget (param $this i32) (param $index i32) (result f64)
  local.get $this
  call $~lib/array/Array<f64>#get:dataStart
  local.get $index
  i32.const 3
  i32.shl
  i32.add
  f64.load
  return
 )
 (func $src/mm/copyFlat (param $a i32) (result i32)
  (local $out i32)
  (local $i i32)
  i32.const 0
  local.get $a
  call $~lib/array/Array<f64>#get:length
  call $~lib/array/Array<f64>#constructor
  local.set $out
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $a
   call $~lib/array/Array<f64>#get:length
   i32.lt_s
   if
    local.get $out
    local.get $i
    local.get $a
    local.get $i
    call $~lib/array/Array<f64>#__uget
    call $~lib/array/Array<f64>#__set
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $out
  return
 )
 (func $src/mm/zeros (param $n i32) (result i32)
  (local $out i32)
  (local $i i32)
  i32.const 0
  local.get $n
  call $~lib/array/Array<f64>#constructor
  local.set $out
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $n
   i32.lt_s
   if
    local.get $out
    local.get $i
    f64.const 0
    call $~lib/array/Array<f64>#__set
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $out
  return
 )
 (func $src/svd/pythag (param $a f64) (param $b f64) (param $epsilon f64) (result f64)
  (local $absA f64)
  (local $absB f64)
  (local $x f64)
  (local $x|6 f64)
  local.get $a
  f64.const 0
  f64.lt
  if (result f64)
   local.get $a
   f64.neg
  else
   local.get $a
  end
  local.set $absA
  local.get $b
  f64.const 0
  f64.lt
  if (result f64)
   local.get $b
   f64.neg
  else
   local.get $b
  end
  local.set $absB
  local.get $absA
  local.get $absB
  f64.gt
  if
   local.get $absA
   block $~lib/math/NativeMath.sqrt|inlined.3 (result f64)
    f64.const 1
    local.get $b
    local.get $b
    f64.mul
    local.get $a
    f64.div
    local.get $a
    f64.div
    f64.add
    local.set $x
    local.get $x
    f64.sqrt
    br $~lib/math/NativeMath.sqrt|inlined.3
   end
   f64.mul
   return
  else
   local.get $absB
   local.get $epsilon
   f64.le
   if
    local.get $absA
    return
   end
  end
  local.get $absB
  block $~lib/math/NativeMath.sqrt|inlined.4 (result f64)
   f64.const 1
   local.get $a
   local.get $a
   f64.mul
   local.get $b
   f64.div
   local.get $b
   f64.div
   f64.add
   local.set $x|6
   local.get $x|6
   f64.sqrt
   br $~lib/math/NativeMath.sqrt|inlined.4
  end
  f64.mul
  return
 )
 (func $src/svd/FlatSVD#set:U (param $this i32) (param $U i32)
  local.get $this
  local.get $U
  i32.store
  local.get $this
  local.get $U
  i32.const 0
  call $~lib/rt/tcms/__link
 )
 (func $src/svd/FlatSVD#set:S (param $this i32) (param $S i32)
  local.get $this
  local.get $S
  i32.store offset=4
  local.get $this
  local.get $S
  i32.const 0
  call $~lib/rt/tcms/__link
 )
 (func $src/svd/FlatSVD#set:V (param $this i32) (param $V i32)
  local.get $this
  local.get $V
  i32.store offset=8
  local.get $this
  local.get $V
  i32.const 0
  call $~lib/rt/tcms/__link
 )
 (func $~lib/object/Object#constructor (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/tcms/__new
   local.set $this
  end
  local.get $this
 )
 (func $src/svd/FlatSVD#constructor (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 12
   i32.const 7
   call $~lib/rt/tcms/__new
   local.set $this
  end
  local.get $this
  call $~lib/object/Object#constructor
  local.set $this
  local.get $this
  i32.const 0
  call $src/svd/FlatSVD#set:U
  local.get $this
  i32.const 0
  call $src/svd/FlatSVD#set:S
  local.get $this
  i32.const 0
  call $src/svd/FlatSVD#set:V
  local.get $this
 )
 (func $src/svd/svdFlat (param $A i32) (param $m i32) (param $n i32) (result i32)
  (local $temp f64)
  (local $prec f64)
  (local $p i32)
  (local $tolerance f64)
  (local $c f64)
  (local $i i32)
  (local $j i32)
  (local $k i32)
  (local $l i32)
  (local $u i32)
  (local $e i32)
  (local $q i32)
  (local $v i32)
  (local $epsilon f64)
  (local $f f64)
  (local $g f64)
  (local $h f64)
  (local $x f64)
  (local $y f64)
  (local $z f64)
  (local $s f64)
  (local $x|24 f64)
  (local $x|25 f64)
  (local $iteration i32)
  (local $test_convergence i32)
  (local $l1 i32)
  (local $29 i32)
  f64.const 0
  local.set $temp
  f64.const 1
  local.set $prec
  i32.const 0
  local.set $p
  loop $for-loop|0
   local.get $p
   i32.const 52
   i32.lt_s
   if
    local.get $prec
    f64.const 0.5
    f64.mul
    local.set $prec
    local.get $p
    i32.const 1
    i32.add
    local.set $p
    br $for-loop|0
   end
  end
  f64.const 1e-64
  local.get $prec
  f64.div
  local.set $tolerance
  f64.const 0
  local.set $c
  i32.const 0
  local.set $i
  i32.const 0
  local.set $j
  i32.const 0
  local.set $k
  i32.const 0
  local.set $l
  local.get $A
  call $src/mm/copyFlat
  local.set $u
  local.get $n
  call $src/mm/zeros
  local.set $e
  local.get $n
  call $src/mm/zeros
  local.set $q
  local.get $n
  local.get $n
  i32.mul
  call $src/mm/zeros
  local.set $v
  local.get $tolerance
  local.set $epsilon
  f64.const 0
  local.set $f
  f64.const 0
  local.set $g
  f64.const 0
  local.set $h
  f64.const 0
  local.set $x
  f64.const 0
  local.set $y
  f64.const 0
  local.set $z
  f64.const 0
  local.set $s
  i32.const 0
  local.set $i
  loop $for-loop|1
   local.get $i
   local.get $n
   i32.lt_s
   if
    local.get $e
    local.get $i
    local.get $g
    call $~lib/array/Array<f64>#__set
    f64.const 0
    local.set $s
    local.get $i
    i32.const 1
    i32.add
    local.set $l
    local.get $i
    local.set $j
    loop $for-loop|2
     local.get $j
     local.get $m
     i32.lt_s
     if
      local.get $s
      local.get $u
      local.get $j
      local.get $n
      i32.mul
      local.get $i
      i32.add
      call $~lib/array/Array<f64>#__uget
      local.get $u
      local.get $j
      local.get $n
      i32.mul
      local.get $i
      i32.add
      call $~lib/array/Array<f64>#__uget
      f64.mul
      f64.add
      local.set $s
      local.get $j
      i32.const 1
      i32.add
      local.set $j
      br $for-loop|2
     end
    end
    local.get $s
    local.get $tolerance
    f64.le
    if
     f64.const 0
     local.set $g
    else
     local.get $u
     local.get $i
     local.get $n
     i32.mul
     local.get $i
     i32.add
     call $~lib/array/Array<f64>#__uget
     local.set $f
     block $~lib/math/NativeMath.sqrt|inlined.1 (result f64)
      local.get $s
      local.set $x|24
      local.get $x|24
      f64.sqrt
      br $~lib/math/NativeMath.sqrt|inlined.1
     end
     local.set $g
     local.get $f
     local.get $epsilon
     f64.gt
     if
      local.get $g
      f64.neg
      local.set $g
     end
     local.get $f
     local.get $g
     f64.mul
     local.get $s
     f64.sub
     local.set $h
     local.get $u
     local.get $i
     local.get $n
     i32.mul
     local.get $i
     i32.add
     local.get $f
     local.get $g
     f64.sub
     call $~lib/array/Array<f64>#__set
     local.get $l
     local.set $j
     loop $for-loop|3
      local.get $j
      local.get $n
      i32.lt_s
      if
       f64.const 0
       local.set $s
       local.get $i
       local.set $k
       loop $for-loop|4
        local.get $k
        local.get $m
        i32.lt_s
        if
         local.get $s
         local.get $u
         local.get $k
         local.get $n
         i32.mul
         local.get $i
         i32.add
         call $~lib/array/Array<f64>#__uget
         local.get $u
         local.get $k
         local.get $n
         i32.mul
         local.get $j
         i32.add
         call $~lib/array/Array<f64>#__uget
         f64.mul
         f64.add
         local.set $s
         local.get $k
         i32.const 1
         i32.add
         local.set $k
         br $for-loop|4
        end
       end
       local.get $s
       local.get $h
       f64.div
       local.set $f
       local.get $i
       local.set $k
       loop $for-loop|5
        local.get $k
        local.get $m
        i32.lt_s
        if
         local.get $u
         local.get $k
         local.get $n
         i32.mul
         local.get $j
         i32.add
         local.get $u
         local.get $k
         local.get $n
         i32.mul
         local.get $j
         i32.add
         call $~lib/array/Array<f64>#__uget
         local.get $f
         local.get $u
         local.get $k
         local.get $n
         i32.mul
         local.get $i
         i32.add
         call $~lib/array/Array<f64>#__uget
         f64.mul
         f64.add
         call $~lib/array/Array<f64>#__set
         local.get $k
         i32.const 1
         i32.add
         local.set $k
         br $for-loop|5
        end
       end
       local.get $j
       i32.const 1
       i32.add
       local.set $j
       br $for-loop|3
      end
     end
    end
    local.get $q
    local.get $i
    local.get $g
    call $~lib/array/Array<f64>#__set
    f64.const 0
    local.set $s
    local.get $l
    local.set $j
    loop $for-loop|6
     local.get $j
     local.get $n
     i32.lt_s
     if
      local.get $s
      local.get $u
      local.get $i
      local.get $n
      i32.mul
      local.get $j
      i32.add
      call $~lib/array/Array<f64>#__uget
      local.get $u
      local.get $i
      local.get $n
      i32.mul
      local.get $j
      i32.add
      call $~lib/array/Array<f64>#__uget
      f64.mul
      f64.add
      local.set $s
      local.get $j
      i32.const 1
      i32.add
      local.set $j
      br $for-loop|6
     end
    end
    local.get $s
    local.get $tolerance
    f64.le
    if
     f64.const 0
     local.set $g
    else
     local.get $u
     local.get $i
     local.get $n
     i32.mul
     local.get $i
     i32.add
     i32.const 1
     i32.add
     call $~lib/array/Array<f64>#__uget
     local.set $f
     block $~lib/math/NativeMath.sqrt|inlined.2 (result f64)
      local.get $s
      local.set $x|25
      local.get $x|25
      f64.sqrt
      br $~lib/math/NativeMath.sqrt|inlined.2
     end
     local.set $g
     local.get $f
     local.get $epsilon
     f64.gt
     if
      local.get $g
      f64.neg
      local.set $g
     end
     local.get $f
     local.get $g
     f64.mul
     local.get $s
     f64.sub
     local.set $h
     local.get $u
     local.get $i
     local.get $n
     i32.mul
     local.get $i
     i32.add
     i32.const 1
     i32.add
     local.get $f
     local.get $g
     f64.sub
     call $~lib/array/Array<f64>#__set
     local.get $l
     local.set $j
     loop $for-loop|7
      local.get $j
      local.get $n
      i32.lt_s
      if
       local.get $e
       local.get $j
       local.get $u
       local.get $i
       local.get $n
       i32.mul
       local.get $j
       i32.add
       call $~lib/array/Array<f64>#__uget
       local.get $h
       f64.div
       call $~lib/array/Array<f64>#__set
       local.get $j
       i32.const 1
       i32.add
       local.set $j
       br $for-loop|7
      end
     end
     local.get $l
     local.set $j
     loop $for-loop|8
      local.get $j
      local.get $m
      i32.lt_s
      if
       f64.const 0
       local.set $s
       local.get $l
       local.set $k
       loop $for-loop|9
        local.get $k
        local.get $n
        i32.lt_s
        if
         local.get $s
         local.get $u
         local.get $j
         local.get $n
         i32.mul
         local.get $k
         i32.add
         call $~lib/array/Array<f64>#__uget
         local.get $u
         local.get $i
         local.get $n
         i32.mul
         local.get $k
         i32.add
         call $~lib/array/Array<f64>#__uget
         f64.mul
         f64.add
         local.set $s
         local.get $k
         i32.const 1
         i32.add
         local.set $k
         br $for-loop|9
        end
       end
       local.get $l
       local.set $k
       loop $for-loop|10
        local.get $k
        local.get $n
        i32.lt_s
        if
         local.get $u
         local.get $j
         local.get $n
         i32.mul
         local.get $k
         i32.add
         local.get $u
         local.get $j
         local.get $n
         i32.mul
         local.get $k
         i32.add
         call $~lib/array/Array<f64>#__uget
         local.get $s
         local.get $e
         local.get $k
         call $~lib/array/Array<f64>#__uget
         f64.mul
         f64.add
         call $~lib/array/Array<f64>#__set
         local.get $k
         i32.const 1
         i32.add
         local.set $k
         br $for-loop|10
        end
       end
       local.get $j
       i32.const 1
       i32.add
       local.set $j
       br $for-loop|8
      end
     end
    end
    local.get $q
    local.get $i
    call $~lib/array/Array<f64>#__get
    f64.const 0
    f64.lt
    if (result f64)
     local.get $q
     local.get $i
     call $~lib/array/Array<f64>#__get
     f64.neg
    else
     local.get $q
     local.get $i
     call $~lib/array/Array<f64>#__get
    end
    local.get $e
    local.get $i
    call $~lib/array/Array<f64>#__get
    f64.const 0
    f64.lt
    if (result f64)
     local.get $e
     local.get $i
     call $~lib/array/Array<f64>#__get
     f64.neg
    else
     local.get $e
     local.get $i
     call $~lib/array/Array<f64>#__get
    end
    f64.add
    local.set $y
    local.get $y
    local.get $x
    f64.gt
    if
     local.get $y
     local.set $x
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|1
   end
  end
  local.get $n
  i32.const 1
  i32.sub
  local.set $i
  loop $for-loop|11
   local.get $i
   i32.const 0
   i32.ge_s
   if
    local.get $g
    f64.const 0
    f64.lt
    if (result f64)
     local.get $g
     f64.neg
    else
     local.get $g
    end
    local.get $epsilon
    f64.gt
    if
     local.get $g
     local.get $u
     local.get $i
     local.get $n
     i32.mul
     local.get $i
     i32.add
     i32.const 1
     i32.add
     call $~lib/array/Array<f64>#__uget
     f64.mul
     local.set $h
     local.get $l
     local.set $j
     loop $for-loop|12
      local.get $j
      local.get $n
      i32.lt_s
      if
       local.get $v
       local.get $j
       local.get $n
       i32.mul
       local.get $i
       i32.add
       local.get $u
       local.get $i
       local.get $n
       i32.mul
       local.get $j
       i32.add
       call $~lib/array/Array<f64>#__uget
       local.get $h
       f64.div
       call $~lib/array/Array<f64>#__set
       local.get $j
       i32.const 1
       i32.add
       local.set $j
       br $for-loop|12
      end
     end
     local.get $l
     local.set $j
     loop $for-loop|13
      local.get $j
      local.get $n
      i32.lt_s
      if
       f64.const 0
       local.set $s
       local.get $l
       local.set $k
       loop $for-loop|14
        local.get $k
        local.get $n
        i32.lt_s
        if
         local.get $s
         local.get $u
         local.get $i
         local.get $n
         i32.mul
         local.get $k
         i32.add
         call $~lib/array/Array<f64>#__uget
         local.get $v
         local.get $k
         local.get $n
         i32.mul
         local.get $j
         i32.add
         call $~lib/array/Array<f64>#__uget
         f64.mul
         f64.add
         local.set $s
         local.get $k
         i32.const 1
         i32.add
         local.set $k
         br $for-loop|14
        end
       end
       local.get $l
       local.set $k
       loop $for-loop|15
        local.get $k
        local.get $n
        i32.lt_s
        if
         local.get $v
         local.get $k
         local.get $n
         i32.mul
         local.get $j
         i32.add
         local.get $v
         local.get $k
         local.get $n
         i32.mul
         local.get $j
         i32.add
         call $~lib/array/Array<f64>#__uget
         local.get $s
         local.get $v
         local.get $k
         local.get $n
         i32.mul
         local.get $i
         i32.add
         call $~lib/array/Array<f64>#__uget
         f64.mul
         f64.add
         call $~lib/array/Array<f64>#__set
         local.get $k
         i32.const 1
         i32.add
         local.set $k
         br $for-loop|15
        end
       end
       local.get $j
       i32.const 1
       i32.add
       local.set $j
       br $for-loop|13
      end
     end
    end
    local.get $l
    local.set $j
    loop $for-loop|16
     local.get $j
     local.get $n
     i32.lt_s
     if
      local.get $v
      local.get $i
      local.get $n
      i32.mul
      local.get $j
      i32.add
      f64.const 0
      call $~lib/array/Array<f64>#__set
      local.get $v
      local.get $j
      local.get $n
      i32.mul
      local.get $i
      i32.add
      f64.const 0
      call $~lib/array/Array<f64>#__set
      local.get $j
      i32.const 1
      i32.add
      local.set $j
      br $for-loop|16
     end
    end
    local.get $v
    local.get $i
    local.get $n
    i32.mul
    local.get $i
    i32.add
    f64.const 1
    call $~lib/array/Array<f64>#__set
    local.get $e
    local.get $i
    call $~lib/array/Array<f64>#__get
    local.set $g
    local.get $i
    local.set $l
    local.get $i
    i32.const 1
    i32.sub
    local.set $i
    br $for-loop|11
   end
  end
  local.get $n
  i32.const 1
  i32.sub
  local.set $i
  loop $for-loop|17
   local.get $i
   i32.const 0
   i32.ge_s
   if
    local.get $i
    i32.const 1
    i32.add
    local.set $l
    local.get $q
    local.get $i
    call $~lib/array/Array<f64>#__get
    local.set $g
    local.get $l
    local.set $j
    loop $for-loop|18
     local.get $j
     local.get $n
     i32.lt_s
     if
      local.get $u
      local.get $i
      local.get $n
      i32.mul
      local.get $j
      i32.add
      f64.const 0
      call $~lib/array/Array<f64>#__set
      local.get $j
      i32.const 1
      i32.add
      local.set $j
      br $for-loop|18
     end
    end
    local.get $g
    f64.const 0
    f64.lt
    if (result f64)
     local.get $g
     f64.neg
    else
     local.get $g
    end
    local.get $epsilon
    f64.gt
    if
     local.get $u
     local.get $i
     local.get $n
     i32.mul
     local.get $i
     i32.add
     call $~lib/array/Array<f64>#__uget
     local.get $g
     f64.mul
     local.set $h
     local.get $l
     local.set $j
     loop $for-loop|19
      local.get $j
      local.get $n
      i32.lt_s
      if
       f64.const 0
       local.set $s
       local.get $l
       local.set $k
       loop $for-loop|20
        local.get $k
        local.get $m
        i32.lt_s
        if
         local.get $s
         local.get $u
         local.get $k
         local.get $n
         i32.mul
         local.get $i
         i32.add
         call $~lib/array/Array<f64>#__uget
         local.get $u
         local.get $k
         local.get $n
         i32.mul
         local.get $j
         i32.add
         call $~lib/array/Array<f64>#__uget
         f64.mul
         f64.add
         local.set $s
         local.get $k
         i32.const 1
         i32.add
         local.set $k
         br $for-loop|20
        end
       end
       local.get $s
       local.get $h
       f64.div
       local.set $f
       local.get $i
       local.set $k
       loop $for-loop|21
        local.get $k
        local.get $m
        i32.lt_s
        if
         local.get $u
         local.get $k
         local.get $n
         i32.mul
         local.get $j
         i32.add
         local.get $u
         local.get $k
         local.get $n
         i32.mul
         local.get $j
         i32.add
         call $~lib/array/Array<f64>#__uget
         local.get $f
         local.get $u
         local.get $k
         local.get $n
         i32.mul
         local.get $i
         i32.add
         call $~lib/array/Array<f64>#__uget
         f64.mul
         f64.add
         call $~lib/array/Array<f64>#__set
         local.get $k
         i32.const 1
         i32.add
         local.set $k
         br $for-loop|21
        end
       end
       local.get $j
       i32.const 1
       i32.add
       local.set $j
       br $for-loop|19
      end
     end
     local.get $i
     local.set $j
     loop $for-loop|22
      local.get $j
      local.get $m
      i32.lt_s
      if
       local.get $u
       local.get $j
       local.get $n
       i32.mul
       local.get $i
       i32.add
       local.get $u
       local.get $j
       local.get $n
       i32.mul
       local.get $i
       i32.add
       call $~lib/array/Array<f64>#__uget
       local.get $g
       f64.div
       call $~lib/array/Array<f64>#__set
       local.get $j
       i32.const 1
       i32.add
       local.set $j
       br $for-loop|22
      end
     end
    else
     local.get $i
     local.set $j
     loop $for-loop|23
      local.get $j
      local.get $m
      i32.lt_s
      if
       local.get $u
       local.get $j
       local.get $n
       i32.mul
       local.get $i
       i32.add
       f64.const 0
       call $~lib/array/Array<f64>#__set
       local.get $j
       i32.const 1
       i32.add
       local.set $j
       br $for-loop|23
      end
     end
    end
    local.get $u
    local.get $i
    local.get $n
    i32.mul
    local.get $i
    i32.add
    local.get $u
    local.get $i
    local.get $n
    i32.mul
    local.get $i
    i32.add
    call $~lib/array/Array<f64>#__uget
    f64.const 1
    f64.add
    call $~lib/array/Array<f64>#__set
    local.get $i
    i32.const 1
    i32.sub
    local.set $i
    br $for-loop|17
   end
  end
  local.get $prec
  local.get $x
  f64.mul
  local.set $prec
  local.get $n
  i32.const 1
  i32.sub
  local.set $k
  loop $for-loop|24
   local.get $k
   i32.const 0
   i32.ge_s
   if
    i32.const 0
    local.set $iteration
    block $for-break25
     loop $for-loop|25
      local.get $iteration
      i32.const 50
      i32.lt_s
      if
       i32.const 0
       local.set $test_convergence
       local.get $k
       local.set $l
       block $for-break26
        loop $for-loop|26
         local.get $l
         i32.const 0
         i32.ge_s
         if
          local.get $e
          local.get $l
          call $~lib/array/Array<f64>#__get
          f64.const 0
          f64.lt
          if (result f64)
           local.get $e
           local.get $l
           call $~lib/array/Array<f64>#__get
           f64.neg
          else
           local.get $e
           local.get $l
           call $~lib/array/Array<f64>#__get
          end
          local.get $prec
          f64.le
          if
           i32.const 1
           local.set $test_convergence
           br $for-break26
          end
          local.get $q
          local.get $l
          i32.const 1
          i32.sub
          call $~lib/array/Array<f64>#__get
          f64.const 0
          f64.lt
          if (result f64)
           local.get $q
           local.get $l
           i32.const 1
           i32.sub
           call $~lib/array/Array<f64>#__get
           f64.neg
          else
           local.get $q
           local.get $l
           i32.const 1
           i32.sub
           call $~lib/array/Array<f64>#__get
          end
          local.get $prec
          f64.le
          if
           br $for-break26
          end
          local.get $l
          i32.const 1
          i32.sub
          local.set $l
          br $for-loop|26
         end
        end
       end
       local.get $test_convergence
       i32.eqz
       if
        f64.const 0
        local.set $c
        f64.const 1
        local.set $s
        local.get $l
        i32.const 1
        i32.sub
        local.set $l1
        local.get $l
        local.set $i
        block $for-break27
         loop $for-loop|27
          local.get $i
          local.get $k
          i32.const 1
          i32.add
          i32.lt_s
          if
           local.get $s
           local.get $e
           local.get $i
           call $~lib/array/Array<f64>#__get
           f64.mul
           local.set $f
           local.get $e
           local.get $i
           local.get $c
           local.get $e
           local.get $i
           call $~lib/array/Array<f64>#__get
           f64.mul
           call $~lib/array/Array<f64>#__set
           local.get $f
           f64.const 0
           f64.lt
           if (result f64)
            local.get $f
            f64.neg
           else
            local.get $f
           end
           local.get $prec
           f64.le
           if
            br $for-break27
           end
           local.get $q
           local.get $i
           call $~lib/array/Array<f64>#__get
           local.set $g
           local.get $f
           local.get $g
           local.get $epsilon
           call $src/svd/pythag
           local.set $h
           local.get $q
           local.get $i
           local.get $h
           call $~lib/array/Array<f64>#__set
           local.get $g
           local.get $h
           f64.div
           local.set $c
           local.get $f
           f64.neg
           local.get $h
           f64.div
           local.set $s
           i32.const 0
           local.set $j
           loop $for-loop|28
            local.get $j
            local.get $m
            i32.lt_s
            if
             local.get $u
             local.get $j
             local.get $n
             i32.mul
             local.get $l1
             i32.add
             call $~lib/array/Array<f64>#__uget
             local.set $y
             local.get $u
             local.get $j
             local.get $n
             i32.mul
             local.get $i
             i32.add
             call $~lib/array/Array<f64>#__uget
             local.set $z
             local.get $u
             local.get $j
             local.get $n
             i32.mul
             local.get $l1
             i32.add
             local.get $y
             local.get $c
             f64.mul
             local.get $z
             local.get $s
             f64.mul
             f64.add
             call $~lib/array/Array<f64>#__set
             local.get $u
             local.get $j
             local.get $n
             i32.mul
             local.get $i
             i32.add
             local.get $y
             f64.neg
             local.get $s
             f64.mul
             local.get $z
             local.get $c
             f64.mul
             f64.add
             call $~lib/array/Array<f64>#__set
             local.get $j
             i32.const 1
             i32.add
             local.set $j
             br $for-loop|28
            end
           end
           local.get $i
           i32.const 1
           i32.add
           local.set $i
           br $for-loop|27
          end
         end
        end
       end
       local.get $q
       local.get $k
       call $~lib/array/Array<f64>#__get
       local.set $z
       local.get $l
       local.get $k
       i32.eq
       if
        local.get $z
        f64.const 0
        f64.lt
        if
         local.get $q
         local.get $k
         local.get $z
         f64.neg
         call $~lib/array/Array<f64>#__set
         i32.const 0
         local.set $j
         loop $for-loop|29
          local.get $j
          local.get $n
          i32.lt_s
          if
           local.get $v
           local.get $j
           local.get $n
           i32.mul
           local.get $k
           i32.add
           local.get $v
           local.get $j
           local.get $n
           i32.mul
           local.get $k
           i32.add
           call $~lib/array/Array<f64>#__uget
           f64.neg
           call $~lib/array/Array<f64>#__set
           local.get $j
           i32.const 1
           i32.add
           local.set $j
           br $for-loop|29
          end
         end
        end
        br $for-break25
       end
       local.get $iteration
       i32.const 50
       i32.const 1
       i32.sub
       i32.ge_s
       if
        i32.const 640
        i32.const 688
        i32.const 258
        i32.const 9
        call $~lib/builtins/abort
        unreachable
       end
       local.get $q
       local.get $l
       call $~lib/array/Array<f64>#__get
       local.set $x
       local.get $q
       local.get $k
       i32.const 1
       i32.sub
       call $~lib/array/Array<f64>#__get
       local.set $y
       local.get $e
       local.get $k
       i32.const 1
       i32.sub
       call $~lib/array/Array<f64>#__get
       local.set $g
       local.get $e
       local.get $k
       call $~lib/array/Array<f64>#__get
       local.set $h
       local.get $y
       local.get $z
       f64.sub
       local.get $y
       local.get $z
       f64.add
       f64.mul
       local.get $g
       local.get $h
       f64.sub
       local.get $g
       local.get $h
       f64.add
       f64.mul
       f64.add
       f64.const 2
       local.get $h
       f64.mul
       local.get $y
       f64.mul
       f64.div
       local.set $f
       local.get $f
       f64.const 1
       local.get $epsilon
       call $src/svd/pythag
       local.set $g
       local.get $f
       f64.const 0
       f64.lt
       if
        local.get $x
        local.get $z
        f64.sub
        local.get $x
        local.get $z
        f64.add
        f64.mul
        local.get $h
        local.get $y
        local.get $f
        local.get $g
        f64.sub
        f64.div
        local.get $h
        f64.sub
        f64.mul
        f64.add
        local.get $x
        f64.div
        local.set $f
       else
        local.get $x
        local.get $z
        f64.sub
        local.get $x
        local.get $z
        f64.add
        f64.mul
        local.get $h
        local.get $y
        local.get $f
        local.get $g
        f64.add
        f64.div
        local.get $h
        f64.sub
        f64.mul
        f64.add
        local.get $x
        f64.div
        local.set $f
       end
       f64.const 1
       local.set $c
       f64.const 1
       local.set $s
       local.get $l
       i32.const 1
       i32.add
       local.set $i
       loop $for-loop|30
        local.get $i
        local.get $k
        i32.const 1
        i32.add
        i32.lt_s
        if
         local.get $e
         local.get $i
         call $~lib/array/Array<f64>#__get
         local.set $g
         local.get $q
         local.get $i
         call $~lib/array/Array<f64>#__get
         local.set $y
         local.get $s
         local.get $g
         f64.mul
         local.set $h
         local.get $c
         local.get $g
         f64.mul
         local.set $g
         local.get $f
         local.get $h
         local.get $epsilon
         call $src/svd/pythag
         local.set $z
         local.get $e
         local.get $i
         i32.const 1
         i32.sub
         local.get $z
         call $~lib/array/Array<f64>#__set
         local.get $f
         local.get $z
         f64.div
         local.set $c
         local.get $h
         local.get $z
         f64.div
         local.set $s
         local.get $x
         local.get $c
         f64.mul
         local.get $g
         local.get $s
         f64.mul
         f64.add
         local.set $f
         local.get $x
         f64.neg
         local.get $s
         f64.mul
         local.get $g
         local.get $c
         f64.mul
         f64.add
         local.set $g
         local.get $y
         local.get $s
         f64.mul
         local.set $h
         local.get $y
         local.get $c
         f64.mul
         local.set $y
         i32.const 0
         local.set $j
         loop $for-loop|31
          local.get $j
          local.get $n
          i32.lt_s
          if
           local.get $v
           local.get $j
           local.get $n
           i32.mul
           local.get $i
           i32.add
           i32.const 1
           i32.sub
           call $~lib/array/Array<f64>#__uget
           local.set $x
           local.get $v
           local.get $j
           local.get $n
           i32.mul
           local.get $i
           i32.add
           call $~lib/array/Array<f64>#__uget
           local.set $z
           local.get $v
           local.get $j
           local.get $n
           i32.mul
           local.get $i
           i32.add
           i32.const 1
           i32.sub
           local.get $x
           local.get $c
           f64.mul
           local.get $z
           local.get $s
           f64.mul
           f64.add
           call $~lib/array/Array<f64>#__set
           local.get $v
           local.get $j
           local.get $n
           i32.mul
           local.get $i
           i32.add
           local.get $x
           f64.neg
           local.get $s
           f64.mul
           local.get $z
           local.get $c
           f64.mul
           f64.add
           call $~lib/array/Array<f64>#__set
           local.get $j
           i32.const 1
           i32.add
           local.set $j
           br $for-loop|31
          end
         end
         local.get $f
         local.get $h
         local.get $epsilon
         call $src/svd/pythag
         local.set $z
         local.get $q
         local.get $i
         i32.const 1
         i32.sub
         local.get $z
         call $~lib/array/Array<f64>#__set
         local.get $f
         local.get $z
         f64.div
         local.set $c
         local.get $h
         local.get $z
         f64.div
         local.set $s
         local.get $c
         local.get $g
         f64.mul
         local.get $s
         local.get $y
         f64.mul
         f64.add
         local.set $f
         local.get $s
         f64.neg
         local.get $g
         f64.mul
         local.get $c
         local.get $y
         f64.mul
         f64.add
         local.set $x
         i32.const 0
         local.set $j
         loop $for-loop|32
          local.get $j
          local.get $m
          i32.lt_s
          if
           local.get $u
           local.get $j
           local.get $n
           i32.mul
           local.get $i
           i32.add
           i32.const 1
           i32.sub
           call $~lib/array/Array<f64>#__uget
           local.set $y
           local.get $u
           local.get $j
           local.get $n
           i32.mul
           local.get $i
           i32.add
           call $~lib/array/Array<f64>#__uget
           local.set $z
           local.get $u
           local.get $j
           local.get $n
           i32.mul
           local.get $i
           i32.add
           i32.const 1
           i32.sub
           local.get $y
           local.get $c
           f64.mul
           local.get $z
           local.get $s
           f64.mul
           f64.add
           call $~lib/array/Array<f64>#__set
           local.get $u
           local.get $j
           local.get $n
           i32.mul
           local.get $i
           i32.add
           local.get $y
           f64.neg
           local.get $s
           f64.mul
           local.get $z
           local.get $c
           f64.mul
           f64.add
           call $~lib/array/Array<f64>#__set
           local.get $j
           i32.const 1
           i32.add
           local.set $j
           br $for-loop|32
          end
         end
         local.get $i
         i32.const 1
         i32.add
         local.set $i
         br $for-loop|30
        end
       end
       local.get $e
       local.get $l
       f64.const 0
       call $~lib/array/Array<f64>#__set
       local.get $e
       local.get $k
       local.get $f
       call $~lib/array/Array<f64>#__set
       local.get $q
       local.get $k
       local.get $x
       call $~lib/array/Array<f64>#__set
       local.get $iteration
       i32.const 1
       i32.add
       local.set $iteration
       br $for-loop|25
      end
     end
    end
    local.get $k
    i32.const 1
    i32.sub
    local.set $k
    br $for-loop|24
   end
  end
  i32.const 0
  local.set $i
  loop $for-loop|33
   local.get $i
   local.get $n
   i32.lt_s
   if
    local.get $q
    local.get $i
    call $~lib/array/Array<f64>#__get
    local.get $prec
    f64.lt
    if
     local.get $q
     local.get $i
     f64.const 0
     call $~lib/array/Array<f64>#__set
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|33
   end
  end
  i32.const 0
  local.set $i
  loop $for-loop|34
   local.get $i
   local.get $n
   i32.lt_s
   if
    local.get $i
    i32.const 1
    i32.sub
    local.set $j
    loop $for-loop|35
     local.get $j
     i32.const 0
     i32.ge_s
     if
      local.get $q
      local.get $j
      call $~lib/array/Array<f64>#__get
      local.get $q
      local.get $i
      call $~lib/array/Array<f64>#__get
      f64.lt
      if
       local.get $q
       local.get $j
       call $~lib/array/Array<f64>#__get
       local.set $c
       local.get $q
       local.get $j
       local.get $q
       local.get $i
       call $~lib/array/Array<f64>#__get
       call $~lib/array/Array<f64>#__set
       local.get $q
       local.get $i
       local.get $c
       call $~lib/array/Array<f64>#__set
       i32.const 0
       local.set $k
       loop $for-loop|36
        local.get $k
        local.get $m
        i32.lt_s
        if
         local.get $u
         local.get $k
         local.get $n
         i32.mul
         local.get $i
         i32.add
         call $~lib/array/Array<f64>#__uget
         local.set $temp
         local.get $u
         local.get $k
         local.get $n
         i32.mul
         local.get $i
         i32.add
         local.get $u
         local.get $k
         local.get $n
         i32.mul
         local.get $j
         i32.add
         call $~lib/array/Array<f64>#__uget
         call $~lib/array/Array<f64>#__set
         local.get $u
         local.get $k
         local.get $n
         i32.mul
         local.get $j
         i32.add
         local.get $temp
         call $~lib/array/Array<f64>#__set
         local.get $k
         i32.const 1
         i32.add
         local.set $k
         br $for-loop|36
        end
       end
       i32.const 0
       local.set $k
       loop $for-loop|37
        local.get $k
        local.get $n
        i32.lt_s
        if
         local.get $v
         local.get $k
         local.get $n
         i32.mul
         local.get $i
         i32.add
         call $~lib/array/Array<f64>#__uget
         local.set $temp
         local.get $v
         local.get $k
         local.get $n
         i32.mul
         local.get $i
         i32.add
         local.get $v
         local.get $k
         local.get $n
         i32.mul
         local.get $j
         i32.add
         call $~lib/array/Array<f64>#__uget
         call $~lib/array/Array<f64>#__set
         local.get $v
         local.get $k
         local.get $n
         i32.mul
         local.get $j
         i32.add
         local.get $temp
         call $~lib/array/Array<f64>#__set
         local.get $k
         i32.const 1
         i32.add
         local.set $k
         br $for-loop|37
        end
       end
       local.get $j
       local.set $i
      end
      local.get $j
      i32.const 1
      i32.sub
      local.set $j
      br $for-loop|35
     end
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|34
   end
  end
  i32.const 0
  call $src/svd/FlatSVD#constructor
  local.set $29
  local.get $29
  local.get $u
  call $src/svd/FlatSVD#set:U
  local.get $29
  local.get $q
  call $src/svd/FlatSVD#set:S
  local.get $29
  local.get $v
  call $src/svd/FlatSVD#set:V
  local.get $29
  return
 )
 (func $src/svd/FlatSVD#get:V (param $this i32) (result i32)
  (local $1 i32)
  local.get $this
  i32.load offset=8
  local.tee $1
  if (result i32)
   local.get $1
  else
   i32.const 736
   i32.const 688
   i32.const 13
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $src/factor/correlation (param $x i32) (param $y i32) (result f64)
  (local $n i32)
  (local $sumX f64)
  (local $sumY f64)
  (local $sumXY f64)
  (local $sumX2 f64)
  (local $sumY2 f64)
  (local $i i32)
  (local $numerator f64)
  (local $x|10 f64)
  (local $denominator f64)
  local.get $x
  call $~lib/array/Array<f64>#get:length
  local.set $n
  f64.const 0
  local.set $sumX
  f64.const 0
  local.set $sumY
  f64.const 0
  local.set $sumXY
  f64.const 0
  local.set $sumX2
  f64.const 0
  local.set $sumY2
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $n
   i32.lt_s
   if
    local.get $sumX
    local.get $x
    local.get $i
    call $~lib/array/Array<f64>#__uget
    f64.add
    local.set $sumX
    local.get $sumY
    local.get $y
    local.get $i
    call $~lib/array/Array<f64>#__uget
    f64.add
    local.set $sumY
    local.get $sumXY
    local.get $x
    local.get $i
    call $~lib/array/Array<f64>#__uget
    local.get $y
    local.get $i
    call $~lib/array/Array<f64>#__uget
    f64.mul
    f64.add
    local.set $sumXY
    local.get $sumX2
    local.get $x
    local.get $i
    call $~lib/array/Array<f64>#__uget
    local.get $x
    local.get $i
    call $~lib/array/Array<f64>#__uget
    f64.mul
    f64.add
    local.set $sumX2
    local.get $sumY2
    local.get $y
    local.get $i
    call $~lib/array/Array<f64>#__uget
    local.get $y
    local.get $i
    call $~lib/array/Array<f64>#__uget
    f64.mul
    f64.add
    local.set $sumY2
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $n
  f64.convert_i32_s
  local.get $sumXY
  f64.mul
  local.get $sumX
  local.get $sumY
  f64.mul
  f64.sub
  local.set $numerator
  block $~lib/math/NativeMath.sqrt|inlined.5 (result f64)
   local.get $n
   f64.convert_i32_s
   local.get $sumX2
   f64.mul
   local.get $sumX
   local.get $sumX
   f64.mul
   f64.sub
   local.get $n
   f64.convert_i32_s
   local.get $sumY2
   f64.mul
   local.get $sumY
   local.get $sumY
   f64.mul
   f64.sub
   f64.mul
   local.set $x|10
   local.get $x|10
   f64.sqrt
   br $~lib/math/NativeMath.sqrt|inlined.5
  end
  local.set $denominator
  local.get $denominator
  f64.const 0
  f64.eq
  if
   f64.const 0
   return
  end
  local.get $numerator
  local.get $denominator
  f64.div
  return
 )
 (func $~lib/array/Array<~lib/array/Array<f64>>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/tcms/__link
 )
 (func $~lib/array/Array<~lib/array/Array<f64>>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/array/Array<f64>>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/array/Array<f64>>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/array/Array<f64>>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 5
   call $~lib/rt/tcms/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<f64>>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<f64>>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<f64>>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<f64>>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 368
   i32.const 96
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/tcms/__new
  local.set $buffer
  i32.const 1
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/array/Array<f64>>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/array/Array<f64>>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/array/Array<f64>>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/array/Array<f64>>#set:length_
  local.get $this
 )
 (func $~lib/array/Array<~lib/array/Array<f64>>#__set (param $this i32) (param $index i32) (param $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/array/Array<f64>>#get:length_
  i32.ge_u
  if
   local.get $index
   i32.const 0
   i32.lt_s
   if
    i32.const 32
    i32.const 96
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   i32.const 2
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   call $~lib/array/Array<~lib/array/Array<f64>>#set:length_
  end
  local.get $this
  call $~lib/array/Array<~lib/array/Array<f64>>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  i32.const 1
  drop
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/tcms/__link
 )
 (func $src/mm/reshape (param $flat i32) (param $rows i32) (param $cols i32) (result i32)
  (local $out i32)
  (local $i i32)
  (local $row i32)
  (local $j i32)
  i32.const 0
  local.get $rows
  call $~lib/array/Array<~lib/array/Array<f64>>#constructor
  local.set $out
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $rows
   i32.lt_s
   if
    i32.const 0
    local.get $cols
    call $~lib/array/Array<f64>#constructor
    local.set $row
    i32.const 0
    local.set $j
    loop $for-loop|1
     local.get $j
     local.get $cols
     i32.lt_s
     if
      local.get $row
      local.get $j
      local.get $flat
      local.get $i
      local.get $cols
      i32.mul
      local.get $j
      i32.add
      call $~lib/array/Array<f64>#__get
      call $~lib/array/Array<f64>#__set
      local.get $j
      i32.const 1
      i32.add
      local.set $j
      br $for-loop|1
     end
    end
    local.get $out
    local.get $i
    local.get $row
    call $~lib/array/Array<~lib/array/Array<f64>>#__set
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $out
  return
 )
 (func $src/factor/FactorResult#set:loadings (param $this i32) (param $loadings i32)
  local.get $this
  local.get $loadings
  i32.store
  local.get $this
  local.get $loadings
  i32.const 0
  call $~lib/rt/tcms/__link
 )
 (func $src/factor/FactorResult#set:scores (param $this i32) (param $scores i32)
  local.get $this
  local.get $scores
  i32.store offset=4
  local.get $this
  local.get $scores
  i32.const 0
  call $~lib/rt/tcms/__link
 )
 (func $src/factor/FactorResult#set:variance (param $this i32) (param $variance i32)
  local.get $this
  local.get $variance
  i32.store offset=8
  local.get $this
  local.get $variance
  i32.const 0
  call $~lib/rt/tcms/__link
 )
 (func $src/factor/FactorResult#constructor (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 12
   i32.const 6
   call $~lib/rt/tcms/__new
   local.set $this
  end
  local.get $this
  call $~lib/object/Object#constructor
  local.set $this
  local.get $this
  i32.const 0
  call $src/factor/FactorResult#set:loadings
  local.get $this
  i32.const 0
  call $src/factor/FactorResult#set:scores
  local.get $this
  i32.const 0
  call $src/factor/FactorResult#set:variance
  local.get $this
 )
 (func $src/factor/factor (param $data i32) (result i32)
  (local $m i32)
  (local $row0 i32)
  (local $n i32)
  (local $input i32)
  (local $means i32)
  (local $stds i32)
  (local $j i32)
  (local $sum f64)
  (local $i i32)
  (local $j|10 i32)
  (local $sumSq f64)
  (local $i|12 i32)
  (local $diff f64)
  (local $x f64)
  (local $standardized i32)
  (local $i|16 i32)
  (local $j|17 i32)
  (local $result i32)
  (local $V i32)
  (local $factorScores i32)
  (local $i|21 i32)
  (local $j|22 i32)
  (local $sum|23 f64)
  (local $k i32)
  (local $loadings i32)
  (local $variableCol i32)
  (local $factorCol i32)
  (local $varIdx i32)
  (local $i|29 i32)
  (local $factorIdx i32)
  (local $i|31 i32)
  (local $signs i32)
  (local $j|33 i32)
  (local $sum|34 f64)
  (local $i|35 i32)
  (local $x|36 f64)
  (local $j|37 i32)
  (local $i|38 i32)
  (local $i|39 i32)
  (local $variance i32)
  (local $j|41 i32)
  (local $sumSq|42 f64)
  (local $i|43 i32)
  (local $44 i32)
  local.get $data
  call $~lib/array/Array<~lib/array/Array<f64>>#get:length
  local.set $m
  local.get $data
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<f64>>#__get
  local.set $row0
  local.get $row0
  i32.eqz
  if
   i32.const 272
   i32.const 320
   i32.const 40
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  local.get $row0
  call $~lib/array/Array<f64>#get:length
  local.set $n
  local.get $data
  call $src/mm/flatten
  local.set $input
  i32.const 0
  local.get $n
  call $~lib/array/Array<f64>#constructor
  local.set $means
  i32.const 0
  local.get $n
  call $~lib/array/Array<f64>#constructor
  local.set $stds
  i32.const 0
  local.set $j
  loop $for-loop|0
   local.get $j
   local.get $n
   i32.lt_s
   if
    f64.const 0
    local.set $sum
    i32.const 0
    local.set $i
    loop $for-loop|1
     local.get $i
     local.get $m
     i32.lt_s
     if
      local.get $sum
      local.get $input
      local.get $i
      local.get $n
      i32.mul
      local.get $j
      i32.add
      call $~lib/array/Array<f64>#__uget
      f64.add
      local.set $sum
      local.get $i
      i32.const 1
      i32.add
      local.set $i
      br $for-loop|1
     end
    end
    local.get $means
    local.get $j
    local.get $sum
    local.get $m
    f64.convert_i32_s
    f64.div
    call $~lib/array/Array<f64>#__set
    local.get $j
    i32.const 1
    i32.add
    local.set $j
    br $for-loop|0
   end
  end
  i32.const 0
  local.set $j|10
  loop $for-loop|2
   local.get $j|10
   local.get $n
   i32.lt_s
   if
    f64.const 0
    local.set $sumSq
    i32.const 0
    local.set $i|12
    loop $for-loop|3
     local.get $i|12
     local.get $m
     i32.lt_s
     if
      local.get $input
      local.get $i|12
      local.get $n
      i32.mul
      local.get $j|10
      i32.add
      call $~lib/array/Array<f64>#__uget
      local.get $means
      local.get $j|10
      call $~lib/array/Array<f64>#__get
      f64.sub
      local.set $diff
      local.get $sumSq
      local.get $diff
      local.get $diff
      f64.mul
      f64.add
      local.set $sumSq
      local.get $i|12
      i32.const 1
      i32.add
      local.set $i|12
      br $for-loop|3
     end
    end
    local.get $stds
    local.get $j|10
    block $~lib/math/NativeMath.sqrt|inlined.0 (result f64)
     local.get $sumSq
     local.get $m
     f64.convert_i32_s
     f64.div
     local.set $x
     local.get $x
     f64.sqrt
     br $~lib/math/NativeMath.sqrt|inlined.0
    end
    call $~lib/array/Array<f64>#__set
    local.get $stds
    local.get $j|10
    call $~lib/array/Array<f64>#__get
    f64.const 0
    f64.eq
    if
     local.get $stds
     local.get $j|10
     f64.const 1
     call $~lib/array/Array<f64>#__set
    end
    local.get $j|10
    i32.const 1
    i32.add
    local.set $j|10
    br $for-loop|2
   end
  end
  i32.const 0
  local.get $m
  local.get $n
  i32.mul
  call $~lib/array/Array<f64>#constructor
  local.set $standardized
  i32.const 0
  local.set $i|16
  loop $for-loop|4
   local.get $i|16
   local.get $m
   i32.lt_s
   if
    i32.const 0
    local.set $j|17
    loop $for-loop|5
     local.get $j|17
     local.get $n
     i32.lt_s
     if
      local.get $standardized
      local.get $i|16
      local.get $n
      i32.mul
      local.get $j|17
      i32.add
      local.get $input
      local.get $i|16
      local.get $n
      i32.mul
      local.get $j|17
      i32.add
      call $~lib/array/Array<f64>#__uget
      local.get $means
      local.get $j|17
      call $~lib/array/Array<f64>#__uget
      f64.sub
      local.get $stds
      local.get $j|17
      call $~lib/array/Array<f64>#__uget
      f64.div
      call $~lib/array/Array<f64>#__set
      local.get $j|17
      i32.const 1
      i32.add
      local.set $j|17
      br $for-loop|5
     end
    end
    local.get $i|16
    i32.const 1
    i32.add
    local.set $i|16
    br $for-loop|4
   end
  end
  local.get $standardized
  local.get $m
  local.get $n
  call $src/svd/svdFlat
  local.set $result
  local.get $result
  call $src/svd/FlatSVD#get:V
  local.set $V
  i32.const 0
  local.get $m
  local.get $n
  i32.mul
  call $~lib/array/Array<f64>#constructor
  local.set $factorScores
  i32.const 0
  local.set $i|21
  loop $for-loop|6
   local.get $i|21
   local.get $m
   i32.lt_s
   if
    i32.const 0
    local.set $j|22
    loop $for-loop|7
     local.get $j|22
     local.get $n
     i32.lt_s
     if
      f64.const 0
      local.set $sum|23
      i32.const 0
      local.set $k
      loop $for-loop|8
       local.get $k
       local.get $n
       i32.lt_s
       if
        local.get $sum|23
        local.get $standardized
        local.get $i|21
        local.get $n
        i32.mul
        local.get $k
        i32.add
        call $~lib/array/Array<f64>#__uget
        local.get $V
        local.get $k
        local.get $n
        i32.mul
        local.get $j|22
        i32.add
        call $~lib/array/Array<f64>#__uget
        f64.mul
        f64.add
        local.set $sum|23
        local.get $k
        i32.const 1
        i32.add
        local.set $k
        br $for-loop|8
       end
      end
      local.get $factorScores
      local.get $i|21
      local.get $n
      i32.mul
      local.get $j|22
      i32.add
      local.get $sum|23
      call $~lib/array/Array<f64>#__set
      local.get $j|22
      i32.const 1
      i32.add
      local.set $j|22
      br $for-loop|7
     end
    end
    local.get $i|21
    i32.const 1
    i32.add
    local.set $i|21
    br $for-loop|6
   end
  end
  i32.const 0
  local.get $n
  local.get $n
  i32.mul
  call $~lib/array/Array<f64>#constructor
  local.set $loadings
  i32.const 0
  local.get $m
  call $~lib/array/Array<f64>#constructor
  local.set $variableCol
  i32.const 0
  local.get $m
  call $~lib/array/Array<f64>#constructor
  local.set $factorCol
  i32.const 0
  local.set $varIdx
  loop $for-loop|9
   local.get $varIdx
   local.get $n
   i32.lt_s
   if
    i32.const 0
    local.set $i|29
    loop $for-loop|10
     local.get $i|29
     local.get $m
     i32.lt_s
     if
      local.get $variableCol
      local.get $i|29
      local.get $standardized
      local.get $i|29
      local.get $n
      i32.mul
      local.get $varIdx
      i32.add
      call $~lib/array/Array<f64>#__uget
      call $~lib/array/Array<f64>#__set
      local.get $i|29
      i32.const 1
      i32.add
      local.set $i|29
      br $for-loop|10
     end
    end
    i32.const 0
    local.set $factorIdx
    loop $for-loop|11
     local.get $factorIdx
     local.get $n
     i32.lt_s
     if
      i32.const 0
      local.set $i|31
      loop $for-loop|12
       local.get $i|31
       local.get $m
       i32.lt_s
       if
        local.get $factorCol
        local.get $i|31
        local.get $factorScores
        local.get $i|31
        local.get $n
        i32.mul
        local.get $factorIdx
        i32.add
        call $~lib/array/Array<f64>#__uget
        call $~lib/array/Array<f64>#__set
        local.get $i|31
        i32.const 1
        i32.add
        local.set $i|31
        br $for-loop|12
       end
      end
      local.get $loadings
      local.get $varIdx
      local.get $n
      i32.mul
      local.get $factorIdx
      i32.add
      local.get $variableCol
      local.get $factorCol
      call $src/factor/correlation
      call $~lib/array/Array<f64>#__set
      local.get $factorIdx
      i32.const 1
      i32.add
      local.set $factorIdx
      br $for-loop|11
     end
    end
    local.get $varIdx
    i32.const 1
    i32.add
    local.set $varIdx
    br $for-loop|9
   end
  end
  i32.const 0
  local.get $n
  call $~lib/array/Array<f64>#constructor
  local.set $signs
  i32.const 0
  local.set $j|33
  loop $for-loop|13
   local.get $j|33
   local.get $n
   i32.lt_s
   if
    f64.const 0
    local.set $sum|34
    i32.const 0
    local.set $i|35
    loop $for-loop|14
     local.get $i|35
     local.get $n
     i32.lt_s
     if
      local.get $sum|34
      local.get $loadings
      local.get $i|35
      local.get $n
      i32.mul
      local.get $j|33
      i32.add
      call $~lib/array/Array<f64>#__uget
      f64.add
      local.set $sum|34
      local.get $i|35
      i32.const 1
      i32.add
      local.set $i|35
      br $for-loop|14
     end
    end
    block $~lib/math/NativeMath.abs|inlined.0 (result f64)
     local.get $sum|34
     local.set $x|36
     local.get $x|36
     f64.abs
     br $~lib/math/NativeMath.abs|inlined.0
    end
    f64.const 1e-10
    f64.lt
    if
     local.get $signs
     local.get $j|33
     f64.const 1
     call $~lib/array/Array<f64>#__set
    else
     local.get $signs
     local.get $j|33
     local.get $sum|34
     f64.const 0
     f64.lt
     if (result f64)
      f64.const -1
     else
      f64.const 1
     end
     call $~lib/array/Array<f64>#__set
    end
    local.get $j|33
    i32.const 1
    i32.add
    local.set $j|33
    br $for-loop|13
   end
  end
  i32.const 0
  local.set $j|37
  loop $for-loop|15
   local.get $j|37
   local.get $n
   i32.lt_s
   if
    i32.const 0
    local.set $i|38
    loop $for-loop|16
     local.get $i|38
     local.get $n
     i32.lt_s
     if
      local.get $loadings
      local.get $i|38
      local.get $n
      i32.mul
      local.get $j|37
      i32.add
      local.get $loadings
      local.get $i|38
      local.get $n
      i32.mul
      local.get $j|37
      i32.add
      call $~lib/array/Array<f64>#__uget
      local.get $signs
      local.get $j|37
      call $~lib/array/Array<f64>#__uget
      f64.mul
      call $~lib/array/Array<f64>#__set
      local.get $i|38
      i32.const 1
      i32.add
      local.set $i|38
      br $for-loop|16
     end
    end
    i32.const 0
    local.set $i|39
    loop $for-loop|17
     local.get $i|39
     local.get $m
     i32.lt_s
     if
      local.get $factorScores
      local.get $i|39
      local.get $n
      i32.mul
      local.get $j|37
      i32.add
      local.get $factorScores
      local.get $i|39
      local.get $n
      i32.mul
      local.get $j|37
      i32.add
      call $~lib/array/Array<f64>#__uget
      local.get $signs
      local.get $j|37
      call $~lib/array/Array<f64>#__uget
      f64.mul
      call $~lib/array/Array<f64>#__set
      local.get $i|39
      i32.const 1
      i32.add
      local.set $i|39
      br $for-loop|17
     end
    end
    local.get $j|37
    i32.const 1
    i32.add
    local.set $j|37
    br $for-loop|15
   end
  end
  i32.const 0
  local.get $n
  call $~lib/array/Array<f64>#constructor
  local.set $variance
  i32.const 0
  local.set $j|41
  loop $for-loop|18
   local.get $j|41
   local.get $n
   i32.lt_s
   if
    f64.const 0
    local.set $sumSq|42
    i32.const 0
    local.set $i|43
    loop $for-loop|19
     local.get $i|43
     local.get $n
     i32.lt_s
     if
      local.get $sumSq|42
      local.get $loadings
      local.get $i|43
      local.get $n
      i32.mul
      local.get $j|41
      i32.add
      call $~lib/array/Array<f64>#__uget
      local.get $loadings
      local.get $i|43
      local.get $n
      i32.mul
      local.get $j|41
      i32.add
      call $~lib/array/Array<f64>#__uget
      f64.mul
      f64.add
      local.set $sumSq|42
      local.get $i|43
      i32.const 1
      i32.add
      local.set $i|43
      br $for-loop|19
     end
    end
    local.get $variance
    local.get $j|41
    local.get $sumSq|42
    local.get $n
    f64.convert_i32_s
    f64.div
    call $~lib/array/Array<f64>#__set
    local.get $j|41
    i32.const 1
    i32.add
    local.set $j|41
    br $for-loop|18
   end
  end
  i32.const 0
  call $src/factor/FactorResult#constructor
  local.set $44
  local.get $44
  local.get $loadings
  local.get $n
  local.get $n
  call $src/mm/reshape
  call $src/factor/FactorResult#set:loadings
  local.get $44
  local.get $factorScores
  local.get $m
  local.get $n
  call $src/mm/reshape
  call $src/factor/FactorResult#set:scores
  local.get $44
  local.get $variance
  call $src/factor/FactorResult#set:variance
  local.get $44
  return
 )
 (func $src/svd/FlatSVD#get:U (param $this i32) (result i32)
  (local $1 i32)
  local.get $this
  i32.load
  local.tee $1
  if (result i32)
   local.get $1
  else
   i32.const 736
   i32.const 688
   i32.const 11
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $src/svd/SVDResult#set:U (param $this i32) (param $U i32)
  local.get $this
  local.get $U
  i32.store
  local.get $this
  local.get $U
  i32.const 0
  call $~lib/rt/tcms/__link
 )
 (func $src/svd/FlatSVD#get:S (param $this i32) (result i32)
  (local $1 i32)
  local.get $this
  i32.load offset=4
  local.tee $1
  if (result i32)
   local.get $1
  else
   i32.const 736
   i32.const 688
   i32.const 12
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $src/svd/SVDResult#set:S (param $this i32) (param $S i32)
  local.get $this
  local.get $S
  i32.store offset=4
  local.get $this
  local.get $S
  i32.const 0
  call $~lib/rt/tcms/__link
 )
 (func $src/svd/SVDResult#set:V (param $this i32) (param $V i32)
  local.get $this
  local.get $V
  i32.store offset=8
  local.get $this
  local.get $V
  i32.const 0
  call $~lib/rt/tcms/__link
 )
 (func $src/svd/SVDResult#constructor (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 12
   i32.const 8
   call $~lib/rt/tcms/__new
   local.set $this
  end
  local.get $this
  call $~lib/object/Object#constructor
  local.set $this
  local.get $this
  i32.const 0
  call $src/svd/SVDResult#set:U
  local.get $this
  i32.const 0
  call $src/svd/SVDResult#set:S
  local.get $this
  i32.const 0
  call $src/svd/SVDResult#set:V
  local.get $this
 )
 (func $src/svd/svd (param $A i32) (result i32)
  (local $m i32)
  (local $row0 i32)
  (local $n i32)
  (local $result i32)
  (local $5 i32)
  local.get $A
  call $~lib/array/Array<~lib/array/Array<f64>>#get:length
  local.set $m
  local.get $m
  i32.const 0
  i32.eq
  if
   i32.const 272
   i32.const 688
   i32.const 359
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  local.get $A
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<f64>>#__get
  local.set $row0
  local.get $row0
  i32.eqz
  if
   i32.const 272
   i32.const 688
   i32.const 364
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  local.get $row0
  call $~lib/array/Array<f64>#get:length
  local.set $n
  local.get $m
  local.get $n
  i32.lt_s
  if
   i32.const 864
   i32.const 688
   i32.const 370
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  local.get $A
  call $src/mm/flatten
  local.get $m
  local.get $n
  call $src/svd/svdFlat
  local.set $result
  i32.const 0
  call $src/svd/SVDResult#constructor
  local.set $5
  local.get $5
  local.get $result
  call $src/svd/FlatSVD#get:U
  local.get $m
  local.get $n
  call $src/mm/reshape
  call $src/svd/SVDResult#set:U
  local.get $5
  local.get $result
  call $src/svd/FlatSVD#get:S
  call $src/svd/SVDResult#set:S
  local.get $5
  local.get $result
  call $src/svd/FlatSVD#get:V
  local.get $n
  local.get $n
  call $src/mm/reshape
  call $src/svd/SVDResult#set:V
  local.get $5
  return
 )
 (func $~lib/rt/tcms/Object#get:color (param $this i32) (result i32)
  local.get $this
  call $~lib/rt/tcms/Object#get:nextWithColor
  i32.const 3
  i32.and
  return
 )
 (func $~lib/rt/tcms/Object#unlink (param $this i32)
  (local $next i32)
  (local $prev i32)
  local.get $this
  call $~lib/rt/tcms/Object#get:next
  local.set $next
  local.get $next
  i32.const 0
  i32.eq
  if
   i32.const 1
   drop
   local.get $this
   call $~lib/rt/tcms/Object#get:prev
   i32.const 0
   i32.eq
   if (result i32)
    local.get $this
    global.get $~lib/memory/__heap_base
    i32.lt_u
   else
    i32.const 0
   end
   i32.eqz
   if
    i32.const 0
    i32.const 480
    i32.const 101
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   return
  end
  local.get $this
  call $~lib/rt/tcms/Object#get:prev
  local.set $prev
  i32.const 1
  drop
  local.get $prev
  i32.eqz
  if
   i32.const 0
   i32.const 480
   i32.const 105
   i32.const 16
   call $~lib/builtins/abort
   unreachable
  end
  local.get $next
  local.get $prev
  call $~lib/rt/tcms/Object#set:prev
  local.get $prev
  local.get $next
  call $~lib/rt/tcms/Object#set:next
 )
 (func $~lib/rt/tcms/__pin (param $ptr i32) (result i32)
  (local $obj i32)
  local.get $ptr
  if
   local.get $ptr
   i32.const 20
   i32.sub
   local.set $obj
   local.get $obj
   call $~lib/rt/tcms/Object#get:color
   i32.const 3
   i32.eq
   if
    i32.const 944
    i32.const 480
    i32.const 181
    i32.const 7
    call $~lib/builtins/abort
    unreachable
   end
   local.get $obj
   call $~lib/rt/tcms/Object#unlink
   local.get $obj
   global.get $~lib/rt/tcms/pinSpace
   i32.const 3
   call $~lib/rt/tcms/Object#linkTo
  end
  local.get $ptr
  return
 )
 (func $~lib/rt/tcms/__unpin (param $ptr i32)
  (local $obj i32)
  local.get $ptr
  i32.eqz
  if
   return
  end
  local.get $ptr
  i32.const 20
  i32.sub
  local.set $obj
  local.get $obj
  call $~lib/rt/tcms/Object#get:color
  i32.const 3
  i32.ne
  if
   i32.const 1040
   i32.const 480
   i32.const 195
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  local.get $obj
  call $~lib/rt/tcms/Object#unlink
  local.get $obj
  global.get $~lib/rt/tcms/fromSpace
  global.get $~lib/rt/tcms/white
  call $~lib/rt/tcms/Object#linkTo
 )
 (func $~lib/rt/tlsf/__free (param $ptr i32)
  local.get $ptr
  global.get $~lib/memory/__heap_base
  i32.lt_u
  if
   return
  end
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   call $~lib/rt/tlsf/initialize
  end
  global.get $~lib/rt/tlsf/ROOT
  local.get $ptr
  call $~lib/rt/tlsf/checkUsedBlock
  call $~lib/rt/tlsf/freeBlock
 )
 (func $~lib/rt/tcms/__collect
  (local $pn i32)
  (local $iter i32)
  (local $black i32)
  (local $to i32)
  (local $from i32)
  (local $newNext i32)
  i32.const 0
  drop
  i32.const 0
  call $~lib/rt/__visit_globals
  global.get $~lib/rt/tcms/pinSpace
  local.set $pn
  local.get $pn
  call $~lib/rt/tcms/Object#get:next
  local.set $iter
  loop $while-continue|0
   local.get $iter
   local.get $pn
   i32.ne
   if
    i32.const 1
    drop
    local.get $iter
    call $~lib/rt/tcms/Object#get:color
    i32.const 3
    i32.eq
    i32.eqz
    if
     i32.const 0
     i32.const 480
     i32.const 213
     i32.const 16
     call $~lib/builtins/abort
     unreachable
    end
    local.get $iter
    i32.const 20
    i32.add
    i32.const 0
    call $~lib/rt/__visit_members
    local.get $iter
    call $~lib/rt/tcms/Object#get:next
    local.set $iter
    br $while-continue|0
   end
  end
  global.get $~lib/rt/tcms/white
  i32.eqz
  local.set $black
  global.get $~lib/rt/tcms/toSpace
  local.set $to
  local.get $to
  call $~lib/rt/tcms/Object#get:next
  local.set $iter
  loop $while-continue|1
   local.get $iter
   local.get $to
   i32.ne
   if
    i32.const 1
    drop
    local.get $iter
    call $~lib/rt/tcms/Object#get:color
    local.get $black
    i32.eq
    i32.eqz
    if
     i32.const 0
     i32.const 480
     i32.const 223
     i32.const 16
     call $~lib/builtins/abort
     unreachable
    end
    local.get $iter
    i32.const 20
    i32.add
    i32.const 0
    call $~lib/rt/__visit_members
    local.get $iter
    call $~lib/rt/tcms/Object#get:next
    local.set $iter
    br $while-continue|1
   end
  end
  global.get $~lib/rt/tcms/fromSpace
  local.set $from
  local.get $from
  call $~lib/rt/tcms/Object#get:next
  local.set $iter
  loop $while-continue|2
   local.get $iter
   local.get $from
   i32.ne
   if
    i32.const 1
    drop
    local.get $iter
    call $~lib/rt/tcms/Object#get:color
    global.get $~lib/rt/tcms/white
    i32.eq
    i32.eqz
    if
     i32.const 0
     i32.const 480
     i32.const 232
     i32.const 16
     call $~lib/builtins/abort
     unreachable
    end
    local.get $iter
    call $~lib/rt/tcms/Object#get:next
    local.set $newNext
    local.get $iter
    global.get $~lib/memory/__heap_base
    i32.lt_u
    if
     local.get $iter
     i32.const 0
     call $~lib/rt/tcms/Object#set:nextWithColor
     local.get $iter
     i32.const 0
     call $~lib/rt/tcms/Object#set:prev
    else
     global.get $~lib/rt/tcms/total
     local.get $iter
     call $~lib/rt/tcms/Object#get:size
     i32.sub
     global.set $~lib/rt/tcms/total
     i32.const 0
     drop
     local.get $iter
     i32.const 4
     i32.add
     call $~lib/rt/tlsf/__free
    end
    local.get $newNext
    local.set $iter
    br $while-continue|2
   end
  end
  local.get $from
  local.get $from
  call $~lib/rt/tcms/Object#set:nextWithColor
  local.get $from
  local.get $from
  call $~lib/rt/tcms/Object#set:prev
  local.get $to
  global.set $~lib/rt/tcms/fromSpace
  local.get $from
  global.set $~lib/rt/tcms/toSpace
  local.get $black
  global.set $~lib/rt/tcms/white
  i32.const 0
  drop
  i32.const 0
  drop
 )
 (func $~lib/rt/tcms/__visit (param $ptr i32) (param $cookie i32)
  (local $obj i32)
  local.get $ptr
  i32.eqz
  if
   return
  end
  local.get $ptr
  i32.const 20
  i32.sub
  local.set $obj
  i32.const 0
  drop
  local.get $obj
  call $~lib/rt/tcms/Object#get:color
  global.get $~lib/rt/tcms/white
  i32.eq
  if
   local.get $obj
   call $~lib/rt/tcms/Object#unlink
   local.get $obj
   global.get $~lib/rt/tcms/toSpace
   global.get $~lib/rt/tcms/white
   i32.eqz
   call $~lib/rt/tcms/Object#linkTo
  end
 )
 (func $~lib/rt/__visit_globals (param $0 i32)
  (local $1 i32)
  i32.const 32
  local.get $0
  call $~lib/rt/tcms/__visit
  i32.const 368
  local.get $0
  call $~lib/rt/tcms/__visit
  i32.const 144
  local.get $0
  call $~lib/rt/tcms/__visit
  i32.const 416
  local.get $0
  call $~lib/rt/tcms/__visit
  i32.const 944
  local.get $0
  call $~lib/rt/tcms/__visit
  i32.const 1040
  local.get $0
  call $~lib/rt/tcms/__visit
 )
 (func $~lib/arraybuffer/ArrayBufferView~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/tcms/__visit
 )
 (func $~lib/object/Object~visit (param $0 i32) (param $1 i32)
 )
 (func $~lib/array/Array<f64>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<f64>#__visit (param $this i32) (param $cookie i32)
  i32.const 0
  drop
  local.get $this
  call $~lib/array/Array<f64>#get:buffer
  local.get $cookie
  call $~lib/rt/tcms/__visit
 )
 (func $~lib/array/Array<f64>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<f64>#__visit
 )
 (func $~lib/array/Array<~lib/array/Array<f64>>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<~lib/array/Array<f64>>#__visit (param $this i32) (param $cookie i32)
  (local $cur i32)
  (local $end i32)
  (local $val i32)
  i32.const 1
  drop
  local.get $this
  call $~lib/array/Array<~lib/array/Array<f64>>#get:dataStart
  local.set $cur
  local.get $cur
  local.get $this
  call $~lib/array/Array<~lib/array/Array<f64>>#get:length_
  i32.const 2
  i32.shl
  i32.add
  local.set $end
  loop $while-continue|0
   local.get $cur
   local.get $end
   i32.lt_u
   if
    local.get $cur
    i32.load
    local.set $val
    local.get $val
    if
     local.get $val
     local.get $cookie
     call $~lib/rt/tcms/__visit
    end
    local.get $cur
    i32.const 4
    i32.add
    local.set $cur
    br $while-continue|0
   end
  end
  local.get $this
  call $~lib/array/Array<~lib/array/Array<f64>>#get:buffer
  local.get $cookie
  call $~lib/rt/tcms/__visit
 )
 (func $~lib/array/Array<~lib/array/Array<f64>>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<~lib/array/Array<f64>>#__visit
 )
 (func $src/factor/FactorResult~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/tcms/__visit
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/rt/tcms/__visit
  local.get $0
  i32.load offset=8
  local.get $1
  call $~lib/rt/tcms/__visit
 )
 (func $src/svd/FlatSVD~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/tcms/__visit
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/rt/tcms/__visit
  local.get $0
  i32.load offset=8
  local.get $1
  call $~lib/rt/tcms/__visit
 )
 (func $src/svd/SVDResult~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/tcms/__visit
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/rt/tcms/__visit
  local.get $0
  i32.load offset=8
  local.get $1
  call $~lib/rt/tcms/__visit
 )
 (func $~lib/rt/__visit_members (param $0 i32) (param $1 i32)
  block $invalid
   block $src/svd/SVDResult
    block $src/svd/FlatSVD
     block $src/factor/FactorResult
      block $~lib/array/Array<~lib/array/Array<f64>>
       block $~lib/array/Array<f64>
        block $~lib/arraybuffer/ArrayBufferView
         block $~lib/string/String
          block $~lib/arraybuffer/ArrayBuffer
           block $~lib/object/Object
            local.get $0
            i32.const 8
            i32.sub
            i32.load
            br_table $~lib/object/Object $~lib/arraybuffer/ArrayBuffer $~lib/string/String $~lib/arraybuffer/ArrayBufferView $~lib/array/Array<f64> $~lib/array/Array<~lib/array/Array<f64>> $src/factor/FactorResult $src/svd/FlatSVD $src/svd/SVDResult $invalid
           end
           return
          end
          return
         end
         return
        end
        local.get $0
        local.get $1
        call $~lib/arraybuffer/ArrayBufferView~visit
        return
       end
       local.get $0
       local.get $1
       call $~lib/array/Array<f64>~visit
       return
      end
      local.get $0
      local.get $1
      call $~lib/array/Array<~lib/array/Array<f64>>~visit
      return
     end
     local.get $0
     local.get $1
     call $src/factor/FactorResult~visit
     return
    end
    local.get $0
    local.get $1
    call $src/svd/FlatSVD~visit
    return
   end
   local.get $0
   local.get $1
   call $src/svd/SVDResult~visit
   return
  end
  unreachable
 )
 (func $~start
  i32.const 592
  call $~lib/rt/tcms/initLazy
  global.set $~lib/rt/tcms/fromSpace
  i32.const 992
  call $~lib/rt/tcms/initLazy
  global.set $~lib/rt/tcms/pinSpace
  i32.const 1088
  call $~lib/rt/tcms/initLazy
  global.set $~lib/rt/tcms/toSpace
 )
)
