#
s-with PCAP.Low_Level.x86_64_linux_gnu_sys_types_h;--
s-with PCAP.Low_Level.x86_64_linux_gnu_bits_types_struct_timeval_h;-pragma Warnings(Off);with System.OS_Interface;pragma Warnings(On);-
s-limited with PCAP.Low_Level.x86_64_linux_gnu_bits_types_FILE_h;-with Interfaces.C_Streams;-
s-with PCAP.Low_Level.stddef_h;--

s-PCAP.Low_Level.x86_64_linux_gnu_sys_types_h.u_short-unsigned_short-g
s-PCAP.Low_Level.x86_64_linux_gnu_sys_types_h.u_int-unsigned-g
s-PCAP.Low_Level.x86_64_linux_gnu_sys_types_h.u_char-unsigned_char-g

s-PCAP.Low_Level.stddef_h.size_t-size_t-g
s-access PCAP.Low_Level.x86_64_linux_gnu_bits_types_FILE_h.FILE-Interfaces.C_Streams.FILEs-g
s-PCAP.Low_Level.x86_64_linux_gnu_bits_types_struct_timeval_h.timeval-System.OS_Interface.timeval-g

s-type pcap is null record.*--
s-subtype pcap_t is pcap-type pcap_t is null record-


s-/usr/include/--

