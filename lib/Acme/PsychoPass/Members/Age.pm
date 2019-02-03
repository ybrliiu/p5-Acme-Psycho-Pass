package Acme::PsychoPass::Members::Age;

use Acme::PsychoPass::Base 'Class';
use Carp;
use Type::Utils qw( class_type );
use Types::Standard qw( Int );
use aliased 'Acme::PsychoPass::Members::Work';

private num  => my %num;
private work => my %work;

method new($class: (class_type Work) $work, Int $num) {
  Carp::croak 'Number must be positive int' if $num < 0;
  my $self = register $class;
  my $addr = id $self;
  $$self = $addr;
  $work{$addr} = $work;
  $num{$addr}  = $num;
  $self;
}

method as_str() {
  $work{$$self}->as_str();
}

method as_number() {
  $num{$$self};
}

1;
