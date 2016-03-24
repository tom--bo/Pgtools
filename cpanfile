requires 'perl', '5.021001';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Test::MockObject';
};

requires 'DBI';
requires 'DBD::Pg';
requires 'DateTime';
requires 'DateTime::Format::Strptime';
requires 'Perl6::Slurp';
requires 'JSON::XS';
requires 'File::Spec';

