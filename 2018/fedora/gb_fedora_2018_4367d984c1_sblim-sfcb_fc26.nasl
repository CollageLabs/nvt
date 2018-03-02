###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_4367d984c1_sblim-sfcb_fc26.nasl 8986 2018-03-01 04:16:23Z santu $
#
# Fedora Update for sblim-sfcb FEDORA-2018-4367d984c1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.874165");
  script_version("$Revision: 8986 $");
  script_tag(name:"last_modification", value:"$Date: 2018-03-01 05:16:23 +0100 (Thu, 01 Mar 2018) $");
  script_tag(name:"creation_date", value:"2018-02-28 08:40:08 +0100 (Wed, 28 Feb 2018)");
  script_cve_id("CVE-2018-6644");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for sblim-sfcb FEDORA-2018-4367d984c1");
  script_tag(name: "summary", value: "Check the version of sblim-sfcb");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Small Footprint CIM Broker (sfcb) is a CIM 
server conforming to the CIM Operations over HTTP protocol. It is robust, with low 
resource consumption and therefore specifically suited for embedded and resource 
constrained environments. sfcb supports providers written against the Common 
Manageability Programming Interface (CMPI).
");
  script_tag(name: "affected", value: "sblim-sfcb on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-4367d984c1");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/B4APLORS5DZTGNAVKYTXKCSDPCXAXSW5");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC26")
{

  if ((res = isrpmvuln(pkg:"sblim-sfcb", rpm:"sblim-sfcb~1.4.9~7.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
