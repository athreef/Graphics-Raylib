use Test::More tests => 1;

use Graphics::Raylib;

my $g = Graphics::Raylib->window(50,50);

SKIP: {
    skip 'No graphic device', 1 unless $g;

    $g->fps(40);

    Graphics::Raylib::draw {
        $g->clear;
    };
    sleep 1;
    ok 1;
}
