# OpenVAS Vulnerability Test
# $Id: deb_2641.nasl 14276 2019-03-18 14:43:56Z cfischer $
# Auto-generated from advisory DSA 2641-2 using nvtgen 1.0
# Script version: 2.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.892641");
  script_version("$Revision: 14276 $");
  script_cve_id("CVE-2013-1667");
  script_name("Debian Security Advisory DSA 2641-2 (perl - rehashing flaw)");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 15:43:56 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2013-03-20 00:00:00 +0100 (Wed, 20 Mar 2013)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_xref(name:"URL", value:"http://www.debian.org/security/2013/dsa-2641.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB(6|7)");
  script_tag(name:"affected", value:"perl on Debian Linux");
  script_tag(name:"solution", value:"For the stable distribution (squeeze), this problem has been fixed in
version 5.10.1-17squeeze6 of perl and version
2.0.4-7+squeeze1 of libapache2-mod-perl2.

For the testing distribution (wheezy), and the unstable distribution
(sid), this problem has been fixed in version 5.14.2-19
of perl and version 2.0.7-3 of libapache2-mod-perl2.

We recommend that you upgrade your perl and libapache2-mod-perl2 packages.");
  script_tag(name:"summary", value:"Yves Orton discovered a flaw in the rehashing code of Perl. This flaw
could be exploited to carry out a denial of service attack against code
that uses arbitrary user input as hash keys. Specifically an attacker
could create a set of keys of a hash causing a denial of service via
memory exhaustion.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"libapache2-mod-perl2", ver:"2.0.4-7+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libapache2-mod-perl2-dev", ver:"2.0.4-7+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libapache2-mod-perl2-doc", ver:"2.0.4-7+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libapache2-mod-perl2", ver:"2.0.7-3", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libapache2-mod-perl2-dev", ver:"2.0.7-3", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libapache2-mod-perl2-doc", ver:"2.0.7-3", rls:"DEB7")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}