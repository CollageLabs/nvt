###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_otrs_login_page_xss_vuln.nasl 11103 2018-08-24 10:37:26Z mmartin $
#
# OTRS Login Page Multiple XSS Vulnerability
#
# Authors:
# Shashi Kiran N <nskiran@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
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
CPE = "cpe:/a:otrs:otrs";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803936");
  script_version("$Revision: 11103 $");
  script_cve_id("CVE-2008-7275");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-08-24 12:37:26 +0200 (Fri, 24 Aug 2018) $");
  script_tag(name:"creation_date", value:"2013-09-25 16:04:50 +0530 (Wed, 25 Sep 2013)");
  script_name("OTRS Login Page Multiple XSS Vulnerability");


  script_tag(name:"impact", value:"Successful exploitation will remote attackers to steal the victim's
cookie-based authentication credentials.

Impact Level: Application");
  script_tag(name:"vuldetect", value:"Get the installed version of OTRS with the help of detect NVT and check the
version is vulnerable or not.");
  script_tag(name:"insight", value:"An error exists in login page which fails to validate user-supplied input to
AgentTicketMailbox and CustomerTicketOverView parameter properly");
  script_tag(name:"solution", value:"Upgrade to OTRS (Open Ticket Request System) version 2.3.3 or
later, For updates refer to http://www.otrs.com/en/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"This host is installed with OTRS (Open Ticket Request System) and is prone to
cross-site scripting vulnerability.");
  script_tag(name:"affected", value:"OTRS (Open Ticket Request System) version before 2.3.3");

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
  script_dependencies("secpod_otrs_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("OTRS/installed");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

if(!port = get_app_port(cpe:CPE)){
  exit(0);
}

if(vers = get_app_version(cpe:CPE, port:port))
{
  if(version_is_less(version: vers, test_version: "2.3.3"))
  {
      security_message(port:port);
      exit(0);
  }

}
