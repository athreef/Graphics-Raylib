use Test::Needs 'PDL', 'PDL::Matrix';
use Test::More;
use strict;
use warnings;

my $HZ = 120;
my $SIZE = 160;
my $MUTATION_CHANCE = 0.000;

###########

my $CELL_SIZE = 3;
use PDL;
use PDL::Matrix;

use Graphics::Raylib;
use Graphics::Raylib::Shape;
use Graphics::Raylib::Color qw(:all);
use Graphics::Raylib::Text;

use PDL;
use PDL::Matrix;

sub rotations { ($_->rotate(-1), $_, $_->rotate(1)) }

my @data;
foreach (0..$SIZE) {
    my @row;
    push @row, !!int(rand(2)) foreach 0..$SIZE;
    push @data, \@row;
}

my $gen = mpdl \@data;

my $g = Graphics::Raylib->window($CELL_SIZE*$SIZE, $CELL_SIZE*$SIZE);

$g->fps($HZ);

my $text = Graphics::Raylib::Text->new(color => RED, size => 20);

my $rainbow = Graphics::Raylib::Color::rainbow(colors => 240);

my $bitmap = Graphics::Raylib::Shape->bitmap(
    matrix => unpdl($gen),
    # uninitialized => 1 # It's fun. Try it :)
);

$g->clear(BLACK);

my $i = 0;
while (!$g->exiting && $i < 50)
{
    Graphics::Raylib::draw {
        $g->clear(BLACK);

        $bitmap->matrix = unpdl($gen);
        $bitmap->color = $rainbow->();
        $bitmap->draw;

        $text->text = "Generation " . ($i++);
        $text->draw;
    };


    # replace every cell with a count of neighbours
    my $neighbourhood = zeroes $gen->dims;
    $neighbourhood += $_ for map { rotations } map {$_->transpose}
                             map { rotations }      $gen->transpose;

    #  next gen are live cells with three neighbours or any with two
    my $next = $gen & ($neighbourhood == 4) | ($neighbourhood == 3);

    # mutation
    $next |= $neighbourhood == 2 if rand(1) < $MUTATION_CHANCE;

    # procreate
    $gen = $next;
}

is $i, 50;

done_testing;
