###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1519.nasl 14281 2019-03-18 14:53:48Z cfischer $
#
# Auto-generated from advisory DLA 1519-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.891519");
  script_version("$Revision: 14281 $");
  script_cve_id("CVE-2017-1000158", "CVE-2018-1000802", "CVE-2018-1060", "CVE-2018-1061");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1519-1] python2.7 security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 15:53:48 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2018-09-26 00:00:00 +0200 (Wed, 26 Sep 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/09/msg00030.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8");
  script_tag(name:"affected", value:"python2.7 on Debian Linux");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
2.7.9-2+deb8u2.

We recommend that you upgrade your python2.7 packages.");
  script_tag(name:"summary", value:"Multiple vulnerabilities were found in the CPython interpreter which
can cause denial of service, information gain, and arbitrary code
execution.

CVE-2017-1000158

CPython (aka Python) is vulnerable to an integer overflow in the
PyString_DecodeEscape function in stringobject.c, resulting in
heap-based buffer overflow (and possible arbitrary code execution)

CVE-2018-1060

python is vulnerable to catastrophic backtracking in pop3lib's
apop() method. An attacker could use this flaw to cause denial of
service.

CVE-2018-1061

python is vulnerable to catastrophic backtracking in the
difflib.IS_LINE_JUNK method. An attacker could use this flaw to
cause denial of service.

CVE-2018-1000802

Python Software Foundation Python (CPython) version 2.7 contains a
CWE-77: Improper Neutralization of Special Elements used in a
Command ('Command Injection') vulnerability in shutil module
(make_archive function) that can result in Denial of service,
Information gain via injection of arbitrary files on the system or
entire drive. This attack appear to be exploitable via Passage of
unfiltered user input to the function.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"idle-python2.7", ver:"2.7.9-2+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libpython2.7", ver:"2.7.9-2+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libpython2.7-dbg", ver:"2.7.9-2+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libpython2.7-dev", ver:"2.7.9-2+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libpython2.7-minimal", ver:"2.7.9-2+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libpython2.7-stdlib", ver:"2.7.9-2+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libpython2.7-testsuite", ver:"2.7.9-2+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"python2.7", ver:"2.7.9-2+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"python2.7-dbg", ver:"2.7.9-2+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"python2.7-dev", ver:"2.7.9-2+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"python2.7-doc", ver:"2.7.9-2+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"python2.7-examples", ver:"2.7.9-2+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"python2.7-minimal", ver:"2.7.9-2+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}