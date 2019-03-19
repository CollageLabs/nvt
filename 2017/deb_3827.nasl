# OpenVAS Vulnerability Test
# $Id: deb_3827.nasl 14275 2019-03-18 14:39:45Z cfischer $
# Auto-generated from advisory DSA 3827-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
#

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.703827");
  script_version("$Revision: 14275 $");
  script_cve_id("CVE-2016-10249", "CVE-2016-10251", "CVE-2016-9591");
  script_name("Debian Security Advisory DSA 3827-1 (jasper - security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 15:39:45 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2017-04-07 00:00:00 +0200 (Fri, 07 Apr 2017)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"http://www.debian.org/security/2017/dsa-3827.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8");
  script_tag(name:"affected", value:"jasper on Debian Linux");
  script_tag(name:"solution", value:"For the stable distribution (jessie), these problems have been fixed in
version 1.900.1-debian1-2.4+deb8u3.

We recommend that you upgrade your jasper packages.");
  script_tag(name:"summary", value:"Multiple vulnerabilities have been discovered in the JasPer library for
processing JPEG-2000 images, which may result in denial of service or
the execution of arbitrary code if a malformed image is processed.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"libjasper-dev", ver:"1.900.1-debian1-2.4+deb8u3", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libjasper-runtime", ver:"1.900.1-debian1-2.4+deb8u3", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libjasper1:amd64", ver:"1.900.1-debian1-2.4+deb8u3", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libjasper1:i386", ver:"1.900.1-debian1-2.4+deb8u3", rls:"DEB8")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}