###############################################################################
# OpenVAS Vulnerability Test
#
# Mozilla Products Multiple Vulnerabilities october-10 (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.801467");
  script_version("2019-08-06T11:17:21+0000");
  script_tag(name:"last_modification", value:"2019-08-06 11:17:21 +0000 (Tue, 06 Aug 2019)");
  script_tag(name:"creation_date", value:"2010-10-28 11:50:37 +0200 (Thu, 28 Oct 2010)");
  script_cve_id("CVE-2010-3170", "CVE-2010-3173", "CVE-2010-3179", "CVE-2010-3178",
                "CVE-2010-3181", "CVE-2010-3180", "CVE-2010-3183");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Mozilla Products Multiple Vulnerabilities October-10 (Windows)");

  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2010/mfsa2010-70.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2010/mfsa2010-72.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2010/mfsa2010-65.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2010/mfsa2010-69.html");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_portable_win.nasl", "gb_seamonkey_detect_win.nasl",
                      "gb_thunderbird_detect_portable_win.nasl");
  script_mandatory_keys("Mozilla/Firefox_or_Seamonkey_or_Thunderbird/Installed");

  script_tag(name:"impact", value:"Successful exploitation will let attackers to cause a denial of service
  or execute arbitrary code.");

  script_tag(name:"affected", value:"Seamonkey version prior to 2.0.9

  Firefox version prior to 3.5.14 and 3.6.x before 3.6.11

  Thunderbird version proior to 3.0.9 and 3.1.x before 3.1.5");

  script_tag(name:"insight", value:"The flaws are due to:

  - A wildcard IP address in the 'subject&qts' Common Name field of an X.509
  certificate.

  - not properly setting the minimum key length for 'Diffie-Hellman Ephemeral'
  (DHE) mode, which makes it easier for remote attackers to defeat
  cryptographic protection mechanisms via a brute-force attack.

  - Passing an excessively long string to 'document.write' could cause text
  rendering routines to end up in an inconsistent state with sections of
  stack memory being overwritten with the string data.

  - not properly handling certain modal calls made by 'javascript: URLs' in
  circumstances related to opening a new window and performing cross-domain
  navigation.

  - an untrusted search path vulnerability.

  - Use-after-free vulnerability in the nsBarProp function.

  - error in 'LookupGetterOrSetter' function, which does not properly support
  'window.__lookupGetter__ function' calls that lack arguments.");

  script_tag(name:"summary", value:"The host is installed with Mozilla Firefox/Seamonkey/Thunderbird and is prone
  to multiple vulnerabilities.");

  script_tag(name:"solution", value:"Upgrade to Firefox version 3.6.11 or 3.5.14 or later

  Upgrade to Seamonkey version 2.0.9 or later

  Upgrade to Thunderbird version 3.0.9 or 3.1.5 or later");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");

ffVer = get_kb_item("Firefox/Win/Ver");
if(ffVer)
{
  if(version_is_less(version:ffVer, test_version:"3.5.14") ||
     version_in_range(version:ffVer, test_version:"3.6.0", test_version2:"3.6.10"))
    {
      security_message( port: 0, data: "The target host was found to be vulnerable" );
      exit(0);
    }
}

smVer = get_kb_item("Seamonkey/Win/Ver");
if(smVer)
{
  if(version_is_less(version:smVer, test_version:"2.0.9"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

tbVer = get_kb_item("Thunderbird/Win/Ver");
if(tbVer)
{
  if(version_is_less(version:tbVer, test_version:"3.0.9") ||
    version_in_range(version:tbVer, test_version:"3.1.0", test_version2:"3.1.4")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}
