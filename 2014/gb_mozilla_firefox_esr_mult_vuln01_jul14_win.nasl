###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_esr_mult_vuln01_jul14_win.nasl 38580 2014-07-01 14:04:43Z jul$
#
# Mozilla Firefox ESR Multiple Vulnerabilities-01 July14 (Windows)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:mozilla:firefox_esr";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804704");
  script_version("2019-07-17T11:14:11+0000");
  script_cve_id("CVE-2014-1533", "CVE-2014-1538", "CVE-2014-1541");
  script_bugtraq_id(67965, 67976, 67979);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"2019-07-17 11:14:11 +0000 (Wed, 17 Jul 2019)");
  script_tag(name:"creation_date", value:"2014-07-01 15:24:18 +0530 (Tue, 01 Jul 2014)");
  script_name("Mozilla Firefox ESR Multiple Vulnerabilities-01 July14 (Windows)");


  script_tag(name:"summary", value:"This host is installed with Mozilla Firefox ESR and is prone to multiple
vulnerabilities.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Multiple flaws are due to,

  - A use-after-free error in the 'nsTextEditRules::CreateMozBR()' function.

  - A use-after-free error in the 'RefreshDriverTimer::TickDriver()' function
  within the MIL Animation Controller.

  - And some unspecified errors exist.");
  script_tag(name:"impact", value:"Successful exploitation will allow attackers to compromise a user's system.");
  script_tag(name:"affected", value:"Mozilla Firefox ESR version 24.x before 24.6 on Windows");
  script_tag(name:"solution", value:"Upgrade to Mozilla Firefox ESR version 24.6 or later.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/59170");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2014/mfsa2014-48.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_portable_win.nasl");
  script_mandatory_keys("Firefox-ESR/Win/Ver");

  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!ffVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(ffVer =~ "^24\." && version_in_range(version:ffVer,
                       test_version:"24.0", test_version2:"24.5"))
{
  security_message( port: 0, data: "The target host was found to be vulnerable" );
  exit(0);
}
