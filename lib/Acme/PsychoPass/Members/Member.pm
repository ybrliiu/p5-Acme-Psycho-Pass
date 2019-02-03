package Acme::PsychoPass::Members::Member;

use Acme::PsychoPass::Base 'Class';
use Type::Utils qw( class_type );
use Types::Standard qw( Str );
use aliased 'Acme::PsychoPass::Members::Role';
use aliased 'Acme::PsychoPass::Members::Works';
use aliased 'Acme::PsychoPass::Members::MemberName';

readonly name    => my %name;
readonly cv      => my %cv;
readonly saying  => my %saying;
readonly works   => my %works;

method new($class:
  (class_type MemberName) :$name,
  Str :$cv,
  Str :$saying,
  (class_type Works) :$works,
) {
  my $self = $class->Class::InsideOut::new(@_);
  $$self = id $self;
  $self;
}

method age(Str $work_name) {
  my $work = $works{$$self}->get($work_name);
  if ( defined $work ) {
    $work->age;
  }
  else {
    die "work'${work_name}' does not exists.";
  }
}

method role(Str $work_name) {
  my $work = $works{$$self}->get($work_name);
  if ( defined $work ) {
    $work->role;
  }
  else {
    die "work'${work_name}' does not exists.";
  }
}

1;
