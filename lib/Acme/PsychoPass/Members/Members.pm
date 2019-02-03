package Acme::PsychoPass::Members::Members;

use Acme::PsychoPass::Base 'Class';
use Type::Utils qw( class_type );
use Types::Standard qw( ArrayRef Str );
use aliased 'Acme::PsychoPass::Members::Member';

private members => my %members;

method new($class: (ArrayRef[ class_type Member ]) $members) {
  my $self = register $class;
  my $addr = id $self;
  $$self = $addr;
  $members{$addr} = $members;
  $self;
}

method get_members_by_work_name(Str $work_name) {
  [ grep { defined $_->works->get($work_name) } $members{$$self}->@* ];
}

method all_members() {
  $members{$$self};
}

1;
