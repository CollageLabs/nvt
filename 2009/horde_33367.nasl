###############################################################################
# OpenVAS Vulnerability Test
# $Id: horde_33367.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Horde XSS Filter Cross Site Scripting Vulnerability
#
# Authors
# Michael Meyer
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
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

tag_summary = "Horde is prone to a cross-site scripting vulnerability because it
  fails to properly sanitize user-supplied input.

  An attacker may leverage this issue to execute arbitrary script code
  in the browser of an unsuspecting user in the context of the
  affected site. This may let the attacker steal cookie-based
  authentication credentials and launch other attacks.

  Note that this issue also affects Turba on Horde IMP.

  Versions prior to Horde 3.2.3 and 3.3.1 are vulnerable.";


if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100117");
 script_version("$Revision: 9350 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2009-04-10 19:06:18 +0200 (Fri, 10 Apr 2009)");
 script_bugtraq_id(33367);
 script_cve_id("CVE-2008-5917");
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");

 script_name("Horde XSS Filter Cross Site Scripting Vulnerability");


 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("horde_detect.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("horde/installed");
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/33367");
 exit(0);
}

include("http_func.inc");
include("version_func.inc");

port = get_http_port(default:80);
if(!version = get_kb_item(string("www/", port, "/horde")))exit(0);
if(!matches = eregmatch(string:version, pattern:"^(.+) under (/.*)$"))exit(0);

vers = matches[1];

if(!isnull(vers)) {

  if(version_in_range(version:vers, test_version:"3.3", test_version2:"3.3.0") ||
     version_in_range(version:vers, test_version:"3.2", test_version2:"3.2.2") ) {
     security_message(port:port);
     exit(0);
  }  

}   

exit(0);
