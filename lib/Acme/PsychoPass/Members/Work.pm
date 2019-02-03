package Acme::PsychoPass::Members::Work;

use Acme::PsychoPass::Base 'Class';
use Type::Utils qw( class_type );
use Types::Standard qw( Str );

use overload (
  '""'    => 'as_str',
  fallback => 1,
);

private name => my %name;

method new($class: Str $name) {
  my $self = register $class;
  my $addr = id $self;
  $$self = $addr;
  $name{$addr} = $name;
  $self;
}

method as_str() {
  $name{$$self};
}

1;
