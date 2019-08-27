##############################################################################
# OpenVAS Vulnerability Test
# $Id: win_passwd_history.nasl 11532 2018-09-21 19:07:30Z cfischer $
#
# Check value for Enforce password history (WMI)
#
# Authors:
# Emanuel Moss <emanuel.moss@greenbone.net>
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.1.300022");
  script_version("$Revision: 11532 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 21:07:30 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-04-25 10:11:33 +0200 (Wed, 25 Apr 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:N/I:N/A:N");
  script_tag(name:"qod", value:"97");
  script_name('Microsoft Windows: Enforce password history');
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("gb_wmi_access.nasl", "smb_reg_service_pack.nasl");
  script_mandatory_keys("Compliance/Launch");
  script_require_keys("WMI/access_successful");
  script_add_preference(name:"Minimum", type:"entry", value:"24");
  script_tag(name:"summary", value:"This test checks the setting for policy
'Enforce password history' on Windows hosts (at least Windows 7).

The policy setting determines the number of unique new passwords that must be
associated with a user account before an old password can be reused.");
  exit(0);
}

include("smb_nt.inc");
include("policy_functions.inc");

if(!get_kb_item("SMB/WindowsVersion")){
  policy_logging(text:'Host is no Microsoft Windows System or it is not possible
to query the registry.');
  exit(0);
}

if(get_kb_item("SMB/WindowsVersion") < "6.1"){
  policy_logging(text:'Host is not at least a Microsoft Windows 7 system.
Older versions of Windows are not supported any more. Please update the
Operating System.');
  exit(0);
}

title = 'Enforce password history';
select = 'Setting';
keyname = 'PasswordHistorySize';
fixtext = 'Set following UI path accordingly:
Computer Configuration/Windows Settings/Security Settings/Account Policies/Password Policy/' + title;
default = script_get_preference("Minimum");

query = "SELECT " + select + " FROM RSOP_SecuritySettingNumeric WHERE KeyName = '" + keyname + "' AND precedence = '1'";
result = policy_rsop_query(query:query, default: default, min:TRUE);

policy_logging(text:'"' + title + '" is set to: ' + result['value']);
policy_add_oid();
policy_set_dval(dval:default);
policy_fixtext(fixtext:fixtext);
policy_control_name(title:title);
policy_set_kb(val:result['value']);
policy_set_compliance(compliant:result['compliant']);

exit(0);
