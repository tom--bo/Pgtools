requires 'perl', '5.021001';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

requires 'DBI';
requires 'DBD::Pg';
requires 'DateTime';
requires 'DateTime::Format::Strptime';
requires 'Perl6::Slurp';
requires 'JSON::XS';
requires 'Test::More';
requires 'Test::MockObject';
requires 'File::Spec';

