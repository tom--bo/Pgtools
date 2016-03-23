use strict;
use warnings;

use Test::Perl::Critic;
use Data::Dumper;

my $rcfile = File::Spec->catfile('t', 'perlcriticrc');
Critic->import(-profile => $rcfile);
all_critic_ok('lib', 't');

