package Acme::PsychoPass::Members::Work;

use Acme::PsychoPass::Base 'Class';
use Type::Utils qw( class_type );
use Types::Standard qw( Str );
use aliased 'Acme::PsychoPass::Members::Age';
use aliased 'Acme::PsychoPass::Members::Role';

use overload (
  '""'    => 'as_str',
  fallback => 1,
);

private name  => my %name;
readonly age  => my %age;
readonly role => my %role;

method new($class: Str :$name, (class_type Age) :$age, (class_type Role) :$role) {
  my $self = $class->Class::InsideOut::new(@_);
  $$self = id $self;
  $self;
}

method as_str() {
  $name{$$self};
}

1;
