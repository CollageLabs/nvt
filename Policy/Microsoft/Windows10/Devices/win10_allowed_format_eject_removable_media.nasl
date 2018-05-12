##############################################################################
# OpenVAS Vulnerability Test
# $Id: win10_allowed_format_eject_removable_media.nasl 9774 2018-05-09 10:20:10Z emoss $
#
# Check value for Devices: Allowed to format and eject removable media
#
# Authors:
# Emanuel Moss <emanuel.moss@greenbone.net>
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.109159");
  script_version("$Revision: 9774 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-09 12:20:10 +0200 (Wed, 09 May 2018) $");
  script_tag(name:"creation_date", value:"2018-05-07 16:00:32 +0200 (Mon, 07 May 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:N/I:N/A:N");
  script_tag(name:"qod", value:"97");
  script_name('Microsoft Windows 10: Devices: Allowed to format and eject removable media');
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("smb_reg_service_pack.nasl");
  script_mandatory_keys("Compliance/Launch");
  script_tag(name: "summary", value: "This policy setting determines who is 
allowed to format and eject removable media.

Users can move removable disks to a different device where they have 
administrative user rights and then take ownership of any file, assign 
themselves full control, and view or modify any file. The advantage of 
configuring this policy setting is diminished by the fact that most removable 
storage devices will eject media with the press of a button.");
  exit(0);
}

include("smb_nt.inc");
include("policy_functions.inc");

if(!get_kb_item("SMB/WindowsVersion")){
  policy_logging(text:'Host is no Microsoft Windows System or it is not possible
to query the registry.');
  exit(0);
}

WindowsName = get_kb_item("SMB/WindowsName");
if('windows 10' >!< tolower(WindowsName)){
  policy_logging(text:'Host is not a Microsoft Windows 10 System.');
  exit(0); 
}

type = 'HKLM';
key = 'SOFTWARE\\Microsoft\\WindowsNT\\CurrentVersion\\Winlogon';
item = 'AllocateDASD';
value = registry_get_dword(key:key, item:item, type:type);
if( value == ''){
  value = 'none';
}
policy_logging_registry(type:type,key:key,item:item,value:value);
policy_set_kb(val:value);

exit(0);