package Query;
use strict;
use warnings;

use parent qw(Class::Accessor);
Query->mk_accessors(qw(datname xact_start query_start state query));

1;
