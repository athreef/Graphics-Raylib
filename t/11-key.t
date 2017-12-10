use Test::More;

BEGIN {
    use_ok 'Graphics::Raylib::Key';
}
use Graphics::Raylib::Key ':all';

my $key = Graphics::Raylib::Key->new(map => '<CR>');
is $key->keycode, KEY_ENTER;
ok $key == Graphics::Raylib::Key->new(keycode => KEY_ENTER);
ok $key eq Graphics::Raylib::Key->new(keycode => KEY_ENTER);
ok $key eq '<cr>';
ok $key eq '<ENTER>';
ok $key eq '<Return>';
ok $key eq "\n";
ok $key eq "\r";
ok(Graphics::Raylib::Key->new(keycode => KEY_ENTER) eq '<return>');
ok "$key" eq '<CR>' || "$key" eq '<enter>' || "$key" eq '<return>';

done_testing;
