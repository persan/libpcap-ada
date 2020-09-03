with Interfaces.C.Strings;
with PCAP.Low_Level.Pcap_Pcap_H;
with Ada.Unchecked_Conversion;
with System;
package body PCAP is
   type Errbuffer_T is new String (1 .. PCAP.Low_Level.Pcap_Pcap_H.PCAP_ERRBUF_SIZE) with
     Default_Component_Value => ASCII.NUL;

   function To_C ( Item : aliased Errbuffer_T) return Interfaces.C.Strings.Chars_Ptr is
      function Conv is new Ada.Unchecked_Conversion (System.Address, Interfaces.C.Strings.Chars_Ptr);
   begin
      return Conv (Item (Item'First)'Address);
   end;

   use PCAP.Low_Level.Pcap_Pcap_H;
   use all type Interfaces.C.Strings.chars_ptr;
   use Interfaces.C;
   use Interfaces.C.Strings;

   type Pcap_T_Impl is new PCAP.Low_Level.Pcap_Pcap_H.Pcap_T;
   type If_T_Impl is new PCAP.Low_Level.Pcap_Pcap_H.Pcap_If_T;

   type Pcap_If_T_Access is access all Pcap_If_T with Storage_Size => 0;
   function To_Low_Level is new Ada.Unchecked_Conversion (If_T_Impl_Access, Pcap_If_T_Access);
   function To_High_Level is new Ada.Unchecked_Conversion (Pcap_If_T_Access, If_T_Impl_Access);

   function Find_All_Devs return If_T is
      Data      : aliased Pcap_If_T_Access;
      Errbuffer : aliased Errbuffer_T;
      Ret       : Int;
   begin
      Ret := Pcap_Findalldevs (Data'Address, To_C (Errbuffer));
      if Ret /=  0 then
         raise PCAP_ERROR with Ret'Img & ":" & Interfaces.C.Strings.Value (To_C (Errbuffer));
      end if;
      return Ret : If_T do
         Ret.Impl := To_High_Level (Data);
      end return;
   end;

   overriding procedure Finalize (Object : in out If_T) is
   begin
      Pcap_Freealldevs (To_Low_Level (Object.Impl));
   end;

   function First_Cursor (Cont : If_T) return If_T_Cursor is
   begin
      return Ret : If_T_Cursor(Cont.Impl) do
         null;
      end return;
   end;

   function Advance (Cont : If_T; Position : If_T_Cursor) return If_T_Cursor is
   begin
      return Ret : If_T_Cursor := Position do
         Ret.Ref := To_High_Level (Ret.Ref.all.Next);
      end return;
   end;

   function Cursor_Has_Element (Cont : If_T; Position : If_T_Cursor) return Boolean is
   begin
      return Position.Ref /= null;
   end;

   function Get_Element (Cont : If_T; Position : If_T_Cursor) return If_T is
   begin
      return Ret : If_T := If_T_Cursor do
         null;
      end return;
   end ;

   function Get_Name (Self : If_T) return String is
   begin
      return Value (Self.Impl.Name);
   end;

   function Get_description (Self : If_T) return String is
   begin
      return Value (Self.Impl.Description);
   end;

   --------------------
   -- Lock_Up_Device --
   --------------------

   function Lock_Up_Device return String is
      Errbuff : aliased Errbuffer_T;
      Dev     : Interfaces.C.Strings.Chars_Ptr;
   begin
      Dev := PCAP.Low_Level.Pcap_Pcap_H.Pcap_Lookupdev (to_c(Errbuff));
      if Dev =  Interfaces.C.Strings.Null_Ptr then
         raise PCAP_ERROR with Interfaces.C.Strings.Value (To_C (Errbuff));
      else
         return Interfaces.C.Strings.Value (Dev);
      end if;
   end Lock_Up_Device;

   -----------------
   -- Look_Up_Net --
   -----------------

   procedure Look_Up_Net
     (Device :     String;
      Net    : out GNAT.Sockets.Inet_Addr_Type;
      Mask   : out GNAT.Sockets.Inet_Addr_Type)
   is
      Dev     : Chars_Ptr := Interfaces.C.Strings.New_String (Device);
      Errbuff : aliased Errbuffer_T;
      Ret     : Int;
      L_Net   : aliased Unsigned with Address => Net.Sin_V4 (Net.Sin_V4'First)'Address;
      L_Mask  : aliased Unsigned with Address => Mask.Sin_V4 (Mask.Sin_V4'First)'Address;
   begin
      Ret := PCAP.Low_Level.Pcap_Pcap_H.Pcap_Lookupnet (Dev, L_Net'Access, L_Mask'Access, To_C (Errbuff));
      Interfaces.C.Strings.Free (Dev);
      if Ret /=  0 then
         raise PCAP_ERROR with Ret'Img & ":" & Interfaces.C.Strings.Value (to_c(Errbuff));
      end if;
   end Look_Up_Net;

end PCAP;
