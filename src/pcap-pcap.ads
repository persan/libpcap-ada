private with Ada.Finalization;
with System;
with Interfaces.C_Streams;
pragma Warnings (Off); with System.OS_Interface; pragma Warnings (On);
with PCAP.Bpf;
private with Pcap.Low_Level.Pcap_Pcap_H;
package PCAP.PCAP is
   type Pcap_T (<>) is tagged private;

   function Loock_Up_Dev return String;
   --  find the default device on which to capture
   --  returns a string giving the name of a network device suitable for use
   --  with create() and activate(), or with open_live(),
   --  and with Lockup_Net()
   type Net_Address is mod 2 ** 32;
   type Net_Mask is mod 2 ** 32;

   procedure Loockup_Net (Device : String ; Net : out Net_Address; Mask : out Net_Mask);
   --  Find the IPv4 network number and netmask for a device
   --  Determine the IPv4 network number and mask associated with the network device device.




   procedure Create (Arg1 : String; Arg2 : String);

   type int is new Integer;
   type Unsigned is mod 2 ** 32;

   procedure Set_Snaplen (Arg1 : in out Pcap_T; Arg2 : int);




   procedure Set_Promisc (Arg1 : in out Pcap_T; Arg2 : int);




   procedure Can_Set_Rfmon (Arg1 : in out Pcap_T);




   procedure Set_Rfmon (Arg1 : in out Pcap_T; Arg2 : int);




   procedure Set_Timeout (Arg1 : in out Pcap_T; Arg2 : int);




   procedure Set_Tstamp_Type (Arg1 : in out Pcap_T; Arg2 : int);




   procedure Set_Immediate_Mode (Arg1 : in out Pcap_T; Arg2 : int);




   procedure Set_Buffer_Size (Arg1 : in out Pcap_T; Arg2 : int);




   procedure Set_Tstamp_Precision (Arg1 : in out Pcap_T; Arg2 : int);




   procedure Get_Tstamp_Precision (Arg1 : in out Pcap_T);




   procedure Activate (Arg1 : in out Pcap_T);




   procedure List_Tstamp_Types (Arg1 : in out Pcap_T; Arg2 : System.Address);




   procedure Pcap_Free_Tstamp_Types (Arg1 : access int);




   procedure Tstamp_Type_Name_To_Val (Arg1 : String);




   procedure Tstamp_Type_Val_To_Name (Arg1 : int);




   procedure Tstamp_Type_Val_To_Description (Arg1 : int);



   procedure Open_Live
     (Arg1 : String;
      Arg2 : int;
      Arg3 : int;
      Arg4 : int;
      Arg5 : String);




   procedure Open_Dead (Arg1 : int; Arg2 : int);




   procedure Open_Dead_With_Tstamp_Precision
     (Arg1 : int;
      Arg2 : int;
      Arg3 : Unsigned);




   procedure Open_Offline_With_Tstamp_Precision
     (Arg1 : String;
      Arg2 : Unsigned;
      Arg3 : String);




   procedure Open_Offline (Arg1 : String; Arg2 : String);




   procedure Fopen_Offline_With_Tstamp_Precision
     (Arg1 : Interfaces.C_Streams.FILEs;
      Arg2 : Unsigned;
      Arg3 : String);

   procedure Fopen_Offline (Arg1 : Interfaces.C_Streams.FILEs; Arg2 : String);

   procedure Close (Arg1 : in out Pcap_T);
   type Unsigned_Char is mod 2 ** 8;

   type Pcap_Pkthdr is record
      Ts     : aliased System.OS_Interface.Timeval;  -- pcap/pcap.h:163
      Caplen : aliased Unsigned;  -- pcap/pcap.h:164
      Len    : aliased Unsigned;  -- pcap/pcap.h:165
   end record;
   type Pcap_Handler is access procedure
     (Arg1 : access Unsigned_Char;
      Arg2 : access constant Pcap_Pkthdr;
      Arg3 : access Unsigned_Char)
     with Convention => C;



   procedure Pcap_Loop
     (Arg1 : in out Pcap_T;
      Arg2 : int;
      Arg3 : Pcap_Handler;
      Arg4 : access Unsigned_Char);




   procedure Dispatch
     (Arg1 : in out Pcap_T;
      Arg2 : int;
      Arg3 : Pcap_Handler;
      Arg4 : access Unsigned_Char);




   procedure Next (Arg1 : in out Pcap_T; Arg2 : access Pcap_Pkthdr);




   procedure Next_Ex
     (Arg1 : in out Pcap_T;
      Arg2 : System.Address;
      Arg3 : System.Address);




   procedure Pcap_Breakloop (Arg1 : in out Pcap_T);


   type Pcap_Stat is record
      Ps_Recv   : aliased Unsigned;  -- pcap/pcap.h:172
      Ps_Drop   : aliased Unsigned;  -- pcap/pcap.h:173
      Ps_Ifdrop : aliased Unsigned;  -- pcap/pcap.h:174
   end record
     with Convention => C;

   procedure Stats (Arg1 : in out Pcap_T; Arg2 : access Pcap_Stat);




   procedure Setfilter (Arg1 : in out Pcap_T; Arg2 : access Bpf.Program);


   type Direction_T is new Integer;

   procedure Setdirection (Arg1 : in out Pcap_T; Arg2 : Direction_T);




   procedure Getnonblock (Arg1 : in out Pcap_T; Arg2 : String);




   procedure Setnonblock
     (Arg1 : in out Pcap_T;
      Arg2 : int;
      Arg3 : String);



   type size_t is new Integer;
   procedure Inject
     (Arg1 : in out Pcap_T;
      Arg2 : System.Address;
      Arg3 : size_t);




   procedure Sendpacket
     (Arg1 : in out Pcap_T;
      Arg2 : access Unsigned_Char;
      Arg3 : int);




   procedure Statustostr (Arg1 : int);




   procedure Strerror (Arg1 : int);




   procedure Geterr (Arg1 : in out Pcap_T);




   procedure Pcap_Perror (Arg1 : in out Pcap_T; Arg2 : String);




   procedure Compile
     (Arg1 : in out Pcap_T;
      Arg2 : access Bpf.Program;
      Arg3 : String;
      Arg4 : int;
      Arg5 : Unsigned);




   procedure Compile_Nopcap
     (Arg1 : int;
      Arg2 : int;
      Arg3 : access Bpf.Program;
      Arg4 : String;
      Arg5 : int;
      Arg6 : Bpf.U_Int32);




   procedure Pcap_Freecode (Arg1 : access Bpf.Program);




   procedure Offline_Filter
     (Arg1 : Bpf.Program;
      Arg2 : Pcap_Pkthdr;
      Arg3 : access Unsigned_Char);




   procedure Datalink (Arg1 : in out Pcap_T);




   procedure Datalink_Ext (Arg1 : in out Pcap_T);




   procedure List_Datalinks (Arg1 : in out Pcap_T; Arg2 : System.Address);




   procedure Set_Datalink (Arg1 : in out Pcap_T; Arg2 : int);




   procedure Pcap_Free_Datalinks (Arg1 : access int);




   procedure Datalink_Name_To_Val (Arg1 : String);




   procedure Datalink_Val_To_Name (Arg1 : int);




   procedure Datalink_Val_To_Description (Arg1 : int);




   procedure Snapshot (Arg1 : in out Pcap_T);




   procedure Is_Swapped (Arg1 : in out Pcap_T);




   procedure Major_Version (Arg1 : in out Pcap_T);




   procedure Minor_Version (Arg1 : in out Pcap_T);




   -- XXX
   procedure File (Arg1 : in out Pcap_T);




   procedure Fileno (Arg1 : in out Pcap_T);




   procedure Dump_Open (Arg1 : in out Pcap_T; Arg2 : String);




   procedure Dump_Fopen (Arg1 : in out Pcap_T; Arg2 : Interfaces.C_Streams.FILEs);




   procedure Dump_Open_Append (Arg1 : in out Pcap_T; Arg2 : String);


   type Dumper is null record;

   procedure Dump_File (Arg1 : access Dumper);




   procedure Dump_Ftell (Arg1 : access Dumper);




   procedure Dump_Flush (Arg1 : access Dumper);




   procedure Pcap_Dump_Close (Arg1 : access Dumper);




   procedure Pcap_Dump
     (Arg1 : access Unsigned_Char;
      Arg2 : Pcap_Pkthdr;
      Arg3 : access Unsigned_Char);




   procedure Findalldevs (Arg1 : System.Address; Arg2 : String);


   type Pcap_If is private;

   procedure Pcap_Freealldevs (Arg1 : access Pcap_If);




   function Lib_Version return String;


   procedure Bpf_Filter
     (Arg1 : Bpf.Insn;
      Arg2 : access Unsigned_Char;
      Arg3 : Unsigned;
      Arg4 : Unsigned);




   procedure Bpf_Validate (Arg1 : Bpf.Insn; Arg2 : int);




   procedure Bpf_Image (Arg1 : Bpf.Insn; Arg2 : int);




   procedure Bpf_Dump (Arg1 : Bpf.Program; Arg2 : int);




   procedure Get_Selectable_Fd (Arg1 : in out Pcap_T);

   PCAP_ERROR  : exception;

private
   type Pcap_If is new Standard.Pcap.Low_Level.Pcap_Pcap_H.Pcap_If;

   type Pcap_T_Impl;
   type Pcap_T_Impl_Access is access all Pcap_T_Impl;
   type Pcap_T is new Ada.Finalization.Controlled with record
      Impl : Pcap_T_Impl_Access;
   end record;

end PCAP.PCAP;
