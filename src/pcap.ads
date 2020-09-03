private with Ada.Finalization;
with GNAT.Sockets;
package PCAP is
   type Pcap_T (<>) is tagged limited private;
   type If_T_Cursor (<>) is limited private;

   type If_T (<>) is tagged limited private with
     Iterable => (First        => First_Cursor,
                  Next         => Advance,
                  Has_Element  => Cursor_Has_Element,
                  Element      => Get_Element);

   function Find_All_Devs return If_T;
   function Get_Name (Self : If_T) return String;
   function Get_Description (Self : If_T) return String;

   procedure Look_Up_Net (Device : String;
                          Net    : out GNAT.Sockets.Inet_Addr_Type;
                          Mask   : out GNAT.Sockets.Inet_Addr_Type);
   --  is used to determine the IPv4 network number and
   --  mask associated with the network device


   PCAP_ERROR  : exception;

   --
   function First_Cursor (Cont : If_T) return If_T_Cursor;
   function Advance (Cont : If_T; Position : If_T_Cursor) return If_T_Cursor;
   function Cursor_Has_Element (Cont : If_T; Position : If_T_Cursor) return Boolean;
   function Get_Element (Cont : If_T; Position : If_T_Cursor) return If_T;

private
   type Pcap_T_Impl;
   type Pcap_T_Impl_access is access all Pcap_T_Impl;
   type Pcap_T is new Ada.Finalization.Limited_Controlled with record
      Impl : Pcap_T_Impl_Access;
   end record;

   type If_T_Impl;
   type If_T_Impl_access is access all If_T_Impl;
   type If_T is new Ada.Finalization.Limited_Controlled with record
      Impl : If_T_Impl_Access;
   end record;
   overriding procedure Initialize (Object : in out If_T) is null;
   overriding procedure Finalize   (Object : in out If_T);

   type If_T_Cursor (List : not null If_T_Impl_Access) is record
      Ref : If_T_Impl_Access := List;
   end record;

end PCAP;
