%module example
%insert("include")
%{
#include "info.h"
%}

%insert("gforthPrefix") %{." Hello Gforth prefix" cr%}
%insert("gforthPostfix") %{." Bye Gforth postfix" cr%}

%include "info.h"
