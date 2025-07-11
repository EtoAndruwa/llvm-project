; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 5
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1100 < %s | FileCheck %s

define float @fma_from_freeze_mul_add_left(float %x, float %y) {
; CHECK-LABEL: fma_from_freeze_mul_add_left:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_fma_f32 v0, v0, v1, 1.0
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %mul = fmul contract float %x, %y
  %mul.fr = freeze float %mul
  %add = fadd contract float %mul.fr, 1.000000e+00
  ret float %add
}

define float @fma_from_freeze_mul_add_left_with_nnan(float %x, float %y) {
; CHECK-LABEL: fma_from_freeze_mul_add_left_with_nnan:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_fma_f32 v0, v0, v1, 1.0
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %mul = fmul nnan contract afn float %x, %y
  %mul.fr = freeze float %mul
  %add = fadd nnan contract float %mul.fr, 1.000000e+00
  ret float %add
}

define float @fma_from_freeze_mul_add_right(float %x, float %y) {
; CHECK-LABEL: fma_from_freeze_mul_add_right:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_fma_f32 v0, v0, v1, 1.0
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %mul = fmul contract float %x, %y
  %mul.fr = freeze float %mul
  %add = fadd contract float 1.000000e+00, %mul.fr
  ret float %add
}

define float @fma_from_freeze_mul_add_right_with_nnan(float %x, float %y) {
; CHECK-LABEL: fma_from_freeze_mul_add_right_with_nnan:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_fma_f32 v0, v0, v1, 1.0
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %mul = fmul nnan contract float %x, %y
  %mul.fr = freeze float %mul
  %add = fadd nnan contract float 1.000000e+00, %mul.fr
  ret float %add
}

define float @fma_from_freeze_mul_sub_left(float %x, float %y) {
; CHECK-LABEL: fma_from_freeze_mul_sub_left:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_fma_f32 v0, v0, v1, -1.0
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %mul = fmul contract float %x, %y
  %mul.fr = freeze float %mul
  %sub = fsub contract float %mul.fr, 1.000000e+00
  ret float %sub
}

define float @fma_from_freeze_mul_sub_left_with_nnan(float %x, float %y) {
; CHECK-LABEL: fma_from_freeze_mul_sub_left_with_nnan:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_fma_f32 v0, v0, v1, -1.0
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %mul = fmul nnan contract float %x, %y
  %mul.fr = freeze float %mul
  %sub = fsub nnan contract float %mul.fr, 1.000000e+00
  ret float %sub
}

define float @fma_from_freeze_mul_sub_right(float %x, float %y) {
; CHECK-LABEL: fma_from_freeze_mul_sub_right:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_fma_f32 v0, -v0, v1, 1.0
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %mul = fmul contract float %x, %y
  %mul.fr = freeze float %mul
  %sub = fsub contract float 1.000000e+00, %mul.fr
  ret float %sub
}

define float @fma_from_freeze_mul_sub_right_with_nnan(float %x, float %y) {
; CHECK-LABEL: fma_from_freeze_mul_sub_right_with_nnan:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_fma_f32 v0, -v0, v1, 1.0
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %mul = fmul nnan contract float %x, %y
  %mul.fr = freeze float %mul
  %sub = fsub nnan contract float 1.000000e+00, %mul.fr
  ret float %sub
}

define float @fma_freeze_sink_multiple_maybe_poison_nnan_add(float %x, float %y) {
; CHECK-LABEL: fma_freeze_sink_multiple_maybe_poison_nnan_add:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_dual_subrev_f32 v0, 1.0, v0 :: v_dual_add_f32 v1, 1.0, v1
; CHECK-NEXT:    s_delay_alu instid0(VALU_DEP_1)
; CHECK-NEXT:    v_fma_f32 v0, v0, v1, 1.0
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %fsub_x = fsub nnan contract float %x, 1.000000e+00
  %fadd_y = fadd nnan contract float %y, 1.000000e+00
  %mul = fmul nnan contract float %fsub_x, %fadd_y
  %mul.fr = freeze float %mul
  %add = fadd nnan contract float %mul.fr, 1.000000e+00
  ret float %add
}

define float @fma_freeze_sink_multiple_maybe_poison_nnan_sub(float %x, float %y) {
; CHECK-LABEL: fma_freeze_sink_multiple_maybe_poison_nnan_sub:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_dual_add_f32 v0, 1.0, v0 :: v_dual_add_f32 v1, -1.0, v1
; CHECK-NEXT:    s_delay_alu instid0(VALU_DEP_1)
; CHECK-NEXT:    v_fma_f32 v0, v0, v1, -1.0
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %fadd_x = fadd nnan contract float %x, 1.000000e+00
  %fsub_y = fsub nnan contract float %y, 1.000000e+00
  %mul = fmul nnan contract float %fadd_x, %fsub_y
  %mul.fr = freeze float %mul
  %sub = fsub nnan contract float %mul.fr, 1.000000e+00
  ret float %sub
}
