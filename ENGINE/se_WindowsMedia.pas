unit se_WindowsMedia;

// Windows Media Format 7.1

interface

uses
  Windows, Classes, ComObj, ActiveX, se_DirectShow;

//============================================================================
//
//  Microsoft Windows Media Technology
//  Copyright (C) Microsoft Corporation, 1999 - 2001.  All Rights Reserved.
//
//  File:        wmsysprf.prx
//
//  Description: This file contains the GUIDs of the system profiles.
//
//============================================================================
const
  WMProfile_V40_DialUpMBR              : TGUID = '{fd7f47f1-72a6-45a4-80f0-3aecefc32c07}';
  WMProfile_V40_IntranetMBR            : TGUID = '{82cd3321-a94a-4ffc-9c2b-092c10ca16e7}';
  WMProfile_V40_2856100MBR             : TGUID = '{5a1c2206-dc5e-4186-beb2-4c5a994b132e}';
  WMProfile_V40_6VoiceAudio            : TGUID = '{D508978A-11A0-4d15-B0DA-ACDC99D4F890}';
  WMProfile_V40_16AMRadio              : TGUID = '{0f4be81f-d57d-41e1-b2e3-2fad986bfec2}';
  WMProfile_V40_288FMRadioMono         : TGUID = '{7fa57fc8-6ea4-4645-8abf-b6e5a8f814a1}';
  WMProfile_V40_288FMRadioStereo       : TGUID = '{22fcf466-aa40-431f-a289-06d0ea1a1e40}';
  WMProfile_V40_56DialUpStereo         : TGUID = '{e8026f87-e905-4594-a3c7-00d00041d1d9}';
  WMProfile_V40_64Audio                : TGUID = '{4820b3f7-cbec-41dc-9391-78598714c8e5}';
  WMProfile_V40_96Audio                : TGUID = '{0efa0ee3-9e64-41e2-837f-3c0038f327ba}';
  WMProfile_V40_128Audio               : TGUID = '{93ddbe12-13dc-4e32-a35e-40378e34279a}';
  WMProfile_V40_288VideoVoice          : TGUID = '{bb2bc274-0eb6-4da9-b550-ecf7f2b9948f}';
  WMProfile_V40_288VideoAudio          : TGUID = '{ac617f2d-6cbe-4e84-8e9a-ce151a12a354}';
  WMProfile_V40_288VideoWebServer      : TGUID = '{abf2f00d-d555-4815-94ce-8275f3a70bfe}';
  WMProfile_V40_56DialUpVideo          : TGUID = '{e21713bb-652f-4dab-99de-71e04400270f}';
  WMProfile_V40_56DialUpVideoWebServer : TGUID = '{b756ff10-520f-4749-a399-b780e2fc9250}';
  WMProfile_V40_100Video               : TGUID = '{8f99ddd8-6684-456b-a0a3-33e1316895f0}';
  WMProfile_V40_250Video               : TGUID = '{541841c3-9339-4f7b-9a22-b11540894e42}';
  WMProfile_V40_512Video               : TGUID = '{70440e6d-c4ef-4f84-8cd0-d5c28686e784}';
  WMProfile_V40_1MBVideo               : TGUID = '{b4482a4c-cc17-4b07-a94e-9818d5e0f13f}';
  WMProfile_V40_3MBVideo               : TGUID = '{55374ac0-309b-4396-b88f-e6e292113f28}';
  WMProfile_V70_DialUpMBR              : TGUID = '{5B16E74B-4068-45b5-B80E-7BF8C80D2C2F}';
  WMProfile_V70_IntranetMBR            : TGUID = '{045880DC-34B6-4ca9-A326-73557ED143F3}';
  WMProfile_V70_2856100MBR             : TGUID = '{07DF7A25-3FE2-4a5b-8B1E-348B0721CA70}';
  WMProfile_V70_288VideoVoice          : TGUID = '{B952F38E-7DBC-4533-A9CA-B00B1C6E9800}';
  WMProfile_V70_288VideoAudio          : TGUID = '{58BBA0EE-896A-4948-9953-85B736F83947}';
  WMProfile_V70_288VideoWebServer      : TGUID = '{70A32E2B-E2DF-4ebd-9105-D9CA194A2D50}';
  WMProfile_V70_56VideoWebServer       : TGUID = '{DEF99E40-57BC-4ab3-B2D1-B6E3CAF64257}';
  WMProfile_V70_64VideoISDN            : TGUID = '{C2B7A7E9-7B8E-4992-A1A1-068217A3B311}';
  WMProfile_V70_100Video               : TGUID = '{D9F3C932-5EA9-4c6d-89B4-2686E515426E}';
  WMProfile_V70_256Video               : TGUID = '{AFE69B3A-403F-4a1b-8007-0E21CFB3DF84}';
  WMProfile_V70_384Video               : TGUID = '{F3D45FBB-8782-44df-97C6-8678E2F9B13D}';
  WMProfile_V70_768Video               : TGUID = '{0326EBB6-F76E-4964-B0DB-E729978D35EE}';
  WMProfile_V70_1500Video              : TGUID = '{0B89164A-5490-4686-9E37-5A80884E5146}';
  WMProfile_V70_2000Video              : TGUID = '{AA980124-BF10-4e4f-9AFD-4329A7395CFF}';
  WMProfile_V70_700FilmContentVideo    : TGUID = '{7A747920-2449-4d76-99CB-FDB0C90484D4}';
  WMProfile_V70_1500FilmContentVideo   : TGUID = '{F6A5F6DF-EE3F-434c-A433-523CE55F516B}';
  WMProfile_V70_6VoiceAudio            : TGUID = '{EABA9FBF-B64F-49b3-AA0C-73FBDD150AD0}';
  WMProfile_V70_288FMRadioMono         : TGUID = '{C012A833-A03B-44a5-96DC-ED95CC65582D}';
  WMProfile_V70_288FMRadioStereo       : TGUID = '{E96D67C9-1A39-4dc4-B900-B1184DC83620}';
  WMProfile_V70_56DialUpStereo         : TGUID = '{674EE767-0949-4fac-875E-F4C9C292013B}';
  WMProfile_V70_64AudioISDN            : TGUID = '{91DEA458-9D60-4212-9C59-D40919C939E4}';
  WMProfile_V70_64Audio                : TGUID = '{B29CFFC6-F131-41db-B5E8-99D8B0B945F4}';
  WMProfile_V70_96Audio                : TGUID = '{A9D4B819-16CC-4a59-9F37-693DBB0302D6}';
  WMProfile_V70_128Audio               : TGUID = '{C64CF5DA-DF45-40d3-8027-DE698D68DC66}';

{++
  Microsoft Windows Media Technology
  Copyright (C) Microsoft Corporation, 1999 - 2001.  All Rights Reserved.
Module Name:    nserror.mc
Abstract   :    Definitions for NetShow events.
**************************** READ ME ******************************************
 Here are the commented error ranges for the Windows Media Technologies Group

 LEGACY RANGES
     0  -  199 = General NetShow errors
   200  -  399 = NetShow error events
   400  -  599 = NetShow monitor events
   600  -  799 = NetShow IMmsAutoServer errors
  1000  - 1199 = NetShow MCMADM errors

 NEW RANGES
  2000 -  2999 = ASF (defined in ASFERR.MC)
  3000 -  3999 = Windows Media SDK
  4000 -  4999 = Windows Media Player
  5000 -  5999 = Windows Media Server
  6000 -  6999 = Windows Media HTTP/RTSP result codes (defined in NETERROR.MC)
  7000 -  7999 = Windows Media Tools
  8000 -  8999 = Windows Media Content Discovery
  9000 -  9999 = Windows Media Real Time Collaboration
 10000 - 10999 = Windows Media Digital Rights Management
 11000 - 11999 = Windows Media Setup
 12000 - 12999 = Windows Media Networking
**************************** READ ME ******************************************
--}

//////////////////////////////////////////////////////////////////////////
///
/// NETSHOW Success Events
///
//////////////////////////////////////////////////////////////////////////

//
// Values are 32 bit values layed out as follows:
//
// 3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
// 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
// +---+-+-+-----------------------+-------------------------------+
// |Sev|C|R| Facility | Code |
// +---+-+-+-----------------------+-------------------------------+
//
// where
//
// Sev - is the severity code
//
// 00 - Success
// 01 - Informational
// 10 - Warning
// 11 - Error
//
// C - is the Customer code flag
//
// R - is a reserved bit
//
// Facility - is the facility code
//
// Code - is the facility's status code
//
//
// Define the facility codes
//

const
  FACILITY_NS_WIN32 = $7; 
  FACILITY_NS = $D;

///
/// Define the severity codes
///
  STATUS_SEVERITY_WARNING = $2;
  STATUS_SEVERITY_SUCCESS = $0;
  STATUS_SEVERITY_INFORMATIONAL = $1;
  STATUS_SEVERITY_ERROR = $3;


// The requested operation is pending completion.%0
  NS_S_CALLPENDING = $000D0000;

// The requested operation was aborted by the client.%0
  NS_S_CALLABORTED = $000D0001;

