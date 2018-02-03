use Test::More;

use Graphics::Raylib;
use Graphics::Raylib::Text;

my $g = Graphics::Raylib->window(200,50)
    or plan skip_all => 'No graphic device';

$g->fps(40);

Graphics::Raylib::draw {
    $g->clear;

    Graphics::Raylib::Text::FPS->draw;
};
sleep 1;
ok 1;
done_testing
