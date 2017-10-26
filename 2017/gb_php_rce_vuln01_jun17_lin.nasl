###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_rce_vuln01_jun17_lin.nasl 7544 2017-10-24 11:07:43Z cfischer $
#
# PHP Remote Code Execution Vulnerability-01 Jun17 (Linux)
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

CPE = "cpe:/a:php:php";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810954");
  script_version("$Revision: 7544 $");
  script_cve_id("CVE-2016-4473");
  script_bugtraq_id(98999);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:07:43 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-06-20 15:46:19 +0530 (Tue, 20 Jun 2017)");
  script_name("PHP Remote Code Execution Vulnerability-01 Jun17 (Linux)");

  script_tag(name:"summary", value:"This host is installed with PHP and is prone
  to remote code execution vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to an error in
  '/ext/phar/phar_object.c' script.");

  script_tag(name:"impact", value:"Successfully exploiting this issue allow
  remote attackers to execute arbitrary code in the context of the user running 
  the affected application. Failed exploit attempts will likely cause a 
  denial-of-service condition.

  Impact Level: Application");

  script_tag(name:"affected", value:"PHP versions 7.0.7 and 5.6.x on Linux");

  script_tag(name:"solution", value:"Upgrade to PHP version 7.0.8 or 5.6.23
  or later. For updates refer to http://www.php.net");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=1347772");
  script_xref(name:"URL", value:"http://lists.opensuse.org/opensuse-security-announce/2016-10/msg00007.html");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_php_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("php/installed","Host/runs_unixoide");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
phpPort = "";
phpVer = "";

if(isnull(phpPort = get_app_port(cpe:CPE))){
  exit(0);
}

if(!phpVer = get_app_version(cpe:CPE, port:phpPort)){
  exit(0);
}

## Check for version 5.6.x before 5.6.23
if(phpVer =~ "^(5\.6)")
{
  if(version_is_less(version:phpVer, test_version:"5.6.23")){
    fix = '5.6.23';
  }
}

## Check for version 7.0.x before 7.0.8
else if(phpVer =~ "^(7\.0)")
{
  if(version_is_less(version:phpVer, test_version:"7.0.8")){
    fix = '7.0.8';
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:phpVer, fixed_version:fix);
  security_message(data:report, port:phpPort);
  exit(0);
}
exit(99);
