use Test::More;
use strict;
use warnings;

my $SIZE  = 150;
my $ITERS = 100;
my ($cX, $cY) = (-0.7, 0.27015);
my ($moveX, $moveY) = (0, 0);
my $zoom = 1;

use Graphics::Raylib '+family';

my $g = Graphics::Raylib->window($SIZE*4, $SIZE*2)
    or plan skip_all => 'No graphic device';

my @julia      = map [(0)x$SIZE], 0..$SIZE-1;
my @mandelbrot = map [(0)x$SIZE], 0..$SIZE-1;
# coloring in the callback is reaaaaally slow, so we don't do it TODO find out why
my @args = (color => sub { shift }, width => $SIZE * 2, height => $SIZE * 2);
my $julia      = Graphics::Raylib::Shape->bitmap(matrix => \@julia,      x => -$SIZE*2, @args);
my $mandelbrot = Graphics::Raylib::Shape->bitmap(matrix => \@mandelbrot, x =>  $SIZE*2, @args);
$g->fps(60);

for (my $y = 0; $y < $SIZE; $y++) {
    for (my $x = 0; $x < $SIZE; $x++) {
        $julia[$y][$x]      = julia($x, $y);
        $mandelbrot[$y][$x] = mandelbrot($x, $y);
    }

    $g->clear;
    $julia->matrix = \@julia;
    $mandelbrot->matrix = \@mandelbrot;

    Graphics::Raylib::draw {
        $julia->draw;
        $mandelbrot->draw;
    };
}
sleep $ENV{RAYLIB_TEST_SLEEP_SECS} // 0;
sub julia {
    my ($x, $y) = @_;
    my $zx = (1.5 * ($x - $SIZE / 2) / (0.5 * $zoom * $SIZE) + $moveX);
    my $zy = (($y - $SIZE / 2) / (0.5 * $zoom * $SIZE) + $moveY);
    my $i = $ITERS;
    while ($zx**2 + $zy**2 < 4 and --$i >= 0) {
        ($zy, $zx) = (2 * $zx * $zy + $cY, $zx**2 - $zy**2 + $cX);
    }

    return Graphics::Raylib::Color::hsv(abs($i / $ITERS * 360), 1, $i > 0 ? 1 : 0);
}
sub mandelbrot {
    my ($x, $y) = @_;
    my ($cx, $cy) = (-2 + 2.5*$x/$SIZE, -1.25 + 2.5*$y/$SIZE);
    my ($zx, $zy) = ($cx, $cy);

    my $i = $ITERS;
    while ($zx**2 + $zy**2 < 16.0 and --$i >= 0) {
        ($zy, $zx) = (2 * $zx * $zy + $cy, $zx**2 - $zy**2 + $cx);
    }

    return Graphics::Raylib::Color::hsv(abs($i / $ITERS * 360), 1, $i > 0 ? 1 : 0);
}

ok 1;
done_testing
