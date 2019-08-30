# Copyright (C) 2019 Greenbone Networks GmbH
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (C) of their respective author(s)
#
# SPDX-License-Identifier: GPL-2.0-or-later
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

CPE = "cpe:/a:apache:struts";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.108624");
  script_version("2019-08-29T07:36:00+0000");
  script_cve_id("CVE-2017-9804");
  script_bugtraq_id(100612);
  script_tag(name:"last_modification", value:"2019-08-29 07:36:00 +0000 (Thu, 29 Aug 2019)");
  script_tag(name:"creation_date", value:"2019-08-28 06:34:39 +0000 (Wed, 28 Aug 2019)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("Apache Struts 'CVE-2017-9804' Denial-of-Service Vulnerability (S2-051) (Windows)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_apache_struts2_detection.nasl", "os_detection.nasl");
  script_mandatory_keys("ApacheStruts/installed", "Host/runs_windows");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/100612");
  script_xref(name:"URL", value:"https://cwiki.apache.org/confluence/display/WW/S2-051");

  script_tag(name:"summary", value:"Apache Struts is prone to a Denial of Service in the Struts REST plugin.");

  script_tag(name:"insight", value:"The REST Plugin is using outdated XStream library which is vulnerable
  and allow perform a DoS attack using malicious request with specially crafted XML payload.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"impact", value:"An attacker can exploit this issue to cause a Denial of Service condition,
  denying service to legitimate users.");

  script_tag(name:"affected", value:"Struts 2.1.6 - 2.3.33

  Struts 2.5 - 2.5.12.");

  script_tag(name:"solution", value:"Upgrade to Struts 2.3.34, 2.5.13 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!port = get_app_port(cpe: CPE))
  exit(0);

if(!infos = get_app_version_and_location(cpe: CPE, port: port, exit_no_version: TRUE))
  exit(0);

vers = infos["version"];
if(vers !~ "^2\.[1-35]\.")
  exit(99);

if(version_in_range(version: vers, test_version: "2.1.6", test_version2: "2.3.33")) {
  vuln = TRUE;
  fix = "2.3.34";
}

else if(version_in_range(version: vers, test_version: "2.5.0", test_version2: "2.5.12")) {
  vuln = TRUE;
  fix = "2.5.13";
}

if(vuln) {
  report = report_fixed_ver(installed_version: vers, fixed_version: fix, install_path: infos["location"]);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
