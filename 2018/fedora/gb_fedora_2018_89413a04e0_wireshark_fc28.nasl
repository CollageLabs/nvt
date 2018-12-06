###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_89413a04e0_wireshark_fc28.nasl 12661 2018-12-05 10:53:21Z santu $
#
# Fedora Update for wireshark FEDORA-2018-89413a04e0
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
  script_oid("1.3.6.1.4.1.25623.1.0.875300");
  script_version("$Revision: 12661 $");
  script_cve_id("CVE-2018-16056", "CVE-2018-16057", "CVE-2018-16058", "CVE-2018-18225", "CVE-2018-18226", "CVE-2018-18227", "CVE-2018-12086", "CVE-2018-14339", "CVE-2018-14340", "CVE-2018-14341", "CVE-2018-14342", "CVE-2018-14343", "CVE-2018-14344", "CVE-2018-14367", "CVE-2018-14368", "CVE-2018-14369", "CVE-2018-14370");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-12-05 11:53:21 +0100 (Wed, 05 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-04 08:20:58 +0100 (Tue, 04 Dec 2018)");
  script_name("Fedora Update for wireshark FEDORA-2018-89413a04e0");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2018-89413a04e0");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/XXS5DAT7UAY3W2K7M3FOXRIFPLX5UFSB");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'wireshark'
  package(s) announced via the FEDORA-2018-89413a04e0 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Metapackage with installs wireshark-cli and wireshark-qt.
");

  script_tag(name:"affected", value:"wireshark on Fedora 28.");

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

if(release == "FC28")
{

  if ((res = isrpmvuln(pkg:"wireshark", rpm:"wireshark~2.6.4~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
