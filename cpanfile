requires 'perl', '5.021001';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Test::MockObject';
	requires 'Test::MockObject', '0';
	requires 'Test::More', '0.98';
	requires 'DBD::Pg', 'v3.5.3';
	requires 'DBI', '1.6';
	requires 'DateTime', '1.2';
	requires 'DateTime::Format::Strptime', '1.6';
	requires 'File::Spec', '0';
	requires 'JSON::XS', '3.0';
	requires 'Perl6::Slurp', '0';
	requires 'DBD::Mock', '0';
	requires 'Test::Exception', '0';
};

requires 'DBI', '1.6';
requires 'DBD::Pg', '3.5.3';
requires 'DateTime', '1.2';
requires 'DateTime::Format::Strptime', '1.6';
requires 'Perl6::Slurp';
requires 'JSON::XS', '3.0';
requires 'File::Spec';

