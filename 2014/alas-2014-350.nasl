###############################################################################
# OpenVAS Vulnerability Test
# $Id: alas-2014-350.nasl 6715 2017-07-13 09:57:40Z teissa$
#
# Amazon Linux security check
#
# Authors:
# Eero Volotinen <eero.volotinen@iki.fi>
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://ping-viini.org
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.120311");
  script_version("2019-10-02T07:08:50+0000");
  script_tag(name:"creation_date", value:"2015-09-08 13:23:19 +0200 (Tue, 08 Sep 2015)");
  script_tag(name:"last_modification", value:"2019-10-02 07:08:50 +0000 (Wed, 02 Oct 2019)");
  script_name("Amazon Linux Local Check: ALAS-2014-350");
  script_tag(name:"insight", value:"It was found that OpenSSL clients and servers could be forced, via a specially crafted handshake packet, to use weak keying material for communication. A man-in-the-middle attacker could use this flaw to decrypt and modify traffic between a client and a server. (CVE-2014-0224 )");
  script_tag(name:"solution", value:"Run yum update openssl098e to update your system.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://alas.aws.amazon.com/ALAS-2014-350.html");
  script_cve_id("CVE-2014-0224");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
  script_copyright("Eero Volotinen");
  script_family("Amazon Linux Local Security Checks");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "AMAZON")
{
if ((res = isrpmvuln(pkg:"openssl098e-debuginfo", rpm:"openssl098e-debuginfo~0.9.8e~18.2.13.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"openssl098e", rpm:"openssl098e~0.9.8e~18.2.13.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99);
  exit(0);
}
