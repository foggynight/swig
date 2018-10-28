%module example
%insert("include")
%{
#include <stdint.h>
#include "info.h"
%}

#define SWIG_FORTH_GFORTH_INCLUDE "use-include-section"

%include "info.h"
