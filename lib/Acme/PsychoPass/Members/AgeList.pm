package Acme::PsychoPass::Members::AgeList;

use Acme::PsychoPass::Base 'Class';
use Carp;
use Type::Utils qw( class_type );
use Types::Standard qw( ArrayRef );
use aliased 'Acme::PsychoPass::Members::Age';
use aliased 'Acme::PsychoPass::Members::Work';

private age_list     => my %age_list;
private age_list_map => my %age_list_map;

method new($class: (ArrayRef[ class_type Age ]) $age_list) {
  my $self = register $class;
  my $addr = id $self;
  $$self = $addr;
  $age_list{$addr} = $age_list;
  $self;
}

my $age_list_map = method() {
  $age_list_map{$$self} //= +{ map { $_->as_str() => $_ } $age_list{$$self}->@* };
};

method get((class_type Work) $work) {
  $self->$age_list_map()->{ $work->as_str() } // die 'Age does not exists.';
}

1;
