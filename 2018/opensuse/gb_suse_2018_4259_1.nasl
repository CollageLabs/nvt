###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_4259_1.nasl 12882 2018-12-27 07:14:01Z santu $
#
# SuSE Update for bluez openSUSE-SU-2018:4259-1 (bluez)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.852200");
  script_version("$Revision: 12882 $");
  script_cve_id("CVE-2016-9800", "CVE-2016-9801");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-12-27 08:14:01 +0100 (Thu, 27 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-23 04:00:41 +0100 (Sun, 23 Dec 2018)");
  script_name("SuSE Update for bluez openSUSE-SU-2018:4259-1 (bluez)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap15\.0");

  script_xref(name:"openSUSE-SU", value:"2018:4259_1");
  script_xref(name:"URL", value:"http://lists.opensuse.org/opensuse-security-announce/2018-12/msg00064.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'bluez'
  package(s) announced via the openSUSE-SU-2018:4259_1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for bluez fixes the following issues:

  Security issues fixed:

  - CVE-2016-9800: Fixed a buffer overflow in pin_code_reply_dump function
  (bsc#1013721)

  - CVE-2016-9801: Fixed a buffer overflow in set_ext_ctrl function
  (bsc#1013732)

  This update was imported from the SUSE:SLE-15:Update update project.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 15.0:

  zypper in -t patch openSUSE-2018-1596=1");

  script_tag(name:"affected", value:"bluez on openSUSE Leap 15.0.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "openSUSELeap15.0")
{

  if ((res = isrpmvuln(pkg:"bluez", rpm:"bluez~5.48~lp150.4.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bluez-cups", rpm:"bluez-cups~5.48~lp150.4.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bluez-cups-debuginfo", rpm:"bluez-cups-debuginfo~5.48~lp150.4.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bluez-debuginfo", rpm:"bluez-debuginfo~5.48~lp150.4.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bluez-debugsource", rpm:"bluez-debugsource~5.48~lp150.4.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bluez-devel", rpm:"bluez-devel~5.48~lp150.4.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bluez-test", rpm:"bluez-test~5.48~lp150.4.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bluez-test-debuginfo", rpm:"bluez-test-debuginfo~5.48~lp150.4.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libbluetooth3", rpm:"libbluetooth3~5.48~lp150.4.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libbluetooth3-debuginfo", rpm:"libbluetooth3-debuginfo~5.48~lp150.4.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bluez-devel-32bit", rpm:"bluez-devel-32bit~5.48~lp150.4.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libbluetooth3-32bit", rpm:"libbluetooth3-32bit~5.48~lp150.4.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libbluetooth3-32bit-debuginfo", rpm:"libbluetooth3-32bit-debuginfo~5.48~lp150.4.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"luez-auto-enable-devices", rpm:"luez-auto-enable-devices~5.48~lp150.4.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
