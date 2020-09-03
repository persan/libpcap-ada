with Ada.Text_IO; use Ada.Text_IO;
procedure PCAP.Tests.Main is
   Net : GNAT.Sockets.Inet_Addr_Type;
   Mask : GNAT.Sockets.Inet_Addr_Type;
begin
   for Dev of Find_All_Devs loop
      Look_Up_Net (Dev.Get_Device, Net, Mask);
      Put_Line (Dev & " -> " & GNAT.Sockets.Image (Net) & "/" & GNAT.Sockets.Image (Mask));
   end loop;
end PCAP.Tests.Main;
