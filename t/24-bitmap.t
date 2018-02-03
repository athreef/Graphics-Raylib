use Test::More tests => 1;

BEGIN {
    use_ok 'Graphics::Raylib', '+family';
}

my $g = Graphics::Raylib->window(150, 150); $g->fps(180);

SKIP: {
    skip 'No graphic device', 0 unless $g;

    my $glider = Graphics::Raylib::Shape->bitmap(
        matrix => [
            [0, 0, 0, 0, 0],
            [0, 1, 0, 1, 0],
            [0, 1, 0, 1, 0],
            [0, 0, 1, 1, 0],
            [0, 0, 0, 0, 0],
        ],
        color => BLACK,
        transposed => 1
        #x => 150, y => 150, # undocumented
    );
    while (!$g->exiting && $glider->rotation < 360) {
        $g->clear(WHITE);
        Graphics::Raylib::draw {
            $glider->rotation += 1;
            $glider->draw
        }
    }
}
