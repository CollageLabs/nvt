###############################################################################
# OpenVAS Vulnerability Test
# $Id: alas-2013-246.nasl 6577 2017-07-06 13:43:46Z cfischer$
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
  script_oid("1.3.6.1.4.1.25623.1.0.120121");
  script_version("$Revision: 11711 $");
  script_tag(name:"creation_date", value:"2015-09-08 13:17:55 +0200 (Tue, 08 Sep 2015)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-01 14:30:57 +0200 (Mon, 01 Oct 2018) $");
  script_name("Amazon Linux Local Check: alas-2013-246");
  script_tag(name:"insight", value:"Multiple flaws were discovered in OpenJDK. Please see the references for more information.");
  script_tag(name:"solution", value:"Run yum update java-1.6.0-openjdk to update your system.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://alas.aws.amazon.com/ALAS-2013-246.html");
  script_cve_id("CVE-2013-5802", "CVE-2013-5803", "CVE-2013-5814", "CVE-2013-5817", "CVE-2013-5849", "CVE-2013-5797", "CVE-2013-5809", "CVE-2013-5842", "CVE-2013-5850", "CVE-2013-5790", "CVE-2013-5780", "CVE-2013-5783", "CVE-2013-3829", "CVE-2013-5782", "CVE-2013-5772", "CVE-2013-5774", "CVE-2013-5804", "CVE-2013-5778", "CVE-2013-5829", "CVE-2013-4002", "CVE-2013-5784", "CVE-2013-5820", "CVE-2013-5840", "CVE-2013-5823", "CVE-2013-5825", "CVE-2013-5830");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
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
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-debuginfo", rpm:"java-1.6.0-openjdk-debuginfo~1.6.0.0~65.1.11.14.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-devel", rpm:"java-1.6.0-openjdk-devel~1.6.0.0~65.1.11.14.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk", rpm:"java-1.6.0-openjdk~1.6.0.0~65.1.11.14.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-javadoc", rpm:"java-1.6.0-openjdk-javadoc~1.6.0.0~65.1.11.14.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-src", rpm:"java-1.6.0-openjdk-src~1.6.0.0~65.1.11.14.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-demo", rpm:"java-1.6.0-openjdk-demo~1.6.0.0~65.1.11.14.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99);
  exit(0);
}
