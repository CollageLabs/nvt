###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1279.nasl 14281 2019-03-18 14:53:48Z cfischer $
#
# Auto-generated from advisory DLA 1279-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891279");
  script_version("$Revision: 14281 $");
  script_cve_id("CVE-2017-11423", "CVE-2017-6419");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1279-1] clamav security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 15:53:48 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2018-02-21 00:00:00 +0100 (Wed, 21 Feb 2018)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/02/msg00014.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7");
  script_tag(name:"affected", value:"clamav on Debian Linux");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
0.99.2+dfsg-0+deb7u5.

We recommend that you upgrade your clamav packages.");
  script_tag(name:"summary", value:"CVE-2017-6419
CVE-2017-11423

Two vulnerabilities have been fixed that can be used for denial of
service or maybe unspecified impact via drafted files
(heap-based buffer overflow and stack-based buffer over-read causing
application crash)");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"clamav", ver:"0.99.2+dfsg-0+deb7u5", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"clamav-base", ver:"0.99.2+dfsg-0+deb7u5", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"clamav-daemon", ver:"0.99.2+dfsg-0+deb7u5", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"clamav-dbg", ver:"0.99.2+dfsg-0+deb7u5", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"clamav-docs", ver:"0.99.2+dfsg-0+deb7u5", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"clamav-freshclam", ver:"0.99.2+dfsg-0+deb7u5", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"clamav-milter", ver:"0.99.2+dfsg-0+deb7u5", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"clamav-testfiles", ver:"0.99.2+dfsg-0+deb7u5", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libclamav-dev", ver:"0.99.2+dfsg-0+deb7u5", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libclamav7", ver:"0.99.2+dfsg-0+deb7u5", rls:"DEB7")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}