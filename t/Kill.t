use strict;
use warnings;

use Test::More;
use Test::MockObject;
use DBI;
use Data::Dumper;

use_ok('Mod::Kill');
use Mod::Kill;

my $opt = {
    "help"                   => 0,
    "ignore_match_query"     => '',
    "ignore_match_state"     => '',
    "ignore_query_user_name" => '',
    "kill"                   => '',
    "match_query"            => '^select',
    "match_state"            => '',
    "print"                  => 0,
    "query_user_name"        => '',
    "run_time"               => 0,
    "version"                => 0,
};

my $k = Kill->new($opt);

ok $k;
isa_ok($k, "Kill");


# ///////////////
# search_queries
# ///////////////

# DB mock
my @data1 = (        
    ['datname', 'pid', 'backend_start', 'state', 'query'],
    ['postgres', 2234, '2016-03-12 11:52:42.400975+00', 'idle', 'select * from actor;'],
    ['postgres', 2834, '2016-03-12 11:53:42.400975+00', 'idle', 'SELECT * from actor limit 3;'],
    ['postgres', 1234, '2016-03-12 11:54:42.400975+00', 'idle', 'INSERT INTO actor values(1,1,1);'],
);
my $dbh = DBI->connect('DBI:Mock:', '', '');
$dbh->{mock_add_resultset} = \@data1;

# $mock_db->fake_module('Mod::Connection');
# $mock_db->fake_new('Mod::Connection');
my $mock_db = Test::MockObject->new;
$mock_db->set_always('dbh', $dbh);
$mock_db->set_always('database', 'postgres');

my $ret = $k->search_queries($mock_db);
# print Dumper $ret;

is($ret->{2234}->{state}, 'idle');
is($ret->{2234}->{backend_start}, '2016-03-12 11:52:42.400975+00');
is($ret->{2234}->{datname}, 'postgres');
is($ret->{2234}->{query}, 'select * from actor;');
is($ret->{2234}->{pid}, 2234);





done_testing;

