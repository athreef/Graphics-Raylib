use strict;
use warnings;
package Graphics::Raylib::Key;

# ABSTRACT: Keyboard Key class
# VERSION

use Graphics::Raylib::XS qw(:all);
use Carp;
require Exporter;
our @ISA = qw(Exporter);
our %EXPORT_TAGS = (keys => [ grep /^KEY_/, @Graphics::Raylib::XS::EXPORT_OK ]);
Exporter::export_ok_tags('keys');
{
    my %seen;
    push @{$EXPORT_TAGS{all}}, grep {!$seen{$_}++} @{$EXPORT_TAGS{$_}} foreach keys %EXPORT_TAGS;
}

sub new {
    my $class = shift;
    my %self = @_;

    return from_keycode($class, $self{keycode}) if exists $self{keycode};
    return from_vinotation($class, $self{map}) if exists $self{map};
    return;
}

my %SPECIAL_KEYCODE_OF = (
    SPACE  => KEY_SPACE,
    ESC    => KEY_ESCAPE,
    ENTER  => KEY_ENTER,
    RETURN => KEY_ENTER,
    CR     => KEY_ENTER,
    BS     => KEY_BACKSPACE,
    RIGHT  => KEY_RIGHT,
    LEFT   => KEY_LEFT,
    DOWN   => KEY_DOWN,
    UP     => KEY_UP,
    F1     => KEY_F1,
    F2     => KEY_F2,
    F3     => KEY_F3,
    F4     => KEY_F4,
    F5     => KEY_F5,
    F6     => KEY_F6,
    F7     => KEY_F7,
    F8     => KEY_F8,
    F9     => KEY_F9,
    F10    => KEY_F10,
    F11    => KEY_F11,
    F12    => KEY_F12,
    SLEFT  => KEY_LEFT_SHIFT,
    CLEFT  => KEY_LEFT_CONTROL,
    ALEFT  => KEY_LEFT_ALT,
    MLEFT  => KEY_LEFT_ALT,
    SRIGHT => KEY_RIGHT_SHIFT,
    CRIGHT => KEY_RIGHT_CONTROL,
    ARIGHT => KEY_RIGHT_ALT,
    MRIGHT => KEY_RIGHT_ALT,
    S      => [ KEY_LEFT_SHIFT, KEY_RIGHT_SHIFT ],
    SHIFT  => [ KEY_LEFT_SHIFT, KEY_RIGHT_SHIFT ],
    C      => [ KEY_LEFT_CONTROL, KEY_RIGHT_CONTROL ],
    CTRL   => [ KEY_LEFT_CONTROL, KEY_RIGHT_CONTROL ],
    A      => [ KEY_LEFT_ALT, KEY_RIGHT_ALT ],
    ALT    => [ KEY_LEFT_ALT, KEY_RIGHT_ALT ],
    M      => [ KEY_LEFT_ALT, KEY_RIGHT_ALT ],
    META   => [ KEY_LEFT_ALT, KEY_RIGHT_ALT ],
);
my %SPECIAL_VINOTATION_OF = reverse %SPECIAL_KEYCODE_OF;

my %KEYCODE_OF = (
    "\n" => KEY_ENTER,
    "\r" => KEY_ENTER,
    "\b" => KEY_BACKSPACE,
    "\e" => KEY_ESCAPE,
    " "  => KEY_SPACE,

    0 => KEY_ZERO,
    1 => KEY_ONE,
    2 => KEY_TWO,
    3 => KEY_THREE,
    4 => KEY_FOUR,
    5 => KEY_FIVE,
    6 => KEY_SIX,
    7 => KEY_SEVEN,
    8 => KEY_EIGHT,
    9 => KEY_NINE,

    A => KEY_A,
    B => KEY_B,
    C => KEY_C,
    D => KEY_D,
    E => KEY_E,
    F => KEY_F,
    G => KEY_G,
    H => KEY_H,
    I => KEY_I,
    J => KEY_J,
    K => KEY_K,
    L => KEY_L,
    M => KEY_M,
    N => KEY_N,
    O => KEY_O,
    P => KEY_P,
    Q => KEY_Q,
    R => KEY_R,
    S => KEY_S,
    T => KEY_T,
    U => KEY_U,
    V => KEY_V,
    W => KEY_W,
    X => KEY_X,
    Y => KEY_Y,
    Z => KEY_Z,
);
my %VINOTATION_OF = reverse %KEYCODE_OF;

sub from_vinotation {
    my $class = shift;
    my $self = {
        map => uc(shift),
    };
    $self->{special} = $self->{map} =~ /<([A-Z0-9\-]+)>/;

    if ($self->{special}) {
        $self->{keycode} = $SPECIAL_KEYCODE_OF{$1} // croak 'Unknown keycode';
    } else {
        $self->{keycode} = $KEYCODE_OF{$self->{map}} // croak 'Unknown keycode';
    }

    bless $self, $class;
    return $self;
}

sub from_keycode {
    my $class = shift;
    my $self = {
        keycode => shift,
        special => 0
    };

    if ($self->{map} = $SPECIAL_VINOTATION_OF{$self->{keycode}}) {
        $self->{special} = 1;
    } elsif (!($self->{map} = $VINOTATION_OF{$self->{keycode}})) {
        croak 'Unknown keycode';
    }

    bless $self, $class;
    return $self;
}

sub keycode { my $self = shift; $self->{keycode} }
sub keycode_eq {
    my ($self, $keycode) = @_;

    $keycode = [$keycode] if ref($keycode) ne 'ARRAY';
    return grep $self->keycode, @$keycode;
}

use overload 'eq' => \&streq, '==' => \&numeq, '""' => \&tostr, '0+' => \&tonum;

sub numeq {
    my ($self, $other) = @_;
    if (ref($other) eq 'Graphics::Raylib::Key') {
        $other = $other->keycode;
    }

    return $self->keycode_eq($other);
}
sub streq {
    my ($self, $other, $swapped) = @_;

    if (ref($other) ne 'Graphics::Raylib::Key') {
        $other = Graphics::Raylib::Key->from_vinotation($other);
    }

    return numeq($self, $other, $swapped);
}
sub tostr {
    my $self = shift;
    return $self->{map};
}
sub tonum {
    my $self = shift;
    return $self->keycode;
}
