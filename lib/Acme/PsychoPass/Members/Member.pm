package Acme::PsychoPass::Members::Member;

use Acme::PsychoPass::Base 'Class';
use Type::Utils qw( class_type );
use Types::Standard qw( Str );
use aliased 'Acme::PsychoPass::Members::Role';
use aliased 'Acme::PsychoPass::Members::Works';
use aliased 'Acme::PsychoPass::Members::AgeList';
use aliased 'Acme::PsychoPass::Members::MemberName';

readonly name    => my %name;
readonly role    => my %role;
readonly cv      => my %cv;
readonly saying  => my %saying;
readonly works   => my %works;
private age_list => my %age_list;

method new($class:
  (class_type MemberName) :$name,
  (class_type Role) :$role,
  Str :$cv,
  Str :$saying,
  (class_type Works) :$works,
  (class_type AgeList) :$age_list
) {
  my $self = $class->Class::InsideOut::new(@_);
  $$self = id $self;
  $self;
}

method age(Str $work_name) {
  my $maybe_work = $works{$$self}->get($work_name);
  if ( defined $maybe_work ) {
    $age_list{$$self}->get($maybe_work);
  }
  else {
    die "work'${work_name}' does not exists.";
  }
}

1;
