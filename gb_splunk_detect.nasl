###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_splunk_detect.nasl 9996 2018-05-29 07:18:44Z cfischer $
#
# Splunk Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100693");
  script_version("$Revision: 9996 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-05-29 09:18:44 +0200 (Tue, 29 May 2018) $");
  script_tag(name:"creation_date", value:"2010-07-05 12:40:56 +0200 (Mon, 05 Jul 2010)");
  script_name("Splunk Detection");

  script_tag(name: "summary" , value: "Detection of installed version of Splunk.

  This script sends HTTP GET request and try to get the version from the
  response, and sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_xref(name : "URL" , value : "http://www.splunk.com/");
  script_category(ACT_GATHER_INFO);
  script_family("Product detection");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 8000);
  script_exclude_keys("Settings/disable_cgi_scanning");
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

spPort = get_http_port(default:8000);

foreach dir (make_list("", "/splunk/en-US/", "/en-US"))
{
  buf = http_get_cache(item:string(dir, "/account/login"), port:spPort);

  if(egrep(pattern:'content="Splunk Inc."', string: buf, icase: TRUE) &&
     ('Splunk Enterprise' >< buf || buf =~ 'product_type":( )?"enterprise'))
  {

    vers = string("unknown");

    version = eregmatch(string:buf, pattern:"&copy;.*Splunk ([0-9.]+)",icase:TRUE);
    if(isnull(version[1])){
      version = eregmatch(string:buf, pattern:'version":"([0-9.]+)', icase:TRUE);
    }
    if(!isnull(version[1])){
      vers=chomp(version[1]);
    }

    b = eregmatch(string:buf, pattern:"&copy;.*Splunk.* build ([0-9.]+)", icase:TRUE);
    if(isnull(b[1])){
      b= eregmatch(string:buf, pattern:'build":"([0-9a-z.]+)', icase:TRUE);
    }
    if(!isnull(b[1])){
      build = b[1];
    }

    set_kb_item(name: string("www/", spPort, "/splunk"), value: string(vers));
    if(!isnull(build)) {
      set_kb_item(name: string("www/", spPort, "/splunk/build"), value: string(build));
    }

    set_kb_item(name:"Splunk/installed", value:TRUE);

    cpe = build_cpe(value:vers, exp:"^([0-9.]+)", base:"cpe:/a:splunk:splunk:");
    if(!cpe){
      cpe = "cpe:/a:splunk:splunk";
    }

    register_product(cpe:cpe, location:dir, port:spPort);

    log_message(data: build_detection_report(app: "Splunk",
                                             version: vers,
                                             install: dir,
                                             cpe: cpe,
                                             concluded: string(vers)), port: spPort);
    exit(0);
  }
}
