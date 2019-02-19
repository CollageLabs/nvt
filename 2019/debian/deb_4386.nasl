# Copyright (C) 2019 Greenbone Networks GmbH
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (C) the respective author(s)
#
# SPDX-License-Identifier: GPL-2.0-or-later
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.704386");
  script_version("$Revision: 13750 $");
  script_cve_id("CVE-2018-16890", "CVE-2019-3822", "CVE-2019-3823");
  script_name("Debian Security Advisory DSA 4386-1 (curl - security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-02-19 08:33:36 +0100 (Tue, 19 Feb 2019) $");
  script_tag(name:"creation_date", value:"2019-02-06 00:00:00 +0100 (Wed, 06 Feb 2019)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2019/dsa-4386.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"curl on Debian Linux");
  script_tag(name:"insight", value:"curl is a command line tool for transferring data with URL syntax, supporting
DICT, FILE, FTP, FTPS, GOPHER, HTTP, HTTPS, IMAP, IMAPS, LDAP, LDAPS, POP3,
POP3S, RTMP, RTSP, SCP, SFTP, SMTP, SMTPS, TELNET and TFTP.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 7.52.1-5+deb9u9.

We recommend that you upgrade your curl packages.

For the detailed security status of curl please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/curl");
  script_tag(name:"summary", value:"Multiple vulnerabilities were discovered in cURL, an URL transfer library.

CVE-2018-16890 
Wenxiang Qian of Tencent Blade Team discovered that the function
handling incoming NTLM type-2 messages does not validate incoming
data correctly and is subject to an integer overflow vulnerability,
which could lead to an out-of-bounds buffer read.

CVE-2019-3822 
Wenxiang Qian of Tencent Blade Team discovered that the function
creating an outgoing NTLM type-3 header is subject to an integer
overflow vulnerability, which could lead to an out-of-bounds write.

CVE-2019-3823 
Brian Carpenter of Geeknik Labs discovered that the code handling
the end-of-response for SMTP is subject to an out-of-bounds heap
read.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"curl", ver:"7.52.1-5+deb9u9", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcurl3", ver:"7.52.1-5+deb9u9", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcurl3-dbg", ver:"7.52.1-5+deb9u9", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcurl3-gnutls", ver:"7.52.1-5+deb9u9", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcurl3-nss", ver:"7.52.1-5+deb9u9", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcurl4-doc", ver:"7.52.1-5+deb9u9", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcurl4-gnutls-dev", ver:"7.52.1-5+deb9u9", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcurl4-nss-dev", ver:"7.52.1-5+deb9u9", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcurl4-openssl-dev", ver:"7.52.1-5+deb9u9", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
