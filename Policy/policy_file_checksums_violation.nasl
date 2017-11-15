###############################################################################
# OpenVAS Vulnerability Test
# $Id: policy_file_checksums_violation.nasl 7753 2017-11-14 10:57:07Z jschulte $
#
# List File Checksum Violations
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
#
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
  script_oid("1.3.6.1.4.1.25623.1.0.103942");
  script_version("$Revision: 7753 $");
  script_name("File Checksums: Violations");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-11-14 11:57:07 +0100 (Tue, 14 Nov 2017) $");
  script_tag(name:"creation_date", value:"2013-08-21 10:56:19 +0200 (Wed, 21 Aug 2013)");
  script_category(ACT_GATHER_INFO);
  script_family("Policy");
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_dependencies("policy_file_checksums.nasl");
  script_mandatory_keys("policy/checksum_fail");

  script_tag(name:"summary", value:"List files with checksum violations");

  script_tag(name:"qod", value:"98"); # direct authenticated file analysis is pretty reliable

  exit(0);
}

md5fail = get_kb_list("policy/md5cksum_fail");
sha1fail = get_kb_list("policy/sha1cksum_fail");

if (md5fail || sha1fail) {
  report = "The following file checksums don't match:\n\n";
  report += 'Filename|Result|Errorcode;\n';
  foreach fail (md5fail) {
    report += fail + '\n';
  }
  foreach fail (sha1fail) {
    report += fail + '\n';
  }
  log_message(data:report, port:0, proto:"ssh");
}

exit(0);
