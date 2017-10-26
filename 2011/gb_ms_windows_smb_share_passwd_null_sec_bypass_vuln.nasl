###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_windows_smb_share_passwd_null_sec_bypass_vuln.nasl 7550 2017-10-24 12:17:52Z cfischer $
#
# Microsoft Windows SMB/NETBIOS NULL Session Authentication Bypass Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.

A workaround is to,
- Disable null session login.
- Remove the share.
- Enable passwords on the share.";

tag_impact = "Successful exploitation could allow attackers to use shares to
cause the system to crash.

Impact Level: System";

tag_affected = "Microsoft Windows 95
Microsoft Windows 98
Microsoft Windows NT";

tag_insight = "The flaw is due to an SMB share, allows full access to Guest
users. If the Guest account is enabled, anyone can access the computer without
a valid user account or password.";

tag_summary = "The host is running SMB/NETBIOS and prone to authentication
bypass Vulnerability";

if(description)
{
  script_id(801991);
  script_version("$Revision: 7550 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 14:17:52 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2011-10-14 14:22:41 +0200 (Fri, 14 Oct 2011)");
  script_cve_id("CVE-1999-0519");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Microsoft Windows SMB/NETBIOS NULL Session Authentication Bypass Vulnerability");

  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/2");
  script_xref(name : "URL" , value : "http://seclab.cs.ucdavis.edu/projects/testing/vulner/38.html");

  script_tag(name:"qod_type", value:"remote_vul");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Windows");
  script_dependencies("netbios_name_get.nasl", "smb_nativelanman.nasl", "os_detection.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("Host/runs_windows");
  script_exclude_keys("SMB/samba");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}

include("smb_nt.inc");
include("host_details.inc");

lanman = get_kb_item("SMB/NativeLanManager");

if(get_kb_item("SMB/samba") || "samba" >< tolower(lanman)){
    exit(0);
}

## Get the SMB Port
port = kb_smb_transport();
if(!port){
  port = 139;
}

## Check the port status
if(!get_port_state(port)){
 exit(0);
}

name = "*SMBSERVER";

## Open the tcp socket
soc = open_sock_tcp(port);
if(!soc){
  exit(0);
}

## Session request
r = smb_session_request(soc:soc, remote:name);
if(!r)
{
  close(soc);
  exit(0);
}

## Get the protocol
prot = smb_neg_prot(soc:soc);
if(!prot)
{
  close(soc);
  exit(0);
}

## Start the session
r = smb_session_setup(soc:soc, login:"", password:"" ,domain:"", prot:prot);
if(!r)
{
  r = smb_session_setup(soc:soc, login:"anonymous", password:"" ,domain:"", prot:prot);
  if(!r)
  {
    close(soc);
    exit(0);
  }
}

## Get the uid
uid = session_extract_uid(reply:r);
if(!uid)
{
  close(soc);
  exit(0);
}

foreach s (make_list("A$", "C$", "D$", "ADMIN$", "WINDOWS$", "ROOT", "WINNT$", "IPC$"))
{
  r = smb_tconx(soc:soc, name:name, uid:uid, share:s);
  if(r)
  {
    tid = tconx_extract_tid(reply:r);
    if(tid)
    {
      close(soc);
      security_message(port:port);
      exit(0);
    }
  }
}
