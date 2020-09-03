pragma Ada_2012;
with Interfaces.C;
with Interfaces.C.Strings;
package body PCAP.PCAP is
   use all type Interfaces.C.Strings.chars_ptr;
   use Standard.PCAP.Low_Level;
   type Pcap_T_Impl is new Pcap_Pcap_H.Pcap_T;


   --------------------
   -- Lock_Up_Device --
   --------------------

   function Loock_Up_Dev return String is
      Errbuff : Interfaces.C.Strings.Chars_Ptr := Interfaces.C.Strings.New_String (String'(1 .. Pcap_Pcap_H.PCAP_ERRBUF_SIZE  => ASCII.NUL));
      Dev     : Interfaces.C.Strings.Chars_Ptr;
   begin
      Dev := Pcap_Pcap_H.Pcap_Lookupdev (Errbuff);
      if Dev =  Interfaces.C.Strings.Null_Ptr then
         raise PCAP_ERROR with Interfaces.C.Strings.Value (Errbuff);
      else
         free(Errbuff);
         return Interfaces.C.Strings.Value (Dev);
      end if;
   end Loock_Up_Dev;

   -----------------
   -- Loockup_Net --
   -----------------

   procedure Loockup_Net
     (Device : String; Net : out Net_Address; Mask : out Net_Mask)
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Loockup_Net unimplemented");
      raise Program_Error with "Unimplemented procedure Loockup_Net";
   end Loockup_Net;

   ------------
   -- Create --
   ------------

   procedure Create (Arg1 : String; Arg2 : String) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Create unimplemented");
      raise Program_Error with "Unimplemented procedure Create";
   end Create;

   -----------------
   -- Set_Snaplen --
   -----------------

   procedure Set_Snaplen (Arg1 : in out Pcap_T; Arg2 : int) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Set_Snaplen unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Snaplen";
   end Set_Snaplen;

   -----------------
   -- Set_Promisc --
   -----------------

   procedure Set_Promisc (Arg1 : in out Pcap_T; Arg2 : int) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Set_Promisc unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Promisc";
   end Set_Promisc;

   -------------------
   -- Can_Set_Rfmon --
   -------------------

   procedure Can_Set_Rfmon (Arg1 : in out Pcap_T) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Can_Set_Rfmon unimplemented");
      raise Program_Error with "Unimplemented procedure Can_Set_Rfmon";
   end Can_Set_Rfmon;

   ---------------
   -- Set_Rfmon --
   ---------------

   procedure Set_Rfmon (Arg1 : in out Pcap_T; Arg2 : int) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Set_Rfmon unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Rfmon";
   end Set_Rfmon;

   -----------------
   -- Set_Timeout --
   -----------------

   procedure Set_Timeout (Arg1 : in out Pcap_T; Arg2 : int) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Set_Timeout unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Timeout";
   end Set_Timeout;

   ---------------------
   -- Set_Tstamp_Type --
   ---------------------

   procedure Set_Tstamp_Type (Arg1 : in out Pcap_T; Arg2 : int) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Set_Tstamp_Type unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Tstamp_Type";
   end Set_Tstamp_Type;

   ------------------------
   -- Set_Immediate_Mode --
   ------------------------

   procedure Set_Immediate_Mode (Arg1 : in out Pcap_T; Arg2 : int) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Set_Immediate_Mode unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Immediate_Mode";
   end Set_Immediate_Mode;

   ---------------------
   -- Set_Buffer_Size --
   ---------------------

   procedure Set_Buffer_Size (Arg1 : in out Pcap_T; Arg2 : int) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Set_Buffer_Size unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Buffer_Size";
   end Set_Buffer_Size;

   --------------------------
   -- Set_Tstamp_Precision --
   --------------------------

   procedure Set_Tstamp_Precision (Arg1 : in out Pcap_T; Arg2 : int) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Set_Tstamp_Precision unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Tstamp_Precision";
   end Set_Tstamp_Precision;

   --------------------------
   -- Get_Tstamp_Precision --
   --------------------------

   procedure Get_Tstamp_Precision (Arg1 : in out Pcap_T) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Get_Tstamp_Precision unimplemented");
      raise Program_Error with "Unimplemented procedure Get_Tstamp_Precision";
   end Get_Tstamp_Precision;

   --------------
   -- Activate --
   --------------

   procedure Activate (Arg1 : in out Pcap_T) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Activate unimplemented");
      raise Program_Error with "Unimplemented procedure Activate";
   end Activate;

   -----------------------
   -- List_Tstamp_Types --
   -----------------------

   procedure List_Tstamp_Types (Arg1 : in out Pcap_T; Arg2 : System.Address) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "List_Tstamp_Types unimplemented");
      raise Program_Error with "Unimplemented procedure List_Tstamp_Types";
   end List_Tstamp_Types;

   ----------------------------
   -- Pcap_Free_Tstamp_Types --
   ----------------------------

   procedure Pcap_Free_Tstamp_Types (Arg1 : access int) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Pcap_Free_Tstamp_Types unimplemented");
      raise Program_Error
        with "Unimplemented procedure Pcap_Free_Tstamp_Types";
   end Pcap_Free_Tstamp_Types;

   -----------------------------
   -- Tstamp_Type_Name_To_Val --
   -----------------------------

   procedure Tstamp_Type_Name_To_Val (Arg1 : String) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Tstamp_Type_Name_To_Val unimplemented");
      raise Program_Error
        with "Unimplemented procedure Tstamp_Type_Name_To_Val";
   end Tstamp_Type_Name_To_Val;

   -----------------------------
   -- Tstamp_Type_Val_To_Name --
   -----------------------------

   procedure Tstamp_Type_Val_To_Name (Arg1 : int) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Tstamp_Type_Val_To_Name unimplemented");
      raise Program_Error
        with "Unimplemented procedure Tstamp_Type_Val_To_Name";
   end Tstamp_Type_Val_To_Name;

   ------------------------------------
   -- Tstamp_Type_Val_To_Description --
   ------------------------------------

   procedure Tstamp_Type_Val_To_Description (Arg1 : int) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Tstamp_Type_Val_To_Description unimplemented");
      raise Program_Error
        with "Unimplemented procedure Tstamp_Type_Val_To_Description";
   end Tstamp_Type_Val_To_Description;

   ---------------
   -- Open_Live --
   ---------------

   procedure Open_Live
     (Arg1 : String; Arg2 : int; Arg3 : int; Arg4 : int; Arg5 : String)
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Open_Live unimplemented");
      raise Program_Error with "Unimplemented procedure Open_Live";
   end Open_Live;

   ---------------
   -- Open_Dead --
   ---------------

   procedure Open_Dead (Arg1 : int; Arg2 : int) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Open_Dead unimplemented");
      raise Program_Error with "Unimplemented procedure Open_Dead";
   end Open_Dead;

   -------------------------------------
   -- Open_Dead_With_Tstamp_Precision --
   -------------------------------------

   procedure Open_Dead_With_Tstamp_Precision
     (Arg1 : int; Arg2 : int; Arg3 : Unsigned)
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Open_Dead_With_Tstamp_Precision unimplemented");
      raise Program_Error
        with "Unimplemented procedure Open_Dead_With_Tstamp_Precision";
   end Open_Dead_With_Tstamp_Precision;

   ----------------------------------------
   -- Open_Offline_With_Tstamp_Precision --
   ----------------------------------------

   procedure Open_Offline_With_Tstamp_Precision
     (Arg1 : String; Arg2 : Unsigned; Arg3 : String)
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Open_Offline_With_Tstamp_Precision unimplemented");
      raise Program_Error
        with "Unimplemented procedure Open_Offline_With_Tstamp_Precision";
   end Open_Offline_With_Tstamp_Precision;

   ------------------
   -- Open_Offline --
   ------------------

   procedure Open_Offline (Arg1 : String; Arg2 : String) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Open_Offline unimplemented");
      raise Program_Error with "Unimplemented procedure Open_Offline";
   end Open_Offline;

   -----------------------------------------
   -- Fopen_Offline_With_Tstamp_Precision --
   -----------------------------------------

   procedure Fopen_Offline_With_Tstamp_Precision
     (Arg1 : Interfaces.C_Streams.FILEs; Arg2 : Unsigned; Arg3 : String)
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Fopen_Offline_With_Tstamp_Precision unimplemented");
      raise Program_Error
        with "Unimplemented procedure Fopen_Offline_With_Tstamp_Precision";
   end Fopen_Offline_With_Tstamp_Precision;

   -------------------
   -- Fopen_Offline --
   -------------------

   procedure Fopen_Offline (Arg1 : Interfaces.C_Streams.FILEs; Arg2 : String)
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Fopen_Offline unimplemented");
      raise Program_Error with "Unimplemented procedure Fopen_Offline";
   end Fopen_Offline;

   -----------
   -- Close --
   -----------

   procedure Close (Arg1 : in out Pcap_T) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Close unimplemented");
      raise Program_Error with "Unimplemented procedure Close";
   end Close;

   ---------------
   -- Pcap_Loop --
   ---------------

   procedure Pcap_Loop
     (Arg1 : in out Pcap_T; Arg2 : int; Arg3 : Pcap_Handler;
      Arg4 :        access Unsigned_Char)
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Pcap_Loop unimplemented");
      raise Program_Error with "Unimplemented procedure Pcap_Loop";
   end Pcap_Loop;

   --------------
   -- Dispatch --
   --------------

   procedure Dispatch
     (Arg1 : in out Pcap_T; Arg2 : int; Arg3 : Pcap_Handler;
      Arg4 :        access Unsigned_Char)
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Dispatch unimplemented");
      raise Program_Error with "Unimplemented procedure Dispatch";
   end Dispatch;

   ----------
   -- Next --
   ----------

   procedure Next (Arg1 : in out Pcap_T; Arg2 : access Pcap_Pkthdr) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Next unimplemented");
      raise Program_Error with "Unimplemented procedure Next";
   end Next;

   -------------
   -- Next_Ex --
   -------------

   procedure Next_Ex
     (Arg1 : in out Pcap_T; Arg2 : System.Address; Arg3 : System.Address)
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Next_Ex unimplemented");
      raise Program_Error with "Unimplemented procedure Next_Ex";
   end Next_Ex;

   --------------------
   -- Pcap_Breakloop --
   --------------------

   procedure Pcap_Breakloop (Arg1 : in out Pcap_T) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Pcap_Breakloop unimplemented");
      raise Program_Error with "Unimplemented procedure Pcap_Breakloop";
   end Pcap_Breakloop;

   -----------
   -- Stats --
   -----------

   procedure Stats (Arg1 : in out Pcap_T; Arg2 : access Pcap_Stat) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Stats unimplemented");
      raise Program_Error with "Unimplemented procedure Stats";
   end Stats;

   ---------------
   -- Setfilter --
   ---------------

   procedure Setfilter (Arg1 : in out Pcap_T; Arg2 : access Bpf.Program) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Setfilter unimplemented");
      raise Program_Error with "Unimplemented procedure Setfilter";
   end Setfilter;

   ------------------
   -- Setdirection --
   ------------------

   procedure Setdirection (Arg1 : in out Pcap_T; Arg2 : Direction_T) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Setdirection unimplemented");
      raise Program_Error with "Unimplemented procedure Setdirection";
   end Setdirection;

   -----------------
   -- Getnonblock --
   -----------------

   procedure Getnonblock (Arg1 : in out Pcap_T; Arg2 : String) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Getnonblock unimplemented");
      raise Program_Error with "Unimplemented procedure Getnonblock";
   end Getnonblock;

   -----------------
   -- Setnonblock --
   -----------------

   procedure Setnonblock (Arg1 : in out Pcap_T; Arg2 : int; Arg3 : String) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Setnonblock unimplemented");
      raise Program_Error with "Unimplemented procedure Setnonblock";
   end Setnonblock;

   ------------
   -- Inject --
   ------------

   procedure Inject
     (Arg1 : in out Pcap_T; Arg2 : System.Address; Arg3 : size_t)
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Inject unimplemented");
      raise Program_Error with "Unimplemented procedure Inject";
   end Inject;

   ----------------
   -- Sendpacket --
   ----------------

   procedure Sendpacket
     (Arg1 : in out Pcap_T; Arg2 : access Unsigned_Char; Arg3 : int)
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Sendpacket unimplemented");
      raise Program_Error with "Unimplemented procedure Sendpacket";
   end Sendpacket;

   -----------------
   -- Statustostr --
   -----------------

   procedure Statustostr (Arg1 : int) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Statustostr unimplemented");
      raise Program_Error with "Unimplemented procedure Statustostr";
   end Statustostr;

   --------------
   -- Strerror --
   --------------

   procedure Strerror (Arg1 : int) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Strerror unimplemented");
      raise Program_Error with "Unimplemented procedure Strerror";
   end Strerror;

   ------------
   -- Geterr --
   ------------

   procedure Geterr (Arg1 : in out Pcap_T) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Geterr unimplemented");
      raise Program_Error with "Unimplemented procedure Geterr";
   end Geterr;

   -----------------
   -- Pcap_Perror --
   -----------------

   procedure Pcap_Perror (Arg1 : in out Pcap_T; Arg2 : String) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Pcap_Perror unimplemented");
      raise Program_Error with "Unimplemented procedure Pcap_Perror";
   end Pcap_Perror;

   -------------
   -- Compile --
   -------------

   procedure Compile
     (Arg1 : in out Pcap_T; Arg2 : access Bpf.Program; Arg3 : String;
      Arg4 :        int; Arg5 : Unsigned)
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Compile unimplemented");
      raise Program_Error with "Unimplemented procedure Compile";
   end Compile;

   --------------------
   -- Compile_Nopcap --
   --------------------

   procedure Compile_Nopcap
     (Arg1 : int; Arg2 : int; Arg3 : access Bpf.Program; Arg4 : String;
      Arg5 : int; Arg6 : Bpf.U_Int32)
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Compile_Nopcap unimplemented");
      raise Program_Error with "Unimplemented procedure Compile_Nopcap";
   end Compile_Nopcap;

   -------------------
   -- Pcap_Freecode --
   -------------------

   procedure Pcap_Freecode (Arg1 : access Bpf.Program) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Pcap_Freecode unimplemented");
      raise Program_Error with "Unimplemented procedure Pcap_Freecode";
   end Pcap_Freecode;

   --------------------
   -- Offline_Filter --
   --------------------

   procedure Offline_Filter
     (Arg1 : Bpf.Program; Arg2 : Pcap_Pkthdr; Arg3 : access Unsigned_Char)
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Offline_Filter unimplemented");
      raise Program_Error with "Unimplemented procedure Offline_Filter";
   end Offline_Filter;

   --------------
   -- Datalink --
   --------------

   procedure Datalink (Arg1 : in out Pcap_T) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Datalink unimplemented");
      raise Program_Error with "Unimplemented procedure Datalink";
   end Datalink;

   ------------------
   -- Datalink_Ext --
   ------------------

   procedure Datalink_Ext (Arg1 : in out Pcap_T) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Datalink_Ext unimplemented");
      raise Program_Error with "Unimplemented procedure Datalink_Ext";
   end Datalink_Ext;

   --------------------
   -- List_Datalinks --
   --------------------

   procedure List_Datalinks (Arg1 : in out Pcap_T; Arg2 : System.Address) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "List_Datalinks unimplemented");
      raise Program_Error with "Unimplemented procedure List_Datalinks";
   end List_Datalinks;

   ------------------
   -- Set_Datalink --
   ------------------

   procedure Set_Datalink (Arg1 : in out Pcap_T; Arg2 : int) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Set_Datalink unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Datalink";
   end Set_Datalink;

   -------------------------
   -- Pcap_Free_Datalinks --
   -------------------------

   procedure Pcap_Free_Datalinks (Arg1 : access int) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Pcap_Free_Datalinks unimplemented");
      raise Program_Error with "Unimplemented procedure Pcap_Free_Datalinks";
   end Pcap_Free_Datalinks;

   --------------------------
   -- Datalink_Name_To_Val --
   --------------------------

   procedure Datalink_Name_To_Val (Arg1 : String) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Datalink_Name_To_Val unimplemented");
      raise Program_Error with "Unimplemented procedure Datalink_Name_To_Val";
   end Datalink_Name_To_Val;

   --------------------------
   -- Datalink_Val_To_Name --
   --------------------------

   procedure Datalink_Val_To_Name (Arg1 : int) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Datalink_Val_To_Name unimplemented");
      raise Program_Error with "Unimplemented procedure Datalink_Val_To_Name";
   end Datalink_Val_To_Name;

   ---------------------------------
   -- Datalink_Val_To_Description --
   ---------------------------------

   procedure Datalink_Val_To_Description (Arg1 : int) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Datalink_Val_To_Description unimplemented");
      raise Program_Error
        with "Unimplemented procedure Datalink_Val_To_Description";
   end Datalink_Val_To_Description;

   --------------
   -- Snapshot --
   --------------

   procedure Snapshot (Arg1 : in out Pcap_T) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Snapshot unimplemented");
      raise Program_Error with "Unimplemented procedure Snapshot";
   end Snapshot;

   ----------------
   -- Is_Swapped --
   ----------------

   procedure Is_Swapped (Arg1 : in out Pcap_T) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Is_Swapped unimplemented");
      raise Program_Error with "Unimplemented procedure Is_Swapped";
   end Is_Swapped;

   -------------------
   -- Major_Version --
   -------------------

   procedure Major_Version (Arg1 : in out Pcap_T) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Major_Version unimplemented");
      raise Program_Error with "Unimplemented procedure Major_Version";
   end Major_Version;

   -------------------
   -- Minor_Version --
   -------------------

   procedure Minor_Version (Arg1 : in out Pcap_T) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Minor_Version unimplemented");
      raise Program_Error with "Unimplemented procedure Minor_Version";
   end Minor_Version;

   ----------
   -- File --
   ----------

   procedure File (Arg1 : in out Pcap_T) is
   begin
      pragma Compile_Time_Warning (Standard.True, "File unimplemented");
      raise Program_Error with "Unimplemented procedure File";
   end File;

   ------------
   -- Fileno --
   ------------

   procedure Fileno (Arg1 : in out Pcap_T) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Fileno unimplemented");
      raise Program_Error with "Unimplemented procedure Fileno";
   end Fileno;

   ---------------
   -- Dump_Open --
   ---------------

   procedure Dump_Open (Arg1 : in out Pcap_T; Arg2 : String) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Dump_Open unimplemented");
      raise Program_Error with "Unimplemented procedure Dump_Open";
   end Dump_Open;

   ----------------
   -- Dump_Fopen --
   ----------------

   procedure Dump_Fopen
     (Arg1 : in out Pcap_T; Arg2 : Interfaces.C_Streams.FILEs)
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Dump_Fopen unimplemented");
      raise Program_Error with "Unimplemented procedure Dump_Fopen";
   end Dump_Fopen;

   ----------------------
   -- Dump_Open_Append --
   ----------------------

   procedure Dump_Open_Append (Arg1 : in out Pcap_T; Arg2 : String) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Dump_Open_Append unimplemented");
      raise Program_Error with "Unimplemented procedure Dump_Open_Append";
   end Dump_Open_Append;

   ---------------
   -- Dump_File --
   ---------------

   procedure Dump_File (Arg1 : access Dumper) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Dump_File unimplemented");
      raise Program_Error with "Unimplemented procedure Dump_File";
   end Dump_File;

   ----------------
   -- Dump_Ftell --
   ----------------

   procedure Dump_Ftell (Arg1 : access Dumper) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Dump_Ftell unimplemented");
      raise Program_Error with "Unimplemented procedure Dump_Ftell";
   end Dump_Ftell;

   ----------------
   -- Dump_Flush --
   ----------------

   procedure Dump_Flush (Arg1 : access Dumper) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Dump_Flush unimplemented");
      raise Program_Error with "Unimplemented procedure Dump_Flush";
   end Dump_Flush;

   ---------------------
   -- Pcap_Dump_Close --
   ---------------------

   procedure Pcap_Dump_Close (Arg1 : access Dumper) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Pcap_Dump_Close unimplemented");
      raise Program_Error with "Unimplemented procedure Pcap_Dump_Close";
   end Pcap_Dump_Close;

   ---------------
   -- Pcap_Dump --
   ---------------

   procedure Pcap_Dump
     (Arg1 : access Unsigned_Char; Arg2 : Pcap_Pkthdr;
      Arg3 : access Unsigned_Char)
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Pcap_Dump unimplemented");
      raise Program_Error with "Unimplemented procedure Pcap_Dump";
   end Pcap_Dump;

   -----------------
   -- Findalldevs --
   -----------------

   procedure Findalldevs (Arg1 : System.Address; Arg2 : String) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Findalldevs unimplemented");
      raise Program_Error with "Unimplemented procedure Findalldevs";
   end Findalldevs;

   ----------------------
   -- Pcap_Freealldevs --
   ----------------------

   procedure Pcap_Freealldevs (Arg1 : access Pcap_If) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Pcap_Freealldevs unimplemented");
      raise Program_Error with "Unimplemented procedure Pcap_Freealldevs";
   end Pcap_Freealldevs;

   -----------------
   -- Lib_Version --
   -----------------

   function Lib_Version return String is
   begin
      pragma Compile_Time_Warning (Standard.True, "Lib_Version unimplemented");
      return raise Program_Error with "Unimplemented function Lib_Version";
   end Lib_Version;

   ----------------
   -- Bpf_Filter --
   ----------------

   procedure Bpf_Filter
     (Arg1 : Bpf.Insn; Arg2 : access Unsigned_Char; Arg3 : Unsigned;
      Arg4 : Unsigned)
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Bpf_Filter unimplemented");
      raise Program_Error with "Unimplemented procedure Bpf_Filter";
   end Bpf_Filter;

   ------------------
   -- Bpf_Validate --
   ------------------

   procedure Bpf_Validate (Arg1 : Bpf.Insn; Arg2 : int) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Bpf_Validate unimplemented");
      raise Program_Error with "Unimplemented procedure Bpf_Validate";
   end Bpf_Validate;

   ---------------
   -- Bpf_Image --
   ---------------

   procedure Bpf_Image (Arg1 : Bpf.Insn; Arg2 : int) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Bpf_Image unimplemented");
      raise Program_Error with "Unimplemented procedure Bpf_Image";
   end Bpf_Image;

   --------------
   -- Bpf_Dump --
   --------------

   procedure Bpf_Dump (Arg1 : Bpf.Program; Arg2 : int) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Bpf_Dump unimplemented");
      raise Program_Error with "Unimplemented procedure Bpf_Dump";
   end Bpf_Dump;

   -----------------------
   -- Get_Selectable_Fd --
   -----------------------

   procedure Get_Selectable_Fd (Arg1 : in out Pcap_T) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Get_Selectable_Fd unimplemented");
      raise Program_Error with "Unimplemented procedure Get_Selectable_Fd";
   end Get_Selectable_Fd;

end PCAP.PCAP;
