use strict;
use warnings;

package Dist::Zilla::Plugin::Test::Fixme;
{
  $Dist::Zilla::Plugin::Test::Fixme::VERSION = '1.122640';
}

# ABSTRACT: Check code for FIXMEs.
use Moose;
use Data::Section -setup;
with 'Dist::Zilla::Role::FileGatherer', 'Dist::Zilla::Role::TextTemplate';

sub gather_files {
    my ( $self, ) = @_;

    require Dist::Zilla::File::InMemory;

    for my $filename (qw( xt/release/fixme.t )) {
        my $content = $self->fill_in_string(
            ${ $self->section_data($filename) },
            { skiptests => '' },
        );
        $self->add_file(
            Dist::Zilla::File::InMemory->new(
                {
                    'name'    => $filename,
                    'content' => $content,
                }
            ),
        );
    }
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;




=pod

=head1 NAME

Dist::Zilla::Plugin::Test::Fixme - Check code for FIXMEs.

=head1 VERSION

version 1.122640

=for test_synopsis 1;
__END__

=head1 SYNOPSIS

In C<dist.ini>:

    [Test::Fixme]

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the
following file:

  xt/release/fixme.t - a standard Test::Fixme test

=head1 TODO

- Allow user to pass options to Test::Fixme

=head1 ACKNOWLEDGMENTS

Thanks to Edmund von der Burg and Graham Ollis for writing L<Test::Fixme>.

Code for this plugin based on L<Dist::Zilla::Plugin::Test::Kwalitee> by Alan Young.

=for Pod::Coverage   mvp_multivalue_args
  gather_files

=head1 AUTHOR

Andrew Jones <andrew@arjones.co.uk>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Andrew Jones.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__DATA__
___[ xt/release/fixme.t ]___
#!perl

# This test is generated by Dist::Zilla::Plugin::Test::Fixme
use strict;
use warnings;

use Test::Fixme;
run_tests();