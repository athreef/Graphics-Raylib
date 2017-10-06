use strict;
use warnings;
use Graphics::Raylib::Color;
package Graphics::Raylib::Shape;

# ABSTRACT: Collection of drawable shapes
# VERSION

use List::Util qw(min max);
use Graphics::Raylib::XS qw(:all);

=pod

=encoding utf8

=head1 NAME

Graphics::Raylib::Shape - Collection of drawable shapes


=head1 SYNOPSIS

    use Graphics::Raylib::Shape::Pixel;
    use Graphics::Raylib::Shape::Circle;
    use Graphics::Raylib::Shape::Rectangle;
    use Graphics::Raylib::Shape::Triangle;
    use Graphics::Raylib::Shape::Bitmap;

    # example

    my $rect = Graphics::Raylib::Rectangle(
        pos   => [0,0],
        size  => [10,10],
        color => Graphics::Raylib::Rectange::MAROON,
    )->draw;

=head1 DESCRIPTION

Basic geometric shapes that can be drawn while in a C<Graphics::Raylib::draw> block.

Coordinates and width/height pairs are represented as array-refs to 2 elements

=head1 METHODS AND ARGUMENTS

=over 4

=item draw()

Call this on any of the following shapes while in a C<Graphics::Raylib::draw> block in order to draw the shape.

Wrap-around progress bar example:

    use Graphics::Raylib;
    use Graphics::Raylib::Shape;
    use Graphics::Raylib::Color;

    my $block_size = 50;

    my $g = Graphics::Raylib->window($block_size*10, $block_size, "Test");

    $g->fps(5);

    my $rect = Graphics::Raylib::Shape->rectangle(
        pos => [1,0], size => [$block_size, $block_size],
        color => Graphics::Raylib::Color::DARKGREEN
    );

    my $i = 0;
    while (!$g->exiting) {
        Graphics::Raylib::draw {
            $g->clear;

            $rect->draw;
        };

        $i %= 10;
        $rect->{pos} = [$i * $block_size, 0];
    }

=cut

=item pixel( pos => [$x, $y], color => $color )

Prepares a single pixel for drawing.

=cut

{
    package Graphics::Raylib::Shape::Pixel;
    use Graphics::Raylib::XS qw(DrawPixel);
    sub draw { DrawPixel(@{$_[0]->{pos}}, $_[0]->{color} ) }
    sub color :lvalue { $_[0]->{color}  }
}
sub pixel {
    my $class = shift;

    my $self = { @_ };

    bless $self, 'Graphics::Raylib::Shape::Pixel';
    return $self;
}


=item line( start => [$x, $y], end => [$x, $y], color => $color )

Prepares a line for drawing.

=cut

{
    package Graphics::Raylib::Shape::Line;
    use Graphics::Raylib::XS qw(DrawLine);
    sub draw { DrawLine(@{$_[0]->{start}}, @{$_[0]->{end}}, $_[0]->{color} ) }
    sub color :lvalue { $_[0]->{color}  }
}
sub line {
    my $class = shift;

    my $self = { @_ };

    bless $self, 'Graphics::Raylib::Shape::Line';
    return $self;
}



=item circle( center => [$x, $y], radius => $r, color => $color )

Prepares a circle for drawing.

=cut


{
    package Graphics::Raylib::Shape::Circle;
    use Graphics::Raylib::XS qw(DrawCircle);
    sub draw { DrawCircle( @{$_[0]->{center}}, $_[0]->{radius}, $_[0]->{color} ) }
    sub color :lvalue { $_[0]->{color}  }
}
sub circle {
    my $class = shift;

    my $self = { @_ };

    bless $self, 'Graphics::Raylib::Shape::Circle';
    return $self;
}


=item rectangle( pos => [$x, $y], size => [$width, $height], color => $color )

Prepares a solid color rectangle for drawing. if $color is an arrayref of 2 Colors, the fill color will be a gradient of those two.

=cut

{
    package Graphics::Raylib::Shape::Rectangle;
    use Graphics::Raylib::XS qw(DrawRectangle DrawRectangleGradient);
    sub draw {
        if (ref($_[0]->{color}) ne 'ARRAY') {
            DrawRectangle( @{$_[0]->{pos}}, @{$_[0]->{size}}, $_[0]->{color} )
        } else {
            DrawRectangleGradient( @{$_[0]->{pos}}, @{$_[0]->{size}}, @{$_[0]->{color}} )
        }
    }
    sub color :lvalue { $_[0]->{color}  }
}

sub rectangle {
    my $class = shift;

    my $self = { @_ };

    bless $self, 'Graphics::Raylib::Shape::Rectangle';
    return $self;
}


