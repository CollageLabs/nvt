###############################################################################
# OpenVAS Vulnerability Test
#
# Amazon Linux security check
#
# Authors:
# Autogenerated by alas-generator developed by Eero Volotinen <eero.volotinen@iki.fi>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.120690");
  script_version("2019-07-02T09:11:25+0000");
  script_tag(name:"creation_date", value:"2016-10-26 15:38:08 +0300 (Wed, 26 Oct 2016)");
  script_tag(name:"last_modification", value:"2019-07-02 09:11:25 +0000 (Tue, 02 Jul 2019)");
  script_name("Amazon Linux Local Check: alas-2016-701");
  script_tag(name:"insight", value:"Multiple flaws were found in OpenSSL as used in MySQL 5.6. Please see the references for more information.");
  script_tag(name:"solution", value:"Run yum update mysql56 to update your system.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://alas.aws.amazon.com/ALAS-2016-701.html");
  script_cve_id("CVE-2016-0639", "CVE-2016-0647", "CVE-2016-0705", "CVE-2016-0642", "CVE-2016-0643", "CVE-2016-0666", "CVE-2016-0648", "CVE-2016-0655", "CVE-2016-2047");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
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
  if ((res = isrpmvuln(pkg:"mysql56-embedded", rpm:"mysql56-embedded~5.6.30~1.15.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"mysql56-test", rpm:"mysql56-test~5.6.30~1.15.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"mysql56-errmsg", rpm:"mysql56-errmsg~5.6.30~1.15.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"mysql56-devel", rpm:"mysql56-devel~5.6.30~1.15.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"mysql56-server", rpm:"mysql56-server~5.6.30~1.15.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"mysql56-debuginfo", rpm:"mysql56-debuginfo~5.6.30~1.15.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"mysql56-libs", rpm:"mysql56-libs~5.6.30~1.15.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"mysql56-common", rpm:"mysql56-common~5.6.30~1.15.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"mysql56-embedded-devel", rpm:"mysql56-embedded-devel~5.6.30~1.15.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"mysql56-bench", rpm:"mysql56-bench~5.6.30~1.15.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"mysql56", rpm:"mysql56~5.6.30~1.15.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
    exit(0);
}
