/*****************************************************************************

	vfxTypemaps.swg

	Function:	VFX uses a subset of c-types and resolves them internally

	Started:	31.01.2017
	Finished:	x

	Copyright 2017 by Gerald Wodni

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
%typemap(vfxForth) bool,		const bool &			"bool"
%typemap(vfxForth) char,		const char &			"char"
%typemap(vfxForth) signed char,		const signed char &		"char"
%typemap(vfxForth) unsigned char,	const unsigned char &		"char"
%typemap(vfxForth) short,		const short &			"short"
%typemap(vfxForth) unsigned short,	const unsigned short &		"short"
%typemap(vfxForth) wchar_t,		const wchar_t &			"int"
%typemap(vfxForth) int,			const int &			"int"
%typemap(vfxForth) unsigned int,	const unsigned int &		"int"
%typemap(vfxForth) long,		const long &			"long"
%typemap(vfxForth) unsigned long,	const unsigned long &		"long"
%typemap(vfxForth) long long,		const long long &		"long long"
%typemap(vfxForth) unsigned long long,	const unsigned long long &	"long long"
%typemap(vfxForth) float,		const float &			"float"
%typemap(vfxForth) double,		const double &			"double"
%typemap(vfxForth) long double,		const long double &		"double"
%typemap(vfxForth) void							"void"

/* instead of creatiung a typemap for every pointer and array e.g.:
	%typemap(vfxForth) char *, char[ANY], char[]			"a"
   all pointers are mapped to "a" (see documentation 10.3.3)	
 */
%typemap(vfxForth) const char *, const char[ANY], const char[]		"char *"
%typemap(vfxForth) const wchar_t *, const wchar_t[ANY], const wchar_t[] "char *"
%typemap(vfxForth) SWIGTYPE *						"void *"
%typemap(vfxForth) SWIGTYPE []						"void *"

/* enums are "n" */
%typemap(vfxForth) enum SWIGTYPE					"int"
