use Test::More;

BEGIN {
    use_ok 'Graphics::Raylib::Color';
}

my $color = Graphics::Raylib::Color::DARKPURPL;
is "$color", '(r: 112, g: 31, b: 126, a: 255)';
ok not eval { DARKPURPL->isa("Color") };


use Graphics::Raylib::Color qw(:all);
ok DARKPURPL->isa("Color");
is DARKPURPL->stringify, $color;

done_testing
