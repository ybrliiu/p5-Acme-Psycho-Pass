package Acme::PsychoPass::Members::Age;

use Acme::PsychoPass::Base 'Class';
use Carp;
use Types::Standard qw( Int );

private num => my %num;

method new($class: Int $num) {
  Carp::croak 'Number must be positive int' if $num < 0;
  my $self = register $class;
  my $addr = id $self;
  $$self = $addr;
  $num{$addr} = $num;
  $self;
}

method as_number() {
  $num{$$self};
}

1;
