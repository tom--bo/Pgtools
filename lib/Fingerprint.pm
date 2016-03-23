package Fingerprint;
use strict;
use warnings;

use File::Spec;
use Data::Dumper;
use parent qw(Class::Accessor);

sub exec {
    my ($self, $query, $filename) = @_;
    
    if($query ne "") {
        $query = &symbolize_query($self, $query);
        &print_queries($self, $query);
        return;
    }
    $filename = File::Spec->rel2abs($filename);

    open(IN, $filename) or die "$!";
    while(<IN>) {
        chomp $_;
        $_ = &symbolize_query($self, $_);
        &print_queries($self, $_);
    }
}

sub symbolize_query {
    my ($self, $q) = @_;
    $q =~ s/([\s<>=])([-\+])?[.0123456789]+/$1?/g;
    $q =~ s/(true|false)/?/ig;

    return $q;
}

sub print_queries {
    my ($self, $query) = @_;
    print $query."\n";
}

1;

