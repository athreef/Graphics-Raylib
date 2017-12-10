use Test::More;

BEGIN {
    use_ok 'Graphics::Raylib::Keyboard';
}

my $key = Graphics::Raylib::Keyboard->new;
ok $key;
$key->exit("<space>");
ok $key->exit eq "<SPACE>";

done_testing;
