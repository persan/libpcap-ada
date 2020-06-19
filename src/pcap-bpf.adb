pragma Ada_2012;
package body PCAP.bpf is

   --------------------------
   -- filter_with_aux_data --
   --------------------------

   function filter_with_aux_data
     (arg1 : access constant insn; arg2 : access interfaces.C.unsigned_char;
      arg3 : interfaces.C.unsigned; arg4 : interfaces.C.unsigned;
      arg5 : access constant aux_data) return interfaces.C.unsigned
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "filter_with_aux_data unimplemented");
      return
        raise Program_Error with "Unimplemented function filter_with_aux_data";
   end filter_with_aux_data;

end PCAP.bpf;
