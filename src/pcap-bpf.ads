with interfaces.C;
package PCAP.bpf is

   BPF_RELEASE : constant := 199606;






   BPF_LD : constant := 16#00#;
   BPF_LDX : constant := 16#01#;
   BPF_ST : constant := 16#02#;
   BPF_STX : constant := 16#03#;
   BPF_ALU : constant := 16#04#;
   BPF_JMP : constant := 16#05#;
   BPF_RET : constant := 16#06#;
   BPF_MISC : constant := 16#07#;



   BPF_W : constant := 16#00#;
   BPF_H : constant := 16#08#;
   BPF_B : constant := 16#10#;



   BPF_IMM : constant := 16#00#;
   BPF_ABS : constant := 16#20#;
   BPF_IND : constant := 16#40#;
   BPF_MEM : constant := 16#60#;
   BPF_LEN : constant := 16#80#;
   BPF_MSH : constant := 16#a0#;



   BPF_ADD : constant := 16#00#;
   BPF_SUB : constant := 16#10#;
   BPF_MUL : constant := 16#20#;
   BPF_DIV : constant := 16#30#;
   BPF_OR : constant := 16#40#;
   BPF_AND : constant := 16#50#;
   BPF_LSH : constant := 16#60#;
   BPF_RSH : constant := 16#70#;
   BPF_NEG : constant := 16#80#;
   BPF_MOD : constant := 16#90#;
   BPF_XOR : constant := 16#a0#;

   BPF_JA : constant := 16#00#;
   BPF_JEQ : constant := 16#10#;
   BPF_JGT : constant := 16#20#;
   BPF_JGE : constant := 16#30#;
   BPF_JSET : constant := 16#40#;



   BPF_K : constant := 16#00#;
   BPF_X : constant := 16#08#;



   BPF_A : constant := 16#10#;



   BPF_TAX : constant := 16#00#;

   BPF_TXA : constant := 16#80#;





   BPF_MEMWORDS : constant := 16;
   subtype int32 is interfaces.C.int;

   subtype u_int32 is interfaces.C.unsigned;


   type insn;
   type program is record
      bf_len : aliased interfaces.C.unsigned;
      bf_insns : access insn;
   end record
   with Convention => C;


   type insn is record
      code : aliased interfaces.C.unsigned_short;
      jt : aliased interfaces.C.unsigned_char;
      jf : aliased interfaces.C.unsigned_char;
      k : aliased u_int32;
   end record
   with Convention => C;






   type aux_data is record
      vlan_tag_present : aliased interfaces.C.unsigned_short;
      vlan_tag : aliased interfaces.C.unsigned_short;
   end record
   with Convention => C;




   function filter_with_aux_data
     (arg1 : access constant insn;
      arg2 : access interfaces.C.unsigned_char;
      arg3 : interfaces.C.unsigned;
      arg4 : interfaces.C.unsigned;
      arg5 : access constant aux_data) return interfaces.C.unsigned;




end PCAP.bpf;
