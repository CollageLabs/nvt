###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_IceWarp_49753.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# IceWarp Web Mail Multiple Information Disclosure Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
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

tag_summary = "IceWarp Web Mail is prone to multiple information-disclosure
vulnerabilities.

Attackers can exploit these issues to gain access to potentially
sensitive information, and possibly cause denial-of-service
conditions; other attacks may also be possible.";

tag_solution = "Vendor updates are available. Please see the references for more
information.";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.103279");
 script_version("$Revision: 9351 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2011-09-28 12:51:43 +0200 (Wed, 28 Sep 2011)");
 script_bugtraq_id(49753);
 script_cve_id("CVE-2011-3579","CVE-2011-3580");
 script_tag(name:"cvss_base", value:"6.4");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");

 script_name("IceWarp Web Mail Multiple Information Disclosure Vulnerabilities");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/49753");
 script_xref(name : "URL" , value : "http://www.icewarp.com/Products/IceWarp_Web_Mail/");
 script_xref(name : "URL" , value : "https://www.trustwave.com/spiderlabs/advisories/TWSL2011-013.txt");

 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
 script_dependencies("gb_get_http_banner.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("IceWarp/banner");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

banner = get_http_banner(port:port);
if(!banner || "IceWarp" >!< banner)exit(0);

foreach dir( make_list_unique( "/webmail", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = string(dir, "/server/"); 

  if(http_vuln_check(port:port, url:url,pattern:"<title>phpinfo\(\)")) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );