###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_postgresql_priv_esc_vuln_jul14_win.nasl 7547 2017-10-24 12:02:32Z cfischer $
#
# PostgreSQL 'make check' Local Privilege Escalation Vulnerability July14 (Windows)
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

CPE = "cpe:/a:postgresql:postgresql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804711");
  script_version("$Revision: 7547 $");
  script_cve_id("CVE-2014-0067");
  script_bugtraq_id(65721);
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 14:02:32 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2014-07-07 15:34:21 +0530 (Mon, 07 Jul 2014)");
  script_name("PostgreSQL 'make check' Local Privilege Escalation Vulnerability July14 (Windows)");

  tag_summary =
"This host is installed with PostgreSQL and is prone to local privilege
escalation vulnerability.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Flaw is due to an error when creating a PostgreSQL database cluster during
'make check'.";

  tag_impact =
"Successful exploitation may allow local attacker to gain temporary server
access and elevated privileges.

Impact Level: System/Application";

  tag_affected =
"PostgreSQL version 9.3.3 and earlier";

  tag_solution =
"No Solution or patch is available as of 7th July, 2014. Information
regarding this issue will updated once the solution details are available.
For updates refer to http://www.postgresql.org/download";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/57054");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/91459");
  script_xref(name : "URL" , value : "http://wiki.postgresql.org/wiki/20140220securityrelease");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("postgresql_detect.nasl","os_detection.nasl");
  script_require_ports("Services/postgresql", 5432);
  script_mandatory_keys("PostgreSQL/installed","Host/runs_windows");
  exit(0);
}


include("misc_func.inc");
include("version_func.inc");
include("host_details.inc");

## Variable Initialization
pgsqlPort = "";
pgsqlVer = "";

## Get the default port
pgsqlPort = get_app_port(cpe:CPE);
if(!pgsqlPort){
  pgsqlPort = 5432;
}

## Get the PostgreSQL version
pgsqlVer = get_app_version(cpe:CPE, port:pgsqlPort);
if(isnull(pgsqlVer) ||  !(pgsqlVer =~ "^((8\.4|9\.(0|1|2|3)))")){
  exit(0);
}

## Check for vulnerable PostgreSQL versions
if(version_in_range(version:pgsqlVer, test_version:"8.4", test_version2:"9.3.3"))
{
  security_message(port:pgsqlPort);
  exit(0);
}
