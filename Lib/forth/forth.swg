/*****************************************************************************

	forth.swg

	Function:	Forth extension module for swig

	Started:	25.02.2008
	Finished:	x

	Copyright 2008-2010 by Gerald Wodni

	This file is part of Forth-Swig-Extension.

	Forth-Swig-Extension is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 3 of the License, or
	(at your option) any later version.

	Forth-Swig-Extension is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.

 *****************************************************************************/

/* Primitive types */
// %typemap(forth) bool,			const bool &			"n"
// %typemap(forth) char,			const char &			"u"
// %typemap(forth) signed char,		const signed char &		"n"
// %typemap(forth) unsigned char,		const unsigned char &		"u"
// %typemap(forth) short,			const short &			"n"
// %typemap(forth) unsigned short,		const unsigned short &		"u"
// %typemap(forth) wchar_t,		const wchar_t &			"n"
// %typemap(forth) int,			const int &			"n"
// %typemap(forth) unsigned int,		const unsigned int &		"u"
// %typemap(forth) long,			const long &			"n"
// %typemap(forth) unsigned long,		const unsigned long &		"u"
// %typemap(forth) long long,		const long long &		"d"
// %typemap(forth) unsigned long long,	const unsigned long long &	"ud"
%typemap(forth) float,			const float &			"r"
%typemap(forth) double,			const double &			"r"
%typemap(forth) long double,		const long double &		"r"
%typemap(forth) void							"void"

/* instead of creatiung a typemap for every pointer and array e.g.:
	%typemap(forth) char *, char[ANY], char[]			"a"
   all pointers are mapped to "a" (see documentation 10.3.3)
 */
// %typemap(forth) const char *, const char[ANY], const char[]		"s"
%typemap(forth) const char *, const char[ANY], const char[]		"a"
// %typemap(forth) const wchar_t *, const wchar_t[ANY], const wchar_t[]    "ws"
%typemap(forth) const wchar_t *, const wchar_t[ANY], const wchar_t[]    "a"
%typemap(forth) SWIGTYPE *						"a"
%typemap(forth) SWIGTYPE []						"a"

/* enums are "n" */
%typemap(forth) enum SWIGTYPE						"n"

/* varargs get a special warning, but are not resolved to the default type */
#define SWIG_FORTH_TYPE_VARARGS						"..."

/* common templates */
#define SWIG_FORTH_STACKEFFECT_COMMENT	        "\t( %{arguments}%{spacer}-- )"
%include "sections.swg"
%include "structs.swg"

/* vendor specific output */
%include "gforth.swg"
%include "swiftForth.swg"
%include "vfx.swg"

/* file header */
%insert("include") "include.swg"
%insert("header") "header.swg"

%insert("footer") "footer.swg"
