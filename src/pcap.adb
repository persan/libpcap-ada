with Interfaces.C.Strings;
with PCAP.Low_Level.Pcap_Pcap_H;
package body PCAP is
   use all type Interfaces.C.Strings.chars_ptr;

   type Pcap_T_Impl is new PCAP.Low_Level.Pcap_Pcap_H.Pcap_T;


   --------------------
   -- Lock_Up_Device --
   --------------------

   function Lock_Up_Device return String is
      Errbuff : constant Interfaces.C.Strings.Chars_Ptr := Interfaces.C.Strings.New_String (String'(1 .. PCAP.Low_Level.Pcap_Pcap_H.PCAP_ERRBUF_SIZE  => ASCII.NUL));
      Dev     : Interfaces.C.Strings.Chars_Ptr;
   begin
      Dev := PCAP.Low_Level.Pcap_Pcap_H.Pcap_Lookupdev (Errbuff);
      if Dev =  Interfaces.C.Strings.Null_Ptr then
         raise PCAP_ERROR with Interfaces.C.Strings.Value (Errbuff);
      else
         return Interfaces.C.Strings.Value (Dev);
      end if;
   end Lock_Up_Device;

end PCAP;
