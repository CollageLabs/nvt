###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_derby_detect.nasl 10929 2018-08-11 11:39:44Z cfischer $
#
# Apache Derby Detection
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
  script_oid("1.3.6.1.4.1.25623.1.0.100795");
  script_version("$Revision: 10929 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-11 13:39:44 +0200 (Sat, 11 Aug 2018) $");
  script_tag(name:"creation_date", value:"2010-09-09 19:37:11 +0200 (Thu, 09 Sep 2010)");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Apache Derby Detection");
  script_category(ACT_GATHER_INFO);
  script_family("Service detection");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/unknown", 1527);

  script_xref(name:"URL", value:"http://db.apache.org/derby/");

  script_tag(name:"summary", value:"This host is running Apache Derby, an open source relational database
  implemented entirely in Java and available under the Apache License, Version 2.0.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("misc_func.inc");
include("dump.inc");

include("host_details.inc");

SCRIPT_DESC = "Apache Derby Detection";

port = get_unknown_port( default:1527 );

soc = open_sock_tcp(port);
if(!soc)exit(0);

p = raw_string(
              0x00,0x65,0xd0,0x41,0x00,0x01,0x00,0x5f,0x10,0x41,0x00,0x10,0x11,0x5e,0x84,0x85,
              0x99,0x82,0xa8,0x84,0x95,0x83,0x94,0x81,0x89,0x95,0x00,0x09,0x11,0x6d,0xc4,0x85,
              0x99,0x82,0xa8,0x00,0x20,0x11,0x5a,0xc4,0xd5,0xc3,0xf1,0xf0,0xf0,0xf6,0xf0,0x61,
              0xf1,0xf0,0x4b,0xf6,0x4b,0xf1,0x4b,0xf0,0x40,0x60,0x40,0x4d,0xf9,0xf3,0xf8,0xf2,
              0xf1,0xf4,0x5d,0x00,0x14,0x14,0x04,0x14,0x03,0x00,0x07,0x24,0x07,0x00,0x07,0x24,
              0x0f,0x00,0x07,0x14,0x40,0x00,0x07,0x00,0x0e,0x11,0x47,0xd8,0xc4,0xc5,0xd9,0xc2,
              0xe8,0x61,0xd1,0xe5,0xd4,0x00,0x26,0xd0,0x01,0x00,0x02,0x00,0x20,0x10,0x6d,0x00,
              0x06,0x11,0xa2,0x00,0x04,0x00,0x16,0x21,0x10,0x95,0x96,0x95,0x85,0xa7,0x89,0xa2,
              0xa3,0x81,0x95,0xa3,0x40,0x40,0x40,0x40,0x40,0x40,0x40);

send(socket:soc, data:p);
res = recv(socket:soc, length:1024);

if(strlen(res) > 2 && ord(res[0]) == 0 && ord(res[1]) == 131 && ord(res[2]) == 208) {

  p = raw_string(
                0x00,0x2d,0xd0,0x41,0x00,0x01,0x00,0x27,0x10,0x6e,0x00,0x06,0x11,0xa2,0x00,0x04,
                0x00,0x16,0x21,0x10,0x95,0x96,0x95,0x85,0xa7,0x89,0xa2,0xa3,0x81,0x95,0xa3,0x40,
                0x40,0x40,0x40,0x40,0x40,0x40,0x00,0x07,0x11,0xa0,0xc1,0xd7,0xd7,0x00,0xa8,0xd0,
                0x01,0x00,0x02,0x00,0xa2,0x20,0x01,0x00,0x16,0x21,0x10,0x95,0x96,0x95,0x85,0xa7,
                0x89,0xa2,0xa3,0x81,0x95,0xa3,0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x00,0x06,0x21,
                0x0f,0x24,0x07,0x00,0x0c,0x11,0x2e,0xc4,0xd5,0xc3,0xf1,0xf0,0xf0,0xf6,0xf0,0x00,
                0x3c,0x21,0x04,0x37,0xc4,0xd5,0xc3,0xf1,0xf0,0xf0,0xf6,0xf0,0xd1,0xe5,0xd4,0x40,
                0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x84,0x85,
                0x99,0x82,0xa8,0x84,0x95,0x83,0x94,0x81,0x89,0x95,0x40,0x40,0x40,0x40,0x40,0x40,
                0x40,0x40,0xc1,0xd7,0xd7,0x40,0x40,0x40,0x40,0x40,0x00,0x00,0x0d,0x00,0x2f,0xd8,
                0xe3,0xc4,0xe2,0xd8,0xd3,0xc1,0xe2,0xc3,0x00,0x17,0x21,0x35,0xc3,0xf0,0xc1,0xf8,
                0xf0,0xf2,0xf0,0xf4,0x4b,0xc1,0xf0,0xf4,0xc4,0x01,0x2a,0xf7,0x2e,0x51,0xab,0x00,
                0x16,0x00,0x35,0x00,0x06,0x11,0x9c,0x04,0xb8,0x00,0x06,0x11,0x9d,0x04,0xb0,0x00,
                0x06,0x11,0x9e,0x04,0xb8);

  send(socket:soc, data:p);
  res = recv(socket:soc, length:1024);
  close(soc);

  if(strlen(res) && "nonexistant" >< res && "XJ004CSS" >< res) {

    register_service(port:port, ipproto:"tcp", proto:"apache_derby");

    res = bin2string(ddata:res);
    ver = string("unknown");
    # version is *not* accurate.
    # Real version is 10.5.3.0, detected version is 10050
    # Real version is 10.6.1.0, detected version is 10060
    version = eregmatch(pattern:"XJ004CSS([0-9]+)", string:string(res));

    if(!isnull(version[1])) {
      ver = '';
      vers = version[1];
      for(i=0;i<strlen(vers);i++) {
        ver += vers[i];
        if((i%2) > 0)
          ver += ".";
      }

      set_kb_item(name:"apache_derby/" + port + "/version", value:ver);
      register_host_detail(name:"App", value:string("cpe:/a:apache:derby:",ver), desc:SCRIPT_DESC);

    } else {
      register_host_detail(name:"App", value:string("cpe:/a:apache:derby"), desc:SCRIPT_DESC);
    }

    info = string("Apache Derby Version '");
    info += string(ver);
    info += string("' was detected on the remote host\n\n");

    log_message(port:port,data:info);
    exit(0);
  }
} else {
  close(soc);
}

exit(0);
