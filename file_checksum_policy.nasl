###############################################################################
# OpenVAS Vulnerability Test
# $Id: file_checksum_policy.nasl 7513 2017-10-20 05:29:41Z cfischer $
#
# Check for File Checksum Violations
#
# Authors:
# Thomas Rotter <thomas.rotter@greenbone.net>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.96214");
  script_version("$Revision: 7513 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-20 07:29:41 +0200 (Fri, 20 Oct 2017) $");
  script_tag(name:"creation_date", value:"2012-10-25 11:26:06 +0200 (Thu, 25 Oct 2012)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N"); 
  script_name("Check for File Checksum Violations");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("login/SSH/success");
  script_exclude_keys("no_linux_shell");

  #script_add_preference(name:"List all and not only the first 100 entries", type:"checkbox", value:"no");
  #script_add_preference(name:"Target checksum File", type:"file", value:"");
  #script_add_preference(name:"Target Verbosity Level", type:"radio", value:"Display only Files with wrong Checksums;Display missing Files and Files with wrong Checksums;Display all Files");

  script_tag(name:"summary", value:"Check for File Checksum Violations

  ATTENTION: This NVT is deprecated. Please use the new set of 4 NVTs to handle
  file checksum policies which are to be found in the family 'Policy'.");

  script_tag(name:"deprecated", value:TRUE);

  script_tag(name:"qod_type", value:"general_note");

  exit(0);
}

exit(66);
