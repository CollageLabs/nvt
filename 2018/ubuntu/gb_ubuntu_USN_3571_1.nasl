###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3571_1.nasl 8849 2018-02-16 14:02:28Z asteins $
#
# Ubuntu Update for erlang USN-3571-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.843449");
  script_version("$Revision: 8849 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-16 15:02:28 +0100 (Fri, 16 Feb 2018) $");
  script_tag(name:"creation_date", value:"2018-02-15 08:44:50 +0100 (Thu, 15 Feb 2018)");
  script_cve_id("CVE-2014-1693", "CVE-2015-2774", "CVE-2016-10253", "CVE-2017-1000385");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for erlang USN-3571-1");
  script_tag(name: "summary", value: "Check the version of erlang");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of 
  detect NVT and check if the version is vulnerable or not."); 
  script_tag(name: "insight", value: "It was discovered that the Erlang FTP module 
  incorrectly handled certain CRLF sequences. A remote attacker could possibly use 
  this issue to inject arbitrary FTP commands. This issue only affected Ubuntu 
  14.04 LTS. (CVE-2014-1693) It was discovered that Erlang incorrectly checked CBC 
  padding bytes. A remote attacker could possibly use this issue to perform a 
  padding oracle attack and decrypt traffic. This issue only affected Ubuntu 14.04 
  LTS. (CVE-2015-2774) It was discovered that Erlang incorrectly handled certain 
  regular expressions. A remote attacker could possibly use this issue to cause 
  Erlang to crash, resulting in a denial of service, or execute arbitrary code. 
  This issue only affected Ubuntu 16.04 LTS. (CVE-2016-10253) Hanno Bck, Juraj 
  Somorovsky and Craig Young discovered that the Erlang otp TLS server incorrectly 
  handled error reporting. A remote attacker could possibly use this issue to 
  perform a variation of the Bleichenbacher attack and decrypt traffic or sign 
  messages. (CVE-2017-1000385)"); 
  script_tag(name: "affected", value: "erlang on Ubuntu 17.10 ,
  Ubuntu 16.04 LTS ,
  Ubuntu 14.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "USN", value: "3571-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-3571-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"erlang", ver:"1:16.b.3-dfsg-1ubuntu2.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU17.10")
{

  if ((res = isdpkgvuln(pkg:"erlang", ver:"1:20.0.4+dfsg-1ubuntu1.1", rls:"UBUNTU17.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"erlang", ver:"1:18.3-dfsg-1ubuntu3.1", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
