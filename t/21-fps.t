use Test::More tests => 1;

use Graphics::Raylib;
BEGIN {
    use_ok 'Graphics::Raylib::Text';
}

my $g = Graphics::Raylib->window(200,50);

SKIP: {
    skip 'No graphic device', 0 unless $g;

    $g->fps(40);

    Graphics::Raylib::draw {
        $g->clear;

        Graphics::Raylib::Text::FPS->draw;
    };
    sleep 1;
}
