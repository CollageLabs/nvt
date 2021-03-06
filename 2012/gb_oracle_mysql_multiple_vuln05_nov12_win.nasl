###############################################################################
# OpenVAS Vulnerability Test
#
# Oracle MySQL Server Multiple Vulnerabilities-05 Nov12 (Windows)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:mysql:mysql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803115");
  script_version("2019-10-17T12:29:45+0000");
  script_cve_id("CVE-2012-3156");
  script_bugtraq_id(56013);
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"2019-10-17 12:29:45 +0000 (Thu, 17 Oct 2019)");
  script_tag(name:"creation_date", value:"2012-11-26 18:06:53 +0530 (Mon, 26 Nov 2012)");
  script_name("Oracle MySQL Server Multiple Vulnerabilities-05 Nov12 (Windows)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/51008/");
  script_xref(name:"URL", value:"http://www.securelist.com/en/advisories/51008");
  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/topics/security/cpuoct2012-1515893.html");
  script_xref(name:"URL", value:"https://support.oracle.com/rs?type=doc&id=1475188.1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("Databases");
  script_tag(name:"qod_type", value:"remote_banner");
  script_dependencies("mysql_version.nasl", "os_detection.nasl");
  script_require_ports("Services/mysql", 3306);
  script_mandatory_keys("MySQL/installed", "Host/runs_windows");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker to disclose potentially
  sensitive information and manipulate certain data.");

  script_tag(name:"affected", value:"Oracle MySQL version 5.5.x to 5.5.25 on Windows.");

  script_tag(name:"insight", value:"The flaw is due to unspecified error in MySQL server component vectors
  server.");

  script_tag(name:"solution", value:"Apply the patch from the linked references or upgrade to latest version.");

  script_tag(name:"summary", value:"The host is running Oracle MySQL server and is prone to unspecified
  vulnerability.");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("misc_func.inc");
include("version_func.inc");
include("host_details.inc");

if(!port = get_app_port(cpe:CPE))
  exit(0);

if(!vers = get_app_version(cpe:CPE, port:port))
  exit(0);

vers = eregmatch(pattern:"([0-9.a-z]+)", string:vers);
if(vers[1])
{
  if(version_in_range(version:vers[1], test_version:"5.5.0", test_version2:"5.5.25")){
    report = report_fixed_ver(installed_version:vers[1], fixed_version:"Apply the patch");
    security_message(data:report, port:port);
    exit(0);
  }
  exit(99);
}

exit(0);
