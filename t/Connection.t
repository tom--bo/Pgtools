use strict;
use warnings;

use Test::More;
use Test::Exception;
use Data::Dumper;

use_ok('Mod::Connection');
use Mod::Connection;

my $default = {
    "host"     => "localhost",
    "port"     => 5432,
    "user"     => "postgres",
    "password" => "",
    "database" => "postgres"
};

my $s = Connection->new($default);

ok $s;
isa_ok($s, "Connection");

is($s->{host}, "localhost");
is($s->{port}, 5432);
is($s->{user}, "postgres");
is($s->{password}, "");
is($s->{database}, "postgres");

# ///////////////
# setArgs
# ///////////////

my $s1 = Connection->new($default);
$s1->setArgs("192.168.33.21,5432,postgres,,");
is($s1->{host}, "192.168.33.21");
is($s1->{port}, 5432);
is($s1->{user}, "postgres");
is($s1->{password}, "");
is($s1->{database}, "postgres");

my $s2 = Connection->new($default);
$s2->setArgs(",,postgres,password,");
is($s2->{host}, "localhost");
is($s2->{port}, 5432);
is($s2->{user}, "postgres");
is($s2->{password}, "password");
is($s2->{database}, "postgres");

my $s3 = Connection->new($default);
$s3->setArgs("postgres-db.com,15432,pguser,,db1");
is($s3->{host}, "postgres-db.com");
is($s3->{port}, 15432);
is($s3->{user}, "pguser");
is($s3->{password}, "");
is($s3->{database}, "db1");

my $s4 = Connection->new($default);
dies_ok {$s4->setArgs("postgres-db.com,15432,pguser,db1")} 'expect to die';

my $s5 = Connection->new($default);
dies_ok {$s5->setArgs("")} 'expect to die';

my $s6 = Connection->new($default);
dies_ok {$s6->setArgs("postgres-db.com,15432,pguser,,db1,")} 'expect to die';




done_testing;

