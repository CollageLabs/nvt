###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_macosx_mult_vuln04_feb17.nasl 9846 2018-05-15 14:10:09Z santu $
#
# Apple Mac OS X Multiple Vulnerabilities-04 February-2017
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.810570");
  script_version("$Revision: 9846 $");
  script_cve_id("CVE-2016-4662", "CVE-2016-4682", "CVE-2016-4669", "CVE-2016-4675",
                "CVE-2016-4663");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-05-15 16:10:09 +0200 (Tue, 15 May 2018) $");
  script_tag(name:"creation_date", value:"2017-02-28 09:04:00 +0530 (Tue, 28 Feb 2017)");
  script_name("Apple Mac OS X Multiple Vulnerabilities-04 February-2017");

  script_tag(name: "summary" , value:"This host is running Apple Mac OS X and
  is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to,
  - A memory corruption issue in 'NVIDIA Graphics Drivers'.
  - A logic issue in 'libxpc'.
  - Multiple input validation issues in 'MIG generated code'.
  - An out-of-bounds read issue in the 'SGI image parsing'.
  - A memory corruption issue in 'AppleGraphicsControl'.");

  script_tag(name: "impact" , value:"Successful exploitation will allow attacker
  to execute arbitrary code or cause a denial of service and gain access to 
  potentially sensitive information.

  Impact Level: System");

  script_tag(name: "affected" , value:"Apple Mac OS X versions 10.11.x through 
  10.11.6 and 10.10.x through 10.10.5");

  script_tag(name: "solution" , value:"Apply the appropriate security patch from
  the reference links.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"package");

  script_xref(name : "URL" , value : "https://support.apple.com/en-in/HT207275");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Mac OS X Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/osx_name", "ssh/login/osx_version");
  exit(0);
}


include("version_func.inc");

## Variable Initialization
osName = "";
osVer = "";

## Get the OS name
osName = get_kb_item("ssh/login/osx_name");
if(!osName){
  exit (0);
}

## Get the OS Version
osVer = get_kb_item("ssh/login/osx_version");
if(!osVer){
  exit(0);
}

## Check for the Mac OS X
if("Mac OS X" >< osName)
{
  ## Check the affected OS versions
  if(version_in_range(version:osVer, test_version:"10.10", test_version2:"10.10.5") ||
     version_in_range(version:osVer, test_version:"10.11", test_version2:"10.11.6"))
  {
    report = report_fixed_ver(installed_version:osVer, fixed_version:"10.12.1");
    security_message(data:report);
    exit(0);
  }
}
