use strict;
use warnings;
package Graphics::Raylib::Keyboard;
use Graphics::Raylib::Key;

# ABSTRACT: Deal with Keyboard Input
# VERSION

use Import::Into;
sub import {
    Graphics::Raylib::Key->import::into(scalar caller);
}

=pod

=encoding utf8

=head1 NAME

Graphics::Raylib::Keyboard - Deal with Keyboard Input


=head1 SYNOPSIS

    use Graphics::Raylib::Keyboard;

    $key = Graphics::Raylib::Keyboard->new; # More concise this way
    print "A is pressed down\n" if $key->down('a');
    print "B is not being pressed down\n" if $key->up('a');
    print "last key pressed is ", $key->latest, "\n";

=head1 DESCRIPTION

Keys are specified in Vi-like notation. Keys returned are instances of L<Graphics::Raylib::Key> which has the C<eq> operator overloaded, so you don't have to care about letter case and synonyms (e.g. C<< <CR> >>, C<< <Return> >> and C<< <Enter> >>

=head1 METHODS AND ARGUMENTS

=over 4

=item new()

Optional. Returns a C<Graphics::Raylib::Keyboard> object that saves you typing that prefix all the time.

=cut

sub new { return bless {}, shift }
sub from_vinotation { Graphics::Raylib::Key->new(map => shift) }
sub from_keycode { Graphics::Raylib::Key->new(keycode => shift) }

=item pressed([$key])

Returns last pressed key. if a $key argument is supplied, detects if that given key has been pressed once.

=cut


sub pressed {
    shift if ref $_[0];
    if (@_) {
        Graphics::Raylib::XS::IsKeyPressed(from_vinotation $_[0])
    } else {
        from_keycode Graphics::Raylib::XS::GetKeyPressed()
    }
}

=item down($key)

Detects if key is being pressed down

=cut

sub down { shift if ref $_[0]; Graphics::Raylib::XS::IsKeyDown(from_vinotation $_[0]) }

=item released($key)

Detects if a key has been released once

=cut

sub released { shift if ref $_[0]; Graphics::Raylib::XS::IsKeyReleased(from_vinotation $_[0]) }

=item up($key)

Detects if a key is NOT being pressed

=cut

sub up { shift if ref $_[0]; Graphics::Raylib::XS::IsKeyUp(from_vinotation $_[0]) }

=item $exit = exit() or $exit("<Esc>")

L-value subroutine to access the key used to exit the program

    $keyboard = Graphics::Raylib::Keyboard->new; # More concise this way
    print "Exit key is ",  $key->exit, "\n";
    $key->exit("<Enter>"); # Instead of the default "<Esc>"

=cut

my $EXIT_KEY = from_vinotation "<ESC>";
sub exit {
    shift if ref $_[0];

    if (@_) {
        $EXIT_KEY = from_vinotation $_[0];
        Graphics::Raylib::XS::SetExitKey($EXIT_KEY);
    } else {
        $EXIT_KEY
    }
}

=back

=head1 GIT REPOSITORY

L<http://github.com/athreef/Graphics-Raylib>

=head1 SEE ALSO

L<Graphics-Raylib>

L<Graphics-Raylib-XS>

=head1 AUTHOR

Ahmad Fatoum C<< <athreef@cpan.org> >>, L<http://a3f.at>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2017 Ahmad Fatoum

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

