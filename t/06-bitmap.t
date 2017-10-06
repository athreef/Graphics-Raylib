use Test::Needs 'PDL', 'PDL::Matrix';
use Test::More;
use strict;
use warnings;

use Graphics::Raylib;
use Graphics::Raylib::Shape;
use Graphics::Raylib::Color qw(:all);

my $g = Graphics::Raylib->window(150, 150); $g->fps(60);

my $glider = Graphics::Raylib::Shape->bitmap(
    matrix => [
                [0, 0, 0, 0, 0],
                [0, 0, 1, 0, 0],
                [0, 0, 0, 1, 0],
                [0, 1, 1, 1, 0],
                [0, 0, 0, 0, 0],
              ],
    color => BLACK
);
$g->clear(WHITE);

Graphics::Raylib::draw { $glider->draw };

sleep 1;

ok 1;

done_testing;
