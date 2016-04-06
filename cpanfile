requires 'perl', '5.021001';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Test::MockObject';
};

requires 'DBI', '1.6';
requires 'DBD::Pg', '3.5';
requires 'DateTime', '1.2';
requires 'DateTime::Format::Strptime', '1.6';
requires 'Perl6::Slurp';
requires 'JSON::XS', '3.2';
requires 'File::Spec';

