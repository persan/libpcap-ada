private with Ada.Finalization;
package PCAP is
   type Pcap_T (<>) is tagged private;

   function Lock_Up_Device return String;
   PCAP_ERROR  : exception;

private
   type Pcap_T_Impl;
   type Pcap_T_Impl_access is access all Pcap_T_Impl;
   type Pcap_T is new Ada.Finalization.Controlled with record
      Impl : Pcap_T_Impl_Access;
   end record;

end PCAP;
