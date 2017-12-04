###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_zte_zxdsl_831CII_access_bypass_vuln.nasl 7947 2017-11-30 12:36:50Z santu $
#
# ZTE ZXDSL 831CII Access Bypass Vulnerability
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
  script_oid("1.3.6.1.4.1.25623.1.0.812228");
  script_version("$Revision: 7947 $");
  script_cve_id("CVE-2017-16953");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-11-30 13:36:50 +0100 (Thu, 30 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-11-28 18:25:42 +0530 (Tue, 28 Nov 2017)");
  script_tag(name:"qod_type", value:"remote_vul");
  script_name("ZTE ZXDSL 831CII Access Bypass Vulnerability");

  script_tag(name:"summary", value:"This host is installed with ZTE ZXDSL 831CII
  router and is prone to access bypass vulnerability.");

  script_tag(name:"vuldetect", value:"Send a crafted request via HTTP GET and
  check whether it is able to obtain sensitive information or not.");

  script_tag(name:"insight", value:"The flaw is due to an improper access
  restriction on CGI files.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to modify router PPPoE configurations, setup malicious 
  configurations which later could lead to disrupt network & its activities.

  Impact Level: Application");

  script_tag(name:"affected", value:"ZTE ZXDSL 831CII");

  script_tag(name: "solution" , value:"No solution or patch is available as of
  28th November, 2017. Information regarding this issue will be updated once the
  solution details are available.
  For updates refer to http://zte.com.cn");

  script_tag(name:"solution_type", value:"NoneAvailable");

  script_xref(name : "URL" , value : "https://www.exploit-db.com/exploits/43188");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_zte_zxdsl_831CII_telnet_detect.nasl");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

url = "";
report = "";
banner = "";
zteport = 0;
telport = 0;

if(!zteport = get_http_port(default:80)){
  exit(0);
}

##Confrim application via http if telnet banner is not available
if(!teldetect = get_kb_item("ZXDSL_831CII/Installed"))
{
  banner = get_http_banner(port: zteport);
  if(!banner || 'WWW-Authenticate: Basic realm="DSL Router"' >!< banner) exit( 0 );
}

url = '/connoppp.cgi';

if(http_vuln_check(port:zteport, url:url, check_header:TRUE,
                   pattern:"Your DSL router is.*", 
                   extra_check:"Configure it from the.*vpivci.cgi'>Quick.*Setup<"))
{
  ##Extra Check Exploit
  if(http_vuln_check(port:zteport, url:"/vpivci.cgi" , check_header:TRUE,  
                     pattern:"Please enter VPI and VCI numbers for the Internet connection which is provided",
                     extra_check:make_list("configure your DSL Router", "VPI:", "VCI:")))
  {
    report = report_vuln_url( port:zteport, url:url );
    security_message(port:zteport, data:report);
    exit(0);
  }  
}
