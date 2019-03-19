# OpenVAS Vulnerability Test
# $Id: deb_2876.nasl 14277 2019-03-18 14:45:38Z cfischer $
# Auto-generated from advisory DSA 2876-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.702876");
  script_version("$Revision: 14277 $");
  script_cve_id("CVE-2013-6474", "CVE-2013-6475", "CVE-2013-6476");
  script_name("Debian Security Advisory DSA 2876-1 (cups - security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 15:45:38 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2014-03-12 00:00:00 +0100 (Wed, 12 Mar 2014)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");

  script_xref(name:"URL", value:"http://www.debian.org/security/2014/dsa-2876.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB6");
  script_tag(name:"affected", value:"cups on Debian Linux");
  script_tag(name:"solution", value:"For the oldstable distribution (squeeze), these problems have been fixed in
version 1.4.4-7+squeeze4.

For the stable distribution (wheezy) and the unstable distribution (sid)
the filter is now part of the cups-filters source package.

We recommend that you upgrade your cups packages.");
  script_tag(name:"summary", value:"Florian Weimer of the Red Hat Product Security Team discovered multiple
vulnerabilities in the pdftoopvp CUPS filter, which could result in the
execution of aribitrary code if a malformed PDF file is processed.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"cups", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"cups-bsd", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"cups-client", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"cups-common", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"cups-dbg", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"cups-ppdc", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"cupsddk", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libcups2", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libcups2-dev", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libcupscgi1", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libcupscgi1-dev", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libcupsdriver1", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libcupsdriver1-dev", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libcupsimage2", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libcupsimage2-dev", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libcupsmime1", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libcupsmime1-dev", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libcupsppdc1", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libcupsppdc1-dev", ver:"1.4.4-7+squeeze4", rls:"DEB6")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}