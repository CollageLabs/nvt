###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_install_manager_detect_win.nasl 9580 2018-04-24 08:44:20Z jschulte $
#
# IBM Installation Manager Version Detection (Windows)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Updated By: Shakeel <bshakeel@secpod.com> on 2014-05-07
# According to CR57 and to support 64 bit.
#
# Copyright:
# Copyright (C) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.801010");
  script_version("$Revision: 9580 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-04-24 10:44:20 +0200 (Tue, 24 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-10-12 07:28:01 +0200 (Mon, 12 Oct 2009)");
  script_tag(name:"qod_type", value:"registry");
  script_name("IBM Installation Manager Version Detection (Windows)");

  tag_summary =
"The script detects the installed IBM Installation Manager version and saves
the version in KB.

The script logs in via smb, searches for IBM Installation Manager in the
registry and gets the version from 'version' string in registry.";


  script_tag(name : "summary" , value : tag_summary);

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("secpod_reg_enum.nasl", "smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion", "SMB/Windows/Arch");
  script_require_ports(139, 445);
  exit(0);
}

include("smb_nt.inc");
include("cpe.inc");
include("host_details.inc");

## variable Initialization
os_arch = "";
key_list = "";
key = "";
insloc = "";
iimVer = "";
checkduplicate = "";

## Get OS Architecture
os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(0);
}

## Check for 32 bit platform
if("x86" >< os_arch){
  key_list = make_list("SOFTWARE\IBM\Installation Manager");
}
## Check for 64 bit platform
else if("x64" >< os_arch)
{
  key_list =  make_list("SOFTWARE\IBM\Installation Manager",
                        "SOFTWARE\Wow6432Node\IBM\Installation Manager");
}

if(isnull(key_list)){
    exit(0);
}

foreach key (key_list)
{
  iimVer= registry_get_sz(key:key, item:"version");
  insloc= registry_get_sz(key:key, item:"appDataLocation");

  if(iimVer != NULL)
  {
    ## Check if version is already set
    if (iimVer + ", " >< checkduplicate){
        continue;
    }

    checkduplicate  += iimVer + ", ";

    set_kb_item(name:"IBM/InstallMang/Win/Ver", value:iimVer);

    ## build cpe
    cpe = build_cpe(value:iimVer, exp:"^([0-9.]+)", base:"cpe:/a:ibm:installation_manager:");
    if(isnull(cpe))
      cpe = "cpe:/a:ibm:installation_manager";

    ## Register for 64 bit app on 64 bit OS once again
    if("64" >< os_arch && "Wow6432Node" >!< key)
    {
      set_kb_item(name:"IBM/InstallMang64/Win/Ver", value:iimVer);

      ## Build CPE
      cpe = build_cpe(value:iimVer, exp:"^([0-9.]+)", base:"cpe:/a:ibm:installation_manager:x64:");
      if(isnull(cpe))
        cpe = "cpe:/a:ibm:installation_manager:x64";
    }
    ##register cpe
    register_product(cpe:cpe, location:insloc);
    log_message(data: build_detection_report(app: "IBM Installatin Manager",
                                             version: iimVer,
                                             install: insloc,
                                             cpe: cpe,
                                             concluded: iimVer));
  }
}