=item triangle( vertices => [ [$x1,$y1], [$x2,$y2], [$x3,$y3] ], color => $color )

Prepares a triangle for drawing.

=cut

{
    package Graphics::Raylib::Shape::Triangle;
    use Graphics::Raylib::XS qw(DrawTriangle);
    sub draw {
        my @v = @{$_[0]->{vertices}};
        DrawTriangle( @{$v[0]}, @{$v[1]}, @{$v[2]}, $_[0]->{color} );
    }
    sub color :lvalue { $_[0]->{color}  }
}

sub triangle {
    my $class = shift;

    my $self = { @_ };

    bless $self, 'Graphics::Raylib::Shape::Triangle';
    return $self;
}

{
    package Graphics::Raylib::Shape::Polygon;
    # TODO: missing
    sub color :lvalue { $_[0]->{color}  }
}

=item bitmap( matrix => $AoA, color => $color [ width => $screen_width, height => $screen_height ])

Creates a texture out of a matrix for printing. C<$AoA> is an array of arrays ref. C<$screen_width> and C<$screenheight> are the size of the area on which the Matrix should be drawn. It defaults to the screen size.

If C<$color> is a C<Graphics::Raylib::Color>, it will be used to color all positive $AoA elements. The space occupied by negative and zero elements stays at background color.

if $color is a code reference, It will be evaluated for each matrix element, with the element's value as argument. The return type of the code reference will be used for the color. Return C<undef>, for omitting the element.

Example:

    use Graphics::Raylib;
    use Graphics::Raylib::Shape;
    use Graphics::Raylib::Color ':all';
    use PDL;
    use PDL::Matrix;

    my $pdl = mpdl([
                     [0, 1, 1, 1, 0],
                     [1, 0, 0, 0, 0],
                     [0, 1, 1, 1 ,0],
                     [0, 0, 0, 0 ,1],
                     [0, 1, 1, 1 ,0],
                   ])->transpose;

    my $g = Graphics::Raylib->window(240, 240);
    $g->fps(10);

    my $bitmap = Graphics::Raylib::Shape->bitmap(matrix => unpdl($pdl), color => YELLOW);

    while (!$g->exiting) {
        Graphics::Raylib::draw {
            $g->clear(BLACK);
            $bitmap->matrix = unpdl($pdl);

            $bitmap->draw;
        };


        # now do some operations on $pdl, to get next iteration
    }

See the game of life example at L<Graphics::Raylib> (or C<t/10-game-of-life.t>) for a more complete example.

=cut

{
    package Graphics::Raylib::Shape::Bitmap;
    sub draw {
        my $self = shift;
        Graphics::Raylib::Shape::_bitmap($self) if $self->{rebitmap};

        Graphics::Raylib::XS::DrawTexture($self->{texture}, 0, 0, Graphics::Raylib::Color::WHITE);
    }
    sub matrix :lvalue {
        my $self = shift;

        $self->{rebitmap} = 1;
        $self->{matrix};
    }
    sub color :lvalue { $_[0]->{color}  }
    sub DESTROY {
          my $self = shift;
          Graphics::Raylib::XS::UnloadTexture($self->{texture}) if defined $self->{texture};
    }
}

sub _bitmap {
    my $self = shift;

    unless (defined $self->{height} && defined $self->{width}) {
        $self->{width}  = GetScreenWidth();
        $self->{height} = GetScreenHeight();
    }

    my $color = $self->{color} // Graphics::Raylib::Color::GOLD;
    $self->{color} = ref($color) eq 'CODE' ? $color : sub { shift > 0 ? $color : undef };

    unless ($self->{uninitialized}) {
        $self->{image} = LoadImageFromAV($self->{matrix}, $self->{color}, $self->{width}, $self->{height});
    } else {
        $self->{image} = LoadImageFromAV_uninitialized_mem($self->{matrix}, $self->{color}, $self->{width}, $self->{height});
    }
    if (defined $self->{texture}) {
        UpdateTextureFromImage($self->{texture}, $self->{image});
    } else {
        $self->{texture} = LoadTextureFromImage($self->{image});
    }
    UnloadImage($self->{image});

    $self->{rebitmap} = 0;
}

sub bitmap {
    my $class = shift;
    my $self = { uninitialized => 0, @_ };

    _bitmap($self);

    bless $self, 'Graphics::Raylib::Shape::Bitmap';
    return $self;
}

1;

=back

=head1 GIT REPOSITORY

L<http://github.com/athreef/Graphics-Raylib>

=head1 SEE ALSO

L<Graphics::Raylib>  L<Graphics::Raylib::Color>

=head1 AUTHOR

Ahmad Fatoum C<< <athreef@cpan.org> >>, L<http://a3f.at>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2017 Ahmad Fatoum

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
