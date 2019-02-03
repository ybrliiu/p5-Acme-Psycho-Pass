package Acme::PsychoPass::Members::MemberName;

use Acme::PsychoPass::Base 'Class';
use Types::Standard qw( Str );

private name          => my %name;
private pronunciation => my %pronunciation;

method new($class: Str $name, Str $pronunciation) {
  my $self = register $class;
  my $addr = id $self;
  $$self = $addr;
  $name{$addr}          = $name;
  $pronunciation{$addr} = $pronunciation;
  $self;
}

method as_str() {
  $name{$$self}
}

method as_pronunciation() {
  $pronunciation{$$self};
}

1;
