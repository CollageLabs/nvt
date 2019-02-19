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
  script_oid("1.3.6.1.4.1.25623.1.0.875454");
  script_version("$Revision: 13749 $");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2019-02-19 06:33:45 +0100 (Tue, 19 Feb 2019) $");
  script_tag(name:"creation_date", value:"2019-02-12 04:09:13 +0100 (Tue, 12 Feb 2019)");
  script_name("Fedora Update for radvd FEDORA-2019-333a7aa511");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2019-333a7aa511");
  script_xref(name:"URL", value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IOOLDHTTLVXLVQU5CL7G3MKE2IA6NZA7");

  script_tag(name:"summary", value:"The remote host is missing an update
  for the 'radvd' package(s) announced via the FEDORA-2019-333a7aa511 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version
  is present on the target host.");

  script_tag(name:"insight", value:"radvd is the router advertisement daemon
  for IPv6.  It listens to router solicitations and sends router advertisements
  as described in 'Neighbor Discovery for IP Version 6 (IPv6)' (RFC 2461).
  With these advertisements hosts can automatically configure their addresses
  and some other parameters.  They also can choose a default router based on these
  advertisements.

Install radvd if you are setting up IPv6 network and/or Mobile IPv6
services.
");

  script_tag(name:"affected", value:"radvd on Fedora 28.");

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

  if ((res = isrpmvuln(pkg:"radvd", rpm:"radvd~2.17~12.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