{/// The stream was purposefully stopped before completion.%0 }
  NS_S_STREAM_TRUNCATED = $000D0002;

/////////////////////////////////////////////////////////////////////////
///
/// NETSHOW Warning Events
///
/////////////////////////////////////////////////////////////////////////

// The maximum filebitrate value specified is greater than the server's configured maximum bandwidth.%0 }
  NS_W_SERVER_BANDWIDTH_LIMIT = $800D0003;

// The maximum bandwidth value specified is less than the maximum filebitrate.%0 }
  NS_W_FILE_BANDWIDTH_LIMIT = $800D0004;


//////////////////////////////////////////////////////////////////////////
///
/// NETSHOW Error Events
///
//////////////////////////////////////////////////////////////////////////

// There is no connection established with the Windows Media server. The operation failed.%0 }
  NS_E_NOCONNECTION = $C00D0005;

// Unable to establish a connection to the server.%0 }
  NS_E_CANNOTCONNECT = $C00D0006;

// Unable to destroy the title.%0 }
  NS_E_CANNOTDESTROYTITLE = $C00D0007;

// Unable to rename the title.%0 }
  NS_E_CANNOTRENAMETITLE = $C00D0008;

// Unable to offline disk.%0 }
  NS_E_CANNOTOFFLINEDISK = $C00D0009;

// Unable to online disk.%0 }
  NS_E_CANNOTONLINEDISK = $C00D000A;

// There is no file parser registered for this type of file.%0 }
  NS_E_NOREGISTEREDWALKER = $C00D000B;

// There is no data connection established.%0 }
  NS_E_NOFUNNEL = $C00D000C;

// Failed to load the local play DLL.%0 }
  NS_E_NO_LOCALPLAY = $C00D000D;

// The network is busy.%0 }
  NS_E_NETWORK_BUSY = $C00D000E;

// The server session limit was exceeded.%0 }
  NS_E_TOO_MANY_SESS = $C00D000F;

// The network connection already exists.%0 }
  NS_E_ALREADY_CONNECTED = $C00D0010;

// Index %1 is invalid.%0 }
  NS_E_INVALID_INDEX = $C00D0011;

// There is no protocol or protocol version supported by both the client and the server.%0 }
  NS_E_PROTOCOL_MISMATCH = $C00D0012;

// The server, a computer setup to offer multimedia content to other computers, could not handle your request for multimedia content in a timely manner. Please try again later.%0 }
  NS_E_TIMEOUT = $C00D0013;

// Error writing to the network.%0 }
  NS_E_NET_WRITE = $C00D0014;

// Error reading from the network.%0 }
  NS_E_NET_READ = $C00D0015;

// Error writing to a disk.%0 }
  NS_E_DISK_WRITE = $C00D0016;

// Error reading from a disk.%0 }
  NS_E_DISK_READ = $C00D0017;

// Error writing to a file.%0 }
  NS_E_FILE_WRITE = $C00D0018;

// Error reading from a file.%0 }
  NS_E_FILE_READ = $C00D0019;

// The system cannot find the file specified.%0 }
  NS_E_FILE_NOT_FOUND = $C00D001A;

// The file already exists.%0 }
  NS_E_FILE_EXISTS = $C00D001B;

// The file name, directory name, or volume label syntax is incorrect.%0 }
  NS_E_INVALID_NAME = $C00D001C;

// Failed to open a file.%0 }
  NS_E_FILE_OPEN_FAILED = $C00D001D;

// Unable to allocate a file.%0 }
  NS_E_FILE_ALLOCATION_FAILED = $C00D001E;

// Unable to initialize a file.%0 }
  NS_E_FILE_INIT_FAILED = $C00D001F;

// Unable to play a file.%0 }
  NS_E_FILE_PLAY_FAILED = $C00D0020;

// Could not set the disk UID.%0 }
  NS_E_SET_DISK_UID_FAILED = $C00D0021;

// An error was induced for testing purposes.%0 }
  NS_E_INDUCED = $C00D0022;

// Two Content Servers failed to communicate.%0 }
  NS_E_CCLINK_DOWN = $C00D0023;

// An unknown error occurred.%0 }
  NS_E_INTERNAL = $C00D0024;

// The requested resource is in use.%0 }
  NS_E_BUSY = $C00D0025;

// The specified stream type is not recognized.%0 }
  NS_E_UNRECOGNIZED_STREAM_TYPE = $C00D0026;

// The network service provider failed.%0 }
  NS_E_NETWORK_SERVICE_FAILURE = $C00D0027;

// An attempt to acquire a network resource failed.%0 }
  NS_E_NETWORK_RESOURCE_FAILURE = $C00D0028;

// The network connection has failed.%0 }
  NS_E_CONNECTION_FAILURE = $C00D0029;

// The session is being terminated locally.%0 }
  NS_E_SHUTDOWN = $C00D002A;

// The request is invalid in the current state.%0 }
  NS_E_INVALID_REQUEST = $C00D002B;

// There is insufficient bandwidth available to fulfill the request.%0 }
  NS_E_INSUFFICIENT_BANDWIDTH = $C00D002C;

// The disk is not rebuilding.%0 }
  NS_E_NOT_REBUILDING = $C00D002D;

// An operation requested for a particular time could not be carried out on schedule.%0 }
  NS_E_LATE_OPERATION = $C00D002E;

// Invalid or corrupt data was encountered.%0 }
  NS_E_INVALID_DATA = $C00D002F;

// The bandwidth required to stream a file is higher than the maximum file bandwidth allowed on the server.%0 }
  NS_E_FILE_BANDWIDTH_LIMIT = $C00D0030;

// The client cannot have any more files open simultaneously.%0 }
  NS_E_OPEN_FILE_LIMIT = $C00D0031;

// The server received invalid data from the client on the control connection.%0 }
  NS_E_BAD_CONTROL_DATA = $C00D0032;

// There is no stream available.%0 }
  NS_E_NO_STREAM = $C00D0033;

// There is no more data in the stream.%0 }
  NS_E_STREAM_END = $C00D0034;

// The specified server could not be found.%0 }
  NS_E_SERVER_NOT_FOUND = $C00D0035;

// The specified name is already in use. }
  NS_E_DUPLICATE_NAME = $C00D0036;

// The specified address is already in use. }
  NS_E_DUPLICATE_ADDRESS = $C00D0037;

// The specified address is not a valid multicast address. }
  NS_E_BAD_MULTICAST_ADDRESS = $C00D0038;

// The specified adapter address is invalid. }
  NS_E_BAD_ADAPTER_ADDRESS = $C00D0039;

// The specified delivery mode is invalid. }
  NS_E_BAD_DELIVERY_MODE = $C00D003A;

// The specified station does not exist. }
  NS_E_INVALID_CHANNEL = $C00D003B;

// The specified stream does not exist. }
  NS_E_INVALID_STREAM = $C00D003C;

// The specified archive could not be opened. }
  NS_E_INVALID_ARCHIVE = $C00D003D;

// The system cannot find any titles on the server.%0 }
  NS_E_NOTITLES = $C00D003E;

// The system cannot find the client specified.%0 }
  NS_E_INVALID_CLIENT = $C00D003F;

// The Blackhole Address is not initialized.%0 }
  NS_E_INVALID_BLACKHOLE_ADDRESS = $C00D0040;

// The station does not support the stream format. }
  NS_E_INCOMPATIBLE_FORMAT = $C00D0041;

// The specified key is not valid. }
  NS_E_INVALID_KEY = $C00D0042;

// The specified port is not valid. }
  NS_E_INVALID_PORT = $C00D0043;

// The specified TTL is not valid. }
  NS_E_INVALID_TTL = $C00D0044;

// The request to fast forward or rewind could not be fulfilled. }
  NS_E_STRIDE_REFUSED = $C00D0045;

// Unable to load the appropriate file parser.%0 }
  NS_E_MMSAUTOSERVER_CANTFINDWALKER = $C00D0046;

// Cannot exceed the maximum bandwidth limit.%0 }
  NS_E_MAX_BITRATE = $C00D0047;

// Invalid value for LogFilePeriod.%0 }
  NS_E_LOGFILEPERIOD = $C00D0048;

// Cannot exceed the maximum client limit.%0 }
  NS_E_MAX_CLIENTS = $C00D0049;

// Log File Size too small.%0 }
  NS_E_LOG_FILE_SIZE = $C00D004A;

// Cannot exceed the maximum file rate.%0 }
  NS_E_MAX_FILERATE = $C00D004B;

//
// File Walker Errors
//

// Unknown file type.%0 }
  NS_E_WALKER_UNKNOWN = $C00D004C;

// The specified file, %1, cannot be loaded onto the specified server, %2.%0 }
  NS_E_WALKER_SERVER = $C00D004D;

// There was a usage error with file parser.%0 }
  NS_E_WALKER_USAGE = $C00D004E;


///////////////////////////////////////////////////////////////////////// 
//
// NETSHOW Monitor Events
//
/////////////////////////////////////////////////////////////////////////

// Tiger Events
// %1 is the tiger name

// The Title Server %1 is running.%0 }
  NS_I_TIGER_START = $400D004F;

// The Title Server %1 has failed.%0 }
  NS_E_TIGER_FAIL = $C00D0050;


// Cub Events

// %1 is the cub ID
// %2 is the cub name

// Content Server %1 (%2) is starting.%0 }
  NS_I_CUB_START = $400D0051;

// Content Server %1 (%2) is running.%0 }
  NS_I_CUB_RUNNING = $400D0052;

// Content Server %1 (%2) has failed.%0 }
  NS_E_CUB_FAIL = $C00D0053;


// Disk Events

// %1 is the tiger disk ID }
// %2 is the device name }
// %3 is the cub ID }

// Disk %1 ( %2 ) on Content Server %3, is running.%0 }
  NS_I_DISK_START = $400D0054;

// Disk %1 ( %2 ) on Content Server %3, has failed.%0 }
  NS_E_DISK_FAIL = $C00D0055;

// Started rebuilding disk %1 ( %2 ) on Content Server %3.%0 }
  NS_I_DISK_REBUILD_STARTED = $400D0056;

// Finished rebuilding disk %1 ( %2 ) on Content Server %3.%0 }
  NS_I_DISK_REBUILD_FINISHED = $400D0057;

// Aborted rebuilding disk %1 ( %2 ) on Content Server %3.%0 }
  NS_I_DISK_REBUILD_ABORTED = $400D0058;

// Admin Events }

// A NetShow administrator at network location %1 set the data stream limit to %2 streams.%0 }
  NS_I_LIMIT_FUNNELS = $400D0059;

// A NetShow administrator at network location %1 started disk %2.%0 }
  NS_I_START_DISK = $400D005A;

// A NetShow administrator at network location %1 stopped disk %2.%0 }
  NS_I_STOP_DISK = $400D005B;

// A NetShow administrator at network location %1 stopped Content Server %2.%0 }
  NS_I_STOP_CUB = $400D005C;

// A NetShow administrator at network location %1 disconnected viewer %2 from the system.%0 }
  NS_I_KILL_VIEWER = $400D005D;

// A NetShow administrator at network location %1 started rebuilding disk %2.%0 }
  NS_I_REBUILD_DISK = $400D005E;

// Unknown %1 event encountered.%0 }
  NS_W_UNKNOWN_EVENT = $800D005F;

// Alerts

// The NetShow data stream limit of %1 streams was reached.%0 }
  NS_E_MAX_FUNNELS_ALERT = $C00D0060;

// The NetShow Video Server was unable to allocate a %1 block file named %2.%0 }
  NS_E_ALLOCATE_FILE_FAIL = $C00D0061;

// A Content Server was unable to page a block.%0 }
  NS_E_PAGING_ERROR = $C00D0062;

// Disk %1 has unrecognized control block version %2.%0 }
  NS_E_BAD_BLOCK0_VERSION = $C00D0063;

// Disk %1 has incorrect uid %2.%0 }
  NS_E_BAD_DISK_UID = $C00D0064;

// Disk %1 has unsupported file system major version %2.%0 }
  NS_E_BAD_FSMAJOR_VERSION = $C00D0065;

// Disk %1 has bad stamp number in control block.%0 }
  NS_E_BAD_STAMPNUMBER = $C00D0066;

// Disk %1 is partially reconstructed.%0 }
  NS_E_PARTIALLY_REBUILT_DISK = $C00D0067;

// EnactPlan gives up.%0 }
  NS_E_ENACTPLAN_GIVEUP = $C00D0068;


// MCMADM warnings/errors }

// Event initialization failed, there will be no MCM events.%0 }
  MCMADM_I_NO_EVENTS = $400D0069;

// The key was not found in the registry.%0 }
  MCMADM_E_REGKEY_NOT_FOUND = $C00D006A;

// No stream formats were found in an NSC file.%0 }
  NS_E_NO_FORMATS = $C00D006B;

// No reference URLs were found in an ASX file.%0 }
  NS_E_NO_REFERENCES = $C00D006C;

// Error opening wave device, the device might be in use.%0 }
  NS_E_WAVE_OPEN = $C00D006D;

// The logging operation failed. }
  NS_I_LOGGING_FAILED = $400D006E;

// Unable to establish a connection to the NetShow event monitor service.%0 }
  NS_E_CANNOTCONNECTEVENTS = $C00D006F;

// A NetShow administrator at network location %1 set the maximum bandwidth limit to %2 bps.%0 }
  NS_I_LIMIT_BANDWIDTH = $400D0070;

// No device driver is present on the system.%0 }
  NS_E_NO_DEVICE = $C00D0071;

// No specified device driver is present.%0 }
  NS_E_NO_SPECIFIED_DEVICE = $C00D0072;


// NOTENOTE!!!
// Due to legacy problems these error codes live inside the ASF error code range }

// NS_E_NOTHING_TO_DO }
  NS_E_NOTHING_TO_DO = $C00D07F1;

// Not receiving data from the server.%0 }
  NS_E_NO_MULTICAST = $C00D07F2;

///////////////////////////////////////////////////////////////////////// 
//
// NETSHOW Error Events
//
// IdRange = 200..399
//
/////////////////////////////////////////////////////////////////////////

// Netshow Events Monitor is not operational and has been disconnected.%0 }
  NS_E_MONITOR_GIVEUP = $C00D00C8;

// Disk %1 is remirrored.%0 }
  NS_E_REMIRRORED_DISK = $C00D00C9;

// Insufficient data found.%0 }
  NS_E_INSUFFICIENT_DATA = $C00D00CA;

// %1 failed in file %2 line %3.%0 }
  NS_E_ASSERT = $C00D00CB;

// The specified adapter name is invalid.%0 }
  NS_E_BAD_ADAPTER_NAME = $C00D00CC;

// The application is not licensed for this feature.%0 }
  NS_E_NOT_LICENSED = $C00D00CD;

// Unable to contact the server.%0 }
  NS_E_NO_SERVER_CONTACT = $C00D00CE;

// Maximum number of titles exceeded.%0 }
  NS_E_TOO_MANY_TITLES = $C00D00CF;

// Maximum size of a title exceeded.%0 }
  NS_E_TITLE_SIZE_EXCEEDED = $C00D00D0;

// UDP protocol not enabled. Not trying %1!ls!.%0 }
  NS_E_UDP_DISABLED = $C00D00D1;

// TCP protocol not enabled. Not trying %1!ls!.%0 }
  NS_E_TCP_DISABLED = $C00D00D2;

// HTTP protocol not enabled. Not trying %1!ls!.%0 }
  NS_E_HTTP_DISABLED = $C00D00D3;

// The product license has expired.%0 }
  NS_E_LICENSE_EXPIRED = $C00D00D4;

// Source file exceeds the per title maximum bitrate. See NetShow Theater documentation for more information.%0 }
  NS_E_TITLE_BITRATE = $C00D00D5;

// The program name cannot be empty.%0 }
  NS_E_EMPTY_PROGRAM_NAME = $C00D00D6;

// Station %1 does not exist.%0 }
  NS_E_MISSING_CHANNEL = $C00D00D7;

// You need to define at least one station before this operation can complete.%0 }
  NS_E_NO_CHANNELS = $C00D00D8;

/////////////////////////////////////////////////////////////////////
// This error message is to replace previous NS_E_INVALID_INDEX which 
// takes an index value for the error message string.  For some application
// obtain the idex value at reporting error time is very difficult, so we
// use this string to avoid the problem.
//////////////////////////////////////////////////////////////////////
//  The index specified is invalid.%0

  NS_E_INVALID_INDEX2 = $C00D00D9;

/////////////////////////////////////////////////////////////////////////
//
// NETSHOW Monitor Events
//
// IdRange = 400..599
//
// Admin Events:
//
// Alerts:
//
// Title Server:
// %1 is the Title Server name
//
// Content Server:
// %1 is the Content Server ID
// %2 is the Content Server name
// %3 is the Peer Content Server name (optional)
//
// Disks:
// %1 is the Title Server disk ID
// %2 is the device name
// %3 is the Content Server ID
//
/////////////////////////////////////////////////////////////////////////

// Content Server %1 (%2) has failed its link to Content Server %3.%0 }
  NS_E_CUB_FAIL_LINK = $C00D0190;

// Content Server %1 (%2) has established its link to Content Server %3.%0 }
  NS_I_CUB_UNFAIL_LINK = $400D0191;

// Content Server %1 (%2) has incorrect uid %3.%0 }
  NS_E_BAD_CUB_UID = $C00D0192;

// Restripe operation has started.%0 }
  NS_I_RESTRIPE_START = $400D0193;

// Restripe operation has completed.%0 }
  NS_I_RESTRIPE_DONE = $400D0194;

// Server unreliable because multiple components failed.%0 }
  NS_E_GLITCH_MODE = $C00D0195;

// Content disk %1 (%2) on Content Server %3 has been restriped out.%0 }
  NS_I_RESTRIPE_DISK_OUT = $400D0196;

// Content server %1 (%2) has been restriped out.%0 }
  NS_I_RESTRIPE_CUB_OUT = $400D0197;

// Disk %1 ( %2 ) on Content Server %3, has been offlined.%0 }
  NS_I_DISK_STOP = $400D0198;

// Disk %1 ( %2 ) on Content Server %3, will be failed because it is catatonic.%0 }
  NS_I_CATATONIC_FAILURE = $800D0199;

// Disk %1 ( %2 ) on Content Server %3, auto online from catatonic state.%0 }
  NS_I_CATATONIC_AUTO_UNFAIL = $800D019A;

// Content Server %1 (%2) is unable to communicate with the Media System Network Protocol.%0 }
  NS_E_NO_MEDIA_PROTOCOL = $C00D019B;

//
// Advanced Streaming Format (ASF) codes occupy MessageIds 2000-2999
//
// See ASFErr.mc for more details - please do not define any symbols
// in that range in this file.
// 

/////////////////////////////////////////////////////////////////////////
//
// Windows Media SDK Errors
//
// IdRange = 3000-3199
//
/////////////////////////////////////////////////////////////////////////

// The input media format is invalid.%0 }
  NS_E_INVALID_INPUT_FORMAT = $C00D0BB8;

// The MSAudio codec is not installed on this system.%0 }
  NS_E_MSAUDIO_NOT_INSTALLED = $C00D0BB9;

// An unexpected error occured with the MSAudio codec.%0 }
  NS_E_UNEXPECTED_MSAUDIO_ERROR = $C00D0BBA;

// The output media format is invalid.%0 }
  NS_E_INVALID_OUTPUT_FORMAT = $C00D0BBB;

// The object must be fully configured before audio samples can be processed.%0 }
  NS_E_NOT_CONFIGURED = $C00D0BBC;

// You need a license to perform the requested operation on this media file.%0 }
  NS_E_PROTECTED_CONTENT = $C00D0BBD;

// You need a license to perform the requested operation on this media file.%0 }
  NS_E_LICENSE_REQUIRED = $C00D0BBE;

// This media file is corrupted or invalid. Contact the content provider for a new file.%0 }
  NS_E_TAMPERED_CONTENT = $C00D0BBF;

// The license for this media file has expired. Get a new license or contact the content provider for further assistance.%0 }
  NS_E_LICENSE_OUTOFDATE = $C00D0BC0;

// You are not allowed to open this file. Contact the content provider for further assistance.%0 }
  NS_E_LICENSE_INCORRECT_RIGHTS = $C00D0BC1;

// The requested audio codec is not installed on this system.%0 }
  NS_E_AUDIO_CODEC_NOT_INSTALLED = $C00D0BC2;

// An unexpected error occurred with the audio codec.%0 }
  NS_E_AUDIO_CODEC_ERROR = $C00D0BC3;

// The requested video codec is not installed on this system.%0 }
  NS_E_VIDEO_CODEC_NOT_INSTALLED = $C00D0BC4;

// An unexpected error occurred with the video codec.%0 }
  NS_E_VIDEO_CODEC_ERROR = $C00D0BC5;

// The Profile is invalid.%0 }
  NS_E_INVALIDPROFILE = $C00D0BC6;

// A new version of the SDK is needed to play the requested content.%0 }
  NS_E_INCOMPATIBLE_VERSION = $C00D0BC7;

// The requested operation has caused the source to rebuffer.%0 }
  NS_S_REBUFFERING = $000D0BC8;

// The requested operation has caused the source to degrade codec quality.%0 }
  NS_S_DEGRADING_QUALITY = $000D0BC9;

// The requested URL is not available in offline mode.%0 }
  NS_E_OFFLINE_MODE = $C00D0BCA;

// The requested URL cannot be accessed because there is no network connection.%0 }
  NS_E_NOT_CONNECTED = $C00D0BCB;

// The encoding process was unable to keep up with the amount of supplied data.%0 }
  NS_E_TOO_MUCH_DATA = $C00D0BCC;

/////////////////////////////////////////////////////////////////////////
//
// Windows Media Player Errors
//
// IdRange = 4000 - 4999
//
/////////////////////////////////////////////////////////////////////////

// There is no compact disc in the drive.%0 }
  NS_E_NO_CD = $C00D0FA0;

// Unable to perform digital reads on this compact disc drive. Please try analog playback via the Tools Options menu.%0 }
  NS_E_CANT_READ_DIGITAL = $C00D0FA1;

// The portable device appears to have been disconnected.%0 }
  NS_E_DEVICE_DISCONNECTED = $C00D0FA2;

// Your Music Player does not support this song's format.%0 }
  NS_E_DEVICE_NOT_SUPPORT_FORMAT = $C00D0FA3;

// Digital reads on this compact disc drive are too slow. Please try analog playback via the Tools Options menu.%0 }
  NS_E_SLOW_READ_DIGITAL = $C00D0FA4;

// An invalid line error occurred in the mixer.%0 }
  NS_E_MIXER_INVALID_LINE = $C00D0FA5;

// An invalid control error occurred in the mixer.%0 }
  NS_E_MIXER_INVALID_CONTROL = $C00D0FA6;

// An invalid value error occurred in the mixer.%0 }
  NS_E_MIXER_INVALID_VALUE = $C00D0FA7;

// An unrecognized MMRESULT occurred in the mixer.%0 }
  NS_E_MIXER_UNKNOWN_MMRESULT = $C00D0FA8;

// User has stopped the operation.%0 }
  NS_E_USER_STOP = $C00D0FA9;

//
// WMP IWMPXMLParser Error codes
//

// A call was made to GetParseError on the XML parser but there was no error to retrieve.%0 }
  NS_E_WMPXML_NOERROR = $C00D0FB4;

// The XML Parser ran out of data while parsing.%0 }
  NS_E_WMPXML_ENDOFDATA = $C00D0FB5;

// A generic parse error occurred in the XML parser but no information is available.%0 }
  NS_E_WMPXML_PARSEERROR = $C00D0FB6;

// A call get GetNamedAttribute or GetNamedAttributeIndex on the XML parser resulted in the index not being found.%0 }
  NS_E_WMPXML_ATTRIBUTENOTFOUND = $C00D0FB7;

// A call was made go GetNamedPI on the XML parser, but the requested Processing Instruction was not found.%0 }
  NS_E_WMPXML_PINOTFOUND = $C00D0FB8;

// Persist was called on the XML parser, but the parser has no data to persist.%0 }
  NS_E_WMPXML_EMPTYDOC = $C00D0FB9;

//
// Miscellaneous Media Player Error codes
//

// A Windows API call failed but no error information was available.%0 }
  NS_E_WMP_WINDOWSAPIFAILURE = $C00D0FC8;

// Copying of this media item is not allowed.%0 }
  NS_E_WMP_RECORDING_NOT_ALLOWED = $C00D0FC9;

// The device is not ready, please check the drive and try again.%0 }
  NS_E_DEVICE_NOT_READY = $C00D0FCA;

// Windows Media Player cannot play the selected file because it is either damaged or corrupt. Please select a different file.%0 }
  NS_E_DAMAGED_FILE = $C00D0FCB;

//
// Generic Media PlayerUI error codes
//

// The control (%s) does not support creation of sub-controls, yet (%d) sub-controls have been specified.%0 }
  NS_E_WMP_UI_SUBCONTROLSNOTSUPPORTED = $C00D0FDE;

// Version mismatch: (%.1f required, %.1f found).%0 }
  NS_E_WMP_UI_VERSIONMISMATCH = $C00D0FDF;

// The layout manager was given valid XML that wasn't a theme file.%0 }
  NS_E_WMP_UI_NOTATHEMEFILE = $C00D0FE0;

// The %s subelement could not be found on the %s object.%0 }
  NS_E_WMP_UI_SUBELEMENTNOTFOUND = $C00D0FE1;

// An error occurred parsing the version tag.\nValid version tags are of the form:\n\n\t<?wmp version='1.0'?>.%0 }
  NS_E_WMP_UI_VERSIONPARSE = $C00D0FE2;

// The view specified in for the 'currentViewID' property (%s) was not found in this theme file.%0 }
  NS_E_WMP_UI_VIEWIDNOTFOUND = $C00D0FE3;

// This error used internally for hit testing.%0 }
  NS_E_WMP_UI_PASSTHROUGH = $C00D0FE4;

// Attributes were specified for the %s object, but the object was not available to send them to.%0 }
  NS_E_WMP_UI_OBJECTNOTFOUND = $C00D0FE5;

// The %s event already has a handler, the second handler was ignored.%0 }
  NS_E_WMP_UI_SECONDHANDLER = $C00D0FE6;

// No .wms file found in skin archive.%0 }
  NS_E_WMP_UI_NOSKININZIP = $C00D0FE7;

// An upgrade may be needed for the theme manager to correctly show this skin. Skin reports version: %.1f.%0 }
  NS_S_WMP_UI_VERSIONMISMATCH = $000D0FE8;

// An error occurred in one of the UI components.%0 }
  NS_S_WMP_EXCEPTION = $000D0FE9;

//
// WMP Regional button control
//

// JPG Images are not recommended for use as a mappingImage.%0 }
  NS_E_WMP_RBC_JPGMAPPINGIMAGE = $C00D1004;

// JPG Images are not recommended when using a transparencyColor.%0 }
  NS_E_WMP_JPGTRANSPARENCY = $C00D1005;

//
// WMP CustomSlider control
//

// JPG Images are not recommended for use as a positionImage.%0 }
  NS_E_WMP_CS_JPGPOSITIONIMAGE = $C00D100E;

// The (%s) image's size is not evenly divisible by the positionImage's size.%0 }
  NS_E_WMP_CS_NOTEVENLYDIVISIBLE = $C00D100F;

//
// WMP ZIP Decoder
//

// The ZIP reader opened a file and its signature didn't match that of ZIP files.%0 }
  NS_E_WMPZIP_NOTAZIPFILE = $C00D1018;

// The ZIP reader has detected that the file is corrupt.%0 }
  NS_E_WMPZIP_CORRUPT = $C00D1019;

// GetFileStream, SaveToFile, or SaveTemp file was called on the ZIP reader with a filename that was not found in the zip file.%0 }
  NS_E_WMPZIP_FILENOTFOUND = $C00D101A;

//
// WMP Image Decoding Error codes
//

// Image type not supported.%0 }
  NS_E_WMP_IMAGE_FILETYPE_UNSUPPORTED = $C00D1022;

// Image file may be corrupt.%0 }
  NS_E_WMP_IMAGE_INVALID_FORMAT = $C00D1023;

// Unexpected end of file. GIF file may be corrupt.%0 }
  NS_E_WMP_GIF_UNEXPECTED_ENDOFFILE = $C00D1024;

// Invalid GIF file.%0 }
  NS_E_WMP_GIF_INVALID_FORMAT = $C00D1025;

// Invalid GIF version. Only 87a or 89a supported.%0 }
  NS_E_WMP_GIF_BAD_VERSION_NUMBER = $C00D1026;

// No images found in GIF file.%0 }
  NS_E_WMP_GIF_NO_IMAGE_IN_FILE = $C00D1027;

// Invalid PNG image file format.%0 }
  NS_E_WMP_PNG_INVALIDFORMAT = $C00D1028;

// PNG bitdepth not supported.%0 }
  NS_E_WMP_PNG_UNSUPPORTED_BITDEPTH = $C00D1029;

// Compression format defined in PNG file not supported,%0 }
  NS_E_WMP_PNG_UNSUPPORTED_COMPRESSION = $C00D102A;

// Filter method defined in PNG file not supported.%0 }
  NS_E_WMP_PNG_UNSUPPORTED_FILTER = $C00D102B;

// Interlace method defined in PNG file not supported.%0 }
  NS_E_WMP_PNG_UNSUPPORTED_INTERLACE = $C00D102C;

// Bad CRC in PNG file.%0 }
  NS_E_WMP_PNG_UNSUPPORTED_BAD_CRC = $C00D102D;

// Invalid bitmask in BMP file.%0 }
  NS_E_WMP_BMP_INVALID_BITMASK = $C00D102E;

// Topdown DIB not supported.%0 }
  NS_E_WMP_BMP_TOPDOWN_DIB_UNSUPPORTED = $C00D102F;

// Bitmap could not be created.%0 }
  NS_E_WMP_BMP_BITMAP_NOT_CREATED = $C00D1030;

// Compression format defined in BMP not supported.%0 }
  NS_E_WMP_BMP_COMPRESSION_UNSUPPORTED = $C00D1031;

// Invalid Bitmap format.%0 }
  NS_E_WMP_BMP_INVALID_FORMAT = $C00D1032;

// JPEG Arithmetic coding not supported.%0 }
  NS_E_WMP_JPG_JERR_ARITHCODING_NOTIMPL = $C00D1033;

// Invalid JPEG format.%0 }
  NS_E_WMP_JPG_INVALID_FORMAT = $C00D1034;

// Invalid JPEG format.%0 }
  NS_E_WMP_JPG_BAD_DCTSIZE = $C00D1035;

// Internal version error. Unexpected JPEG library version.%0 }
  NS_E_WMP_JPG_BAD_VERSION_NUMBER = $C00D1036;

// Internal JPEG Library error. Unsupported JPEG data precision.%0 }
  NS_E_WMP_JPG_BAD_PRECISION = $C00D1037;

// JPEG CCIR601 not supported.%0 }
  NS_E_WMP_JPG_CCIR601_NOTIMPL = $C00D1038;

// No image found in JPEG file.%0 }
  NS_E_WMP_JPG_NO_IMAGE_IN_FILE = $C00D1039;

// Could not read JPEG file.%0 }
  NS_E_WMP_JPG_READ_ERROR = $C00D103A;

// JPEG Fractional sampling not supported.%0 }
  NS_E_WMP_JPG_FRACT_SAMPLE_NOTIMPL = $C00D103B;

// JPEG image too large. Maximum image size supported is 65500 X 65500.%0 }
  NS_E_WMP_JPG_IMAGE_TOO_BIG = $C00D103C;

// Unexpected end of file reached in JPEG file.%0 }
  NS_E_WMP_JPG_UNEXPECTED_ENDOFFILE = $C00D103D;

// Unsupported JPEG SOF marker found.%0 }
  NS_E_WMP_JPG_SOF_UNSUPPORTED = $C00D103E;

// Unknown JPEG marker found.%0 }
  NS_E_WMP_JPG_UNKNOWN_MARKER = $C00D103F;

// Successfully loaded a GIF file.%0 }
  NS_S_WMP_LOADED_GIF_IMAGE = $000D1040;

// Successfully loaded a PNG file.%0 }
  NS_S_WMP_LOADED_PNG_IMAGE = $000D1041;

// Successfully loaded a BMP file.%0 }
  NS_S_WMP_LOADED_BMP_IMAGE = $000D1042;

// Successfully loaded a JPG file.%0 }
  NS_S_WMP_LOADED_JPG_IMAGE = $000D1043;

// 
// WMP WM Runtime Error codes
//

// Operation attempted in an invalid graph state.%0 }
  NS_E_WMG_INVALIDSTATE = $C00D1054;

// A renderer cannot be inserted in a stream while one already exists.%0 }
  NS_E_WMG_SINKALREADYEXISTS = $C00D1055;

// A necessary WM SDK interface to complete the operation doesn't exist at this time.%0 }
  NS_E_WMG_NOSDKINTERFACE = $C00D1056;

// Some streams in the current media couldn't be rendered.%0 }
  NS_E_WMG_NOTALLOUTPUTSRENDERED = $C00D1057;

// Failed to render current media.%0 }
  NS_E_WMR_RENDERFAILED = $C00D1058;

// The stream you are attempting to render is currently not supported.%0 }
  NS_E_WMR_UNSUPPORTEDSTREAM = $C00D1059;

// An operation was attempted on a pin that doesn't exist in the DirectShow filter graph.%0 }
  NS_E_WMR_PINNOTFOUND = $C00D105A;

// Specified operation cannot be completed while waiting for a media format change from the SDK.%0 }
  NS_E_WMR_WAITINGONFORMATSWITCH = $C00D105B;

//
// WMP Playlist Error codes
//

// The format of this file was not recognized as a valid playlist format.%0 }
  NS_E_WMX_UNRECOGNIZED_PLAYLIST_FORMAT = $C00D1068;

// This file was believed to be an ASX playlist, but the format was not recognized.%0 }
  NS_E_ASX_INVALIDFORMAT = $C00D1069;

// The version of this playlist is not supported.%0 }
  NS_E_ASX_INVALIDVERSION = $C00D106A;

// Format of a REPEAT loop within the current playlist file is invalid.%0 }
  NS_E_ASX_INVALID_REPEAT_BLOCK = $C00D106B;

// You can not write an empty playlist.%0 }
  NS_E_ASX_NOTHING_TO_WRITE = $C00D106C;

// This playlist was believed to be a simple list of files, but the format was not recoginized.%0 }
  NS_E_URLLIST_INVALIDFORMAT = $C00D106D;

// The specified attribute does not exist.%0 }
  NS_E_WMX_ATTRIBUTE_DOES_NOT_EXIST = $C00D106E;

// The specified attribute already exists.%0 }
  NS_E_WMX_ATTRIBUTE_ALREADY_EXISTS = $C00D106F;

// Can not retrieve the specified attribute.%0 }
  NS_E_WMX_ATTRIBUTE_UNRETRIEVABLE = $C00D1070;

// The specified item does not exist in the current playlist.%0 }
  NS_E_WMX_ITEM_DOES_NOT_EXIST = $C00D1071;

// Items of the specified type can not be created within the current playlist.%0 }
  NS_E_WMX_ITEM_TYPE_ILLEGAL = $C00D1072;

// The specified item can not be set in the current playlist.%0 }
  NS_E_WMX_ITEM_UNSETTABLE = $C00D1073;

//
// WMP Core Error codes
//

// Could not find the source URL for this media.%0 }
  NS_E_WMPCORE_NOSOURCEURLSTRING = $C00D107C;

// Failed to create the Global Interface Table.%0 }
  NS_E_WMPCORE_COCREATEFAILEDFORGITOBJECT = $C00D107D;

// Failed to get the marshalled graph event handler interface.%0 }
  NS_E_WMPCORE_FAILEDTOGETMARSHALLEDEVENTHANDLERINTERFACE = $C00D107E;

// Buffer is too small for copying media type.%0 }
  NS_E_WMPCORE_BUFFERTOOSMALL = $C00D107F;

// Current state of the player does not allow the operation.%0 }
  NS_E_WMPCORE_UNAVAILABLE = $C00D1080;

// Playlist manager does not understand the current play mode (shuffle, normal etc).%0 }
  NS_E_WMPCORE_INVALIDPLAYLISTMODE = $C00D1081;

// Operation failed because the media item is not in the playlist.%0 }
  NS_E_WMPCORE_ITEMNOTINPLAYLIST = $C00D1086;

// Operation failed because there are no items in the playlist.%0 }
  NS_E_WMPCORE_PLAYLISTEMPTY = $C00D1087;

// URL could not be launched since WMP could not find a browser associated with it.%0 }
  NS_E_WMPCORE_NOBROWSER = $C00D1088;

// URL unrecognized by WMP runtime.%0 }
  NS_E_WMPCORE_UNRECOGNIZED_MEDIA_URL = $C00D1089;

// Graph with the specified URL was not found in the prerolled graph list.%0 }
  NS_E_WMPCORE_GRAPH_NOT_IN_LIST = $C00D108A;

// Operation could not be performed because the playlist does not have more than one item.%0 }
  NS_E_WMPCORE_PLAYLIST_EMPTY_OR_SINGLE_MEDIA = $C00D108B;

// An error sink was never registered for the calling object.%0 }
  NS_E_WMPCORE_ERRORSINKNOTREGISTERED = $C00D108C;

// The error manager is not available to respond to errors.%0 }
  NS_E_WMPCORE_ERRORMANAGERNOTAVAILABLE = $C00D108D;

// Failed launching WebHelp URL.%0 }
  NS_E_WMPCORE_WEBHELPFAILED = $C00D108E;

// Could not resume playing next item in playlist.%0 }
  NS_E_WMPCORE_MEDIA_ERROR_RESUME_FAILED = $C00D108F;

// No URL specified in the Ref attribute in playlist file.%0 }
  NS_E_WMPCORE_NO_REF_IN_ENTRY = $C00D1090;

// An empty string for playlist attribute name was found.%0 }
  NS_E_WMPCORE_WMX_LIST_ATTRIBUTE_NAME_EMPTY = $C00D1091;

// An invalid playlist attribute name was found.%0 }
  NS_E_WMPCORE_WMX_LIST_ATTRIBUTE_NAME_ILLEGAL = $C00D1092;

// An empty string for a playlist attribute value was found.%0 }
  NS_E_WMPCORE_WMX_LIST_ATTRIBUTE_VALUE_EMPTY = $C00D1093;

// An illegal value for a playlist attribute was found.%0 }
  NS_E_WMPCORE_WMX_LIST_ATTRIBUTE_VALUE_ILLEGAL = $C00D1094;

// An empty string for a playlist item attribute name was found.%0 }
  NS_E_WMPCORE_WMX_LIST_ITEM_ATTRIBUTE_NAME_EMPTY = $C00D1095;

// An illegal value for a playlist item attribute name was found.%0 }
  NS_E_WMPCORE_WMX_LIST_ITEM_ATTRIBUTE_NAME_ILLEGAL = $C00D1096;

// An illegal value for a playlist item attribute was found.%0 }
  NS_E_WMPCORE_WMX_LIST_ITEM_ATTRIBUTE_VALUE_EMPTY = $C00D1097;

// No entries found in the playlist file.%0 }
  NS_E_WMPCORE_LIST_ENTRY_NO_REF = $C00D1098;

// The codec downloaded for this media does not appear to be properly signed. Installation is not possible.%0 }
  NS_E_WMPCORE_CODEC_NOT_TRUSTED = $C00D109A;

// One or more codecs required to play this media could not be found on the codec server.%0 }
  NS_E_WMPCORE_CODEC_NOT_FOUND = $C00D109B;

// Some of the codecs required by this media are not installed on your system. Since the option for automatic codec acquisition is disabled, no codecs will be downloaded.%0 }
  NS_E_WMPCORE_CODEC_DOWNLOAD_NOT_ALLOWED = $C00D109C;

// Failed to download the playlist file.%0 }
  NS_E_WMPCORE_ERROR_DOWNLOADING_PLAYLIST = $C00D109D;

// Failed to build the playlist.%0 }
  NS_E_WMPCORE_FAILED_TO_BUILD_PLAYLIST = $C00D109E;

// Playlist has no alternates to switch into.%0 }
  NS_E_WMPCORE_PLAYLIST_ITEM_ALTERNATE_NONE = $C00D109F;

// No more playlist alternates available to switch to.%0 }
  NS_E_WMPCORE_PLAYLIST_ITEM_ALTERNATE_EXHAUSTED = $C00D10A0;

// Could not find the name of the alternate playlist to switch into.%0 }
  NS_E_WMPCORE_PLAYLIST_ITEM_ALTERNATE_NAME_NOT_FOUND = $C00D10A1;

// Failed to switch to an alternate for this media.%0 }
  NS_E_WMPCORE_PLAYLIST_ITEM_ALTERNATE_MORPH_FAILED = $C00D10A2;

// Failed to initialize an alternate for the media.%0 }
  NS_E_WMPCORE_PLAYLIST_ITEM_ALTERNATE_INIT_FAILED = $C00D10A3;

// No URL specified for the roll over Refs in the playlist file.%0 }
  NS_E_WMPCORE_MEDIA_ALTERNATE_REF_EMPTY = $C00D10A4;

// Encountered a playlist with no name.%0 }
  NS_E_WMPCORE_PLAYLIST_NO_EVENT_NAME = $C00D10A5;

// A required attribute in the event block of the playlist was not found.%0 }
  NS_E_WMPCORE_PLAYLIST_EVENT_ATTRIBUTE_ABSENT = $C00D10A6;

// No items were found in the event block of the playlist.%0 }
  NS_E_WMPCORE_PLAYLIST_EVENT_EMPTY = $C00D10A7;

// No playlist was found while returning from a nested playlist.%0 }
  NS_E_WMPCORE_PLAYLIST_STACK_EMPTY = $C00D10A8;

// The media item is not active currently.%0 }
  NS_E_WMPCORE_CURRENT_MEDIA_NOT_ACTIVE = $C00D10A9;

// Open was aborted by user.%0 }
  NS_E_WMPCORE_USER_CANCEL = $C00D10AB;

// No items were found inside the playlist repeat block.%0 }
  NS_E_WMPCORE_PLAYLIST_REPEAT_EMPTY = $C00D10AC;

// Media object corresponding to start of a playlist repeat block was not found.%0 }
  NS_E_WMPCORE_PLAYLIST_REPEAT_START_MEDIA_NONE = $C00D10AD;

// Media object corresponding to the end of a playlist repeat block was not found.%0 }
  NS_E_WMPCORE_PLAYLIST_REPEAT_END_MEDIA_NONE = $C00D10AE;

// Playlist URL supplied to the playlist manager is invalid.%0 }
  NS_E_WMPCORE_INVALID_PLAYLIST_URL = $C00D10AF;

// Player is selecting a runtime that is not valid for this media file type.%0 }
  NS_E_WMPCORE_MISMATCHED_RUNTIME = $C00D10B0;

// The import has failed because none of the items in the playlist could be imported.%0 }
  NS_E_WMPCORE_PLAYLIST_IMPORT_FAILED_NO_ITEMS = $C00D10B1;

// An error has occurred that could prevent the changing of the video contrast on this media.%0 }
  NS_E_WMPCORE_VIDEO_TRANSFORM_FILTER_INSERTION = $C00D10B2;

// Unable to acess this media, you may not be connected to the network.%0 }
  NS_E_WMPCORE_MEDIA_UNAVAILABLE = $C00D10B3;

// The playlist contains an ENTRYREF for which no href was parsed. Check the syntax of playlist file.%0 }
  NS_E_WMPCORE_WMX_ENTRYREF_NO_REF = $C00D10B4;

// Could not play any media in the playlist.%0 }
  NS_E_WMPCORE_NO_PLAYABLE_MEDIA_IN_PLAYLIST = $C00D10B5;

// Failed to open the nested playlist because it has no items after player has ignored entries which are pointing to other playlists.%0 }
  NS_E_WMPCORE_PLAYLIST_EMPTY_NESTED_PLAYLIST_SKIPPED_ITEMS = $C00D10B6;

// The player could not handle your request for multimedia content in a timely manner. Please try again later.%0 }
  NS_E_WMPCORE_BUSY = $C00D10B7;

//
// WMP Core Success codes
//

// Failed to clear playlist because it was aborted by user.%0 }
  NS_S_WMPCORE_PLAYLISTCLEARABORT = $000D10FE;

// Failed to remove item in the playlist since it was aborted by user.%0 }
  NS_S_WMPCORE_PLAYLISTREMOVEITEMABORT = $000D10FF;

// Playlist is being generated asynchronously.%0 }
  NS_S_WMPCORE_PLAYLIST_CREATION_PENDING = $000D1102;

// Validation of the media is pending...%0 }
  NS_S_WMPCORE_MEDIA_VALIDATION_PENDING = $000D1103;

// Encountered more than one Repeat block during ASX processing.%0 }
  NS_S_WMPCORE_PLAYLIST_REPEAT_SECONDARY_SEGMENTS_IGNORED = $000D1104;

// Current state of WMP disallows calling this method or property.%0 }
  NS_S_WMPCORE_COMMAND_NOT_AVAILABLE = $000D1105;

// Name for the playlist has been auto generated.%0 }
  NS_S_WMPCORE_PLAYLIST_NAME_AUTO_GENERATED = $000D1106;

// The imported playlist does not contain all items from the original.%0 }
  NS_S_WMPCORE_PLAYLIST_IMPORT_MISSING_ITEMS = $000D1107;

// The playlist has been collapsed into a single media.%0 }
  NS_S_WMPCORE_PLAYLIST_COLLAPSED_TO_SINGLE_MEDIA = $000D1108;

//
// WMP Internet Manager error codes
//

// System is not connected to the Internet.%0 }
  NS_E_WMPIM_USEROFFLINE = $C00D1126;

// User cancelled attempt to connect to the Internet.%0 }
  NS_E_WMPIM_USERCANCELED = $C00D1127;

// Attempt to dial connection to the Internet failed.%0 }
  NS_E_WMPIM_DIALUPFAILED = $C00D1128;

//
// WMP Backup and restore error and success codes
//

// No window is currently listening to Backup and Restore events.%0 }
  NS_E_WMPBR_NOLISTENER = $C00D1130;

// Backup of your licenses has been cancelled. Please try again to ensure license backup.%0 }
  NS_E_WMPBR_BACKUPCANCEL = $C00D1131;

// Restoration of your licenses has been cancelled. Please try again to ensure license restoration.%0 }
  NS_E_WMPBR_RESTORECANCEL = $C00D1132;

// An error occured during the backup or restore operation that requires a web page be displayed to the user.%0 }
  NS_E_WMPBR_ERRORWITHURL = $C00D1133;

// Backup of your licenses was not successfully completed. Please try again or click Details for additional assistance.%0 }
  NS_E_WMPBR_NAMECOLLISION = $C00D1134;

// Backup or Restore successful!.%0 }
  NS_S_WMPBR_SUCCESS = $000D1135;

// Transfer complete with limitations.%0 }
  NS_S_WMPBR_PARTIALSUCCESS = $000D1136;

//
// WMP Effects Success codes
//

// Request to the effects control to change transparency status to transparent.%0 }
  NS_S_WMPEFFECT_TRANSPARENT = $000D1144;

// Request to the effects control to change transparency status to opaque.%0 }
  NS_S_WMPEFFECT_OPAQUE = $000D1145;

//
// WMP Application Success codes
//

// The requested application pane is performing an operation and will not be relased.%0 }
  NS_S_OPERATION_PENDING = $000D114E;

/////////////////////////////////////////////////////////////////////////
//
// Windows Media Server Errors
//
// IdRange = 5000 - 5999
//
/////////////////////////////////////////////////////////////////////////

// The client is redirected to another server.%0 }
  NS_E_REDIRECT = $C00D1388;

// The streaming media description is no longer current.%0 }
  NS_E_STALE_PRESENTATION = $C00D1389;

// Namespace Errors

// Attempt to create a persistent namespace node under a transient parent node.%0 }
  NS_E_NAMESPACE_WRONG_PERSIST = $C00D138A;

// Unable to store a value in a namespace node of different value type.%0 }
  NS_E_NAMESPACE_WRONG_TYPE = $C00D138B;

// Unable to remove the root namespace node.%0 }
  NS_E_NAMESPACE_NODE_CONFLICT = $C00D138C;

// Could not find the specified namespace node.%0 }
  NS_E_NAMESPACE_NODE_NOT_FOUND = $C00D138D;

// The buffer supplied to hold namespace node string is too small.%0 }
  NS_E_NAMESPACE_BUFFER_TOO_SMALL = $C00D138E;

// Callback list on a namespace node is at maximum size.%0 }
  NS_E_NAMESPACE_TOO_MANY_CALLBACKS = $C00D138F;

// Attempt to register an already-registered callback on a namespace node.%0 }
  NS_E_NAMESPACE_DUPLICATE_CALLBACK = $C00D1390;

// Could not find callback in namespace when attempting to remove callback.%0 }
  NS_E_NAMESPACE_CALLBACK_NOT_FOUND = $C00D1391;

// The length of a namespace node name exceeds the allowed maximum length.%0 }
  NS_E_NAMESPACE_NAME_TOO_LONG = $C00D1392;

// Cannot create a namespace node which already exists.%0 }
  NS_E_NAMESPACE_DUPLICATE_NAME = $C00D1393;

// The name of a namespace node cannot be a null string.%0 }
  NS_E_NAMESPACE_EMPTY_NAME = $C00D1394;

// Finding a child namespace node by index failed because the index exceeded the number of children.%0 }
  NS_E_NAMESPACE_INDEX_TOO_LARGE = $C00D1395;

// The name supplied for a namespace node is not valid.%0 }
  NS_E_NAMESPACE_BAD_NAME = $C00D1396;

// Cache Errors

// Archive request conflicts with other requests in progress.%0 }
  NS_E_CACHE_ARCHIVE_CONFLICT = $C00D1397;

// The specified origin server cannot be found.%0 }
  NS_E_CACHE_ORIGIN_SERVER_NOT_FOUND = $C00D1398;

// The specified origin server does not respond.%0 }
  NS_E_CACHE_ORIGIN_SERVER_TIMEOUT = $C00D1399;

// The internal code for HTTP status code 412 Precondition Failed due to not broadcast type.%0 }
  NS_E_CACHE_NOT_BROADCAST = $C00D139A;

// The internal code for HTTP status code 403 Forbidden due to not cacheable.%0 }
  NS_E_CACHE_CANNOT_BE_CACHED = $C00D139B;

// The internal code for HTTP status code 304 Not Modified.%0 }
  NS_E_CACHE_NOT_MODIFIED = $C00D139C;

// Publishing Point Errors

// The Publishing Point can not be removed.%0 }
  NS_E_CANNOT_REMOVE_PUBPOINT = $C00D139D;

/////////////////////////////////////////////////////////////////////////
//
// Windows Media Tools Errors
//
// IdRange = 7000 - 7999
//
/////////////////////////////////////////////////////////////////////////

// The Mark In time should be greater than 0 and less than Mark Out time.%0
  NS_E_BAD_MARKIN = $C00D1B58;

//  The Mark Out time should be greater than Mark In time and less than file duration.%0
  NS_E_BAD_MARKOUT = $C00D1B59;

// No matching media source is found in source group %1.%0 }
  NS_E_NOMATCHING_MEDIASOURCE = $C00D1B5A;

// Unsupported source type.%0 }
  NS_E_UNSUPPORTED_SOURCETYPE = $C00D1B5B;

// No more than 1 audio input is allowed.%0 }
  NS_E_TOO_MANY_AUDIO = $C00D1B5C;

// No more than 2 video inputs are allowed.%0 }
  NS_E_TOO_MANY_VIDEO = $C00D1B5D;

// No matching element is found in the list.%0 }
  NS_E_NOMATCHING_ELEMENT = $C00D1B5E;

// The profile's media content doesn't match the media content defined in the source group.%0 }
  NS_E_MISMATCHED_MEDIACONTENT = $C00D1B5F;

// Cannot remove an active source group from the source group collection while encoder is currently running.%0 }
  NS_E_CANNOT_DELETE_ACTIVE_SOURCEGROUP = $C00D1B60;

// Cannot open specified audio capture device because it is in use right now.%0 }
  NS_E_AUDIODEVICE_BUSY = $C00D1B61;

// Cannot open specified audio capture device because unexpected error occurred.%0 }
  NS_E_AUDIODEVICE_UNEXPECTED = $C00D1B62;

// Audio capture device doesn't support specified audio format.%0 }
  NS_E_AUDIODEVICE_BADFORMAT = $C00D1B63;

// Cannot open specified video capture device because it is in use right now.%0 }
  NS_E_VIDEODEVICE_BUSY = $C00D1B64;

// Cannot open specified video capture device because unexpected error occurred.%0 }
  NS_E_VIDEODEVICE_UNEXPECTED = $C00D1B65;

// This operation is not allowed while encoder is running.%0 }
  NS_E_INVALIDCALL_WHILE_ENCODER_RUNNING = $C00D1B66;

// No profile is set in source group.%0 }
  NS_E_NO_PROFILE_IN_SOURCEGROUP = $C00D1B67;

// The video capture driver returned an unrecoverable error. It is now in an unstable state.%0 }
  NS_E_VIDEODRIVER_UNSTABLE = $C00D1B68;

// The video input device could not be started.%0 }
  NS_E_VIDCAPSTARTFAILED = $C00D1B69;

// The video input source does not support the requested output format or color depth.%0 }
  NS_E_VIDSOURCECOMPRESSION = $C00D1B6A;

// The video input source does not support the request capture size.%0 }
  NS_E_VIDSOURCESIZE = $C00D1B6B;

// Unable to obtain output information from video compressor.%0 }
  NS_E_ICMQUERYFORMAT = $C00D1B6C;

// Unable to create video capture window.%0 }
  NS_E_VIDCAPCREATEWINDOW = $C00D1B6D;

// There already is a running stream active on this video input device.%0 }
  NS_E_VIDCAPDRVINUSE = $C00D1B6E;

// No media format is set in source.%0 }
  NS_E_NO_MEDIAFORMAT_IN_SOURCE = $C00D1B6F;

// Cannot find valid output stream from source.%0 }
  NS_E_NO_VALID_OUTPUT_STREAM = $C00D1B70;

// Cannot find valid source plugin to support specified source.%0 }
  NS_E_NO_VALID_SOURCE_PLUGIN = $C00D1B71;

// No source group is currently active.%0 }
  NS_E_NO_ACTIVE_SOURCEGROUP = $C00D1B72;

// No script stream is set in current active source group.%0 }
  NS_E_NO_SCRIPT_STREAM = $C00D1B73;

// This operation is not allowed when file archival is started.%0 }
  NS_E_INVALIDCALL_WHILE_ARCHIVAL_RUNNING = $C00D1B74;

// The MaxPacketSize value specified is invalid.%0 }
  NS_E_INVALIDPACKETSIZE = $C00D1B75;

// The plugin CLSID specified is invalid.%0 }
  NS_E_PLUGIN_CLSID_NOTINVALID = $C00D1B76;

// This Archive type is not supported.%0 }
  NS_E_UNSUPPORTED_ARCHIVETYPE = $C00D1B77;

// This Archive operation is not supported.%0 }
  NS_E_UNSUPPORTED_ARCHIVEOPERATION = $C00D1B78;

// The local archive filename was not set.%0 }
  NS_E_ARCHIVE_FILENAME_NOTSET = $C00D1B79;

// The SourceGroup is not yet prepared.%0 }
  NS_E_SOURCEGROUP_NOTPREPARED = $C00D1B7A;

// Profiles on the sourcegroups do not match.%0 }
  NS_E_PROFILE_MISMATCH = $C00D1B7B;

// The clip settings specified on the source are incorrect.%0 }
  NS_E_INCORRECTCLIPSETTINGS = $C00D1B7C;

// No statistics are available at this time.%0 }
  NS_E_NOSTATSAVAILABLE = $C00D1B7D;

// Encoder is not archiving.%0 }
  NS_E_NOTARCHIVING = $C00D1B7E;

// This operation is not allowed while encoder is not running.%0 }
  NS_E_INVALIDCALL_WHILE_ENCODER_STOPPED = $C00D1B7F;

// This SourceGroupCollection doesnt contain any SourceGroups.%0 }
  NE_E_NOSOURCEGROUPS = $C00D1B80;

// Because this source group does not have a frame rate of 30 frames per second, you cannot use the inverse telecine feature.%0 }
  NS_E_INVALIDINPUTFPS = $C00D1B81;

// Internal problems are preventing the preview or postview of your content.%0 }
  NS_E_NO_DATAVIEW_SUPPORT = $C00D1B82;

// One or more codecs required to open this media could not be found.%0 }
  NS_E_CODEC_UNAVAILABLE = $C00D1B83;

// The output archive file specified is the same as an input source in one of the source groups.%0 }
  NS_E_ARCHIVE_SAME_AS_INPUT = $C00D1B84;

// The input source has not been setup completely.%0 }
  NS_E_SOURCE_NOTSPECIFIED = $C00D1B85;

// Cannot apply time compression transform plug-in to a real time broadcast session.%0 }
  NS_E_NO_REALTIME_TIMECOMPRESSION = $C00D1B86;

// The Encoder was unable to open this device. Please see the system requirements for more information.%0 }
  NS_E_UNSUPPORTED_ENCODER_DEVICE = $C00D1B87;

// Encoding cannot start because the display size or color setting has changed since the current session was defined. Restore the previous settings or create a new session.%0 }
  NS_E_UNEXPECTED_DISPLAY_SETTINGS = $C00D1B88;

//  No audio data has been received for multiple seconds.  Check the audio source and restart the encoder.%0
  NS_E_NO_AUDIODATA                = $C00D1B89;

//  One or all of your specified input sources are not working properly. Make sure your input sources are configured correctly.%0
  NS_E_INPUTSOURCE_PROBLEM         = $C00D1B8A;

//  The supplied configuration file is not supported by this version of the encoder.%0
  NS_E_WME_VERSION_MISMATCH        = $C00D1B8B;


/////////////////////////////////////////////////////////////////////////
//
// DRM Specific Errors
//
// IdRange = 10000..10999
/////////////////////////////////////////////////////////////////////////

// A problem has occurred in the Digital Rights Management component. Contact product support for this application.%0
  NS_E_DRM_INVALID_APPLICATION = $C00D2711;

// License storage is not working. Contact Microsoft product support.%0 }
  NS_E_DRM_LICENSE_STORE_ERROR = $C00D2712;

// Secure storage is not working. Contact Microsoft product support.%0 }
  NS_E_DRM_SECURE_STORE_ERROR = $C00D2713;

// License acquisition did not work. Acquire a new license or contact the content provider for further assistance.%0 }
  NS_E_DRM_LICENSE_STORE_SAVE_ERROR = $C00D2714;

// A problem has occurred in the Digital Rights Management component. Contact Microsoft product support.%0 }
  NS_E_DRM_SECURE_STORE_UNLOCK_ERROR = $C00D2715;

// The media file is corrupted. Contact the content provider to get a new file.%0 }
  NS_E_DRM_INVALID_CONTENT = $C00D2716;

// The license is corrupted. Acquire a new license.%0 }
  NS_E_DRM_UNABLE_TO_OPEN_LICENSE = $C00D2717;

// The license is corrupted or invalid. Acquire a new license%0 }
  NS_E_DRM_INVALID_LICENSE = $C00D2718;

// Licenses cannot be copied from one computer to another. Use License Management to transfer licenses, or get a new license for the media file.%0 }
  NS_E_DRM_INVALID_MACHINE = $C00D2719;

// The license is corrupted or invalid. Acquire a new license or reinstall the application.%0 }
  NS_E_DRM_LICENSE_EVAL_FAILED = $C00D271A;

// License storage is not working. Contact Microsoft product support.%0 }
  NS_E_DRM_ENUM_LICENSE_FAILED = $C00D271B;

// The media file is corrupted. Contact the content provider to get a new file.%0 }
  NS_E_DRM_INVALID_LICENSE_REQUEST = $C00D271C;

// A problem has occurred in the Digital Rights Management component. Contact Microsoft product support.%0 }
  NS_E_DRM_UNABLE_TO_INITIALIZE = $C00D271D;

// The license could not be acquired. Try again later.%0 }
  NS_E_DRM_UNABLE_TO_ACQUIRE_LICENSE = $C00D271E;

// License acquisition did not work. Acquire a new license or contact the content provider for further assistance.%0 }
  NS_E_DRM_INVALID_LICENSE_ACQUIRED = $C00D271F;

// The requested operation cannot be performed on this file.%0 }
  NS_E_DRM_NO_RIGHTS = $C00D2720;

// A problem has occurred in the Digital Rights Management component. Contact Microsoft product support.%0. }
  NS_E_DRM_KEY_ERROR = $C00D2721;

// A problem has occurred in the Digital Rights Management component. Contact Microsoft product support.%0 }
  NS_E_DRM_ENCRYPT_ERROR = $C00D2722;

// The media file is corrupted. Contact the content provider to get a new file.%0 }
  NS_E_DRM_DECRYPT_ERROR = $C00D2723;

// You cannot save this file.%0 }
  NS_E_DRM_LICENSE_PREVENTS_STORING = $C00D2724;

// The license is corrupted. Acquire a new license.%0 }
  NS_E_DRM_LICENSE_INVALID_XML = $C00D2725;

// Status message: The license was acquired.%0 }
  NS_S_DRM_LICENSE_ACQUIRED = $000D2726;

// Status message: The security upgrade has been completed.%0 }
  NS_S_DRM_INDIVIDUALIZED = $000D2727;

// A security upgrade is required to perform the operation on this media file.%0 }
  NS_E_DRM_NEEDS_INDIVIDUALIZATION = $C00D2728;

// The security upgrade failed. Try again later.%0 }
  NS_E_DRM_INDIVIDUALIZATION_FAILED = $C00D2729;

// The application cannot perform this action. Contact product support for this application.%0 }
  NS_E_DRM_ACTION_NOT_QUERIED = $C00D272A;

// You cannot begin a new license acquisition process until the current one has been completed.%0 }
  NS_E_DRM_ACQUIRING_LICENSE = $C00D272B;

// You cannot begin a new security upgrade until the current one has been completed.%0 }
  NS_E_DRM_INDIVIDUALIZING = $C00D272C;

// A problem has occurred in the Digital Rights Management component. Contact Microsoft product support.%0. }
  NS_E_DRM_ENCRYPTING = $C00D272D;

// A problem has occurred in the Digital Rights Management component. Contact Microsoft product support.%0. }
  NS_E_DRM_PARAMETERS_MISMATCHED = $C00D272F;

// A license cannot be created for this media file. Reinstall the application.%0 }
  NS_E_DRM_UNABLE_TO_CREATE_LICENSE_OBJECT = $C00D2730;

// A problem has occurred in the Digital Rights Management component. Contact Microsoft product support.%0. }
  NS_E_DRM_UNABLE_TO_CREATE_INDI_OBJECT = $C00D2731;

// A problem has occurred in the Digital Rights Management component. Contact Microsoft product support.%0. }
  NS_E_DRM_UNABLE_TO_CREATE_ENCRYPT_OBJECT = $C00D2732;

// A problem has occurred in the Digital Rights Management component. Contact Microsoft product support.%0. }
  NS_E_DRM_UNABLE_TO_CREATE_DECRYPT_OBJECT = $C00D2733;

// A problem has occurred in the Digital Rights Management component. Contact Microsoft product support.%0. }
  NS_E_DRM_UNABLE_TO_CREATE_PROPERTIES_OBJECT = $C00D2734;

// A problem has occurred in the Digital Rights Management component. Contact Microsoft product support.%0. }
  NS_E_DRM_UNABLE_TO_CREATE_BACKUP_OBJECT = $C00D2735;

// The security upgrade failed. Try again later.%0 }
  NS_E_DRM_INDIVIDUALIZE_ERROR = $C00D2736;

// License storage is not working. Contact Microsoft product support.%0 }
  NS_E_DRM_LICENSE_OPEN_ERROR = $C00D2737;

// License storage is not working. Contact Microsoft product support.%0 }
  NS_E_DRM_LICENSE_CLOSE_ERROR = $C00D2738;

// License storage is not working. Contact Microsoft product support.%0 }
  NS_E_DRM_GET_LICENSE_ERROR = $C00D2739;

// A problem has occurred in the Digital Rights Management component. Contact Microsoft product support.%0. }
  NS_E_DRM_QUERY_ERROR = $C00D273A;

// A problem has occurred in the Digital Rights Management component. Contact product support for this application.%0 }
  NS_E_DRM_REPORT_ERROR = $C00D273B;

// License storage is not working. Contact Microsoft product support.%0 }
  NS_E_DRM_GET_LICENSESTRING_ERROR = $C00D273C;

// The media file is corrupted. Contact the content provider to get a new file.%0 }
  NS_E_DRM_GET_CONTENTSTRING_ERROR = $C00D273D;

// A problem has occurred in the Digital Rights Management component. Try again later.%0 }
  NS_E_DRM_MONITOR_ERROR = $C00D273E;

// The application has made an invalid call to the Digital Rights Management component. Contact product support for this application.%0 }
  NS_E_DRM_UNABLE_TO_SET_PARAMETER = $C00D273F;

// A problem has occurred in the Digital Rights Management component. Contact Microsoft product support.%0. }
  NS_E_DRM_INVALID_APPDATA = $C00D2740;

// A problem has occurred in the Digital Rights Management component. Contact product support for this application.%0. }
  NS_E_DRM_INVALID_APPDATA_VERSION = $C00D2741;

// Licenses are already backed up in this location.%0 }
  NS_E_DRM_BACKUP_EXISTS = $C00D2742;

// One or more backed-up licenses are missing or corrupt.%0 }
  NS_E_DRM_BACKUP_CORRUPT = $C00D2743;

// You cannot begin a new backup process until the current process has been completed.%0 }
  NS_E_DRM_BACKUPRESTORE_BUSY = $C00D2744;

// A problem has occurred in the Digital Rights Management component. Contact product support for this application.%0. }
  NS_E_DRM_GET_ATTRIBUTE_ERROR = $C00D2745;

// Status message: License monitoring has been cancelled.%0 }
  NS_S_DRM_MONITOR_CANCELLED = $000D2746;

// Status message: License acquisition has been cancelled.%0 }
  NS_S_DRM_ACQUIRE_CANCELLED = $000D2747;

// The license is invalid. Contact the content provider for further assistance.%0 }
  NS_E_DRM_LICENSE_UNUSABLE = $C00D2748;

// A required property was not set by the application. Contact product support for this application.%0. }
  NS_E_DRM_INVALID_PROPERTY = $C00D2749;

// A problem has occurred in the Digital Rights Management component of this application. Try to acquire a license again.%0 }
  NS_E_DRM_SECURE_STORE_NOT_FOUND = $C00D274A;

// A license cannot be found for this media file. Use License Management to transfer a license for this file from the original computer, or acquire a new license.%0 }
  NS_E_DRM_CACHED_CONTENT_ERROR = $C00D274B;

// A problem occurred during the security upgrade. Try again later.%0 }
  NS_E_DRM_INDIVIDUALIZATION_INCOMPLETE = $C00D274C;

// Certified driver components are required to play this media file. Contact Windows Update to see whether updated drivers are available for your hardware.%0 }
  NS_E_DRM_DRIVER_AUTH_FAILURE = $C00D274D;

// A new version of the Digital Rights Management component is required. Contact product support for this application to get the latest version.%0 }
  NS_E_DRM_NEED_UPGRADE = $C00D274E;

// Status message: Reopen the file.%0 }
  NS_E_DRM_REOPEN_CONTENT = $C00D274F;

// Certain driver functionality is required to play this media file. Contact Windows Update to see whether updated drivers are available for your hardware.%0 }
  NS_E_DRM_DRIVER_DIGIOUT_FAILURE = $C00D2750;

// A problem has occurred in the Digital Rights Management component. Contact Microsoft product support.%0. }
  NS_E_DRM_INVALID_SECURESTORE_PASSWORD = $C00D2751;

// A problem has occurred in the Digital Rights Management component. Contact Microsoft product support.%0. }
  NS_E_DRM_APPCERT_REVOKED = $C00D2752;

// You cannot restore your license(s).%0 }
  NS_E_DRM_RESTORE_FRAUD = $C00D2753;

// The licenses for your media files are corrupted. Contact Microsoft product support.%0 }
  NS_E_DRM_HARDWARE_INCONSISTENT = $C00D2754;

// To transfer this media file, you must upgrade the application.%0 }
  NS_E_DRM_SDMI_TRIGGER = $C00D2755;

// You cannot make any more copies of this media file.%0 }
  NS_E_DRM_SDMI_NOMORECOPIES = $C00D2756;

//  A problem has occurred in the Digital Rights Management component. Contact Microsoft product support.%0.
  NS_E_DRM_UNABLE_TO_CREATE_AUTHENTICATION_OBJECT = $C00D2763;


/////////////////////////////////////////////////////////////////////////
//
// Windows Media Setup Specific Errors
//
// IdRange = 11000..11999
/////////////////////////////////////////////////////////////////////////

// The requested operation is successful. Some cleanup will not be complete until the system is rebooted.%0 }
  NS_S_REBOOT_RECOMMENDED = $000D2AF8;

// The requested operation is successful. The system will not function correctly until the system is rebooted.%0 }
  NS_S_REBOOT_REQUIRED = $000D2AF9;

// The requested operation failed. Some cleanup will not be complete until the system is rebooted.%0 }
  NS_E_REBOOT_RECOMMENDED = $C00D2AFA;

// The requested operation failed. The system will not function correctly until the system is rebooted.%0 }
  NS_E_REBOOT_REQUIRED = $C00D2AFB;


/////////////////////////////////////////////////////////////////////////
//
// Windows Media Networking Errors
//
// IdRange = 12000..12999
/////////////////////////////////////////////////////////////////////////

// The specified protocol is not supported.%0 }
  NS_E_UNKNOWN_PROTOCOL = $C00D2EE0;

// The client is redirected to a proxy server.%0 }
  NS_E_REDIRECT_TO_PROXY = $C00D2EE1;

// The server encountered an unexpected condition which prevented it from fulfilling the request.%0 }
  NS_E_INTERNAL_SERVER_ERROR = $C00D2EE2;

// The request could not be understood by the server.%0 }
  NS_E_BAD_REQUEST = $C00D2EE3;

// The proxy experienced an error while attempting to contact the media server.%0 }
  NS_E_ERROR_FROM_PROXY = $C00D2EE4;

// The proxy did not receive a timely response while attempting to contact the media server.%0 }
  NS_E_PROXY_TIMEOUT = $C00D2EE5;

// The server is currently unable to handle the request due to a temporary overloading or maintenance of the server.%0 }
  NS_E_SERVER_UNAVAILABLE = $C00D2EE6;

// The server is refusing to fulfill the requested operation.%0 }
  NS_E_REFUSED_BY_SERVER = $C00D2EE7;

// The server is not a compatible streaming media server.%0 }
  NS_E_INCOMPATIBLE_SERVER = $C00D2EE8;

// The content cannot be streamed because the Multicast protocol has been disabled.%0 }
  NS_E_MULTICAST_DISABLED = $C00D2EE9;

// The server redirected the player to an invalid location.%0 }
  NS_E_INVALID_REDIRECT = $C00D2EEA;

// The content cannot be streamed because all protocols have been disabled.%0 }
  NS_E_ALL_PROTOCOLS_DISABLED = $C00D2EEB;

// The MSBD protocol is no longer supported. Please use HTTP to connect to the Windows Media stream.%0 }
  NS_E_MSBD_NO_LONGER_SUPPORTED = $C00D2EEC;

// The proxy server could not be located. Please check your proxy server configuration.%0 }
  NS_E_PROXY_NOT_FOUND = $C00D2EED;

// Unable to establish a connection to the proxy server. Please check your proxy server configuration.%0 }
  NS_E_CANNOT_CONNECT_TO_PROXY = $C00D2EEE;

// Unable to locate the media server. The operation timed out.%0 }
  NS_E_SERVER_DNS_TIMEOUT = $C00D2EEF;

// Unable to locate the proxy server. The operation timed out.%0 }
  NS_E_PROXY_DNS_TIMEOUT = $C00D2EF0;

// Media closed because Windows was shut down.%0 }
  NS_E_CLOSED_ON_SUSPEND = $C00D2EF1;

///////////////////////////////////////////////////////////////////////////
//
// ASFErr.h - definition of ASF HRESULT codes
//
//  Microsoft Windows Media Technology
//  Copyright (C) Microsoft Corporation, 1999 - 2001.  All Rights Reserved.
//
// This file is generated by the MC tool from ASFErr.mc
//

//#define  STATUS_SEVERITY(hr)  (((hr) >> 30) & 0x3)


///////////////////////////////////////////////////////////////////////////
//
// Advanced Streaming Format (ASF) Errors (2000 - 2999)
//
//
//  Values are 32 bit values layed out as follows:
//
//   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
//   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
//  +---+-+-+-----------------------+-------------------------------+
//  |Sev|C|R|     Facility          |               Code            |
//  +---+-+-+-----------------------+-------------------------------+
//
//  where
//
//      Sev - is the severity code
//
//          00 - Success
//          01 - Informational
//          10 - Warning
//          11 - Error
//
//      C - is the Customer code flag
//
//      R - is a reserved bit
//
//      Facility - is the facility code
//
//      Code - is the facility's status code
//
//
// Define the facility codes
//
const
  //FACILITY_NS                   =   $D; -> NSERROR

// Define the severity codes
  //STATUS_SEVERITY_WARNING       =   $2; -> NSERROR
  //STATUS_SEVERITY_SUCCESS       =   $0; -> NSERROR
  //STATUS_SEVERITY_INFORMATIONAL =   $1; -> NSERROR
  //STATUS_SEVERITY_ERROR         =   $3; -> NSERROR

//  An attempt was made to seek or position past the end of a buffer.%0
  ASF_E_BUFFEROVERRUN           =   $C00D07D0;

//  The supplied input or output buffer was too small.%0
  ASF_E_BUFFERTOOSMALL          =  $C00D07D1;

//  The language ID was not found.%0
  ASF_E_BADLANGUAGEID           =  $C00D07D2;

//  The multiple payload packet is missing the payload length.%0
  ASF_E_NOPAYLOADLENGTH         =  $C00D07DB;

//  The packet contains too many payloads.%0
  ASF_E_TOOMANYPAYLOADS         =  $C00D07DC;

//  ASF_E_PACKETCONTENTTOOLARGE
  ASF_E_PACKETCONTENTTOOLARGE   =  $C00D07DE;

//  Expecting a fixed packet size but min. and max. are not equal.%0
  ASF_E_UNKNOWNPACKETSIZE       =   $C00D07E0;

//  ASF_E_INVALIDHEADER
  ASF_E_INVALIDHEADER           =   $C00D07E2;

//  The object does not have a valid clock object.%0
  ASF_E_NOCLOCKOBJECT           =   $C00D07E6;

//  ASF_E_UNKNOWNCLOCKTYPE
  ASF_E_UNKNOWNCLOCKTYPE        =   $C00D07EB;

//  An attempt was made to restore or access an opaque packet.%0
  ASF_E_OPAQUEPACKET            =   $C00D07ED;

//  ASF_E_WRONGVERSION
  ASF_E_WRONGVERSION            =   $C00D07EE;

//  An attempt was made to store a value which was larger than then destination's maximum value.%0
  ASF_E_OVERFLOW                =   $C00D07EF;

//  The object was not found.%0
  ASF_E_NOTFOUND                =   $C00D07F0;

//
// Someone else is using MessageIds 2033 & 2034, so we skip them
//
// 2033 = NS_E_NOTHING_TO_DO
// 2034 = NS_E_NO_MULTICAST

//  The object is too large to be processed in the requested manner.%0
  ASF_E_OBJECTTOOBIG            =   $C00D07F3;

//  A value was not set as expected.%0
  ASF_E_UNEXPECTEDVALUE         =   $C00D07F4;

//  The request is not valid in the object's current state.%0
  ASF_E_INVALIDSTATE            =   $C00D07F5;

//  This object does not have a valid library pointer; it was not properly created or it has been Shutdown().%0
  ASF_E_NOLIBRARY               =   $C00D07F6;

//  This object has already been initialized; the setting cannot be changed.%0
  ASF_E_ALREADYINITIALIZED      =   $C00D07F7;

//  This object has not been initialized properly; that operation cannot be performed.%0
  ASF_E_INVALIDINIT             =   $C00D07F8;

//  The ASF Header object could not be found.%0
  ASF_E_NOHEADEROBJECT          =   $C00D07F9;

//  The ASF Data object could not be found.%0
  ASF_E_NODATAOBJECT            =   $C00D07FA;

//  The ASF Index object could not be found.%0
  ASF_E_NOINDEXOBJECT           =   $C00D07FB;

//  A Stream Properties object with the correct stream number could not be found.%0
  ASF_E_NOSTREAMPROPS           =   $C00D07FC;

//  The File Properties object could not be found.%0
  ASF_E_NOFILEPROPS             =   $C00D07FD;

//  The Language List object could not be found.%0
  ASF_E_NOLANGUAGELIST          =   $C00D07FE;

//  The Index Parameters object could not be found.%0
  ASF_E_NOINDEXPARAMETERS       =   $C00D07FF;

//  The requested error concealment strategy is not supported by this component.%0
  ASF_E_UNSUPPORTEDERRORCONCEALMENT = $C00D0800;

//  The flags for this object or set of objects are not properly set.%0
  ASF_E_INVALIDFLAGS            =   $C00D0801;

//  One or more data descriptors is not properly set.%0
  ASF_E_BADDATADESCRIPTOR       =   $C00D0802;

//  The index has an invalid time interval (probably zero).%0
  ASF_E_BADINDEXTIMEINTERVAL    =   $C00D0803;

//  The given time value is not valid.%0
  ASF_E_INVALIDTIME             =   $C00D0804;

//  The given index value is not valid.%0
  ASF_E_INVALIDINDEX            =   $C00D0805;

//  The specified stream number is already in use.%0
  ASF_E_STREAMNUMBERINUSE       =   $C00D0806;

//  The specified media type does not work with this component.%0
  ASF_E_BADMEDIATYPE            =   $C00D0807;

//  The object could not be written as specified.%0
  ASF_E_WRITEFAILED             =   $C00D0808;

//  The given data unit requires a larger number of descriptors to be fully parsed.%0
  ASF_E_NOTENOUGHDESCRIPTORS    =   $C00D0809;

//  The index entries for the specified index block have been unloaded from memory and are not available.%0
  ASF_E_INDEXBLOCKUNLOADED      =   $C00D080A;

//  The specified bandwidth is not large enough.%0
  ASF_E_NOTENOUGHBANDWIDTH      =   $C00D080B;

//  The object has exceeded its maximum size.%0
  ASF_E_EXCEEDEDMAXIMUMOBJECTSIZE  = $C00D080C;

//  The given data unit is corrupted, badly formatted, or otherwise not valid.%0
  ASF_E_BADDATAUNIT                = $C00D080D;

//  The ASF header has exceeded the specified maximum size.%0
  ASF_E_HEADERSIZE                 = $C00D080E;


///////////////////////////////////////////////////////////////////////////
//
// Advanced Streaming Format (ASF) Success Codes (2000 - 2999)
//

//  ASF_S_OPAQUEPACKET
  ASF_S_OPAQUEPACKET               = $000D07F0;

//+-------------------------------------------------------------------------
//
//  Microsoft Windows Media Technologies
//  Copyright (C) Microsoft Corporation, 1999 - 2001.  All Rights Reserved.
//
//  File:       WMSBuffer.idl
//
//  Contents:
//
//--------------------------------------------------------------------------

const
  IID_INSSBuffer          : TGUID = '{E1CD3524-03D7-11d2-9EED-006097D2D7CF}';
  IID_IWMSBuffer          : TGUID = '{E1CD3524-03D7-11d2-9EED-006097D2D7CF}';
  IID_IWMSBufferAllocator : TGUID = '{61103CA4-2033-11d2-9EF1-006097D2D7CF}';
  IID_INSSBuffer2         : TGUID = '{4f528693-1035-43fe-b428-757561ad3a68}';

type
  INSSBuffer = interface;
  IWMSBuffer = INSSBuffer;

  INSSBuffer = interface(IUnknown)
    ['{E1CD3524-03D7-11d2-9EED-006097D2D7CF}']
    function GetLength(out pdwLength: DWORD): HResult; stdcall;
    function SetLength(dwLength: DWORD): HResult; stdcall;
    function GetMaxLength(out pdwLength: DWORD): HResult; stdcall;
    function GetBuffer(out ppdwBuffer): HResult; stdcall;
    function GetBufferAndLength(out ppdwBuffer; out pdwLength: DWORD): HResult; stdcall;
  end;

  INSSBuffer2 = interface(INSSBuffer)
    ['{4F528693-1035-43fe-B428-757561AD3A68}']
    function GetSampleProperties(cbProperties: DWORD; out pbProperties: BYTE): HResult; stdcall;
    function SetSampleProperties(cbProperties: DWORD; pbProperties : PBYTE): HResult; stdcall;
  end;

  IWMSBufferAllocator = interface(IUnknown)
    ['{61103CA4-2033-11d2-9EF1-006097D2D7CF}']
    function AllocateBuffer(dwMaxBufferSize: DWORD; out ppBuffer: INSSBuffer): HResult; stdcall;
    function AllocatePageSizeBuffer(dwMaxBufferSize: DWORD; out ppBuffer: INSSBuffer): HResult; stdcall;
  end;

//============================================================================
//
//  wmdmlog.h + wmdmlog_i.c
//
//============================================================================

const
  IID_IWMDMLogger  : TGUID = '{110A3200-5A79-11d3-8D78-444553540000}';
  LIBID_WMDMLogLib : TGUID = '{110A3201-5A79-11d3-8D78-444553540000}';
  CLSID_WMDMLogger : TGUID = '{110A3202-5A79-11d3-8D78-444553540000}';

  WMDM_LOG_SEV_INFO            = $00000001;
  WMDM_LOG_SEV_WARN            = $00000002;
  WMDM_LOG_SEV_ERROR           = $00000004;
  WMDM_LOG_NOTIMESTAMP         = $00000010;

type

  IWMDMLogger = interface(IUnknown)
    ['{110A3200-5A79-11d3-8D78-444553540000}']
    function IsEnabled(out pfEnabled: BOOL): HResult; stdcall;
    function Enable(fEnable: BOOL): HResult; stdcall;
    function GetLogFileName(out pszFilename: WideChar; nMaxChars: UINT): HResult; stdcall;
    function SetLogFileName(pszFilename: PWideChar): HResult; stdcall;
    function LogString(dwFlags: DWORD; pszSrcName, pszLog: PWideChar): HResult; stdcall;
    function LogDword(dwFlags: DWORD; pszSrcName, pszLogFormat: PWideChar;
               dwLog: DWORD): HResult; stdcall;
    function Reset: HResult; stdcall;
    function GetSizeParams(out pdwMaxSize, pdwShrinkToSize: DWORD): HResult; stdcall;
    function SetSizeParams(dwMaxSize, dwShrinkToSize: DWORD): HResult; stdcall;
  end;

//============================================================================
//
//  Microsoft Windows Media Technology
//  Copyright (C) Microsoft Corporation, 1999 - 2001.  All Rights Reserved.
//
//  File:        wmsdkidl.idl
//
//  Description:
//
//============================================================================

///////////////////////////////////////////////////////////////////////////////
//
// Enumerations and constants used by the SDK.
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//
// Attributes
//
///////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////
// These are the special case attributes that give information
// about the Windows Media file.
const
  g_dwWMSpecialAttributes = DWORD(14);
  g_wszWMDuration         = 'Duration';
  g_wszWMBitrate          = 'Bitrate';
  g_wszWMSeekable         = 'Seekable';
  g_wszWMStridable        = 'Stridable';
  g_wszWMBroadcast        = 'Broadcast';
  g_wszWMProtected        = 'Is_Protected';
  g_wszWMTrusted          = 'Is_Trusted';
  g_wszWMSignature_Name   = 'Signature_Name';
  g_wszWMHasAudio         = 'HasAudio';
  g_wszWMHasImage         = 'HasImage';
  g_wszWMHasScript        = 'HasScript';
  g_wszWMHasVideo         = 'HasVideo';
  g_wszWMCurrentBitrate   = 'CurrentBitrate';
  g_wszWMOptimalBitrate   = 'OptimalBitrate';

////////////////////////////////////////////////////////////////
// The content description object supports 5 basic attributes.

  g_dwWMContentAttributes = DWORD(5);
  g_wszWMTitle            = 'Title';
  g_wszWMAuthor           = 'Author';
  g_wszWMDescription      = 'Description';
  g_wszWMRating           = 'Rating';
  g_wszWMCopyright        = 'Copyright';

////////////////////////////////////////////////////////////////" )
// These attributes are used to set DRM properties." )

  g_wszWMUse_DRM   = 'Use_DRM';
  g_wszWMDRM_Flags = 'DRM_Flags';
  g_wszWMDRM_Level = 'DRM_Level';

////////////////////////////////////////////////////////////////
// These are the additional attributes defined in the WM attribute
// namespace that give information about the content.

  g_wszWMAlbumTitle    = 'WM/AlbumTitle';
  g_wszWMTrack         = 'WM/Track';
  g_wszWMPromotionURL  = 'WM/PromotionURL';
  g_wszWMAlbumCoverURL = 'WM/AlbumCoverURL';
  g_wszWMGenre         = 'WM/Genre';
  g_wszWMYear          = 'WM/Year';
  g_wszWMGenreID       = 'WM/GenreID';
  g_wszWMMCDI          = 'WM/MCDI';

////////////////////////////////////////////////////////////////" )
// These optional attributes may be used to give information " )
// about the branding of the content." )

  g_wszWMBannerImageType = 'BannerImageType';
  g_wszWMBannerImageData = 'BannerImageData';
  g_wszWMBannerImageURL  = 'BannerImageURL';
  g_wszWMCopyrightURL    = 'CopyrightURL';

////////////////////////////////////////////////////////////////
// The NSC file supports the following attributes.

  g_dwWMNSCAttributes   = DWORD(5);
  g_wszWMNSCName        = 'NSC_Name';
  g_wszWMNSCAddress     = 'NSC_Address';
  g_wszWMNSCPhone       = 'NSC_Phone';
  g_wszWMNSCEmail       = 'NSC_Email';
  g_wszWMNSCDescription = 'NSC_Description';

///////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////
// These are setting names for use in Get/SetOutputSetting

  g_wszEarlyDataDelivery  = 'EarlyDataDelivery';
  g_wszJustInTimeDecode   = 'JustInTimeDecode';
  g_wszSingleOutputBuffer = 'SingleOutputBuffer';
  g_wszSoftwareScaling    = 'SoftwareScaling';
  g_wszDeliverOnReceive   = 'DeliverOnReceive'; //7.1

////////////////////////////////////////////////////////////////
// These are setting names for use in Get/SetInputSetting

  g_wszDeinterlaceMode = 'DeinterlaceMode';

////////////////////////////////////////////////////////////////
// All known IWMPropertyVault property names

  g_wszOriginalSourceFormatTag = '_SOURCEFORMATTAG'; // 7.1

///////////////////////////////////////////////////////////////////////////////
// Enumerations and flags used by the SDK.
///////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////" )
// Flags that can be passed into the Start method of IWMReader" )

  WM_START_CURRENTPOSITION     = int64(-1);

// Flag to force overwrite of existing license backup
  WM_BACKUP_OVERWRITE      = DWORD($00000001);
  WM_RESTORE_INDIVIDUALIZE = DWORD($00000002);

// Wave format ex type
  WAVE_FORMAT_DRM          = $0009;

// The flags that can be set on a sample (input or output).
  WM_SF_CLEANPOINT    = $1;
  WM_SF_DISCONTINUITY = $2;
  WM_SF_DATALOSS      = $4;

// These flags might be set for a call to the IWMReaderAllocatorEx methods.
  WM_SFEX_NOTASYNCPOINT = $2;
  WM_SFEX_DATALOSS      = $4;

// Status messages that the reader and index objects can
// pass in the OnStatus call.
type
  TWMT_STATUS = (
    WMT_ERROR,
    WMT_OPENED,
    WMT_BUFFERING_START,
    WMT_BUFFERING_STOP,
    WMT_END_OF_FILE, //  WMT_EOF = 4
    WMT_END_OF_SEGMENT,
    WMT_END_OF_STREAMING,
    WMT_LOCATING,
    WMT_CONNECTING,
    WMT_NO_RIGHTS,
    WMT_MISSING_CODEC,
    WMT_STARTED,
    WMT_STOPPED,
    WMT_CLOSED,
    WMT_STRIDING,
    WMT_TIMER,
    WMT_INDEX_PROGRESS,
    WMT_SAVEAS_START,
    WMT_SAVEAS_STOP,
    WMT_NEW_SOURCEFLAGS,
    WMT_NEW_METADATA,
    WMT_BACKUPRESTORE_BEGIN,
    WMT_SOURCE_SWITCH,
    WMT_ACQUIRE_LICENSE,
    WMT_INDIVIDUALIZE,
    WMT_NEEDS_INDIVIDUALIZATION,
    WMT_NO_RIGHTS_EX,
    WMT_BACKUPRESTORE_END,
    WMT_BACKUPRESTORE_CONNECTING,
    WMT_BACKUPRESTORE_DISCONNECTING,
    WMT_ERROR_WITHURL,
    WMT_RESTRICTED_LICENSE,
    WMT_CLIENT_CONNECT,
    WMT_CLIENT_DISCONNECT
  );

type
  TWMT_RIGHTS = TOleEnum;
  const
    WMT_RIGHT_PLAYBACK                  = $00000001;
    WMT_RIGHT_COPY_TO_NON_SDMI_DEVICE   = $00000002;
    WMT_RIGHT_COPY_TO_CD                = $00000008;
    WMT_RIGHT_COPY_TO_SDMI_DEVICE       = $00000010;
    WMT_RIGHT_ONE_TIME                  = $00000020;
    WMT_RIGHT_SDMI_TRIGGER              = $00010000;
    WMT_RIGHT_SDMI_NOMORECOPIES         = $00020000;


// Stream selection statuses (stati?).
type
  PWMT_STREAM_SELECTION = ^TWMT_STREAM_SELECTION;
  TWMT_STREAM_SELECTION = (
    WMT_OFF,
    WMT_CLEANPOINT_ONLY,
    WMT_ON
  );

// Attribute datatypes.
  TWMT_ATTR_DATATYPE = (
    WMT_TYPE_DWORD,
    WMT_TYPE_STRING,
    WMT_TYPE_BINARY,
    WMT_TYPE_BOOL,
    WMT_TYPE_QWORD,
    WMT_TYPE_WORD,
    WMT_TYPE_GUID
  );

// Types of images that can be stored in the header of a Windows Media File.
  TWMT_ATTR_IMAGETYPE = (
    WMT_IMAGETYPE_INVALID_0,
    WMT_IMAGETYPE_BITMAP,
    WMT_IMAGETYPE_JPEG,
    WMT_IMAGETYPE_GIF
  );

// Windows Media versions.
type
  PWMT_VERSION = ^TWMT_VERSION;
  TWMT_VERSION = TOleEnum;
  const
    WMT_VER_4_0 = $00040000;
    WMT_VER_7_0 = $00070000;

// Protocols that the network sink supports.
type
  TWMT_NET_PROTOCOL = (
    WMT_PROTOCOL_HTTP
  );

// The reader supports a number of different types of playback, each with
// slightly different characteristics.
  TWMT_PLAY_MODE = (
    WMT_PLAY_MODE_AUTOSELECT,
    WMT_PLAY_MODE_LOCAL,
    WMT_PLAY_MODE_DOWNLOAD,
    WMT_PLAY_MODE_STREAMING
  );

// Network Proxy settings for the reader
  PWMT_PROXY_SETTINGS = ^TWMT_PROXY_SETTINGS;
  TWMT_PROXY_SETTINGS = (
    WMT_PROXY_SETTING_NONE,
    WMT_PROXY_SETTING_MANUAL,
    WMT_PROXY_SETTING_AUTO,
    WMT_PROXY_SETTING_BROWSER // Only valid for HTTP
  );

  TWMT_CODEC_INFO_TYPE = TOleEnum;
  const
    WMT_CODECINFO_AUDIO         = 0;           // codec info is a word = wFormatTag
    WMT_CODECINFO_VIDEO         = 1;           // codec info is a dword = biCompression
    WMT_CODECINFO_UNKNOWN       = $FFFFFFFF;   // codec info is undefined

type
  TDRM_HTTP_STATUS = (
    HTTP_NOTINITIATED,
    HTTP_CONNECTING,
    HTTP_REQUESTING,
    HTTP_RECEIVING,
    HTTP_COMPLETED
  );

//  The various states individualization can be in:
  TDRM_INDIVIDUALIZATION_STATUS = TOleEnum;
  const
    INDI_UNDEFINED   = $0000;
    INDI_BEGIN       = $0001;
    INDI_SUCCEED     = $0002;
    INDI_FAIL        = $0004;
    INDI_CANCEL      = $0008;
    INDI_DOWNLOAD    = $0010;
    INDI_INSTALL     = $0020;

// These values can be passed in when setting the DeinterlaceMode
// setting on the writer
  WM_DM_NOTINTERLACED                          = Longint(0);
  WM_DM_DEINTERLACE_NORMAL                     = Longint(1);
  WM_DM_DEINTERLACE_HALFSIZE                   = Longint(2);
  WM_DM_DEINTERLACE_HALFSIZEDOUBLERATE         = Longint(3);
  WM_DM_DEINTERLACE_INVERSETELECINE            = Longint(4);
  WM_DM_DEINTERLACE_VERTICALHALFSIZEDOUBLERATE = Longint(5);


// Frame level access data structures - not supported in this version
type
  TWMT_OFFSET_FORMAT = ( //7.1
    WMT_OFFSET_FORMAT_100NS,
    WMT_OFFSET_FORMAT_SMPTE,
    WMT_OFFSET_FORMAT_FRAME_NUMBERS,
    WMT_OFFSET_FORMAT_PLAYLIST_OFFSET
  );


///////////////////////////////////////////////////////////////////////////////
//
// Structures used by the SDK.
//
///////////////////////////////////////////////////////////////////////////////

// Writer Statistics struct
type
  TWMWriterStatistics = record
    qwSampleCount: int64;
    qwByteCount  : int64;

    qwDroppedSampleCount: int64;
    qwDroppedByteCount  : int64;

    dwCurrentBitrate : DWORD;
    dwAverageBitrate : DWORD;
    dwExpectedBitrate: DWORD;

    // Sample rates are given as 1000 * (samples / second).
     dwCurrentSampleRate : DWORD;
     dwAverageSampleRate : DWORD;
     dwExpectedSampleRate: DWORD;
  end;

// Reader Statistics struct
  TWMReaderStatistics = record
    cbSize           : DWORD;
    dwBandwidth      : DWORD;
    cPacketsReceived : DWORD;
    cPacketsRecovered: DWORD;
    cPacketsLost     : DWORD;
    wQuality         : WORD;
  end;

// Reader Client Info struct
  PWMReaderClientInfo = ^TWMReaderClientInfo;
  TWMReaderClientInfo = record
     cbSize             : DWORD;
     wszLang            : PWideChar;  // 2-3 letter language code
     wszBrowserUserAgent: PWideChar;  // Embedded browser's user-agent string
     wszBrowserWebPage  : PWideChar;  // The web page that contains the plugin
     qwReserved         : int64;      // Reserved
     pReserved          : Pointer;    // Reserved
     wszHostExe         : PWideChar;  // iexplore.exe, netscape.exe dshow.exe, etc
     qwHostVersion      : int64;      // Version of the host application e.g.:4.70.12.15
  end;

  TWMIndividualizeStatus = record
    hr                : HRESULT;
    enIndiStatus      : TDRM_INDIVIDUALIZATION_STATUS;
    pszIndiRespUrl    : PAnsiChar;
    dwHTTPRequest     : DWORD;
    enHTTPStatus      : TDRM_HTTP_STATUS;
    dwHTTPReadProgress: DWORD;
    dwHTTPReadTotal   : DWORD;
  end;

  TWMGetLicenseData = record
    dwSize          : DWORD;
    hr              : HRESULT;
    wszURL          : PWideChar;
    wszLocalFilename: PWideChar;
    pbPostData      : PBYTE;
    dwPostDataSize  : DWORD;
  end;

  TWMClientProperties = record
    dwIPAddress: DWORD;
    dwPort     : DWORD;
  end;

// Inclusive port number range.
// Used by IWMReaderNetworkConfig.
  PWMPortNumberRange = ^TWMPortNumberRange;
  TWMPortNumberRange = record
    wPortBegin: WORD;
    wPortEnd  : WORD;
  end;

///////////////////////////////////////////////////////////////////////////////
//
// Media-type structures and GUIDs.
//
///////////////////////////////////////////////////////////////////////////////

// We use DirectShow media types in this SDK. However, to avoid conflict with
// their names, we define our own version of the structure. This is exactly
// the same as an AM_MEDIA_TYPE!

  PWM_MEDIA_TYPE = ^TWM_MEDIA_TYPE;
  TWM_MEDIA_TYPE = record
    majortype: TGUID;
    subtype: TGUID;
    bFixedSizeSamples: BOOL;
    bTemporalCompression: BOOL;
    lSampleSize: ULONG;
    formattype: TGUID;
    pUnk: IUnknown;
    cbFormat: ULONG;
    pbFormat: Pointer;
  end;

  PWMVIDEOINFOHEADER = ^TWMVIDEOINFOHEADER;
  TWMVIDEOINFOHEADER = record
    rcSource       : TRECT; // The bit we really want to use.
    rcTarget       : TRECT; // Where the video should go.
    dwBitRate      : DWORD; // Approximate bit data rate.
    dwBitErrorRate : DWORD; // Bit error rate for this stream.
    AvgTimePerFrame: int64; // Average time per frame (100ns units).
    bmiHeader      : TBITMAPINFOHEADER;
  end;

  TWMSCRIPTFORMAT = record
    scriptType: TGUID;
  end;

// This special GUID is used to create a subtype from an audio format tag, or
// video four-character code. Just fill in the first DWORD of the GUID with
// the appropriate value.
const
  GUID_NULL: TGUID = (D1:$00000000;D2:$0000;D3:$0000;D4:($00,$00,$00,$00,$00,$00,$00,$00));

  WMMEDIASUBTYPE_Base : TGUID = '{00000000-0000-0010-8000-00AA00389B71}';
  WMMEDIATYPE_Video   : TGUID = '{73646976-0000-0010-8000-00AA00389B71}'; // 'vids'
  MEDIASUBTYPE_RGB1   : TGUID = '{e436eb78-524f-11ce-9f53-0020af0ba770}';
  MEDIASUBTYPE_RGB4   : TGUID = '{e436eb79-524f-11ce-9f53-0020af0ba770}';
  MEDIASUBTYPE_RGB8   : TGUID = '{e436eb7a-524f-11ce-9f53-0020af0ba770}';
  MEDIASUBTYPE_RGB565 : TGUID = '{e436eb7b-524f-11ce-9f53-0020af0ba770}';
  MEDIASUBTYPE_RGB555 : TGUID = '{e436eb7c-524f-11ce-9f53-0020af0ba770}';
  MEDIASUBTYPE_RGB24  : TGUID = '{e436eb7d-524f-11ce-9f53-0020af0ba770}';
  MEDIASUBTYPE_RGB32  : TGUID = '{e436eb7e-524f-11ce-9f53-0020af0ba770}';
  MEDIASUBTYPE_I420   : TGUID = '{30323449-0000-0010-8000-00AA00389B71}'; // 'YV12'
  MEDIASUBTYPE_IYUV   : TGUID = '{56555949-0000-0010-8000-00AA00389B71}'; // 'YV12'
  MEDIASUBTYPE_YV12   : TGUID = '{31313259-0000-0010-8000-00AA00389B71}'; // 'YV12'
  MEDIASUBTYPE_YUY2   : TGUID = '{32595559-0000-0010-8000-00AA00389B71}'; // 'YUY2'
  MEDIASUBTYPE_UYVY   : TGUID = '{59565955-0000-0010-8000-00AA00389B71}'; // 'UYVY'
  MEDIASUBTYPE_YVYU   : TGUID = '{55595659-0000-0010-8000-00AA00389B71}'; // 'YVYU'
  MEDIASUBTYPE_YVU9   : TGUID = '{39555659-0000-0010-8000-00AA00389B71}'; // 'YVU9'
  WMMEDIASUBTYPE_MP43 : TGUID = '{3334504D-0000-0010-8000-00AA00389B71}';
  WMMEDIASUBTYPE_MP4S : TGUID = '{5334504D-0000-0010-8000-00AA00389B71}';
  WMMEDIASUBTYPE_WMV1 : TGUID = '{31564D57-0000-0010-8000-00AA00389B71}';
  WMMEDIASUBTYPE_WMV2 : TGUID = '{32564D57-0000-0010-8000-00AA00389B71}'; // 7.1
  WMMEDIASUBTYPE_MSS1 : TGUID = '{3153534D-0000-0010-8000-00AA00389B71}';
  WMMEDIATYPE_Audio   : TGUID = '{73647561-0000-0010-8000-00AA00389B71}'; // 'auds'
  WMMEDIASUBTYPE_PCM  : TGUID = '{00000001-0000-0010-8000-00AA00389B71}';
  WMMEDIASUBTYPE_DRM  : TGUID = '{00000009-0000-0010-8000-00AA00389B71}';


// WM Audio v2 and v7 are actually compatible bitstreams.

  WMMEDIASUBTYPE_WMAudioV7 : TGUID = '{00000161-0000-0010-8000-00AA00389B71}';
  WMMEDIASUBTYPE_WMAudioV2 : TGUID = '{00000161-0000-0010-8000-00AA00389B71}';
  WMMEDIASUBTYPE_ACELPnet  : TGUID = '{00000130-0000-0010-8000-00AA00389B71}';
  MEDIATYPE_Script         : TGUID = '{73636d64-0000-0010-8000-00AA00389B71}'; // 'scmd'
  WMMEDIATYPE_Image        : TGUID = '{34A50FD8-8AA5-4386-81FE-A0EFE0488E31}';
  WMFORMAT_VideoInfo       : TGUID = '{05589f80-c356-11ce-bf01-00aa0055595a}';
  WMFORMAT_WaveFormatEx    : TGUID = '{05589f81-c356-11ce-bf01-00aa0055595a}';
  WMFORMAT_Script          : TGUID = '{5C8510F2-DEBE-4ca7-BBA5-F07A104F8DFF}';
  WMSCRIPTTYPE_TwoStrings  : TGUID = '{82f38a70-c29f-11d1-97ad-00a0c95ea850}';

///////////////////////////////////////////////////////////////////////////////
//
// IID GUIDs defined here.
//
///////////////////////////////////////////////////////////////////////////////

  IID_IWMMediaProps             : TGUID = '{96406BCE-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMVideoMediaProps        : TGUID = '{96406BCF-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMWriter                 : TGUID = '{96406BD4-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMInputMediaProps        : TGUID = '{96406BD5-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMReader                 : TGUID = '{96406BD6-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMOutputMediaProps       : TGUID = '{96406BD7-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMReaderCallback         : TGUID = '{96406BD8-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMMetadataEditor         : TGUID = '{96406BD9-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMHeaderInfo             : TGUID = '{96406BDA-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMProfile                : TGUID = '{96406BDB-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMProfileManager         : TGUID = '{d16679f2-6ca0-472d-8d31-2f5d55aee155}';
  IID_IWMStreamConfig           : TGUID = '{96406BDC-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMStreamList             : TGUID = '{96406BDD-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMMutualExclusion        : TGUID = '{96406BDE-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMPacketSize             : TGUID = '{CDFB97AB-188F-40b3-B643-5B7903975C59}';
  IID_IWMWriterAdvanced         : TGUID = '{96406BE3-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMWriterAdvanced2        : TGUID = '{962dc1ec-c046-4db8-9cc7-26ceae500817}';
  IID_IWMWriterSink             : TGUID = '{96406BE4-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMWriterFileSink         : TGUID = '{96406BE5-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMWriterNetworkSink      : TGUID = '{96406BE7-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMReaderAdvanced         : TGUID = '{96406BEA-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMReaderAdvanced2        : TGUID = '{ae14a945-b90c-4d0d-9127-80d665f7d73e}';
  IID_IWMReaderAdvanced3        : TGUID = '{5dc0674b-f04b-4a4e-9f2a-b1afde2c8100}';//7.1
  IID_IWMReaderCallbackAdvanced : TGUID = '{96406BEB-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMDRMReader              : TGUID = '{D2827540-3EE7-432c-B14C-DC17F085D3B3}';
  IID_IWMReaderNetworkConfig    : TGUID = '{96406BEC-2B2B-11d3-B36B-00C04F6108FF}';
  IID_IWMLicenseBackup          : TGUID = '{05E5AC9F-3FB6-4508-BB43-A4067BA1EBE8}';
  IID_IWMLicenseRestore         : TGUID = '{C70B6334-0544-4efb-A245-15E65A004A13}';
  IID_IWMBackupRestoreProps     : TGUID = '{3C8E0DA6-996F-4ff3-A1AF-4838F9377E2E}';
  IID_IWMCodecInfo              : TGUID = '{A970F41E-34DE-4a98-B3BA-E4B3CA7528F0}';
  IID_IWMCodecInfo2             : TGUID = '{AA65E273-B686-4056-91EC-DD768D4DF710}';
  IID_IWMStatusCallback         : TGUID = '{6d7cdc70-9888-11d3-8edc-00c04f6109cf}';
  IID_IWMCredentialCallback     : TGUID = '{342e0eb7-e651-450c-975b-2ace2c90c48e}';
  IID_IWMHeaderInfo2            : TGUID = '{15cf9781-454e-482e-b393-85fae487a810}';
  IID_IWMProfileManager2        : TGUID = '{7a924e51-73c1-494d-8019-23d37ed9b89a}';
  IID_IWMProfile2               : TGUID = '{07e72d33-d94e-4be7-8843-60ae5ff7e5f5}';
  IID_IWMWriterFileSink2        : TGUID = '{14282ba7-4aef-4205-8ce5-c229035a05bc}';
  IID_IWMClientConnections      : TGUID = '{73c66010-a299-41df-b1f0-ccf03b09c1c6}';
  IID_IWMReaderStreamClock      : TGUID = '{96406bed-2b2b-11d3-b36b-00c04f6108ff}';
  IID_IWMIndexer                : TGUID = '{6d7cdc71-9888-11d3-8edc-00c04f6109cf}';
  IID_IWMReaderAllocatorEx      : TGUID = '{9f762fa7-a22e-428d-93c9-ac82f3aafe5a}';
  IID_IWMReaderTypeNegotiation  : TGUID = '{fdbe5592-81a1-41ea-93bd-735cad1adc05}';
  IID_IWMRegisterCallback       : TGUID = '{cf4b1f99-4de2-4e49-a363-252740d99bc1}';
  IID_IWMWriterPostView         : TGUID = '{81e20ce4-75ef-491a-8004-fc53c45bdc3e}';
  IID_IWMWriterPostViewCallback : TGUID = '{d9d6549d-a193-4f24-b308-03123d9b7f8d}';
  IID_IWMPropertyVault          : TGUID = '{72995A79-5090-42a4-9C8C-D9D0B6D34BE5}';


///////////////////////////////////////////////////////////////////////////////
// Other GUIDs defined here
///////////////////////////////////////////////////////////////////////////////

  CLSID_WMMUTEX_Bitrate : TGUID = '{D6E22A01-35DA-11D1-9034-00A0C90349BE}';

///////////////////////////////////////////////////////////////////////////////
// Max Video Streams / Bands
///////////////////////////////////////////////////////////////////////////////

  WM_MAX_VIDEO_STREAMS           = $00c;

///////////////////////////////////////////////////////////////////////////////
//
// Creation functions.
//
// The SDK supports 3 major objects:
// - CLSID_WMWriter - For writing out WM content.
// - CLSID_WMReader - For playing back WM content.
// - CLSID_WMMetadataEditor - For getting and editing header metadata in WM
//   content.
//
///////////////////////////////////////////////////////////////////////////////

// moved to bottom

///////////////////////////////////////////////////////////////////////////////
//
// The following interfaces define the media types that this SDK supports.
// These media types are used by the writer, the reader, and the profile
// object, to identify the media-type specific properties of a media stream.
//
// The main media type is stored in the WM_MEDIA_TYPE structure. Some
// interesting (option) parameters may exist for particular stream types;
// in that case, an IWM<x>MediaProps interface can be used to get and set
// these additional parameters.
//
///////////////////////////////////////////////////////////////////////////////
type
  IWMMediaProps = interface(IUnknown)
    ['{96406BCE-2B2B-11d3-B36B-00C04F6108FF}']
    // GetType is provided for convenience; it returns the same as the
    // majortype of the WM_MEDIA_TYPE.
    function GetType(out pguidType: TGUID): HRESULT; stdcall;
    function GetMediaType(pType: PWM_MEDIA_TYPE; var pcbType: DWORD): HRESULT; stdcall;
    function SetMediaType(pType: PWM_MEDIA_TYPE): HRESULT; stdcall;
  end;

  IWMVideoMediaProps = interface(IWMMediaProps)
    ['{96406BCF-2B2B-11d3-B36B-00C04F6108FF}']
    function GetMaxKeyFrameSpacing(out pllTime: int64): HRESULT; stdcall;
    function SetMaxKeyFrameSpacing(llTime: int64): HRESULT; stdcall;
    function GetQuality(out pdwQuality: DWORD): HRESULT; stdcall;
    function SetQuality(dwQuality: DWORD): HRESULT; stdcall;
  end;

///////////////////////////////////////////////////////////////////////////////
//
// The CLSID_WMWriter basic interfaces.
//
// Usage scenario is as follows:
// 1) SetProfile to define the configuration.
// 2) Set the outputs.
// 3) Call GetInputCount (which is valid after (1)), and GetInputProps for
//    each stream. Get the default input format, and change it if desired.
// 3.5) Call SetAttribute to add metadata to the header
// At this point, the writer has been configured.
// 4) Call WriteSample repeatedly, until done. (Note that the AllocateSample
//    call is just provided for convenience. You are welcome to pass in your
//    own samples.)
// 5) Call Flush to write out any buffered data, and update the header and
//    index.
//
///////////////////////////////////////////////////////////////////////////////
  IWMProfile         = interface;
  IWMInputMediaProps = interface;
  
  IWMWriter = interface(IUnknown)
    ['{96406BD4-2B2B-11d3-B36B-00C04F6108FF}']
    // This interface QI's for IWMHeaderInfo, and IWMWriterAdvanced.
    // There are 3 options for setting the profile on the writer. Note that
    // setting the profile means that the profile is copied into the writer.
    // Further editing of that profile object will have no effect, unless
    // SetProfile() is called again.
    // Calling SetProfile() removes any previously set header attribute info
    function SetProfileByID(const guidProfile : TGUID): HRESULT; stdcall;       // ok
    function SetProfile(pProfile: IWMProfile): HRESULT; stdcall;                // ok
    // The easiest way to use the writer is just to write to file.
    function SetOutputFilename(pwszFilename: PWideChar): HRESULT; stdcall;      // ok
    // The user can enumerate through the various inputs, and get the input
    // format. Note that these are not ASF streams; one input stream may map
    // to multiple ASF streams in a MEB scenario.
    // Manipulating the IWMInputMediaProps has no effect on the writer, unless
    // the user calls SetInputProps to configure the input.
    function GetInputCount(out pcInputs: DWORD): HRESULT; stdcall;              // ok
    function GetInputProps(dwInputNum: DWORD; out ppInput: IWMInputMediaProps): HRESULT; stdcall;  // ok
    function SetInputProps(dwInputNum: DWORD; pInput: IWMInputMediaProps): HRESULT; stdcall; // ok
    // Used for determining all possible format types supported by this
    // input on the writer.
    function GetInputFormatCount(dwInputNumber: DWORD; out pcFormats: DWORD): HRESULT; stdcall;
    function GetInputFormat(dwInputNumber, dwFormatNumber: DWORD; out pProps: IWMInputMediaProps): HRESULT; stdcall;
    // You must call BeginWriting before sending any samples, and
    // you must call EndWriting when you're done sending samples.
    function BeginWriting: HRESULT; stdcall;                                    // ok
    // EndWriting flushes everything, updates indices and headers,
    // and closes the file.
    function EndWriting: HRESULT; stdcall;                                      // ok
    // Allocate a sample. This is optional; the user is welcome to allocate
    // their own buffer class.
    function AllocateSample(dwSampleSize: DWORD; out ppSample: INSSBuffer): HRESULT; stdcall;
    function WriteSample(dwInputNum: DWORD; cnsSampleTime: int64; dwFlags: DWORD;
               pSample: INSSBuffer): HRESULT; stdcall;
    // Flush() will flush the writer, but leaves the writer prepared to run
    // again, when WriteSample() is called again.
    // Flush() also causes an updated header to be sent to the sink.
    function Flush: HRESULT; stdcall;                                           // ok 
  end;

  IWMInputMediaProps = interface(IWMMediaProps) // ok
    ['{96406BD5-2B2B-11d3-B36B-00C04F6108FF}']
    function GetConnectionName(out pwszName{array[0..n]of wchar} ;
      var pcchName: WORD {n+1}): HRESULT; stdcall;
    function GetGroupName(out pwszName{array[0..n]of wchar};
      var pcchName: WORD{n+1}): HRESULT; stdcall;
  end;

  IWMPropertyVault = interface(IUnknown)
    ['{72995A79-5090-42a4-9C8C-D9D0B6D34BE5}']
    function GetPropertyCount(pdwCount: PDWORD): HRESULT; stdcall;
    function GetPropertyByName(pszName: PWideChar; out pType: TWMT_ATTR_DATATYPE;
      out pValue: BYTE; var pdwSize: DWORD): HRESULT; stdcall;
    function SetProperty(pszName: PWideChar; pType: TWMT_ATTR_DATATYPE; pValue: PBYTE;
      dwSize: DWORD): HRESULT; stdcall;
    function GetPropertyByIndex(dwIndex: DWORD; out pszName: WideChar; var pdwNameLen: DWORD;
      out pType: TWMT_ATTR_DATATYPE; out pValue: BYTE; var pdwSize: DWORD): HRESULT; stdcall;
    function CopyPropertiesFrom(pIWMPropertyVault: IWMPropertyVault): HRESULT; stdcall;
    function Clear: HRESULT; stdcall;
  end;


///////////////////////////////////////////////////////////////////////////////
//
// The CLSID_WMReader basic interfaces.
//
// Usage is as follows:
// 1) Call Open with a URL (possibly a local filename) and a user-supplied
//    callback. After open has completed, the file has been opened and parsed.
// 2) Call GetOutputCount, and GetOutputProps for each output. This
//    is valid after (1). This allows the user to get the output format for
//    each output.
// 3) Call Start. Status messages and samples will begin arriving in the
//    callback function.
// 4) Continue with any combination of Start/Stop/Pause/Seek/SetRate, until
//    finished.
//
///////////////////////////////////////////////////////////////////////////////
  IWMReaderCallback   = interface;
  IWMOutputMediaProps = interface;

  IWMReader = interface(IUnknown)
    ['{96406BD6-2B2B-11d3-B36B-00C04F6108FF}']
    // This interface QI's for IWMHeaderInfo, IWMProfile, IWMReaderAdvanced,
    // IWMReaderAdvanced2 and IWMReaderAdvanced3.
    // Open is an asynch call; it returns almost immediately (if the URL
    // is valid), and the user should wait for appropriate OnStatus calls to
    // be sent to the callback.
    function Open(pwszURL: PWideChar; pCallback: IWMReaderCallback; pvContext: pointer): HRESULT; stdcall; // ok
    function Close: HRESULT; stdcall;                                            // ok
    // The user can enumerate through the various outputs, and get the
    // output format for that data.
    // Manipulating the IWMOutputMediaProps has no effect on the output, unless
    // the user also calls SetOutputProps.
    function GetOutputCount(out pcOutputs: DWORD): HRESULT; stdcall;
    function GetOutputProps(dwOutputNum: DWORD; out ppOutput: IWMOutputMediaProps): HRESULT; stdcall;
    function SetOutputProps(dwOutputNum: DWORD; pOutput: IWMOutputMediaProps): HRESULT; stdcall;
    // Used for determining all possible format types supported by this
    // output on the reader.
    function GetOutputFormatCount(dwOutputNumber: DWORD; out pcFormats: DWORD): HRESULT; stdcall;
    function GetOutputFormat(dwOutputNumber, dwFormatNumber: DWORD; out ppProps: IWMOutputMediaProps): HRESULT; stdcall;
    // If duration is 0, play to the end of the file.
    // If msStart is set to WM_START_CURRENTPOSITION then don't perform a seek
    // operation.  A good use for this is when you want to change the rate but
    // not the current file position.
    // Note that any call to start while Paused will be treated as a seek.
    // Even calls to Start( WM_START_CURRENTPOSITION, ... ).  If your intention
    // is to seek (which will incur the buffering penalty from network files)
    // then you can go ahead and call Start.  However, if your intention was
    // to continue playing from where the user paused, you should call Resume
    // instead.
    function Start(cnsStart, cnsDuration: int64; fRate: single; pvContext: pointer): HRESULT; stdcall; // ok
    function Stop: HRESULT; stdcall; // ok
    function Pause: HRESULT; stdcall;
    function Resume: HRESULT; stdcall;
  end;

  IWMOutputMediaProps = interface(IWMMediaProps)
    ['{96406BD7-2B2B-11d3-B36B-00C04F6108FF}']
    // A Stream Group and type together uniquely identify each output. (The
    // type is on IWMMediaProps).
    function GetStreamGroupName(out pwszName: WideChar; var pcchName: WORD): HRESULT; stdcall;
    function GetConnectionName(out pwszName: WideChar; var pcchName: WORD): HRESULT; stdcall;
  end;

  IWMStatusCallback = interface(IUnknown)
    ['{6d7cdc70-9888-11d3-8edc-00c04f6109cf}']
    // The contents of pValue depends on the Status.
    function OnStatus(Status: TWMT_STATUS; hr: HRESULT; dwType: TWMT_ATTR_DATATYPE;
               pValue: PBYTE; pvContext: pointer): HRESULT; stdcall;
  end;

 IWMReaderCallback = interface(IWMStatusCallback)
   ['{96406BD8-2B2B-11d3-B36B-00C04F6108FF}']
    // cnsSampleDuration will be 0 for most media types.
    function OnSample(dwOutputNum: DWORD; cnsSampleTime, cnsSampleDuration: int64;
              dwFlags: DWORD; pSample: INSSBuffer; pvContext: pointer): HRESULT; stdcall;
  end;

  IWMCredentialCallback = interface(IUnknown)
    ['{342e0eb7-e651-450c-975b-2ace2c90c48e}']
    function AcquireCredentials(pwszRealm, pwszSite: PWideChar; pwszUser: pointer{pwidechar};
               cchUser: DWORD; pwszPassword: pointer{pwidechar}; cchPassword: DWORD;
               hrStatus: HRESULT; var pdwFlags: DWORD): HRESULT; stdcall;
  end;

///////////////////////////////////////////////////////////////////////////////
//
// The CLSID_WMMetadataEditor basic interfaces.
//
// Usage:
// 1) Call Open with a filename.
// 2) QI for IWMHeaderInfo, and use that to get and set attributes as
//    needed.
// 3) Flush() will cause any changes to be written back to disk (if possible).
// 4) Close() closes the file without writing any changes to disk.
//
///////////////////////////////////////////////////////////////////////////////

  IWMMetadataEditor = interface(IUnknown)
    ['{96406BD9-2B2B-11d3-B36B-00C04F6108FF}']
    // QI this for IWMHeaderInfo to edit the header attributes.
    // Manage the file
    function Open(pwszFilename: PWideChar): HRESULT; stdcall;
    function Close: HRESULT; stdcall;
    function Flush: HRESULT; stdcall;
  end;

///////////////////////////////////////////////////////////////////////////////
//
// Below are utility interfaces used across all 3 of the main objects.
//
///////////////////////////////////////////////////////////////////////////////

// The 3 main interface (IWMWriter, IWMReader, and
// IWMMetadataEditor) can be QI'd for this interface to get and set
// header attributes, and markers.

 IWMHeaderInfo = interface(IUnknown)
   ['{96406BDA-2B2B-11d3-B36B-00C04F6108FF}']
    // For attributes, the stream number passed in means:
    // -1 (0xffff) to specifies "any or no stream".
    // 0 specifies "no stream".
    // Any other value indicates the stream number.
    //
    // Windows Media version 4 and earlier does not support per stream
    // attributes, so any stream number other than 0 will fail.
    function GetAttributeCount(wStreamNum: WORD; out pcAttributes: WORD): HRESULT; stdcall; // ok
    function GetAttributeByIndex(wIndex: WORD; var pwStreamNum: WORD; out pwszName: WideChar;
               var pcchNameLen: WORD; out pType: TWMT_ATTR_DATATYPE; out pValue: BYTE;
               var pcbLength: WORD): HRESULT; stdcall;
    function GetAttributeByName(var pwStreamNum: WORD; pszName: PWideChar;
               out pType: TWMT_ATTR_DATATYPE; pValue: PBYTE; var pcbLength: WORD): HRESULT; stdcall; // ok
    function SetAttribute(wStreamNum: WORD; pszName: PWideChar; Type_ : TWMT_ATTR_DATATYPE;
               Value: PByte; cbLength: WORD): HRESULT; stdcall;  // ok
    // Marker methods.
    function GetMarkerCount(out pcMarkers: WORD): HRESULT; stdcall;
    function GetMarker(wIndex: WORD; out pwszMarkerName: PWideChar; var pcchMarkerNameLen: WORD;
               out pcnsMarkerTime: int64): HRESULT; stdcall;
    function AddMarker(pwszMarkerName: PWideChar; cnsMarkerTime: int64): HRESULT; stdcall;
    function RemoveMarker(wIndex: WORD): HRESULT; stdcall;
    // Script command methods.
    function GetScriptCount(out pcScripts: WORD): HRESULT; stdcall; // ok
    function GetScript(wIndex: WORD; pwszType: PWideChar; var pcchTypeLen: WORD;
               pwszCommand: PWideChar; var pcchCommandLen: WORD; out pcnsScriptTime: int64): HRESULT; stdcall; // ok
    function AddScript(pwszType, pwszCommand: PWideChar; cnsScriptTime: int64): HRESULT; stdcall; // ok
    function RemoveScript(wIndex: WORD): HRESULT; stdcall;
  end;

// The 3 main interface (IWMWriter, IWMReader, and
// IWMMetadataEditor) can be QI'd for this interface to get and set
// header attributes, and markers.

  IWMHeaderInfo2 = interface(IWMHeaderInfo)
    ['{15CF9781-454E-482e-B393-85FAE487A810}']
    function GetCodecInfoCount( out pcCodecInfos: DWORD): HRESULT; stdcall;
    function GetCodecInfo(wIndex: DWORD; var pcchName: WORD; out pwszName: WideChar;
                var pcchDescription: WORD; out pwszDescription: PWideChar;
                out pCodecType: TWMT_CODEC_INFO_TYPE; var pcbCodecInfo: WORD;
                out pbCodecInfo: BYTE): HRESULT; stdcall;
  end;


///////////////////////////////////////////////////////////////////////////////
//
// The profile API. The intention is that most users don't touch the profile
// API, but just use pre-existing profiles.
//
// Profiles define authoring configurations, such as stream types, bitrates,
// etc.
//
///////////////////////////////////////////////////////////////////////////////

 IWMProfileManager = interface(IUnknown)
   ['{d16679f2-6ca0-472d-8d31-2f5d55aee155}']
    // Create a profile with nothing in it.
    function CreateEmptyProfile(dwVersion: TWMT_VERSION; out ppProfile: IWMProfile): HRESULT; stdcall;
    // Load a system profile given its ID.
    function LoadProfileByID( const guidProfile: TGUID; out ppProfile: IWMProfile): HRESULT; stdcall; // ok
    // Load a profile from a stored string.
    function LoadProfileByData(pwszProfile: PWideChar; out ppProfile: IWMProfile): HRESULT; stdcall;
    // Save profile specified by its string.
    function SaveProfile(pIWMProfile: IWMProfile; pwszProfile: PWideChar; var pdwLength: DWORD): HRESULT; stdcall;
    // Iterate through the system profiles.
    function GetSystemProfileCount(out pcProfiles: DWORD): HRESULT; stdcall;
    function LoadSystemProfile(dwProfileIndex: DWORD; out ppProfile: IWMProfile): HRESULT; stdcall;
  end;

  IWMProfileManager2 = interface(IWMProfileManager)
    ['{7A924E51-73C1-494d-8019-23D37ED9B89A}']
    // Set the version number of the system profiles that the profile manager
    // will enumerate. WMT_VER_4_0 is the default, for compatibility reasons,
    // so be sure to set this to the latest version if that is the desired
    // result.
    function GetSystemProfileVersion(pdwVersion: PWMT_VERSION): HRESULT; stdcall;
    function SetSystemProfileVersion(dwVersion: TWMT_VERSION): HRESULT; stdcall;
  end;

 IWMStreamConfig    = interface;
 IWMMutualExclusion = interface;
 
 IWMProfile = interface(IUnknown)
   ['{96406BDB-2B2B-11d3-B36B-00C04F6108FF}']
    // By default, when the user creates a profile, it will use the latest
    // version of Windows Media. To create a backward-compatible profile,
    // call IWMProfileManager::CreateEmptyProfile with the appropriate version
    // number.
    function GetVersion(out pdwVersion: TWMT_VERSION): HRESULT; stdcall;
    // Profiles have names and descriptions, for use when displaying lists
    // of profiles, etc.
    function GetName(out pwszName: WideChar; var pcchName: DWORD): HRESULT; stdcall;
    function SetName(pwszName: PWideChar): HRESULT; stdcall;
    function GetDescription(out pwszDescription: WideChar; var pcchName: DWORD): HRESULT; stdcall;
    function SetDescription(pwszDescription: PWideChar): HRESULT; stdcall;
    // Methods for enumerating the streams. Note that updating the
    // returned IWMStreamConfig has no effect on the profile until you
    // call ReconfigStream().
    function GetStreamCount(out pcStreams: DWORD): HRESULT; stdcall; // ok
    function GetStream(dwStreamIndex: DWORD; out ppConfig: IWMStreamConfig): HRESULT; stdcall; // ok
    function GetStreamByNumber(wStreamNum: WORD; out ppConfig: IWMStreamConfig): HRESULT; stdcall;
    // Remove a stream.
    function RemoveStream(pConfig: IWMStreamConfig): HRESULT; stdcall;
    function RemoveStreamByNumber(wStreamNum: WORD): HRESULT; stdcall;
    // Adding a stream copies the config into the profile.
    function AddStream(pConfig: IWMStreamConfig): HRESULT; stdcall;
    function ReconfigStream(pConfig: IWMStreamConfig): HRESULT; stdcall;
    // Create a new stream config object (avoiding the need to CoCreate).
    // This will still need to be added to the profile using the AddStream()
    // call (but only after it has been configured).
    function CreateNewStream(const guidStreamType: TGUID; out ppConfig: IWMStreamConfig): HRESULT; stdcall;
    // Mutual Exclusion. As above, only Add and Remove actual change the
    // profile.
    function GetMutualExclusionCount(out pcME: DWORD): HRESULT; stdcall;
    function GetMutualExclusion(dwMEIndex: DWORD; out ppME: IWMMutualExclusion): HRESULT; stdcall;
    function RemoveMutualExclusion(pME: IWMMutualExclusion): HRESULT; stdcall;
    function AddMutualExclusion(pME: IWMMutualExclusion): HRESULT; stdcall;
    function CreateNewMutualExclusion(out ppME: IWMMutualExclusion): HRESULT; stdcall;
  end;

  IWMProfile2 = interface(IWMProfile)
    ['{07E72D33-D94E-4be7-8843-60AE5FF7E5F5}']
    // Get/set this profile's unique identifier
    function GetProfileID(out pguidID: TGUID): HRESULT; stdcall;
  end;

// IWMStreamConfig represents an ASF stream.

  IWMStreamConfig = interface(IUnknown)
    ['{96406BDC-2B2B-11d3-B36B-00C04F6108FF}']
    // This interface QI's for IWMMediaProps and one of it's inheritors.
    // (IWMVideoMediaProps, for instance).
    function GetStreamType(out pguidStreamType: TGUID): HRESULT; stdcall;
    function GetStreamNumber(out pwStreamNum: WORD): HRESULT; stdcall; // ok
    function SetStreamNumber(wStreamNum: WORD): HRESULT; stdcall;
    function GetStreamName(out pwszStreamName: WideChar; var pcchStreamName: WORD): HRESULT; stdcall;
    function SetStreamName(pwszStreamName: PWideChar): HRESULT; stdcall;
    function GetConnectionName(out pwszInputName: WideChar; var pcchInputName: WORD): HRESULT; stdcall;
    function SetConnectionName(pwszInputName: PWideChar): HRESULT; stdcall;
    function GetBitrate(out pdwBitrate: DWORD): HRESULT; stdcall;
    function SetBitrate(pdwBitrate: DWORD): HRESULT; stdcall;
    // A buffer window of -1 (0xffffffff) indicates that the buffer window
    // is unknown. On the writer side, this means the writer can use whatever
    // buffer window it chooses.
    function GetBufferWindow(out pmsBufferWindow: DWORD): HRESULT; stdcall;
    function SetBufferWindow(msBufferWindow: DWORD): HRESULT; stdcall;
  end;

// Controls how big packets can get in an ASF file.

  IWMPacketSize = interface(IUnknown)
    ['{CDFB97AB-188F-40b3-B643-5B7903975C59}']
    function GetMaxPacketSize(out pdwMaxPacketSize: DWORD): HRESULT; stdcall;
    function SetMaxPacketSize(dwMaxPacketSize: DWORD): HRESULT; stdcall;
  end;

// IWMStreamList is used for the various objects that define relationships
// between streams.

  IWMStreamList = interface(IUnknown)
    ['{96406BDD-2B2B-11d3-B36B-00C04F6108FF}']
    function GetStreams(out pwStreamNumArray: WORD; var pcStreams: WORD): HRESULT; stdcall;
    function AddStream(wStreamNum: WORD): HRESULT; stdcall;
    function RemoveStream(wStreamNum: WORD): HRESULT; stdcall;
  end;

// IWMMutualExclusion specifies a group of streams, of which only one can
// be played at once. These are used to do MEB (stream selection based on
// bandwidth).

  IWMMutualExclusion = interface(IWMStreamList)
    ['{96406BDE-2B2B-11d3-B36B-00C04F6108FF}']
    // The possible types of mutual exclusion are defined in the ASF
    // header.
    function GetType(out pguidType: TGUID): HRESULT; stdcall;
    function SetType(const guidType: TGUID): HRESULT; stdcall;
  end;

///////////////////////////////////////////////////////////////////////////////
//
// Advanced features.
//
///////////////////////////////////////////////////////////////////////////////
  IWMWriterSink = interface;
// The writer can be QI'd for this interface, which provides advanced writing
// functionality.
  IWMWriterAdvanced = interface(IUnknown)
    ['{96406BE3-2B2B-11d3-B36B-00C04F6108FF}']
    // Sinks are where the output ASF data goes.
    function GetSinkCount(out pcSinks: DWORD): HRESULT; stdcall;
    function GetSink(dwSinkNum: DWORD; out ppSink: IWMWriterSink): HRESULT; stdcall;
    function AddSink(pSink: IWMWriterSink): HRESULT; stdcall; // ok
    function RemoveSink(pSink: IWMWriterSink): HRESULT; stdcall; // ok
    // By default, the user provides samples to an input on the
    // IWMWriter interface, and the samples may be compressed, put
    // into a MEB stream, etc. However, the user can use this interface to
    // put the samples directly into the ASF, with no compression etc.
    function WriteStreamSample(wStreamNum: WORD; cnsSampleTime: int64; msSampleSendTime: DWORD;
               cnsSampleDuration: int64; dwFlags: DWORD; pSample: INSSBuffer): HRESULT; stdcall; // ok
    // The writer may be running in real-time. If so, it's interesting to
    // get the current time from the writer.
    function SetLiveSource(fIsLiveSource: BOOL): HRESULT; stdcall;
    function IsRealTime(out pfRealTime:  BOOL): HRESULT; stdcall;
    function GetWriterTime(out pcnsCurrentTime: int64): HRESULT; stdcall;
    // To get statistics, pass in a WM_WRITER_STATISTICS structure, which
    // will be filled out by the GetStatistics() call with the requested
    // stats.
    // Pass in a stream number to get statistics for a specific stream, or
    // pass 0 to get statistics for the entire ASF file.
    function GetStatistics(wStreamNum: WORD; out pStats: TWMWRITERSTATISTICS): HRESULT; stdcall;
    // Sync tolerance determines how far out of sync the inputs will be allowed
    // to get before samples are thrown away.  Default is 3000 ms.
    function SetSyncTolerance(msWindow: DWORD): HRESULT; stdcall;
    function GetSyncTolerance(out pmsWindow: DWORD): HRESULT; stdcall;
  end;

// The writer can be QI'd for this interface, which provides advanced writing
// functionality.

  IWMWriterAdvanced2 = interface(IWMWriterAdvanced)
    ['{962dc1ec-c046-4db8-9cc7-26ceae500817}']
    // Retrieves a setting for a particular output by name
    function GetInputSetting(dwInputNum: DWORD; pszName: PWideChar; out pType: TWMT_ATTR_DATATYPE;
               out pValue: BYTE; var pcbLength: WORD): HRESULT; stdcall;
    // Sets a named setting for a particular input
    function SetInputSetting(dwInputNum: DWORD; pszName: PWideChar; Type_: TWMT_ATTR_DATATYPE;
               const pValue: BYTE; cbLength: WORD): HRESULT; stdcall;
  end;

// This is the interface that receives uncompressed samples from the writer
// to preview (well, postview) what the codec is doing.

  IWMWriterPostViewCallback = interface(IWMStatusCallback)
    ['{D9D6549D-A193-4f24-B308-03123D9B7F8D}']
    // cnsSampleDuration will be 0 for most media types.
    function OnPostViewSample(wStreamNumber: WORD; cnsSampleTime: int64; cnsSampleDuration: int64;
               dwFlags: DWORD; pSample: INSSBuffer; pvContext: pointer): HRESULT; stdcall;
    function AllocateForPostView(wStreamNum: WORD; cbBuffer: DWORD; out ppBuffer: INSSBuffer;
               pvContext: pointer): HRESULT; stdcall;
  end;

// The writer can be QI'd for this interface, which provides advanced writing
// functionality.

  IWMWriterPostView = interface(IUnknown)
    ['{81E20CE4-75EF-491a-8004-FC53C45BDC3E}']
    // Specify the callback to use for PostView
    function SetPostViewCallback(pCallback: IWMWriterPostViewCallback; pvContext: pointer): HRESULT; stdcall;
    // Turns on delivery of postview samples for a given stream
    function SetReceivePostViewSamples(wStreamNum: WORD; fReceivePostViewSamples: BOOL): HRESULT; stdcall;
    function GetReceivePostViewSamples(wStreamNum: WORD; out pfReceivePostViewSamples: BOOL): HRESULT; stdcall;
    // The user can enumerate through the various outputs, and get the
    // output format for that data.
    // Manipulating the IWMOutputMediaProps has no effect on the output, unless
    // the user also calls SetOutputProps.
    function GetPostViewProps(wStreamNumber: WORD; out ppOutput: IWMMediaProps): HRESULT; stdcall;
    function SetPostViewProps(wStreamNumber: WORD; pOutput: IWMMediaProps): HRESULT; stdcall;
    // Used for determining all possible format types supported by this
    // output on the reader.
    function GetPostViewFormatCount(wStreamNumber: WORD; out pcFormats: DWORD): HRESULT; stdcall;
    function GetPostViewFormat(wStreamNumber: WORD; dwFormatNumber: DWORD;
               out ppProps: IWMMediaProps): HRESULT; stdcall;
    // The user can register himself to provide buffers for any of the outputs
    // (for instance, DDraw buffers). The actual allocation is on the
    // IWMReaderCallbackAdvanced interface.
    function SetAllocateForPostView(wStreamNumber: WORD; fAllocate: BOOL): HRESULT; stdcall;
    function GetAllocateForPostView(wStreamNumber: WORD; out pfAllocate: BOOL): HRESULT; stdcall;
  end;

// This is the interface that receives raw ASF from the writer.

  IWMWriterSink = interface(IUnknown)
    ['{96406BE4-2B2B-11d3-B36B-00C04F6108FF}']
    function OnHeader(pHeader: INSSBuffer): HRESULT; stdcall;
    // Some sinks require that data be fed to them in real-time.
    function IsRealTime(out pfRealTime: BOOL): HRESULT; stdcall;
    function AllocateDataUnit(cbDataUnit: DWORD; out ppDataUnit: INSSBuffer): HRESULT; stdcall;
    function OnDataUnit(pDataUnit: INSSBuffer): HRESULT; stdcall;
    // This function is called when the writer is done sending data.
    function OnEndWriting: HRESULT; stdcall;
  end;

  IWMRegisterCallback = interface(IUnknown)
    ['{CF4B1F99-4DE2-4e49-A363-252740D99BC1}']
    function Advise(pCallback: IWMStatusCallback; pvContext: pointer): HRESULT; stdcall;
    function Unadvise(pCallback: IWMStatusCallback; pvContext: pointer): HRESULT; stdcall;
  end;

  IWMWriterFileSink = interface(IWMWriterSink)
    ['{96406BE5-2B2B-11d3-B36B-00C04F6108FF}']
    function Open(pwszFilename: PWideChar): HRESULT; stdcall;
  end;

  IWMWriterFileSink2 = interface(IWMWriterFileSink)
    ['{14282BA7-4AEF-4205-8CE5-C229035A05BC}']
    function Start(cnsStartTime: int64): HRESULT; stdcall;
    function Stop(cnsStopTime: int64): HRESULT; stdcall;
    function IsStopped(out pfStopped: BOOL): HRESULT; stdcall;
    function GetFileDuration(out pcnsDuration: int64): HRESULT; stdcall;
    function GetFileSize(out pcbFile: int64): HRESULT; stdcall;
    function Close: HRESULT; stdcall;
    function IsClosed(out pfClosed: BOOL): HRESULT; stdcall;
  end;

  IWMWriterNetworkSink = interface(IWMWriterSink)
      ['{96406BE7-2B2B-11d3-B36B-00C04F6108FF}']
    // Determine the maximum number of clients that can connect to this sink.
    // Default is 10.
    function SetMaximumClients(dwMaxClients: DWORD): HRESULT; stdcall; // ok
    function GetMaximumClients(out pdwMaxClients: DWORD): HRESULT; stdcall;
    // The network protocol that the network sink will use.
    function SetNetworkProtocol(protocol: TWMT_NET_PROTOCOL): HRESULT; stdcall; // ok
    function GetNetworkProtocol(out pProtocol: TWMT_NET_PROTOCOL): HRESULT; stdcall;
    // Find out the name of the URL on which we're broadcasting
    function GetHostURL(pwszURL: PWideChar; var pcchURL: DWORD): HRESULT; stdcall; // ok
    // The method claims the network port number. Close the sink to release
    // the port.
    // Specify 0 for the port number and the sink will select a port for
    // the user.
    function Open(var pdwPortNum: DWORD): HRESULT; stdcall; // ok
    // Disconnect all connected clients.
    function Disconnect: HRESULT; stdcall;
    // Close and release the open port.
    function Close: HRESULT; stdcall;  // ok
  end;

  IWMClientConnections = interface(IUnknown)
    ['{73C66010-A299-41df-B1F0-CCF03B09C1C6}']
    // Determine the number of connected clients
    function GetClientCount(out pcClients: DWORD): HRESULT; stdcall;
    // Get information about a connected client
    function GetClientProperties(dwClientNum: DWORD; out pClientProperties: TWMCLIENTPROPERTIES): HRESULT; stdcall;
  end;

// The reader can be QI'd for this interface for advanced functionality.

  IWMReaderAdvanced = interface(IUnknown)
    ['{96406BEA-2B2B-11d3-B36B-00C04F6108FF}']
    // The user may want to drive the clock himself, particularly if he wants
    // to source from a file faster-than-realtime. This call may fail if the
    // current source does not support user-driven clocks.
    // The proper way for a user to drive the clock is for the user to call
    // DeliverTime, and then wait for the OnTime call on
    // IWMReaderCallbackAdvanced to reach the time he specified.
    function SetUserProvidedClock(fUserClock: BOOL): HRESULT; stdcall; // ok
    function GetUserProvidedClock(out pfUserClock: BOOL): HRESULT; stdcall;
    function DeliverTime(cnsTime: int64): HRESULT; stdcall; // ok
    // The user can select streams manually, instead of relying on the
    // automatic bandwidth stream selection that the reader will
    // normally do. To figure out what streams are in this ASF and what their
    // numbers are, QI for IWMProfile.
    // When SetManualStreamSelection( TRUE ) is called, all streams are
    // selected by default.
    function SetManualStreamSelection(fSelection: BOOL): HRESULT; stdcall; // ok
    function GetManualStreamSelection(out pfSelection: BOOL): HRESULT; stdcall;
    function SetStreamsSelected(cStreamCount: WORD; pwStreamNumbers: PWORD;
               pSelections: PWMT_STREAM_SELECTION): HRESULT; stdcall;
    function GetStreamSelected(wStreamNum: WORD; out pSelection: TWMT_STREAM_SELECTION): HRESULT; stdcall;
    // The user can also choose to get callbacks when automatic stream
    // selection occurs.
    function SetReceiveSelectionCallbacks(fGetCallbacks: BOOL): HRESULT; stdcall;
    function GetReceiveSelectionCallbacks(out pfGetCallbacks: BOOL): HRESULT; stdcall;
    // The user can register himself to receive samples directly from the
    // ASF streams, rather than letting the Reader decompress them. Note that
    // to do this, the IWMReaderCallback (supplied by the user) must support
    // IWMReaderCallbackAdvanced.
    // To get actual information about the contents of a stream, QI the
    // object for IWMProfile.
    function SetReceiveStreamSamples(wStreamNum: WORD; fReceiveStreamSamples: BOOL): HRESULT; stdcall; // ok
    function GetReceiveStreamSamples(wStreamNum: WORD; out pfReceiveStreamSamples: BOOL): HRESULT; stdcall;
    // The user can register himself to provide buffers for any of the outputs
    // (for instance, DDraw buffers). The actual allocation is on the
    // IWMReaderCallbackAdvanced interface.
    function SetAllocateForOutput(dwOutputNum: DWORD; fAllocate: BOOL): HRESULT; stdcall;
    function GetAllocateForOutput(dwOutputNum: DWORD; out pfAllocate: BOOL): HRESULT; stdcall;
    function SetAllocateForStream(dwStreamNum: WORD; fAllocate: BOOL): HRESULT; stdcall;
    function GetAllocateForStream(dwSreamNum: WORD; out pfAllocate: BOOL): HRESULT; stdcall;
    // Get statistics on demand
    function GetStatistics(pStatistics: TWMREADERSTATISTICS): HRESULT; stdcall;
    // Set client side information used for logging
    function SetClientInfo(pClientInfo: PWMREADERCLIENTINFO): HRESULT; stdcall;
    // Get the maximum required buffer sizes that the SDK will allocate.
    // The first is for output buffers, the second for stream buffers.
    function GetMaxOutputSampleSize(dwOutput: DWORD; out pcbMax: DWORD): HRESULT; stdcall;
    function GetMaxStreamSampleSize(wStream: WORD; out pcbMax: DWORD): HRESULT; stdcall;
    // Used to notify the reader that it's delivering data
    // too slowly to the client.  The reader will try to speed
    // up.
    function NotifyLateDelivery(cnsLateness: int64): HRESULT; stdcall;
  end;

///////////////////////////////////////////////////////////////////////////////
// The reader can be QI'd for this interface for advanced functionality.

  IWMReaderAdvanced2 = interface(IWMReaderAdvanced)
    ['{ae14a945-b90c-4d0d-9127-80d665f7d73e}']
    // Set the play mode to WMT_PLAY_MODE_AUTOSELECT to allow the reader
    // to pick the mode. (This is the default). If you select a play mode that
    // is impossible for the requested URL, an error will be returned when
    // the URL is opened.
    function SetPlayMode(Mode: TWMT_PLAY_MODE): HRESULT; stdcall;
    // Get the current play mode.
    function GetPlayMode(out pMode: TWMT_PLAY_MODE): HRESULT; stdcall;
    // Between WMT_BUFFERING_START and WMT_BUFFERING_STOP this call will
    // return progress values. pdwPercent returns the percentage of buffering
    // that has completed, and pcnsBuffering returns the amount of buffering
    // remaining.
    function GetBufferProgress(out pdwPercent: DWORD; out pcnsBuffering: int64): HRESULT; stdcall;
    // When the play mode is WMT_PLAY_MODE_DOWNLOAD, this call will return
    // progress values. pdwPercent returns the percentage of the download
    // that has completed, pqwBytesDownloaded returns the number of bytes
    // that have been downloaded, and pcnsDownload returns the amount of
    // downloading remaining.
    function GetDownloadProgress(out pdwPercent: DWORD; out pqwBytesDownloaded: int64;
               out pcnsDownload: int64): HRESULT; stdcall;
    // When saving a file, the operation may take awhile. Between
    // WMT_SAVEAS_START and WMT_SAVEAS_STOP, this call will return progress
    // values. pdwPercent returns the percentage of the save as that has
    // completed.
    function GetSaveAsProgress(out pdwPercent: DWORD): HRESULT; stdcall;
    // Save the current file. This only works for WMT_PLAY_MODE_DOWNLOAD.
    // This operation is asynchronous; WMT_SAVEAS_STOP indicates that the
    // save has completed. Closing the reader will abort a save operation
    // that has not completed.
    function SaveFileAs(pwszFilename: PWideChar): HRESULT; stdcall;
    // Returns the name of the protocol that is currently being used.
    // The protocol name is a URL scheme, such as "mmsu", "http", "file", etc.
    // Note, however, that the protocol name may differ from the URL scheme
    // that was specified in IWMReader::Open().
    // This method may return an empty string if the protocol name cannot be determined.
    function GetProtocolName(out pwszProtocol: WideChar; var pcchProtocol: DWORD): HRESULT; stdcall;
    // Same as IWMReader::Start, but uses a marker index instead of a time value.
    function StartAtMarker(wMarkerIndex: WORD; cnsDuration: int64; fRate: single;
               pvContext: pointer): HRESULT; stdcall;
    // Retrieves a setting for a particular output by name
    function GetOutputSetting(dwOutputNum: DWORD; pszName: PWideChar;out pType: TWMT_ATTR_DATATYPE;
               out pValue: BYTE; var pcbLength: WORD): HRESULT; stdcall;
    // Sets a named setting for a particular output
    function SetOutputSetting(dwOutputNum: DWORD; pszName: PWideChar; Type_: TWMT_ATTR_DATATYPE;
                const pValue: BYTE; cbLength: WORD): HRESULT; stdcall;
    // Used to begin prerolling the reader.  Call this method
    // when you know you're going to call Start soon and want
    // to start buffering data in advance.  cnsStart, cnsDuration
    // and fRate should be the same as the values you plan to pass
    // to Start in the future.
    function Preroll(cnsStart, cnsDuration: int64; fRate: single): HRESULT; stdcall;
    // Specifies whether the SDK should send the client's unique identifier
    // to the server when streaming.
    function SetLogClientID(fLogClientID: BOOL): HRESULT; stdcall;
    function GetLogClientID(out pfLogClientID: BOOL): HRESULT; stdcall;
    // This method requests that the Reader send WMT_BUFFERING_STOP as soon
    // as possible. The Reader will only honor the request if it is currently
    // buffering, i.e., it has sent a WMT_BUFFERING_START, but not yet sent the
    // corresponding WMT_BUFFERING_STOP.
    function StopBuffering: HRESULT; stdcall;
    // Same as IWMReader::Open but takes an IStream interface pointer instead
    // of an URL to be opened
    function OpenStream(pStream: IStream; pCallback: IWMReaderCallback; pvContext: pointer): HRESULT; stdcall;
  end;

//
// The reader can be QI'ed for this interface for frame access functionaly.
//
  IWMReaderAdvanced3 = interface(IWMReaderAdvanced2)
    ['{5DC0674B-F04B-4a4e-9F2A-B1AFDE2C8100}']
    // This method is used when you want to stop net streaming right away but
    // continue to receive samples that SDK have gotten so far.
    // If it's successful, user should receive an END_OF_STREAMING quickly.
    function StopNetStreaming: HRESULT; stdcall;
    // This method is for frame based accessing, start with SMPTE time stamp etc.
    // It is not supported in current version, we'll start to support this from v9
    function StartAtPosition(wStreamNum: WORD; pvOffsetStart, pvDuration: pointer;
      dwOffsetFormat: TWMT_OFFSET_FORMAT; fRate: single; pvContext: pointer): HRESULT; stdcall;
  end;


  IWMReaderAllocatorEx = interface(IUnknown)
    ['{9F762FA7-A22E-428d-93C9-AC82F3AAFE5A}']

    function AllocateForStreamEx(wStreamNum: WORD; cbBuffer: DWORD; out ppBuffer: INSSBuffer;
               dwFlags: DWORD; cnsSampleTime, cnsSampleDuration: int64; pvContext: pointer): HRESULT; stdcall;
    function AllocateForOutputEx(dwOutputNum: DWORD; cbBuffer: DWORD; out ppBuffer: INSSBuffer;
               dwFlags: DWORD; cnsSampleTime, cnsSampleDuration: int64; pvContext: pointer): HRESULT; stdcall;
  end;

  IWMReaderTypeNegotiation = interface(IUnknown)
    ['{FDBE5592-81A1-41ea-93BD-735CAD1ADC05}']
    function TryOutputProps(dwOutputNum: DWORD; pOutput: IWMOutputMediaProps): HRESULT; stdcall;
  end;

// For some advanced functionality, the IWMReaderCallback must support this
// interface.

  IWMReaderCallbackAdvanced = interface(IUnknown)
    ['{96406BEB-2B2B-11d3-B36B-00C04F6108FF}']
    // Receive a sample directly from the ASF. To get this call, the user
    // must register himself to receive samples for a particular stream.
    function OnStreamSample(wStreamNum: WORD; cnsSampleTime, cnsSampleDuration: int64;
               dwFlags: DWORD; pSample: INSSBuffer; pvContext: pointer): HRESULT; stdcall;
    // In some cases, the user may want to get callbacks telling what the
    // reader thinks the current time is. This is interesting in 2 cases:
    // - If the ASF has gaps in it; say no audio for 10 seconds. This call
    //   will continue to be called, while OnSample won't be called.
    // - If the user is driving the clock, the reader needs to communicate
    //   back to the user its time, to avoid the user overrunning the reader.
    function OnTime(cnsCurrentTime: int64; pvContext: pointer): HRESULT; stdcall;
    // The user can also get callbacks when stream selection occurs.
    function OnStreamSelection( wStreamCount, pStreamNumbers: WORD;
               pSelections: PWMT_STREAM_SELECTION; pvContext: pointer): HRESULT; stdcall;
    // Will be called if the user got an async result from their
    // call to SetOutputProps.  The next sample you receive for
    // this output will have these properties.  The contents of the
    // media type after calling SetOutputProps and before receiving
    // an OutputPropsChanged notification are undefined.
    function OnOutputPropsChanged(dwOutputNum: DWORD; pMediaType: PWM_MEDIA_TYPE;
               pvContext: pointer): HRESULT; stdcall;
    // If the user has registered to allocate buffers, this is where he must
    // do it.
    function AllocateForStream(wStreamNum: WORD; cbBuffer: DWORD; out ppBuffer: INSSBuffer;
               pvContext: pointer): HRESULT; stdcall;
    function AllocateForOutput(dwOutputNum, cbBuffer: DWORD; out ppBuffer: INSSBuffer;
               pvContext: pointer): HRESULT; stdcall;
  end;

// Used to access advanced DRM functionality.

  IWMDRMReader = interface(IUnknown)
    ['{D2827540-3EE7-432c-B14C-DC17F085D3B3}']
    function AcquireLicense(dwFlags: DWORD): HRESULT; stdcall;
    function CancelLicenseAcquisition: HRESULT; stdcall;
    function Individualize(dwFlags: DWORD): HRESULT; stdcall;
    function CancelIndividualization: HRESULT; stdcall;
    function MonitorLicenseAcquisition: HRESULT; stdcall;
    function CancelMonitorLicenseAcquisition: HRESULT; stdcall;
    function SetDRMProperty(pwstrName: PWideChar; dwType: TWMT_ATTR_DATATYPE; const pValue: BYTE;
               cbLength: WORD): HRESULT; stdcall;
    function GetDRMProperty(pwstrName: PWideChar; out pdwType: TWMT_ATTR_DATATYPE;
               out pValue: BYTE; out pcbLength: WORD): HRESULT; stdcall;
  end;

// Used to configure the network.  This interface is implemented by
// the IWMReader object.

  IWMReaderNetworkConfig = interface(IUnknown)
    ['{96406BEC-2B2B-11d3-B36B-00C04F6108FF}']
    // Get and set the amount of time the network source will buffer
    // data before rendering it.
    function GetBufferingTime(out pcnsBufferingTime: int64): HRESULT; stdcall;
    function SetBufferingTime(cnsBufferingTime: int64): HRESULT; stdcall;
    // Returns the UDP port number ranges that will be used for receiving
    // data.  If no ranges are available, random UDP port numbers will be used.
    function GetUDPPortRanges(out pRangeArray: TWMPORTNUMBERRANGE; var pcRanges: DWORD): HRESULT; stdcall;
    // Sets the UDP port number ranges that can be used for receiving data.
    // If no ranges are specified, random UDP port numbers will be used.
    function SetUDPPortRanges(pRangeArray: PWMPORTNUMBERRANGE; cRanges: DWORD): HRESULT; stdcall;
    // Proxy settings: Manual proxy, Autodetect, UseBrowser (only for HTTP), or No Proxy.
    function GetProxySettings(pwszProtocol: PWideChar; pProxySetting: PWMT_PROXY_SETTINGS): HRESULT; stdcall;
    function SetProxySettings(pwszProtocol: PWideChar; ProxySetting: TWMT_PROXY_SETTINGS): HRESULT; stdcall;
    // The host to use as the proxy.
    function GetProxyHostName(pwszProtocol: PWideChar; out pwszHostName: WideChar; var pcchHostName: DWORD): HRESULT; stdcall;
    function SetProxyHostName(pwszProtocol, pwszHostName: PWideChar): HRESULT; stdcall;
    // The port to use as the proxy.
    function GetProxyPort(pwszProtocol: PWideChar; out pdwPort: DWORD): HRESULT; stdcall;
    function SetProxyPort(pwszProtocol: PWideChar; dwPort: DWORD): HRESULT; stdcall;
    // Get and set the proxy exception list.
    function GetProxyExceptionList(pwszProtocol: PWideChar; out pwszExceptionList: WideChar; var pcchExceptionList: DWORD): HRESULT; stdcall;
    function SetProxyExceptionList(pwszProtocol, pwszExceptionList: PWideChar): HRESULT; stdcall;
    // Whether or not to bypass proxy for local hosts
    function GetProxyBypassForLocal(pwszProtocol: PWideChar; out pfBypassForLocal: BOOL): HRESULT; stdcall;
    function SetProxyBypassForLocal(pwszProtocol: PWideChar; fBypassForLocal: BOOL): HRESULT; stdcall;
    // Whether to force a wpad discovery on the next run
    function GetForceRerunAutoProxyDetection(out pfForceRerunDetection: BOOL): HRESULT; stdcall;
    function SetForceRerunAutoProxyDetection(fForceRerunDetection: BOOL): HRESULT; stdcall;
    // Whether or not to use multicast, http, tcp, or udp
    function GetEnableMulticast(out pfEnableMulticast: BOOL): HRESULT; stdcall;
    function SetEnableMulticast(fEnableMulticast: BOOL): HRESULT; stdcall;
    function GetEnableHTTP(out pfEnableHTTP: BOOL): HRESULT; stdcall;
    function SetEnableHTTP(fEnableHTTP: BOOL): HRESULT; stdcall;
    function GetEnableUDP(out pfEnableUDP: BOOL): HRESULT; stdcall;
    function SetEnableUDP(fEnableUDP: BOOL): HRESULT; stdcall;
    function GetEnableTCP(out pfEnableTCP: BOOL): HRESULT; stdcall;
    function SetEnableTCP(fEnableTCP: BOOL): HRESULT; stdcall;
    // Forgets automatic protocol detection settings and redetects next time.
    function ResetProtocolRollover: HRESULT; stdcall;
    // Return or set the client's link bandwidth in bps.  This is an optional
    // setting.  By default, the SDK will automatically detect its connection
    // bandwidth to the streaming media server.
    function GetConnectionBandwidth(out pdwConnectionBandwidth: DWORD): HRESULT; stdcall;
    function SetConnectionBandwidth(dwConnectionBandwidth: DWORD): HRESULT; stdcall;
    // Iterate through the network protocols supported by this reader
    function GetNumProtocolsSupported(out pcProtocols: DWORD): HRESULT; stdcall;
    function GetSupportedProtocolName(dwProtocolNum: DWORD; out pwszProtocolName: WideChar; var pcchProtocolName: DWORD): HRESULT; stdcall;
    // Adds the specified pszUrl to the list of URL's to recieve logging data.
    // This list is in addition to the origin server.
    function AddLoggingUrl(pwszUrl: PWideChar): HRESULT; stdcall;
    // Fills the buffer with the URL corresponding to index dwIndex.
    function GetLoggingUrl(dwIndex: DWORD; out pwszUrl: WideChar; var pcchUrl: DWORD): HRESULT; stdcall;
    // Returns the number of URLs in the current list of logging URLs.
    function GetLoggingUrlCount(out pdwUrlCount: DWORD): HRESULT; stdcall;
    // Clears the list of logging URLs
    function ResetLoggingUrlList: HRESULT; stdcall;
  end;

// Used to configure the network.  This interface is implemented by
// the IWMReader object.

  IWMReaderStreamClock = interface(IUnknown)
    ['{96406BED-2B2B-11d3-B36B-00C04F6108FF}']
    // Get the current value of the stream clock
    function GetTime(pcnsNow: Pint64): HRESULT; stdcall;
    // Set or kill a timer.  All timers are automatically
    // killed whenever you stop the Reader.  When a timer
    // expires, you'll receive a WMT_TIMER OnStatus callback
    // with hr == S_OK, pValue = TimerId and pvContext == pvParam.
    function SetTimer(cnsWhen: int64; pvParam: pointer; out pdwTimerId: DWORD): HRESULT; stdcall;
    function KillTimer(dwTimerId :DWORD): HRESULT; stdcall;
  end;

  IWMIndexer = interface(IUnknown)
    ['{6d7cdc71-9888-11d3-8edc-00c04f6109cf}']
    // Start is an asynchronous call; it returns almost immediately and the user
    // should wait for appropriate OnStatus calls to be sent to the callback.
    function StartIndexing(const pwszURL: WideChar; pCallback: IWMStatusCallback; pvContext: pointer): HRESULT; stdcall;
    function Cancel: HRESULT; stdcall;
  end;

  IWMLicenseBackup = interface(IUnknown)
    ['{05E5AC9F-3FB6-4508-BB43-A4067BA1EBE8}']
    function BackupLicenses(dwFlags: DWORD; pCallback: IWMStatusCallback): HRESULT; stdcall;
    function CancelLicenseBackup: HRESULT; stdcall;
  end;

  IWMLicenseRestore = interface(IUnknown)
    ['{C70B6334-0544-4efb-A245-15E65A004A13}']
    function RestoreLicenses(dwFlags: DWORD; pCallback: IWMStatusCallback): HRESULT; stdcall;
    function CancelLicenseRestore: HRESULT; stdcall;
  end;

  IWMBackupRestoreProps = interface(IUnknown)
    ['{3C8E0DA6-996F-4ff3-A1AF-4838F9377E2E}']
    function GetPropCount(out pcProps: WORD): HRESULT; stdcall;
    function GetPropByIndex(wIndex: WORD; out pwszName: WideChar; var pcchNameLen: WORD;
               out pType: TWMT_ATTR_DATATYPE; out pValue: BYTE; var pcbLength: WORD): HRESULT; stdcall;
    function GetPropByName(pszName: PWideChar; out pType: TWMT_ATTR_DATATYPE;
               out pValue: BYTE; var pcbLength: WORD): HRESULT; stdcall;
    function SetProp(pszName: PWideChar; Type_: TWMT_ATTR_DATATYPE; const pValue: BYTE;
               cbLength: WORD): HRESULT; stdcall;
    function RemoveProp(pcwszName: PWideChar): HRESULT; stdcall;
    function RemoveAllProps: HRESULT; stdcall;
  end;

  IWMCodecInfo = interface(IUnknown)
    ['{A970F41E-34DE-4a98-B3BA-E4B3CA7528F0}']
    function GetCodecInfoCount(const guidType: TGUID; out pcCodecs: DWORD): HRESULT; stdcall;
    function GetCodecFormatCount(const guidType: TGUID; dwCodecIndex: DWORD;
               out pcFormat: DWORD): HRESULT; stdcall;
    function GetCodecFormat(const guidType: TGUID; dwCodecIndex, dwFormatIndex: DWORD;
               out ppIStreamConfig: IWMStreamConfig): HRESULT; stdcall;
  end;

  IWMCodecInfo2 = interface(IWMCodecInfo)
    ['{AA65E273-B686-4056-91EC-DD768D4DF710}']
    function GetCodecName(const guidType: TGUID; dwCodecIndex: DWORD; out wszName: WideChar;
               out pcchName: DWORD): HRESULT; stdcall;
    function GetCodecFormatDesc(const guidType: TGUID; dwCodecIndex, dwFormatIndex: DWORD;
               out ppIStreamConfig: IWMStreamConfig; out wszDesc: WideChar; var pcchDesc: DWORD): HRESULT; stdcall;
  end;

////////////////////////////////////////////////////////////////////////////////
//
// file: mswmdm.h
//
////////////////////////////////////////////////////////////////////////////////

const

  LIBID_MSWMDMLib            : TGUID = '{6EC6C744-355F-11D3-8470-00C04F79DBC0}';

  IID_IWMDeviceManager       : TGUID = '{1DCB3A00-33ED-11d3-8470-00C04F79DBC0}';
  IID_IWMDMStorageGlobals    : TGUID = '{1DCB3A07-33ED-11d3-8470-00C04F79DBC0}';
  IID_IWMDMStorage           : TGUID = '{1DCB3A06-33ED-11d3-8470-00C04F79DBC0}';
  IID_IWMDMOperation         : TGUID = '{1DCB3A0B-33ED-11d3-8470-00C04F79DBC0}';
  IID_IWMDMProgress          : TGUID = '{1DCB3A0C-33ED-11d3-8470-00C04F79DBC0}';
  IID_IWMDMDevice            : TGUID = '{1DCB3A02-33ED-11d3-8470-00C04F79DBC0}';
  IID_IWMDMEnumDevice        : TGUID = '{1DCB3A01-33ED-11d3-8470-00C04F79DBC0}';
  IID_IWMDMDeviceControl     : TGUID = '{1DCB3A04-33ED-11d3-8470-00C04F79DBC0}';
  IID_IWMDMEnumStorage       : TGUID = '{1DCB3A05-33ED-11d3-8470-00C04F79DBC0}';
  IID_IWMDMStorageControl    : TGUID = '{1DCB3A08-33ED-11d3-8470-00C04F79DBC0}';
  IID_IWMDMObjectInfo        : TGUID = '{1DCB3A09-33ED-11d3-8470-00C04F79DBC0}';
  IID_IMDServiceProvider     : TGUID = '{1DCB3A10-33ED-11d3-8470-00C04F79DBC0}';
  IID_IMDSPEnumDevice        : TGUID = '{1DCB3A11-33ED-11d3-8470-00C04F79DBC0}';
  IID_IMDSPDevice            : TGUID = '{1DCB3A12-33ED-11d3-8470-00C04F79DBC0}';
  IID_IMDSPDeviceControl     : TGUID = '{1DCB3A14-33ED-11d3-8470-00C04F79DBC0}';
  IID_IMDSPEnumStorage       : TGUID = '{1DCB3A15-33ED-11d3-8470-00C04F79DBC0}';
  IID_IMDSPStorage           : TGUID = '{1DCB3A16-33ED-11d3-8470-00C04F79DBC0}';
  IID_IMDSPStorageGlobals    : TGUID = '{1DCB3A17-33ED-11d3-8470-00C04F79DBC0}';
  IID_IMDSPObjectInfo        : TGUID = '{1DCB3A19-33ED-11d3-8470-00C04F79DBC0}';
  IID_IMDSPObject            : TGUID = '{1DCB3A18-33ED-11d3-8470-00C04F79DBC0}';
  IID_ISCPSecureAuthenticate : TGUID = '{1DCB3A0F-33ED-11d3-8470-00C04F79DBC0}';
  IID_ISCPSecureQuery        : TGUID = '{1DCB3A0D-33ED-11d3-8470-00C04F79DBC0}';
  IID_ISCPSecureExchange     : TGUID = '{1DCB3A0E-33ED-11d3-8470-00C04F79DBC0}';
  IID_IComponentAuthenticate : TGUID = '{A9889C00-6D2B-11d3-8496-00C04F79DBC0}';

  CLSID_MediaDevMgr          : TGUID = '{25BAAD81-3560-11D3-8471-00C04F79DBC0}';
  CLSID_WMDMDevice           : TGUID = '{807B3CDF-357A-11d3-8471-00C04F79DBC0}';
  CLSID_WMDMStorage          : TGUID = '{807B3CE0-357A-11d3-8471-00C04F79DBC0}';
  CLSID_WMDMStorageGlobal    : TGUID = '{807B3CE1-357A-11d3-8471-00C04F79DBC0}';
  CLSID_WMDMDeviceEnum       : TGUID = '{430E35AF-3971-11D3-8474-00C04F79DBC0}';
  CLSID_WMDMStorageEnum      : TGUID = '{EB401A3B-3AF7-11d3-8474-00C04F79DBC0}';

type
  PWAVEFORMATEX = ^TWAVEFORMATEX;
  TWAVEFORMATEX = record
    wFormatTag     : WORD;
    nChannels      : WORD;
    nSamplesPerSec : DWORD;
    nAvgBytesPerSec: DWORD;
    nBlockAlign    : WORD;
    wBitsPerSample : WORD;
    cbSize         : WORD;
  end;

  TOPAQUECOMMAND = record
    guidCommand: TGUID;
    dwDataLen  : DWORD;
    pData      : PBYTE;   (* [size_is] *)
    abMAC      : array[0..19] of BYTE;
  end;
const
  WMDMID_LENGTH = 128;

type
  PWMDMID = ^TWMDMID;
  TWMDMID = record
    cbSize            : UINT;
    dwVendorID        : DWORD ;
    pID               : array[0..127] of BYTE;
    SerialNumberLength: UINT;
  end;

  PWMDMDATETIME = ^TWMDMDATETIME;
  TWMDMDATETIME = record
    wYear  : WORD;
    wMonth : WORD;
    wDay   : WORD;
    wHour  : WORD;
    wMinute: WORD;
    wSecond: WORD;
  end;

  PWMDMRIGHTS = ^TWMDMRIGHTS;
  TWMDMRIGHTS = record
    cbSize         : UINT;
    dwContentType  : DWORD;
    fuFlags        : DWORD;
    fuRights       : DWORD;
    dwAppSec       : DWORD;
    dwPlaybackCount: DWORD;
    ExpirationDate : TWMDMDATETIME ;
  end;

const

  WMDM_MAC_LENGTH = 8;
// WMDM HRESULTS
  WMDM_E_BUSY                            = $80045000;
  WMDM_E_INTERFACEDEAD                   = $80045001;
  WMDM_E_INVALIDTYPE                     = $80045002;
  WMDM_E_PROCESSFAILED                   = $80045003;
  WMDM_E_NOTSUPPORTED                    = $80045004;
  WMDM_E_NOTCERTIFIED                    = $80045005;
  WMDM_E_NORIGHTS                        = $80045006;
  WMDM_E_CALL_OUT_OF_SEQUENCE            = $80045007;
  WMDM_E_BUFFERTOOSMALL                  = $80045008;
  WMDM_E_MOREDATA                        = $80045009;
  WMDM_E_MAC_CHECK_FAILED                = $8004500A;
  WMDM_E_USER_CANCELLED                  = $8004500B;
  WMDM_E_SDMI_TRIGGER                    = $8004500C;
  WMDM_E_SDMI_NOMORECOPIES               = $8004500D;
// MDMRIGHTS Flags
  WMDM_RIGHTS_PLAYBACKCOUNT              = $00000001;
  WMDM_RIGHTS_EXPIRATIONDATE             = $00000002;
  WMDM_RIGHTS_GROUPID                    = $00000004;
  WMDM_RIGHTS_FREESERIALIDS              = $00000008;
  WMDM_RIGHTS_NAMEDSERIALIDS             = $00000010;
// Device Type Flags
  WMDM_DEVICE_TYPE_PLAYBACK              = $00000001;
  WMDM_DEVICE_TYPE_RECORD                = $00000002;
  WMDM_DEVICE_TYPE_DECODE                = $00000004;
  WMDM_DEVICE_TYPE_ENCODE                = $00000008;
  WMDM_DEVICE_TYPE_STORAGE               = $00000010;
  WMDM_DEVICE_TYPE_VIRTUAL               = $00000020;
  WMDM_DEVICE_TYPE_SDMI                  = $00000040;
  WMDM_DEVICE_TYPE_NONSDMI               = $00000080;
// Device Power Source Flags
  WMDM_POWER_CAP_BATTERY                 = $00000001;
  WMDM_POWER_CAP_EXTERNAL                = $00000002;
  WMDM_POWER_IS_BATTERY                  = $00000004;
  WMDM_POWER_IS_EXTERNAL                 = $00000008;
  WMDM_POWER_PERCENT_AVAILABLE           = $00000010;
// Device Status Flags
  WMDM_STATUS_READY                      = $00000001;
  WMDM_STATUS_BUSY                       = $00000002;
  WMDM_STATUS_DEVICE_NOTPRESENT          = $00000004;
  WMDM_STATUS_DEVICECONTROL_PLAYING      = $00000008;
  WMDM_STATUS_DEVICECONTROL_RECORDING    = $00000010;
  WMDM_STATUS_DEVICECONTROL_PAUSED       = $00000020;
  WMDM_STATUS_DEVICECONTROL_REMOTE       = $00000040;
  WMDM_STATUS_DEVICECONTROL_STREAM       = $00000080;
  WMDM_STATUS_STORAGE_NOTPRESENT         = $00000100;
  WMDM_STATUS_STORAGE_INITIALIZING       = $00000200;
  WMDM_STATUS_STORAGE_BROKEN             = $00000400;
  WMDM_STATUS_STORAGE_NOTSUPPORTED       = $00000800;
  WMDM_STATUS_STORAGE_UNFORMATTED        = $00001000;
  WMDM_STATUS_STORAGECONTROL_INSERTING   = $00002000;
  WMDM_STATUS_STORAGECONTROL_DELETING    = $00004000;
  WMDM_STATUS_STORAGECONTROL_APPENDING   = $00008000;
  WMDM_STATUS_STORAGECONTROL_MOVING      = $00010000;
  WMDM_STATUS_STORAGECONTROL_READING     = $00020000;
// Device Capabilities Flags
  WMDM_DEVICECAP_CANPLAY                 = $00000001;
  WMDM_DEVICECAP_CANSTREAMPLAY           = $00000002;
  WMDM_DEVICECAP_CANRECORD               = $00000004;
  WMDM_DEVICECAP_CANSTREAMRECORD         = $00000008;
  WMDM_DEVICECAP_CANPAUSE                = $00000010;
  WMDM_DEVICECAP_CANRESUME               = $00000020;
  WMDM_DEVICECAP_CANSTOP                 = $00000040;
  WMDM_DEVICECAP_CANSEEK                 = $00000080;
// WMDM Seek Flags
  WMDM_SEEK_REMOTECONTROL                = $00000001;
  WMDM_SEEK_STREAMINGAUDIO               = $00000002;
// Storage Attributes Flags
  WMDM_STORAGE_ATTR_FILESYSTEM           = $00000001;
  WMDM_STORAGE_ATTR_REMOVABLE            = $00000002;
  WMDM_STORAGE_ATTR_NONREMOVABLE         = $00000004;
  WMDM_FILE_ATTR_FOLDER                  = $00000008;
  WMDM_FILE_ATTR_LINK                    = $00000010;
  WMDM_FILE_ATTR_FILE                    = $00000020;
  WMDM_STORAGE_ATTR_FOLDERS              = $00000100;
  WMDM_FILE_ATTR_AUDIO                   = $00001000;
  WMDM_FILE_ATTR_DATA                    = $00002000;
  WMDM_FILE_ATTR_CANPLAY                 = $00004000;
  WMDM_FILE_ATTR_CANDELETE               = $00008000;
  WMDM_FILE_ATTR_CANMOVE                 = $00010000;
  WMDM_FILE_ATTR_CANRENAME               = $00020000;
  WMDM_FILE_ATTR_CANREAD                 = $00040000;
  WMDM_FILE_ATTR_MUSIC                   = $00080000;
  WMDM_FILE_CREATE_OVERWRITE             = $00100000;
  WMDM_FILE_ATTR_AUDIOBOOK               = $00200000;
  WMDM_FILE_ATTR_HIDDEN                  = $00400000;
  WMDM_FILE_ATTR_SYSTEM                  = $00800000;
  WMDM_FILE_ATTR_READONLY                = $01000000;
  WMDM_STORAGE_ATTR_HAS_FOLDERS          = $02000000;
  WMDM_STORAGE_ATTR_HAS_FILES            = $04000000;
// Storage Capabilities Flags
  WMDM_STORAGECAP_FOLDERSINROOT          = $00000001;
  WMDM_STORAGECAP_FILESINROOT            = $00000002;
  WMDM_STORAGECAP_FOLDERSINFOLDERS       = $00000004;
  WMDM_STORAGECAP_FILESINFOLDERS         = $00000008;
  WMDM_STORAGECAP_FOLDERLIMITEXISTS      = $00000010;
  WMDM_STORAGECAP_FILELIMITEXISTS        = $00000020;
// WMDM Mode Flags
  WMDM_MODE_BLOCK                        = $00000001;
  WMDM_MODE_THREAD                       = $00000002;
  WMDM_CONTENT_FILE                      = $00000004;
  WMDM_CONTENT_FOLDER                    = $00000008;
  WMDM_CONTENT_OPERATIONINTERFACE        = $00000010;
  WMDM_MODE_QUERY                        = $00000020;
  WMDM_MODE_PROGRESS                     = $00000040;
  WMDM_MODE_TRANSFER_PROTECTED           = $00000080;
  WMDM_MODE_TRANSFER_UNPROTECTED         = $00000100;
  WMDM_STORAGECONTROL_INSERTBEFORE       = $00000200;
  WMDM_STORAGECONTROL_INSERTAFTER        = $00000400;
  WMDM_STORAGECONTROL_INSERTINTO         = $00000800;
  WMDM_MODE_RECURSIVE                    = $00001000;
// WMDM Rights Flags
// NON_SDMI = !SDMI_PROTECTED
// SDMI = SDMI_VALIDATED
  WMDM_RIGHTS_PLAY_ON_PC                 = $00000001;
  WMDM_RIGHTS_COPY_TO_NON_SDMI_DEVICE    = $00000002;
  WMDM_RIGHTS_COPY_TO_CD                 = $00000008;
  WMDM_RIGHTS_COPY_TO_SDMI_DEVICE        = $00000010;
// WMDM Seek Flags
  WMDM_SEEK_BEGIN                        = $00000001;
  WMDM_SEEK_CURRENT                      = $00000002;
  WMDM_SEEK_END                          = $00000008;

type
  IWMDMEnumDevice = interface;

  IWMDeviceManager = interface(IUnknown)
    ['{1DCB3A00-33ED-11d3-8470-00C04F79DBC0}']
    function GetRevision(out pdwRevision: DWORD): HRESULT; stdcall;
    function GetDeviceCount(out pdwCount: DWORD): HRESULT; stdcall;
    function EnumDevices(out ppEnumDevice: IWMDMEnumDevice): HRESULT; stdcall;
  end;

  TabMac = array[0..7] of BYTE;

  IWMDMProgress = interface;

  IWMDMStorageGlobals = interface(IUnknown)
    ['{1DCB3A07-33ED-11d3-8470-00C04F79DBC0}']
    function GetCapabilities(out pdwCapabilities: DWORD): HRESULT; stdcall;
    function GetSerialNumber(out pSerialNum: PWMDMID; var abMac: TabMac): HRESULT; stdcall;
    function GetTotalSize(out pdwTotalSizeLow, pdwTotalSizeHigh: DWORD): HRESULT; stdcall;
    function GetTotalFree(out pdwFreeLow, pdwFreeHigh: DWORD): HRESULT; stdcall;
    function GetTotalBad(out pdwBadLow, pdwBadHigh: DWORD): HRESULT; stdcall;
    function GetStatus(out pdwStatus: DWORD): HRESULT; stdcall;
    function Initialize(fuMode: UINT; pProgress: IWMDMProgress): HRESULT; stdcall;
  end;

  IWMDMEnumStorage = interface;

  IWMDMStorage = interface(IUnknown)
    ['{1DCB3A06-33ED-11d3-8470-00C04F79DBC0}']
    function SetAttributes(dwAttributes: DWORD; pFormat: PWAVEFORMATEX): HRESULT; stdcall;
    function GetStorageGlobals(out ppStorageGlobals: IWMDMStorageGlobals): HRESULT; stdcall;
    function GetAttributes(out pdwAttributes: DWORD; out pFormat: TWAVEFORMATEX): HRESULT; stdcall;
    function GetName(out pwszName: WideChar; nMaxChars: UINT): HRESULT; stdcall;
    function GetDate(out pDateTimeUTC: TWMDMDATETIME): HRESULT; stdcall;
    function GetSize(out pdwSizeLow, pdwSizeHigh: DWORD): HRESULT; stdcall;
    function GetRights(out ppRights: PWMDMRIGHTS; out pnRightsCount: UINT;
               var abMac: TabMac): HRESULT; stdcall;
    function EnumStorage(out pEnumStorage: IWMDMEnumStorage): HRESULT; stdcall;
    function SendOpaqueCommand(var pCommand: TOPAQUECOMMAND): HRESULT; stdcall;
  end;

  IWMDMOperation = interface(IUnknown)
    ['{1DCB3A0B-33ED-11d3-8470-00C04F79DBC0}']
    function BeginRead: HRESULT; stdcall;
    function BeginWrite: HRESULT; stdcall;
    function GetObjectName(out pwszName: WideChar; nMaxChars: UINT): HRESULT; stdcall;
    function SetObjectName(pwszName: PWideChar; nMaxChars: UINT): HRESULT; stdcall;
    function GetObjectAttributes(out pdwAttributes: DWORD; out pFormat: TWAVEFORMATEX): HRESULT; stdcall;
    function SetObjectAttributes(dwAttributes: DWORD; pFormat: PWAVEFORMATEX): HRESULT; stdcall;
    function GetObjectTotalSize(out pdwSize, pdwSizeHigh: DWORD): HRESULT; stdcall;
    function SetObjectTotalSize(dwSize, dwSizeHigh: DWORD): HRESULT; stdcall;
    function TransferObjectData(var pData: BYTE; var pdwSize: DWORD; var abMac: TabMac): HRESULT; stdcall;
    function End_(phCompletionCode: PHRESULT; pNewObject: IUnknown): HRESULT; stdcall;
  end;

  IWMDMProgress = interface(IUnknown)
    ['{1DCB3A0C-33ED-11d3-8470-00C04F79DBC0}']
    function Begin_(dwEstimatedTicks: DWORD): HRESULT; stdcall;
    function Progress(dwTranspiredTicks: DWORD): HRESULT; stdcall;
    function End_: HRESULT; stdcall;
  end;

  PPWideChar = ^PWideChar;
  IWMDMDevice = interface(IUnknown)
    ['{1DCB3A02-33ED-11d3-8470-00C04F79DBC0}']
    function GetName(out pwszName: WideChar; nMaxChars: UINT): HRESULT; stdcall;
    function GetManufacturer(out pwszName: WideChar; nMaxChars: UINT): HRESULT; stdcall;
    function GetVersion(out pdwVersion: DWORD): HRESULT; stdcall;
    function GetType(out pdwType: DWORD): HRESULT; stdcall;
    function GetSerialNumber(out pSerialNumber: TWMDMID; var abMac: TabMac): HRESULT; stdcall;
    function GetPowerSource(out pdwPowerSource, pdwPercentRemaining: DWORD): HRESULT; stdcall;
    function GetStatus(out pdwStatus: DWORD): HRESULT; stdcall;
    function GetDeviceIcon(out hIcon: ULONG): HRESULT; stdcall;
    function EnumStorage(out ppEnumStorage: IWMDMEnumStorage): HRESULT; stdcall;
    function GetFormatSupport(out ppFormatEx: PWAVEFORMATEX; out pnFormatCount: UINT;
               out pppwszMimeType: PPWideChar; out pnMimeTypeCount: UINT): HRESULT; stdcall;
    function SendOpaqueCommand(var pCommand: TOPAQUECOMMAND): HRESULT; stdcall;
  end;

  IWMDMEnumDevice = interface(IUnknown)
    ['{1DCB3A01-33ED-11d3-8470-00C04F79DBC0}']
    function Next(celt: ULONG; out ppDevice: IWMDMDevice; out pceltFetched: ULONG): HRESULT; stdcall;
    function Skip(celt: ULONG; out pceltFetched: ULONG): HRESULT; stdcall;
    function Reset: HRESULT; stdcall;
    function Clone(out ppEnumDevice: IWMDMEnumDevice): HRESULT; stdcall;
  end;

  IWMDMDeviceControl = interface(IUnknown)
    ['{1DCB3A04-33ED-11d3-8470-00C04F79DBC0}']
    function GetStatus(out pdwStatus: DWORD): HRESULT; stdcall;
    function GetCapabilities(out pdwCapabilitiesMask: DWORD): HRESULT; stdcall;
    function Play: HRESULT; stdcall;
    function Record_(pFormat: PWAVEFORMATEX): HRESULT; stdcall;
    function Pause: HRESULT; stdcall;
    function Resume: HRESULT; stdcall;
    function Stop: HRESULT; stdcall;
    function Seek(fuMode: UINT; nOffset: integer): HRESULT; stdcall;
  end;

  IWMDMEnumStorage = interface(IUnknown)
    ['{1DCB3A05-33ED-11d3-8470-00C04F79DBC0}']
    function Next(celt: ULONG; out ppStorage: IWMDMStorage; out pceltFetched: ULONG): HRESULT; stdcall;
    function Skip(celt: ULONG; out pceltFetched: ULONG): HRESULT; stdcall;
    function Reset: HRESULT; stdcall;
    function Clone(out ppEnumStorage: IWMDMEnumStorage): HRESULT; stdcall;
  end;

  IWMDMStorageControl = interface(IUnknown)
    ['{1DCB3A08-33ED-11d3-8470-00C04F79DBC0}']
    function Insert(fuMode: UINT; pwszFile: PWideChar; pOperation: IWMDMOperation;
               pProgress: IWMDMProgress; out ppNewObject: IWMDMStorage): HRESULT; stdcall;
    function Delete(fuMode: UINT; pProgress: IWMDMProgress): HRESULT; stdcall;
    function Rename(fuMode: UINT; pwszNewName: PWideChar; pProgress: IWMDMProgress): HRESULT; stdcall;
    function Read(fuMode: UINT; pwszFile: LPWSTR; pProgress: IWMDMProgress; pOperation: IWMDMOperation): HRESULT; stdcall;
    function Move(fuMode: UINT; pTargetObject: IWMDMStorage; pProgress: IWMDMProgress): HRESULT; stdcall;
  end;

  IWMDMObjectInfo = interface(IUnknown)
    ['{1DCB3A09-33ED-11d3-8470-00C04F79DBC0}']
    function GetPlayLength(out pdwLength: DWORD): HRESULT; stdcall;
    function SetPlayLength(dwLength: DWORD): HRESULT; stdcall;
    function GetPlayOffset(out pdwOffset: DWORD): HRESULT; stdcall;
    function SetPlayOffset(dwOffset: DWORD): HRESULT; stdcall;
    function GetTotalLength(out pdwLength: DWORD): HRESULT; stdcall;
    function GetLastPlayPosition(out pdwLastPos: DWORD): HRESULT; stdcall;
    function GetLongestPlayPosition(out pdwLongestPos: DWORD): HRESULT; stdcall;
  end;

const
// Open Mode Flags
  MDSP_READ                              = $00000001;
  MDSP_WRITE                             = $00000002;
// Seek Flags
  MDSP_SEEK_BOF                          = $00000001;
  MDSP_SEEK_CUR                          = $00000002;
  MDSP_SEEK_EOF                          = $00000004;

type
  IMDSPEnumDevice = interface;

  IMDServiceProvider = interface(IUnknown)
    ['{1DCB3A10-33ED-11d3-8470-00C04F79DBC0}']
    function GetDeviceCount(out pdwCount: DWORD): HRESULT; stdcall;
    function EnumDevices(out ppEnumDevice: IMDSPEnumDevice): HRESULT; stdcall;
  end;

  IMDSPDevice = interface;

  IMDSPEnumDevice = interface(IUnknown)
    ['{1DCB3A11-33ED-11d3-8470-00C04F79DBC0}']
    function Next(celt: ULONG; out ppDevice: IMDSPDevice; out pceltFetched: ULONG): HRESULT; stdcall;
    function Skip(celt: ULONG; out pceltFetched: ULONG): HRESULT; stdcall;
    function Reset: HRESULT; stdcall;
    function Clone(out ppEnumDevice: IMDSPEnumDevice): HRESULT; stdcall;
  end;

  IMDSPEnumStorage = interface;

  IMDSPDevice = interface(IUnknown)
    ['{1DCB3A12-33ED-11d3-8470-00C04F79DBC0}']
    function GetName(out pwszName: WideChar; nMaxChars: UINT): HRESULT; stdcall;
    function GetManufacturer(out pwszName: WideChar; nMaxChars: UINT): HRESULT; stdcall;
    function GetVersion(out pdwVersion: DWORD): HRESULT; stdcall;
    function GetType(out pdwType: DWORD): HRESULT; stdcall;
    function GetSerialNumber(out pSerialNumber: TWMDMID; var abMac: TabMac): HRESULT; stdcall;
    function GetPowerSource(out pdwPowerSource, pdwPercentRemaining: DWORD): HRESULT; stdcall;
    function GetStatus(out pdwStatus: DWORD): HRESULT; stdcall;
    function GetDeviceIcon(out hIcon: ULONG): HRESULT; stdcall;
    function EnumStorage(out ppEnumStorage: IMDSPEnumStorage): HRESULT; stdcall;
    function GetFormatSupport(out pFormatEx: PWAVEFORMATEX; out pnFormatCount: UINT;
               out pppwszMimeType: PPWideChar; out pnMimeTypeCount: UINT): HRESULT; stdcall;
    function SendOpaqueCommand(var pCommand: TOPAQUECOMMAND): HRESULT; stdcall;
  end;

  IMDSPDeviceControl = interface(IUnknown)
    ['{1DCB3A14-33ED-11d3-8470-00C04F79DBC0}']
    function GetDCStatus(out pdwStatus: DWORD): HRESULT; stdcall;
    function GetCapabilities(out pdwCapabilitiesMask: DWORD): HRESULT; stdcall;
    function Play: HRESULT; stdcall;
    function Record_(pFormat: PWAVEFORMATEX): HRESULT; stdcall;
    function Pause: HRESULT; stdcall;
    function Resume: HRESULT; stdcall;
    function Stop: HRESULT; stdcall;
    function Seek(fuMode: UINT; nOffset: integer): HRESULT; stdcall;
  end;

  IMDSPStorage = interface;

  IMDSPEnumStorage = interface(IUnknown)
    ['{1DCB3A15-33ED-11d3-8470-00C04F79DBC0}']
    function Next(celt: ULONG; out ppStorage: IMDSPStorage; out pceltFetched: ULONG): HRESULT; stdcall;
    function Skip(celt: ULONG; out pceltFetched: ULONG): HRESULT; stdcall;
    function Reset: HRESULT; stdcall;
    function Clone(out ppEnumStorage: IMDSPEnumStorage): HRESULT; stdcall;
  end;

  IMDSPStorageGlobals = interface;

  IMDSPStorage = interface(IUnknown)
    ['{1DCB3A16-33ED-11d3-8470-00C04F79DBC0}']
    function SetAttributes(dwAttributes: DWORD; pFormat: PWAVEFORMATEX): HRESULT; stdcall;
    function GetStorageGlobals(out ppStorageGlobals: IMDSPStorageGlobals): HRESULT; stdcall;
    function GetAttributes(out pdwAttributes: DWORD; out pFormat: TWAVEFORMATEX): HRESULT; stdcall;
    function GetName(out pwszName: WideChar; nMaxChars: UINT): HRESULT; stdcall;
    function GetDate(out pDateTimeUTC: TWMDMDATETIME): HRESULT; stdcall;
    function GetSize(out pdwSizeLow, pdwSizeHigh: DWORD): HRESULT; stdcall;
    function GetRights(out ppRights: TWMDMRIGHTS; out pnRightsCount: UINT;
               var abMac: TabMac): HRESULT; stdcall;
    function CreateStorage(dwAttributes: DWORD; pFormat: PWAVEFORMATEX; pwszName: PWideChar;
               out ppNewStorage: IMDSPStorage): HRESULT; stdcall;
    function EnumStorage(out ppEnumStorage: IMDSPEnumStorage): HRESULT; stdcall;
    function SendOpaqueCommand(var pCommand: TOPAQUECOMMAND): HRESULT; stdcall;
  end;

  IMDSPStorageGlobals = interface(IUnknown)
    ['{1DCB3A17-33ED-11d3-8470-00C04F79DBC0}']
    function GetCapabilities(out pdwCapabilities: DWORD): HRESULT; stdcall;
    function GetSerialNumber(out pSerialNum: TWMDMID; var abMac: TabMac): HRESULT; stdcall;
    function GetTotalSize(out pdwTotalSizeLow, pdwTotalSizeHigh: DWORD): HRESULT; stdcall;
    function GetTotalFree(out pdwFreeLow, pdwFreeHigh: DWORD): HRESULT; stdcall;
    function GetTotalBad(out pdwBadLow, pdwBadHigh: DWORD): HRESULT; stdcall;
    function GetStatus(out pdwStatus: DWORD): HRESULT; stdcall;
    function Initialize(fuMode: UINT; pProgress: IWMDMProgress): HRESULT; stdcall;
    function GetDevice(out ppDevice: IMDSPDevice): HRESULT; stdcall;
    function GetRootStorage(out ppRoot: IMDSPStorage): HRESULT; stdcall;
  end;

  IMDSPObjectInfo = interface(IUnknown)
    ['{1DCB3A19-33ED-11d3-8470-00C04F79DBC0}']
    function GetPlayLength(out pdwLength: DWORD): HRESULT; stdcall;
    function SetPlayLength(dwLength: DWORD): HRESULT; stdcall;
    function GetPlayOffset(out pdwOffset: DWORD): HRESULT; stdcall;
    function SetPlayOffset(dwOffset: DWORD): HRESULT; stdcall;
    function GetTotalLength(out pdwLength: DWORD): HRESULT; stdcall;
    function GetLastPlayPosition(out pdwLastPos: DWORD): HRESULT; stdcall;
    function GetLongestPlayPosition(out pdwLongestPos: DWORD): HRESULT; stdcall;
  end;

  IMDSPObject = interface(IUnknown)
    ['{1DCB3A18-33ED-11d3-8470-00C04F79DBC0}']
    function Open(fuMode: UINT): HRESULT; stdcall;
    function Read(out pData: BYTE; var pdwSize: DWORD; var abMac: TabMac): HRESULT; stdcall;
    function Write(pData: BYTE; var pdwSize: DWORD; var abMac: TabMac): HRESULT; stdcall;
    function Delete(fuMode: UINT; pProgress: IWMDMProgress): HRESULT; stdcall;
    function Seek(fuFlags: UINT; dwOffset: DWORD): HRESULT; stdcall;
    function Rename(pwszNewName: PWideChar; pProgress: IWMDMProgress): HRESULT; stdcall;
    function Move(fuMode: UINT; pProgress: IWMDMProgress; pTarget: IMDSPStorage): HRESULT; stdcall;
    function Close: HRESULT; stdcall;
  end;

const
// SCP Data Flags
  WMDM_SCP_EXAMINE_EXTENSION                = $00000001;
  WMDM_SCP_EXAMINE_DATA                     = $00000002;
  WMDM_SCP_DECIDE_DATA                      = $00000008;
  WMDM_SCP_PROTECTED_OUTPUT                 = $00000010;
  WMDM_SCP_UNPROTECTED_OUTPUT               = $00000020;
  WMDM_SCP_RIGHTS_DATA                      = $00000040;
// SCP Transfer Flags
  WMDM_SCP_TRANSFER_OBJECTDATA              = $00000020;
  WMDM_SCP_NO_MORE_CHANGES                  = $00000040;

type

  ISCPSecureQuery = interface;

  ISCPSecureAuthenticate = interface(IUnknown)
    ['{1DCB3A0F-33ED-11d3-8470-00C04F79DBC0}']
    function GetSecureQuery(out ppSecureQuery: ISCPSecureQuery): HRESULT; stdcall;
  end;

  ISCPSecureExchange = interface;

  ISCPSecureQuery = interface(IUnknown)
    ['{1DCB3A0D-33ED-11d3-8470-00C04F79DBC0}']
    function GetDataDemands(out pfuFlags: UINT; out pdwMinRightsData, pdwMinExamineData,
               pdwMinDecideData: DWORD; var abMac: TabMac): HRESULT; stdcall;
    function ExamineData(fuFlags: UINT; pwszExtension: PWideChar; pData: PBYTE;
               dwSize: DWORD; var abMac: TabMac): HRESULT; stdcall;
    function MakeDecision(fuFlags: UINT; pData: PBYTE; dwSize, dwAppSec: DWORD;
               pbSPSessionKey: PBYTE; dwSessionKeyLen: DWORD; pStorageGlobals: IMDSPStorageGlobals;
               out ppExchange: ISCPSecureExchange; var abMac: TabMac): HRESULT; stdcall;
    function GetRights(pData: PBYTE; dwSize: DWORD; pbSPSessionKey: PBYTE; dwSessionKeyLen: DWORD;
               pStgGlobals: IMDSPStorageGlobals; out ppRights: PWMDMRIGHTS;
               out pnRightsCount: UINT; out abMac: TabMac): HRESULT; stdcall;
  end;

  ISCPSecureExchange = interface(IUnknown)
    ['{1DCB3A0E-33ED-11d3-8470-00C04F79DBC0}']
    function TransferContainerData(pData: PBYTE; dwSize: DWORD; out pfuReadyFlags: UINT;
               var abMac: TabMac): HRESULT; stdcall;
    function ObjectData(out pData: BYTE; var pdwSize: DWORD; var abMac: TabMac): HRESULT; stdcall;
    function TransferComplete: HRESULT; stdcall;
  end;

  IComponentAuthenticate = interface(IUnknown)
    ['{A9889C00-6D2B-11d3-8496-00C04F79DBC0}']
    function SACAuth(dwProtocolID, dwPass: DWORD; pbDataIn: PBYTE; dwDataInLen: DWORD;
               out ppbDataOut: PBYTE; out pdwDataOutLen: DWORD): HRESULT; stdcall;
    function SACGetProtocols(out ppdwProtocols: PDWORD; out pdwProtocolCount: DWORD): HRESULT; stdcall;
  end;

//extern int Asmversion;  { 1 if we're linked with an asm version, 0 if C }

////////////////////////////////////////////////////////////////////////////////
//
// functions
//
////////////////////////////////////////////////////////////////////////////////

function WMCreateCertificate(out pUnkCert: IUnknown): HRESULT; stdcall;
function WMCreateWriter(pUnkCert: IUnknown; out ppWriter: IWMWriter): HRESULT; stdcall; // ok
function WMCreateReader(pUnkCert: IUnknown; dwRights: DWORD; out ppReader: IWMReader): HRESULT; stdcall;
function WMCreateEditor(out ppEditor: IWMMetadataEditor): HRESULT; stdcall;
function WMCreateIndexer(out ppIndexer: IWMIndexer): HRESULT; stdcall;
function WMCreateBackupRestorer(pCallback: IUnknown; out ppBackup: IWMLicenseBackup): HRESULT; stdcall;

function WMCreateProfileManager(out ppProfileManager: IWMProfileManager): HRESULT; stdcall; // ok
function WMCreateWriterFileSink(out ppSink: IWMWriterFileSink): HRESULT; stdcall;
function WMCreateWriterNetworkSink(out ppSink: IWMWriterNetworkSink): HRESULT; stdcall;

const
  IID_IServiceProvider : TGUID = '{6d5140c1-7436-11ce-8034-00aa006009fa}';
  IID_IUnknown         : TGUID = '{00000000-0000-0000-C000-000000000046}';
  IID_IObjectWithSite  : TGUID = '{FC4801A3-2BA9-11CF-A229-00AA003D7352}';

type
  TWMKeyProvider = class(TInterfacedObject,IServiceProvider)
  private
    m_cRef: ULONG;
  public
    constructor Create;
    function QueryService(const rsid, iid: TGuid; out Obj): HResult; stdcall;
  end;

  TWMPofiles = (
    wmp_Unknown,
    wmp_V40_DialUpMBR,
    wmp_V40_IntranetMBR,
    wmp_V40_2856100MBR,
    wmp_V40_6VoiceAudio,
    wmp_V40_16AMRadio,
    wmp_V40_288FMRadioMono,
    wmp_V40_288FMRadioStereo,
    wmp_V40_56DialUpStereo,
    wmp_V40_64Audio,
    wmp_V40_96Audio,
    wmp_V40_128Audio,
    wmp_V40_288VideoVoice,
    wmp_V40_288VideoAudio,
    wmp_V40_288VideoWebServer,
    wmp_V40_56DialUpVideo,
    wmp_V40_56DialUpVideoWebServer,
    wmp_V40_100Video,
    wmp_V40_250Video,
    wmp_V40_512Video,
    wmp_V40_1MBVideo,
    wmp_V40_3MBVideo,
    wmp_V70_DialUpMBR,
    wmp_V70_IntranetMBR,
    wmp_V70_2856100MBR,
    wmp_V70_288VideoVoice,
    wmp_V70_288VideoAudio,
    wmp_V70_288VideoWebServer,
    wmp_V70_56VideoWebServer,
    wmp_V70_64VideoISDN,
    wmp_V70_100Video,
    wmp_V70_256Video,
    wmp_V70_384Video,
    wmp_V70_768Video,
    wmp_V70_1500Video,
    wmp_V70_2000Video,
    wmp_V70_700FilmContentVideo,
    wmp_V70_1500FilmContentVideo,
    wmp_V70_6VoiceAudio,
    wmp_V70_288FMRadioMono,
    wmp_V70_288FMRadioStereo,
    wmp_V70_56DialUpStereo,
    wmp_V70_64AudioISDN,
    wmp_V70_64Audio,
    wmp_V70_96Audio,
    wmp_V70_128Audio
  );

function WMCertificateAdd(pGraph: IFilterGraph; out KeyProvider : TWMKeyProvider): HRESULT; stdcall;
function WMCertificateRemove(pGraph: IFilterGraph; KeyProvider : TWMKeyProvider): HRESULT; stdcall;

function GuidToProfile(GUID: TGUID): TWMPofiles;
function ProfileToGuid(Profile: TWMPofiles): TGUID;

type
  EASFError = EOleSysError;

  TWMProfileManager = class(TComponent, IWMProfileManager2)
  private
    FWMProfileManager: IWMProfileManager2;
    FCustomProfileText: TStrings;
    function GetCustomProfile: IWMProfile;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property WMProfileManager: IWMProfileManager2 read FWMProfileManager implements IWMProfileManager2;
    property CustomProfile: IWMProfile read GetCustomProfile;
  published
    property CustomProfileText: TStrings read FCustomProfileText write FCustomProfileText;
  end;

procedure ASFError(ErrorCode: HResult);
procedure ASFCheck(Result: HResult);

resourcestring
  S_ASF_E_BUFFEROVERRUN              = 'An attempt was made to seek or position past the end of a buffer.';
  S_ASF_E_BUFFERTOOSMALL             = 'The supplied input or output buffer was too small.';
  S_ASF_E_BADLANGUAGEID              = 'The language ID was not found.';
  S_ASF_E_NOPAYLOADLENGTH            = 'The multiple payload packet is missing the payload length.';
  S_ASF_E_TOOMANYPAYLOADS            = 'The packet contains too many payloads.';
  S_ASF_E_PACKETCONTENTTOOLARGE      = 'ASF_E_PACKETCONTENTTOOLAR';
  S_ASF_E_UNKNOWNPACKETSIZE          = 'Expecting a fixed packet size but min. and max. are not equal.';
  S_ASF_E_INVALIDHEADER              = 'ASF_E_INVALIDHEAD';
  S_ASF_E_NOCLOCKOBJECT              = 'The object does not have a valid clock object.';
  S_ASF_E_UNKNOWNCLOCKTYPE           = 'ASF_E_UNKNOWNCLOCKTY';
  S_ASF_E_OPAQUEPACKET               = 'An attempt was made to restore or access an opaque packet.';
  S_ASF_E_WRONGVERSION               = 'ASF_E_WRONGVERSI';
  S_ASF_E_OVERFLOW                   = 'An attempt was made to store a value which was larger than then destination''s maximum value.';
  S_ASF_E_NOTFOUND                   = 'The object was not found.';
  S_ASF_E_OBJECTTOOBIG               = 'The object is too large to be processed in the requested manner.';
  S_ASF_E_UNEXPECTEDVALUE            = 'A value was not set as expected.';
  S_ASF_E_INVALIDSTATE               = 'The request is not valid in the object''s current state.';
  S_ASF_E_NOLIBRARY                  = 'This object does not have a valid library pointer; it was not properly created or it has been Shutdown().';
  S_ASF_E_ALREADYINITIALIZED         = 'This object has already been initialized; the setting cannot be changed.';
  S_ASF_E_INVALIDINIT                = 'This object has not been initialized properly; that operation cannot be performed.';
  S_ASF_E_NOHEADEROBJECT             = 'The ASF Header object could not be found.';
  S_ASF_E_NODATAOBJECT               = 'The ASF Data object could not be found.';
  S_ASF_E_NOINDEXOBJECT              = 'The ASF Index object could not be found.';
  S_ASF_E_NOSTREAMPROPS              = 'A Stream Properties object with the correct stream number could not be found.';
  S_ASF_E_NOFILEPROPS                = 'The File Properties object could not be found.';
  S_ASF_E_NOLANGUAGELIST             = 'The Language List object could not be found.';
  S_ASF_E_NOINDEXPARAMETERS          = 'The Index Parameters object could not be found.';
  S_ASF_E_UNSUPPORTEDERRORCONCEALMENT = 'The requested error concealment strategy is not supported by this component.';
  S_ASF_E_INVALIDFLAGS               = 'The flags for this object or set of objects are not properly set.';
  S_ASF_E_BADDATADESCRIPTOR          = 'One or more data descriptors is not properly set.';
  S_ASF_E_BADINDEXTIMEINTERVAL       = 'The index has an invalid time interval (probably zero).';
  S_ASF_E_INVALIDTIME                = 'The given time value is not valid.';
  S_ASF_E_INVALIDINDEX               = 'The given index value is not valid.';
  S_ASF_E_STREAMNUMBERINUSE          = 'The specified stream number is already in use.';
  S_ASF_E_BADMEDIATYPE               = 'The specified media type does not work with this component.';
  S_ASF_E_WRITEFAILED                = 'The object could not be written as specified.';
  S_ASF_E_NOTENOUGHDESCRIPTORS       = 'The given data unit requires a larger number of descriptors to be fully parsed.';
  S_ASF_E_INDEXBLOCKUNLOADED         = 'The index entries for the specified index block have been unloaded from memory and are not available.';
  S_ASF_E_NOTENOUGHBANDWIDTH         = 'The specified bandwidth is not large enough.';
  S_ASF_E_EXCEEDEDMAXIMUMOBJECTSIZE  = 'The object has exceeded its maximum size.';
  S_ASF_E_BADDATAUNIT                = 'The given data unit is corrupted, badly formatted, or otherwise not valid.';
  S_ASF_E_HEADERSIZE                 = 'The ASF header has exceeded the specified maximum size.';
  S_ASF_S_OPAQUEPACKET               = 'ASF_S_OPAQUEPACK';

implementation


// define your DLL
const
  WMLIB    = 'WMFLIB.DLL';
  LOADDLLERROR: HResult = E_FAIL;

{$IFNDEF STATICDLL}
var
  _WMCreateCertificate: function(out pUnkCert: IUnknown): HRESULT; stdcall;
  _WMCreateWriter: function(pUnkCert: IUnknown; out ppWriter: IWMWriter): HRESULT; stdcall;
  _WMCreateReader: function(pUnkCert: IUnknown; dwRights: DWORD; out ppReader: IWMReader): HRESULT; stdcall;
  _WMCreateEditor: function(out ppEditor: IWMMetadataEditor): HRESULT; stdcall;
  _WMCreateIndexer: function(out ppIndexer: IWMIndexer): HRESULT; stdcall;
  _WMCreateBackupRestorer: function(pCallback: IUnknown; out ppBackup: IWMLicenseBackup): HRESULT; stdcall;
  _WMCreateProfileManager: function(out ppProfileManager: IWMProfileManager): HRESULT; stdcall;
  _WMCreateWriterFileSink: function(out ppSink: IWMWriterFileSink): HRESULT; stdcall;
  _WMCreateWriterNetworkSink: function(out ppSink: IWMWriterNetworkSink): HRESULT; stdcall;
  DLLHandle: THandle;
  DLLLoaded: Boolean;

procedure LoadDLL;
var
  ErrorMode: Integer;
begin
  if DLLLoaded then Exit;
  ErrorMode := SetErrorMode($8000{SEM_NoOpenFileErrorBox});
  DLLHandle := LoadLibrary(WMLIB);

  if DLLHandle >= 32 then
  begin
    DLLLoaded := True;
    @_WMCreateCertificate := GetProcAddress(DLLHandle,'WMCreateCertificate');
    Assert(@_WMCreateCertificate <> nil);
    @_WMCreateWriter := GetProcAddress(DLLHandle,'WMCreateWriter');
    Assert(@_WMCreateWriter <> nil);
    @_WMCreateReader := GetProcAddress(DLLHandle,'WMCreateReader');
    Assert(@_WMCreateReader <> nil);
    @_WMCreateEditor := GetProcAddress(DLLHandle,'WMCreateEditor');
    Assert(@_WMCreateEditor <> nil);
    @_WMCreateIndexer := GetProcAddress(DLLHandle,'WMCreateIndexer');
    Assert(@_WMCreateIndexer <> nil);
    @_WMCreateBackupRestorer := GetProcAddress(DLLHandle,'WMCreateBackupRestorer');
    Assert(@_WMCreateBackupRestorer <> nil);
    @_WMCreateProfileManager := GetProcAddress(DLLHandle,'WMCreateProfileManager');
    Assert(@_WMCreateProfileManager <> nil);
    @_WMCreateWriterFileSink := GetProcAddress(DLLHandle,'WMCreateWriterFileSink');
    Assert(@_WMCreateWriterFileSink <> nil);
    @_WMCreateWriterNetworkSink := GetProcAddress(DLLHandle,'WMCreateWriterNetworkSink');
    Assert(@_WMCreateWriterNetworkSink <> nil);
  end
  else
    DLLLoaded := False;

  SetErrorMode(ErrorMode);
end;

function WMCreateCertificate(out pUnkCert: IUnknown): HRESULT; stdcall;
begin
  LoadDLL;
  if (@_WMCreateCertificate <> nil) then
    Result := _WMCreateCertificate(pUnkCert)
  else
    Result := LOADDLLERROR;
end;

function WMCreateWriter(pUnkCert: IUnknown; out ppWriter: IWMWriter): HRESULT; stdcall;
begin
  LoadDLL;
  if (@_WMCreateWriter <> nil) then
    Result := _WMCreateWriter(pUnkCert, ppWriter)
  else
    Result := LOADDLLERROR;
end;

function WMCreateReader(pUnkCert: IUnknown; dwRights: DWORD; out ppReader: IWMReader): HRESULT; stdcall;
begin
  LoadDLL;
  if (@_WMCreateReader <> nil) then
    Result := _WMCreateReader(pUnkCert, dwRights, ppReader)
  else
    Result := LOADDLLERROR;
end;

function WMCreateEditor(out ppEditor: IWMMetadataEditor): HRESULT; stdcall;
begin
  LoadDLL;
  if (@_WMCreateEditor <> nil) then
    Result := _WMCreateEditor(ppEditor)
  else
    Result := LOADDLLERROR;
end;

function WMCreateIndexer(out ppIndexer: IWMIndexer): HRESULT; stdcall;
begin
  LoadDLL;
  if (@_WMCreateIndexer <> nil) then
    Result := _WMCreateIndexer(ppIndexer)
  else
    Result := LOADDLLERROR;
end;

function WMCreateBackupRestorer(pCallback: IUnknown; out ppBackup: IWMLicenseBackup): HRESULT; stdcall;
begin
  LoadDLL;
  if (@_WMCreateBackupRestorer <> nil) then
    Result := _WMCreateBackupRestorer(pCallback, ppBackup)
  else
    Result := LOADDLLERROR;
end;

function WMCreateProfileManager(out ppProfileManager: IWMProfileManager): HRESULT; stdcall; // ok
begin
  LoadDLL;
  if (@_WMCreateProfileManager <> nil) then
    Result := _WMCreateProfileManager(ppProfileManager)
  else
    Result := LOADDLLERROR;
end;

function WMCreateWriterFileSink(out ppSink: IWMWriterFileSink): HRESULT; stdcall;
begin
  LoadDLL;
  if (@_WMCreateWriterFileSink <> nil) then
    Result := _WMCreateWriterFileSink(ppSink)
  else
    Result := LOADDLLERROR;
end;

function WMCreateWriterNetworkSink(out ppSink: IWMWriterNetworkSink): HRESULT; stdcall;
begin
  LoadDLL;
  if (@_WMCreateWriterNetworkSink <> nil) then
    Result := _WMCreateWriterNetworkSink(ppSink)
  else
    Result := LOADDLLERROR;
end;

{$ELSE}

function WMCreateCertificate(out pUnkCert: IUnknown): HRESULT; stdcall; external WMLIB;
function WMCreateWriter(pUnkCert: IUnknown; out ppWriter: IWMWriter): HRESULT; stdcall; external WMLIB; // ok
function WMCreateReader(pUnkCert: IUnknown; dwRights: DWORD; out ppReader: IWMReader): HRESULT; stdcall; external WMLIB;
function WMCreateEditor(out ppEditor: IWMMetadataEditor): HRESULT; stdcall; external WMLIB;
function WMCreateIndexer(out ppIndexer: IWMIndexer): HRESULT; stdcall; external WMLIB;
function WMCreateBackupRestorer(pCallback: IUnknown; out ppBackup: IWMLicenseBackup): HRESULT; stdcall; external WMLIB;
function WMCreateProfileManager(out ppProfileManager: IWMProfileManager): HRESULT; stdcall; external WMLIB; // ok
function WMCreateWriterFileSink(out ppSink: IWMWriterFileSink): HRESULT; stdcall; external WMLIB;
function WMCreateWriterNetworkSink(out ppSink: IWMWriterNetworkSink): HRESULT; stdcall; external WMLIB;

{$ENDIF}

constructor TWMKeyProvider.Create;
begin
  m_cRef := 0;
end;

function TWMKeyProvider.QueryService(const rsid, iid: TGuid; out Obj): HResult;
var
  punkCert : IUnknown;
  hr       : HRESULT;
begin
  if(IsEqualGUID(rsid,IID_IWMReader) and IsEqualGUID(iid,IID_IUnknown)) then
  begin
    hr := WMCreateCertificate(punkCert);
    if(SUCCEEDED(hr)) then IUnknown(obj) := punkCert;
    result := hr;
  end
  else
    result := E_NOINTERFACE;
end;

function WMCertificateAdd(pGraph: IFilterGraph; out KeyProvider : TWMKeyProvider): HRESULT; stdcall;
var
  pObjectWithSite: IObjectWithSite;
  hr: HRESULT;
begin
  result := E_FAIL;
  if(pGraph<>nil) then
  begin
    // need to disconnect the filter graph's site
    hr := pGraph.QueryInterface(IID_IObjectWithSite, pObjectWithSite);
    if(SUCCEEDED(hr)) then
    begin
      KeyProvider := TWMKeyProvider.create;
      KeyProvider._AddRef();
      result := pObjectWithSite.SetSite(IServiceProvider(KeyProvider));
      pObjectWithSite := nil;
    end;
  end
  else
    result := E_INVALIDARG;
end;

function WMCertificateRemove(pGraph: IFilterGraph; KeyProvider : TWMKeyProvider): HRESULT; stdcall;
var
  pObjectWithSite: IObjectWithSite;
  hr: HRESULT;
begin
  result := E_FAIL;
  if(pGraph<>nil) then
  begin
    hr := pGraph.QueryInterface(IID_IObjectWithSite, pObjectWithSite);
    if(SUCCEEDED(hr)) then
    begin
      result := pObjectWithSite.SetSite(nil);
      pObjectWithSite := nil;
    end;
  end
  else
    result := E_INVALIDARG;
  if Assigned(KeyProvider) then
  begin
    KeyProvider._Release;
  end;
end;

{ Raise EASFError exception from an error code }

procedure ASFError(ErrorCode: HResult);
//var
 // ErrBuf: array[0..255] of Char;
begin
  case ErrorCode of
    HResult(ASF_E_BUFFEROVERRUN)               : EASFError.Create(PChar(S_ASF_E_BUFFEROVERRUN),ErrorCode,0);
    HResult(ASF_E_BUFFERTOOSMALL)              : EASFError.Create(PChar(S_ASF_E_BUFFERTOOSMALL),ErrorCode,0);
    HResult(ASF_E_BADLANGUAGEID)               : EASFError.Create(PChar(S_ASF_E_BADLANGUAGEID),ErrorCode,0);
    HResult(ASF_E_NOPAYLOADLENGTH)             : EASFError.Create(PChar(S_ASF_E_NOPAYLOADLENGTH),ErrorCode,0);
    HResult(ASF_E_TOOMANYPAYLOADS)             : EASFError.Create(PChar(S_ASF_E_TOOMANYPAYLOADS),ErrorCode,0);
    HResult(ASF_E_PACKETCONTENTTOOLARGE)       : EASFError.Create(PChar(S_ASF_E_PACKETCONTENTTOOLARGE),ErrorCode,0);
    HResult(ASF_E_UNKNOWNPACKETSIZE)           : EASFError.Create(PChar(S_ASF_E_UNKNOWNPACKETSIZE),ErrorCode,0);
    HResult(ASF_E_INVALIDHEADER)               : EASFError.Create(PChar(S_ASF_E_INVALIDHEADER),ErrorCode,0);
    HResult(ASF_E_NOCLOCKOBJECT)               : EASFError.Create(PChar(S_ASF_E_NOCLOCKOBJECT),ErrorCode,0);
    HResult(ASF_E_UNKNOWNCLOCKTYPE)            : EASFError.Create(PChar(S_ASF_E_UNKNOWNCLOCKTYPE),ErrorCode,0);
    HResult(ASF_E_OPAQUEPACKET)                : EASFError.Create(PChar(S_ASF_E_OPAQUEPACKET),ErrorCode,0);
    HResult(ASF_E_WRONGVERSION)                : EASFError.Create(PChar(S_ASF_E_WRONGVERSION),ErrorCode,0);
    HResult(ASF_E_OVERFLOW)                    : EASFError.Create(PChar(S_ASF_E_OVERFLOW),ErrorCode,0);
    HResult(ASF_E_NOTFOUND)                    : EASFError.Create(PChar(S_ASF_E_NOTFOUND),ErrorCode,0);
    HResult(ASF_E_OBJECTTOOBIG)                : EASFError.Create(PChar(S_ASF_E_OBJECTTOOBIG),ErrorCode,0);
    HResult(ASF_E_UNEXPECTEDVALUE)             : EASFError.Create(PChar(S_ASF_E_UNEXPECTEDVALUE),ErrorCode,0);
    HResult(ASF_E_INVALIDSTATE)                : EASFError.Create(PChar(S_ASF_E_INVALIDSTATE),ErrorCode,0);
    HResult(ASF_E_NOLIBRARY)                   : EASFError.Create(PChar(S_ASF_E_NOLIBRARY),ErrorCode,0);
    HResult(ASF_E_ALREADYINITIALIZED)          : EASFError.Create(PChar(S_ASF_E_ALREADYINITIALIZED),ErrorCode,0);
    HResult(ASF_E_INVALIDINIT)                 : EASFError.Create(PChar(S_ASF_E_INVALIDINIT),ErrorCode,0);
    HResult(ASF_E_NOHEADEROBJECT)              : EASFError.Create(PChar(S_ASF_E_NOHEADEROBJECT),ErrorCode,0);
    HResult(ASF_E_NODATAOBJECT)                : EASFError.Create(PChar(S_ASF_E_NODATAOBJECT),ErrorCode,0);
    HResult(ASF_E_NOINDEXOBJECT)               : EASFError.Create(PChar(S_ASF_E_NOINDEXOBJECT),ErrorCode,0);
    HResult(ASF_E_NOSTREAMPROPS)               : EASFError.Create(PChar(S_ASF_E_NOSTREAMPROPS),ErrorCode,0);
    HResult(ASF_E_NOFILEPROPS)                 : EASFError.Create(PChar(S_ASF_E_NOFILEPROPS),ErrorCode,0);
    HResult(ASF_E_NOLANGUAGELIST)              : EASFError.Create(PChar(S_ASF_E_NOLANGUAGELIST),ErrorCode,0);
    HResult(ASF_E_NOINDEXPARAMETERS)           : EASFError.Create(PChar(S_ASF_E_NOINDEXPARAMETERS),ErrorCode,0);
    HResult(ASF_E_UNSUPPORTEDERRORCONCEALMENT) : EASFError.Create(PChar(S_ASF_E_UNSUPPORTEDERRORCONCEALMENT),ErrorCode,0);
    HResult(ASF_E_INVALIDFLAGS)                : EASFError.Create(PChar(S_ASF_E_INVALIDFLAGS),ErrorCode,0);
    HResult(ASF_E_BADDATADESCRIPTOR)           : EASFError.Create(PChar(S_ASF_E_BADDATADESCRIPTOR),ErrorCode,0);
    HResult(ASF_E_BADINDEXTIMEINTERVAL)        : EASFError.Create(PChar(S_ASF_E_BADINDEXTIMEINTERVAL),ErrorCode,0);
    HResult(ASF_E_INVALIDTIME)                 : EASFError.Create(PChar(S_ASF_E_INVALIDTIME),ErrorCode,0);
    HResult(ASF_E_INVALIDINDEX)                : EASFError.Create(PChar(S_ASF_E_INVALIDINDEX),ErrorCode,0);
    HResult(ASF_E_STREAMNUMBERINUSE)           : EASFError.Create(PChar(S_ASF_E_STREAMNUMBERINUSE),ErrorCode,0);
    HResult(ASF_E_BADMEDIATYPE)                : EASFError.Create(PChar(S_ASF_E_BADMEDIATYPE),ErrorCode,0);
    HResult(ASF_E_WRITEFAILED)                 : EASFError.Create(PChar(S_ASF_E_WRITEFAILED),ErrorCode,0);
    HResult(ASF_E_NOTENOUGHDESCRIPTORS)        : EASFError.Create(PChar(S_ASF_E_NOTENOUGHDESCRIPTORS),ErrorCode,0);
    HResult(ASF_E_INDEXBLOCKUNLOADED)          : EASFError.Create(PChar(S_ASF_E_INDEXBLOCKUNLOADED),ErrorCode,0);
    HResult(ASF_E_NOTENOUGHBANDWIDTH)          : EASFError.Create(PChar(S_ASF_E_NOTENOUGHBANDWIDTH),ErrorCode,0);
    HResult(ASF_E_EXCEEDEDMAXIMUMOBJECTSIZE)   : EASFError.Create(PChar(S_ASF_E_EXCEEDEDMAXIMUMOBJECTSIZE),ErrorCode,0);
    HResult(ASF_E_BADDATAUNIT)                 : EASFError.Create(PChar(S_ASF_E_BADDATAUNIT),ErrorCode,0);
    HResult(ASF_E_HEADERSIZE)                  : EASFError.Create(PChar(S_ASF_E_HEADERSIZE),ErrorCode,0);
    HResult(ASF_S_OPAQUEPACKET)                : EASFError.Create(PChar(S_ASF_S_OPAQUEPACKET),ErrorCode,0);
    else raise EASFError.Create('', ErrorCode, 0);
  end;
end;

{ Raise EASFError exception if result code indicates an error }

procedure ASFCheck(Result: HResult);
begin
  if not Succeeded(Result) then ASFError(Result);
end;

{ TWMProfileManager }

constructor TWMProfileManager.Create(AOwner: TComponent);
var
  PM: IWMProfileManager;
begin
  inherited;
  FCustomProfileText := TStringList.Create;
  if not (csDesigning in ComponentState) then
  begin
    ASFCheck(WMCreateProfileManager(PM));
    FWMProfileManager := PM as IWMProfileManager2;
    FWMProfileManager.SetSystemProfileVersion(WMT_VER_7_0);
  end;
end;

destructor TWMProfileManager.Destroy;
begin
  FWMProfileManager := nil;
  FCustomProfileText.Free;
  inherited;
end;

function TWMProfileManager.GetCustomProfile: IWMProfile;
var
  ProfileStr: WideString;
begin
  ProfileStr := FCustomProfileText.Text;
  ASFCheck(FWMProfileManager.LoadProfileByData(PWideChar(ProfileStr),Result));
end;

function GuidToProfile(GUID: TGUID): TWMPofiles;
begin
  if IsEqualGUID(GUID, WMProfile_V40_DialUpMBR)              then result := wmp_V40_DialUpMBR else
  if IsEqualGUID(GUID, WMProfile_V40_IntranetMBR)            then result := wmp_V40_IntranetMBR else
  if IsEqualGUID(GUID, WMProfile_V40_2856100MBR)             then result := wmp_V40_2856100MBR else
  if IsEqualGUID(GUID, WMProfile_V40_6VoiceAudio)            then result := wmp_V40_6VoiceAudio else
  if IsEqualGUID(GUID, WMProfile_V40_16AMRadio)              then result := wmp_V40_16AMRadio else
  if IsEqualGUID(GUID, WMProfile_V40_288FMRadioMono)         then result := wmp_V40_288FMRadioMono else
  if IsEqualGUID(GUID, WMProfile_V40_288FMRadioStereo)       then result := wmp_V40_288FMRadioStereo else
  if IsEqualGUID(GUID, WMProfile_V40_56DialUpStereo)         then result := wmp_V40_56DialUpStereo else
  if IsEqualGUID(GUID, WMProfile_V40_64Audio)                then result := wmp_V40_64Audio else
  if IsEqualGUID(GUID, WMProfile_V40_96Audio)                then result := wmp_V40_96Audio else
  if IsEqualGUID(GUID, WMProfile_V40_128Audio)               then result := wmp_V40_128Audio else
  if IsEqualGUID(GUID, WMProfile_V40_288VideoVoice)          then result := wmp_V40_288VideoVoice else
  if IsEqualGUID(GUID, WMProfile_V40_288VideoAudio)          then result := wmp_V40_288VideoAudio else
  if IsEqualGUID(GUID, WMProfile_V40_288VideoWebServer)      then result := wmp_V40_288VideoWebServer else
  if IsEqualGUID(GUID, WMProfile_V40_56DialUpVideo)          then result := wmp_V40_56DialUpVideo else
  if IsEqualGUID(GUID, WMProfile_V40_56DialUpVideoWebServer) then result := wmp_V40_56DialUpVideoWebServer else
  if IsEqualGUID(GUID, WMProfile_V40_100Video)               then result := wmp_V40_100Video else
  if IsEqualGUID(GUID, WMProfile_V40_250Video)               then result := wmp_V40_250Video else
  if IsEqualGUID(GUID, WMProfile_V40_512Video)               then result := wmp_V40_512Video else
  if IsEqualGUID(GUID, WMProfile_V40_1MBVideo)               then result := wmp_V40_1MBVideo else
  if IsEqualGUID(GUID, WMProfile_V40_3MBVideo)               then result := wmp_V40_3MBVideo else
  if IsEqualGUID(GUID, WMProfile_V70_DialUpMBR)              then result := wmp_V70_DialUpMBR else
  if IsEqualGUID(GUID, WMProfile_V70_IntranetMBR)            then result := wmp_V70_IntranetMBR else
  if IsEqualGUID(GUID, WMProfile_V70_2856100MBR)             then result := wmp_V70_2856100MBR else
  if IsEqualGUID(GUID, WMProfile_V70_288VideoVoice)          then result := wmp_V70_288VideoVoice else
  if IsEqualGUID(GUID, WMProfile_V70_288VideoAudio)          then result := wmp_V70_288VideoAudio else
  if IsEqualGUID(GUID, WMProfile_V70_288VideoWebServer)      then result := wmp_V70_288VideoWebServer else
  if IsEqualGUID(GUID, WMProfile_V70_56VideoWebServer)       then result := wmp_V70_56VideoWebServer else
  if IsEqualGUID(GUID, WMProfile_V70_64VideoISDN)            then result := wmp_V70_64VideoISDN else
  if IsEqualGUID(GUID, WMProfile_V70_100Video)               then result := wmp_V70_100Video else
  if IsEqualGUID(GUID, WMProfile_V70_256Video)               then result := wmp_V70_256Video else
  if IsEqualGUID(GUID, WMProfile_V70_384Video)               then result := wmp_V70_384Video else
  if IsEqualGUID(GUID, WMProfile_V70_768Video)               then result := wmp_V70_768Video else
  if IsEqualGUID(GUID, WMProfile_V70_1500Video)              then result := wmp_V70_1500Video else
  if IsEqualGUID(GUID, WMProfile_V70_2000Video)              then result := wmp_V70_2000Video else
  if IsEqualGUID(GUID, WMProfile_V70_700FilmContentVideo)    then result := wmp_V70_700FilmContentVideo else
  if IsEqualGUID(GUID, WMProfile_V70_1500FilmContentVideo)   then result := wmp_V70_1500FilmContentVideo else
  if IsEqualGUID(GUID, WMProfile_V70_6VoiceAudio)            then result := wmp_V70_6VoiceAudio else
  if IsEqualGUID(GUID, WMProfile_V70_288FMRadioMono)         then result := wmp_V70_288FMRadioMono else
  if IsEqualGUID(GUID, WMProfile_V70_288FMRadioStereo)       then result := wmp_V70_288FMRadioStereo else
  if IsEqualGUID(GUID, WMProfile_V70_56DialUpStereo)         then result := wmp_V70_56DialUpStereo else
  if IsEqualGUID(GUID, WMProfile_V70_64AudioISDN)            then result := wmp_V70_64AudioISDN else
  if IsEqualGUID(GUID, WMProfile_V70_64Audio)                then result := wmp_V70_64Audio else
  if IsEqualGUID(GUID, WMProfile_V70_96Audio)                then result := wmp_V70_96Audio else
  if IsEqualGUID(GUID, WMProfile_V70_128Audio)               then result := wmp_V70_128Audio else
  result := wmp_Unknown;
end;

function ProfileToGUID(Profile: TWMPofiles): TGUID;
begin
  case profile of
    wmp_Unknown                    : result := GUID_NULL;
    wmp_V40_DialUpMBR              : result := WMProfile_V40_DialUpMBR;
    wmp_V40_IntranetMBR            : result := WMProfile_V40_IntranetMBR;
    wmp_V40_2856100MBR             : result := WMProfile_V40_2856100MBR;
    wmp_V40_6VoiceAudio            : result := WMProfile_V40_6VoiceAudio;
    wmp_V40_16AMRadio              : result := WMProfile_V40_16AMRadio;
    wmp_V40_288FMRadioMono         : result := WMProfile_V40_288FMRadioMono;
    wmp_V40_288FMRadioStereo       : result := WMProfile_V40_288FMRadioStereo;
    wmp_V40_56DialUpStereo         : result := WMProfile_V40_56DialUpStereo;
    wmp_V40_64Audio                : result := WMProfile_V40_64Audio;
    wmp_V40_96Audio                : result := WMProfile_V40_96Audio;
    wmp_V40_128Audio               : result := WMProfile_V40_128Audio;
    wmp_V40_288VideoVoice          : result := WMProfile_V40_288VideoVoice;
    wmp_V40_288VideoAudio          : result := WMProfile_V40_288VideoAudio;
    wmp_V40_288VideoWebServer      : result := WMProfile_V40_288VideoWebServer;
    wmp_V40_56DialUpVideo          : result := WMProfile_V40_56DialUpVideo;
    wmp_V40_56DialUpVideoWebServer : result := WMProfile_V40_56DialUpVideoWebServer;
    wmp_V40_100Video               : result := WMProfile_V40_100Video;
    wmp_V40_250Video               : result := WMProfile_V40_250Video;
    wmp_V40_512Video               : result := WMProfile_V40_512Video;
    wmp_V40_1MBVideo               : result := WMProfile_V40_1MBVideo;
    wmp_V40_3MBVideo               : result := WMProfile_V40_3MBVideo;
    wmp_V70_DialUpMBR              : result := WMProfile_V70_DialUpMBR;
    wmp_V70_IntranetMBR            : result := WMProfile_V70_IntranetMBR;
    wmp_V70_2856100MBR             : result := WMProfile_V70_2856100MBR;
    wmp_V70_288VideoVoice          : result := WMProfile_V70_288VideoVoice;
    wmp_V70_288VideoAudio          : result := WMProfile_V70_288VideoAudio;
    wmp_V70_288VideoWebServer      : result := WMProfile_V70_288VideoWebServer;
    wmp_V70_56VideoWebServer       : result := WMProfile_V70_56VideoWebServer;
    wmp_V70_64VideoISDN            : result := WMProfile_V70_64VideoISDN;
    wmp_V70_100Video               : result := WMProfile_V70_100Video;
    wmp_V70_256Video               : result := WMProfile_V70_256Video;
    wmp_V70_384Video               : result := WMProfile_V70_384Video;
    wmp_V70_768Video               : result := WMProfile_V70_768Video;
    wmp_V70_1500Video              : result := WMProfile_V70_1500Video;
    wmp_V70_2000Video              : result := WMProfile_V70_2000Video;
    wmp_V70_700FilmContentVideo    : result := WMProfile_V70_700FilmContentVideo;
    wmp_V70_1500FilmContentVideo   : result := WMProfile_V70_1500FilmContentVideo;
    wmp_V70_6VoiceAudio            : result := WMProfile_V70_6VoiceAudio;
    wmp_V70_288FMRadioMono         : result := WMProfile_V70_288FMRadioMono;
    wmp_V70_288FMRadioStereo       : result := WMProfile_V70_288FMRadioStereo;
    wmp_V70_56DialUpStereo         : result := WMProfile_V70_56DialUpStereo;
    wmp_V70_64AudioISDN            : result := WMProfile_V70_64AudioISDN;
    wmp_V70_64Audio                : result := WMProfile_V70_64Audio;
    wmp_V70_96Audio                : result := WMProfile_V70_96Audio;
    wmp_V70_128Audio               : result := WMProfile_V70_128Audio;
  else
    result := GUID_NULL;
  end;
end;


end.
