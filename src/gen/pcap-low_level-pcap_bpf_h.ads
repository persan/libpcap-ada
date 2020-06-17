pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;


package PCAP.Low_Level.pcap_bpf_h is

   BPF_RELEASE : constant := 199606;  --  pcap/bpf.h:82
   --  unsupported macro: BPF_ALIGNMENT sizeof(bpf_int32)
   --  arg-macro: function BPF_WORDALIGN (x)
   --    return ((x)+(BPF_ALIGNMENT-1))and~(BPF_ALIGNMENT-1);
   --  arg-macro: function BPF_CLASS (code)
   --    return (code) and 16#07#;

   BPF_LD : constant := 16#00#;  --  pcap/bpf.h:130
   BPF_LDX : constant := 16#01#;  --  pcap/bpf.h:131
   BPF_ST : constant := 16#02#;  --  pcap/bpf.h:132
   BPF_STX : constant := 16#03#;  --  pcap/bpf.h:133
   BPF_ALU : constant := 16#04#;  --  pcap/bpf.h:134
   BPF_JMP : constant := 16#05#;  --  pcap/bpf.h:135
   BPF_RET : constant := 16#06#;  --  pcap/bpf.h:136
   BPF_MISC : constant := 16#07#;  --  pcap/bpf.h:137
   --  arg-macro: function BPF_SIZE (code)
   --    return (code) and 16#18#;

   BPF_W : constant := 16#00#;  --  pcap/bpf.h:141
   BPF_H : constant := 16#08#;  --  pcap/bpf.h:142
   BPF_B : constant := 16#10#;  --  pcap/bpf.h:143
   --  arg-macro: function BPF_MODE (code)
   --    return (code) and 16#e0#;

   BPF_IMM : constant := 16#00#;  --  pcap/bpf.h:146
   BPF_ABS : constant := 16#20#;  --  pcap/bpf.h:147
   BPF_IND : constant := 16#40#;  --  pcap/bpf.h:148
   BPF_MEM : constant := 16#60#;  --  pcap/bpf.h:149
   BPF_LEN : constant := 16#80#;  --  pcap/bpf.h:150
   BPF_MSH : constant := 16#a0#;  --  pcap/bpf.h:151
   --  arg-macro: function BPF_OP (code)
   --    return (code) and 16#f0#;

   BPF_ADD : constant := 16#00#;  --  pcap/bpf.h:157
   BPF_SUB : constant := 16#10#;  --  pcap/bpf.h:158
   BPF_MUL : constant := 16#20#;  --  pcap/bpf.h:159
   BPF_DIV : constant := 16#30#;  --  pcap/bpf.h:160
   BPF_OR : constant := 16#40#;  --  pcap/bpf.h:161
   BPF_AND : constant := 16#50#;  --  pcap/bpf.h:162
   BPF_LSH : constant := 16#60#;  --  pcap/bpf.h:163
   BPF_RSH : constant := 16#70#;  --  pcap/bpf.h:164
   BPF_NEG : constant := 16#80#;  --  pcap/bpf.h:165
   BPF_MOD : constant := 16#90#;  --  pcap/bpf.h:166
   BPF_XOR : constant := 16#a0#;  --  pcap/bpf.h:167

   BPF_JA : constant := 16#00#;  --  pcap/bpf.h:174
   BPF_JEQ : constant := 16#10#;  --  pcap/bpf.h:175
   BPF_JGT : constant := 16#20#;  --  pcap/bpf.h:176
   BPF_JGE : constant := 16#30#;  --  pcap/bpf.h:177
   BPF_JSET : constant := 16#40#;  --  pcap/bpf.h:178
   --  arg-macro: function BPF_SRC (code)
   --    return (code) and 16#08#;

   BPF_K : constant := 16#00#;  --  pcap/bpf.h:191
   BPF_X : constant := 16#08#;  --  pcap/bpf.h:192
   --  arg-macro: function BPF_RVAL (code)
   --    return (code) and 16#18#;

   BPF_A : constant := 16#10#;  --  pcap/bpf.h:196
   --  arg-macro: function BPF_MISCOP (code)
   --    return (code) and 16#f8#;

   BPF_TAX : constant := 16#00#;  --  pcap/bpf.h:201

   BPF_TXA : constant := 16#80#;  --  pcap/bpf.h:218
   --  arg-macro: procedure BPF_STMT (code, k)
   --    { (u_short)(code), 0, 0, k }
   --  arg-macro: procedure BPF_JUMP (code, k, jt, jf)
   --    { (u_short)(code), jt, jf, k }

   BPF_MEMWORDS : constant := 16;  --  pcap/bpf.h:274

  ---
  -- * Copyright (c) 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997
  -- *	The Regents of the University of California.  All rights reserved.
  -- *
  -- * This code is derived from the Stanford/CMU enet packet filter,
  -- * (net/enet.c) distributed as part of 4.3BSD, and code contributed
  -- * to Berkeley by Steven McCanne and Van Jacobson both of Lawrence
  -- * Berkeley Laboratory.
  -- *
  -- * Redistribution and use in source and binary forms, with or without
  -- * modification, are permitted provided that the following conditions
  -- * are met:
  -- * 1. Redistributions of source code must retain the above copyright
  -- *    notice, this list of conditions and the following disclaimer.
  -- * 2. Redistributions in binary form must reproduce the above copyright
  -- *    notice, this list of conditions and the following disclaimer in the
  -- *    documentation and/or other materials provided with the distribution.
  -- * 3. All advertising materials mentioning features or use of this software
  -- *    must display the following acknowledgement:
  -- *      This product includes software developed by the University of
  -- *      California, Berkeley and its contributors.
  -- * 4. Neither the name of the University nor the names of its contributors
  -- *    may be used to endorse or promote products derived from this software
  -- *    without specific prior written permission.
  -- *
  -- * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
  -- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  -- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  -- * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
  -- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  -- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
  -- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
  -- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
  -- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
  -- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
  -- * SUCH DAMAGE.
  -- *
  -- *      @(#)bpf.h       7.1 (Berkeley) 5/7/91
  --  

  -- * This is libpcap's cut-down version of bpf.h; it includes only
  -- * the stuff needed for the code generator and the userland BPF
  -- * interpreter, and the libpcap APIs for setting filters, etc..
  -- *
  -- * "pcap-bpf.c" will include the native OS version, as it deals with
  -- * the OS's BPF implementation.
  -- *
  -- * At least two programs found by Google Code Search explicitly includes
  -- * <pcap/bpf.h> (even though <pcap.h>/<pcap/pcap.h> includes it for you),
  -- * so moving that stuff to <pcap/pcap.h> would break the build for some
  -- * programs.
  --  

  -- * If we've already included <net/bpf.h>, don't re-define this stuff.
  -- * We assume BSD-style multiple-include protection in <net/bpf.h>,
  -- * which is true of all but the oldest versions of FreeBSD and NetBSD,
  -- * or Tru64 UNIX-style multiple-include protection (or, at least,
  -- * Tru64 UNIX 5.x-style; I don't have earlier versions available to check),
  -- * or AIX-style multiple-include protection (or, at least, AIX 5.x-style;
  -- * I don't have earlier versions available to check), or QNX-style
  -- * multiple-include protection (as per GitHub pull request #394).
  -- *
  -- * We do not check for BPF_MAJOR_VERSION, as that's defined by
  -- * <linux/filter.h>, which is directly or indirectly included in some
  -- * programs that also include pcap.h, and <linux/filter.h> doesn't
  -- * define stuff we need.
  -- *
  -- * This also provides our own multiple-include protection.
  --  

  -- BSD style release date  
   subtype bpf_int32 is int;  -- pcap/bpf.h:88

   subtype bpf_u_int32 is unsigned;  -- pcap/bpf.h:89

  -- * Alignment macros.  BPF_WORDALIGN rounds up to the next
  -- * even multiple of BPF_ALIGNMENT.
  -- *
  -- * Tcpdump's print-pflog.c uses this, so we define it here.
  --  

  -- * Structure for "pcap_compile()", "pcap_setfilter()", etc..
  --  

   type bpf_insn;
   type bpf_program is record
      bf_len : aliased unsigned;  -- pcap/bpf.h:109
      bf_insns : access bpf_insn;  -- pcap/bpf.h:110
   end record
   with Convention => C_Pass_By_Copy;  -- pcap/bpf.h:108

  -- * The instruction encodings.
  -- *
  -- * Please inform tcpdump-workers@lists.tcpdump.org if you use any
  -- * of the reserved values, so that we can note that they're used
  -- * (and perhaps implement it in the reference BPF implementation
  -- * and encourage its implementation elsewhere).
  --  

  -- * The upper 8 bits of the opcode aren't used. BSD/OS used 0x8000.
  --  

  -- instruction classes  
  -- ld/ldx fields  
  --				0x18	reserved; used by BSD/OS  
  --				0xc0	reserved; used by BSD/OS  
  --				0xe0	reserved; used by BSD/OS  
  -- alu/jmp fields  
  --				0xb0	reserved  
  --				0xc0	reserved  
  --				0xd0	reserved  
  --				0xe0	reserved  
  --				0xf0	reserved  
  --				0x50	reserved; used on BSD/OS  
  --				0x60	reserved  
  --				0x70	reserved  
  --				0x80	reserved  
  --				0x90	reserved  
  --				0xa0	reserved  
  --				0xb0	reserved  
  --				0xc0	reserved  
  --				0xd0	reserved  
  --				0xe0	reserved  
  --				0xf0	reserved  
  -- ret - BPF_K and BPF_X also apply  
  --				0x18	reserved  
  -- misc  
  --				0x08	reserved  
  --				0x10	reserved  
  --				0x18	reserved  
  -- #define	BPF_COP		0x20	NetBSD "coprocessor" extensions  
  --				0x28	reserved  
  --				0x30	reserved  
  --				0x38	reserved  
  -- #define	BPF_COPX	0x40	NetBSD "coprocessor" extensions  
  --					also used on BSD/OS  
  --				0x48	reserved  
  --				0x50	reserved  
  --				0x58	reserved  
  --				0x60	reserved  
  --				0x68	reserved  
  --				0x70	reserved  
  --				0x78	reserved  
  --				0x88	reserved  
  --				0x90	reserved  
  --				0x98	reserved  
  --				0xa0	reserved  
  --				0xa8	reserved  
  --				0xb0	reserved  
  --				0xb8	reserved  
  --				0xc0	reserved; used on BSD/OS  
  --				0xc8	reserved  
  --				0xd0	reserved  
  --				0xd8	reserved  
  --				0xe0	reserved  
  --				0xe8	reserved  
  --				0xf0	reserved  
  --				0xf8	reserved  
  -- * The instruction data structure.
  --  

   type bpf_insn is record
      code : aliased unsigned_short;  -- pcap/bpf.h:239
      jt : aliased unsigned_char;  -- pcap/bpf.h:240
      jf : aliased unsigned_char;  -- pcap/bpf.h:241
      k : aliased bpf_u_int32;  -- pcap/bpf.h:242
   end record
   with Convention => C_Pass_By_Copy;  -- pcap/bpf.h:238

  -- * Auxiliary data, for use when interpreting a filter intended for the
  -- * Linux kernel when the kernel rejects the filter (requiring us to
  -- * run it in userland).  It contains VLAN tag information.
  --  

   type bpf_aux_data is record
      vlan_tag_present : aliased unsigned_short;  -- pcap/bpf.h:251
      vlan_tag : aliased unsigned_short;  -- pcap/bpf.h:252
   end record
   with Convention => C_Pass_By_Copy;  -- pcap/bpf.h:250

  -- * Macros for insn array initializers.
  --  

   function bpf_filter_with_aux_data
     (arg1 : access constant bpf_insn;
      arg2 : access unsigned_char;
      arg3 : unsigned;
      arg4 : unsigned;
      arg5 : access constant bpf_aux_data) return unsigned  -- pcap/bpf.h:264
   with Import => True, 
        Convention => C, 
        External_Name => "bpf_filter_with_aux_data";

  -- * Number of scratch memory words (for BPF_LD|BPF_MEM and BPF_ST).
  --  

end PCAP.Low_Level.pcap_bpf_h;
