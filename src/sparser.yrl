Nonterminals program list elems elem.
Terminals '(' ')' int bool atom.

Rootsymbol program.

program ->
  list             : ['$1'].
program ->
  list program     : ['$1' | '$2'].

list ->
  '(' ')'          : [].
list ->
  '(' elems ')'    : '$2'.

elems ->
  elem             : ['$1'].
elems ->
  elem elems       : ['$1'|'$2'].

elem -> int        : extract_token('$1').
elem -> bool       : extract_token('$1').
elem -> atom       : extract_token('$1').
elem -> list       : '$1'.

Erlang code.

extract_token({_Token, _Line, Value}) -> Value.
