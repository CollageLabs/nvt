###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ilias_detect.nasl 7525 2017-10-20 08:57:52Z ckuersteiner $
#
# ILIAS Detection
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.140443");
  script_version("$Revision: 7525 $");
  script_tag(name: "last_modification", value: "$Date: 2017-10-20 10:57:52 +0200 (Fri, 20 Oct 2017) $");
  script_tag(name: "creation_date", value: "2017-10-20 10:51:43 +0700 (Fri, 20 Oct 2017)");
  script_tag(name: "cvss_base", value: "0.0");
  script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("ILIAS Detection");

  script_tag(name: "summary" , value: "Detection of ILIAS eLearning.

The script sends a connection request to the server and attempts to detect ILIAS and to extract its
version.");
  
  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 443);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name: "URL", value: "https://www.ilias.de");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 443);

if (!can_host_php(port: port))
  exit(0);

# login.php often needs some parameters so we check over setup.php
url = "/ilias/setup/setup.php";
# http_get_cache() doesn't make sense here since we get a unique session id anyway
req = http_get(port: port, item: url);
res = http_keepalive_send_recv(port: port, data: req);

# We should get a redirect with a session id
loc = extract_location_from_redirect(port: port, data: res);
if (isnull(loc))
  exit(0);

req = http_get(port: port, item: loc);
res = http_keepalive_send_recv(port: port, data: req);

if ("<title>ILIAS Setup</title>" >< res && "std setup ilSetupLogin" >< res) {
  version = "unknown";

  vers = eregmatch(pattern: 'class="row">ILIAS ([0-9.]+)', string: res);
  if (!isnull(vers[1])) {
    version = vers[1];
    set_kb_item(name: "ilias/version", value: version);
  }

  set_kb_item(name: "ilias/installed", value: TRUE);

  cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/a:ilias:ilias:");
  if (!cpe)
    cpe = 'cpe:/a:ilias:ilias';

  register_product(cpe: cpe, location: "/ilias", port: port);

  log_message(data: build_detection_report(app: "ILIAS", version: version, install: "/ilias", cpe: cpe,
                                           concluded: vers[0], concludedUrl: url),
              port: port);
  exit(0);
}

exit(0);
