###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_virtualbox_guest_host_escape_e1000_vuln_macosx.nasl 13450 2019-02-05 03:52:29Z ckuersteiner $
#
# Oracle VirtualBox Guest-to-Host Escape E1000 Privilege Escalation Vulnerability (Mac OS X)
#
# Authors:
# Vidita V Koushik <vidita@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:oracle:vm_virtualbox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814328");
  script_version("$Revision: 13450 $");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-02-05 04:52:29 +0100 (Tue, 05 Feb 2019) $");
  script_tag(name:"creation_date", value:"2018-11-09 10:40:36 +0530 (Fri, 09 Nov 2018)");

  script_name("Oracle VirtualBox Guest-to-Host Escape E1000 Privilege Escalation Vulnerability (Mac OS X)");

  script_tag(name:"summary", value:"The host is installed with Oracle VirtualBox
  and is prone to privilege escalation vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaw exists in the Intel PRO/1000 MT
  Desktop (82540EM) network adapter in Network Address Translation (NAT) mode
  called the E1000.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  with root/administrator privileges in a guest to escape to a host ring3. Then the
  attacker can use existing techniques to escalate privileges to ring 0 via
  /dev/vboxdrv");

  script_tag(name:"affected", value:"Oracle VirtualBox versions 5.2.20 and
  before on Mac OS X.");

  script_tag(name:"solution", value:"No known solution is available as of 05th February, 2019.
  Information regarding this issue will be updated once solution details are available.");

  script_tag(name:"solution_type", value:"NoneAvailable");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://github.com/MorteNoir1/virtualbox_e1000_0day");
  script_xref(name:"URL", value:"https://www.virtualbox.org/");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Privilege escalation");
  script_dependencies("secpod_oracle_virtualbox_detect_macosx.nasl");
  script_mandatory_keys("Oracle/VirtualBox/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
appVer = infos['version'];
appPath = infos['location'];

if(appVer =~ "^(5\.2)")
{
  if(version_is_less_equal(version:appVer, test_version:"5.2.20"))
  {
    report = report_fixed_ver(installed_version:appVer, fixed_version:"NoneAvailable", install_path:appPath);
    security_message(data:report);
    exit(0);
  }
}
exit(99);
