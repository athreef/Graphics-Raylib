use Test::More;

use Graphics::Raylib;
use Graphics::Raylib::Shape;
use Graphics::Raylib::Color;

my $block_size = 50;

my $g = Graphics::Raylib->window($block_size*10, $block_size, "Test")
    or plan skip_all => 'No graphic device';

$g->fps(10);

my $rect = Graphics::Raylib::Shape->rectangle(
    pos => [0,0], size => [$block_size, $block_size],
    color => Graphics::Raylib::Color::DARKGREEN
);
my $i = 0;
while (!$g->exiting && $i != 20) {
    Graphics::Raylib::draw {
        $g->clear;

        $rect->draw;

    };

    $rect->{pos} = [(++$i % 10) * $block_size, 0];
}
ok 1;
done_testing
