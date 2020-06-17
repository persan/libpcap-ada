with Ada.Text_IO; use Ada.Text_IO;
with Interfaces.C.Strings;
with PCAP.Low_Level.pcap_pcap_h;
procedure PCAP.Tests.Main is

begin
   Put_Line (Interfaces.C.Strings.Value (PCAP.Low_Level.pcap_pcap_h.pcap_strerror (0)));
end PCAP.Tests.Main;
