package Acme::PsychoPass::Members::Works;

use Acme::PsychoPass::Base 'Class';
use Carp;
use Type::Utils qw( class_type );
use Types::Standard qw( Str ArrayRef );
use aliased 'Acme::PsychoPass::Members::Work';

use overload (
  '@{}'    => 'as_array_ref',
  fallback => 1,
);

private works     => my %works;
private works_map => my %works_map;

method new($class: (ArrayRef[ class_type Work ]) $works) {
  my $self = register $class;
  my $addr = id $self;
  $$self = $addr;
  $works{$addr} = $works;
  $self;
}

my $works_map = method() {
  $works_map{$$self} //= +{ map { $_->as_str() => $_ } $works{$$self}->@* };
};

method get(Str $work_name) {
  $self->$works_map()->{$work_name} // die "work'$work_name' does not exists.";
}

method as_array_ref() {
  $works{$$self};
}

1;
