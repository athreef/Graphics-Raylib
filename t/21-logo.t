use Test::More;

use Graphics::Raylib;
use Graphics::Raylib::XS;

Graphics::Raylib::XS::ShowLogo();
my $g = Graphics::Raylib->window(300,300);
plan skip_all => 'No graphic device' if !$g or defined $ENV{NO_GRAPHICAL_TEST} or defined $ENV{NO_GRAPHICAL_TESTS};

ok 1;
done_testing
