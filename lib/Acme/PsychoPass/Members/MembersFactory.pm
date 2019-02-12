package Acme::PsychoPass::Members::MembersFactory;

use Acme::PsychoPass::Base 'Class';
use Types::Standard qw( ArrayRef HashRef );
use aliased 'Acme::PsychoPass::Members::Role';
use aliased 'Acme::PsychoPass::Members::Work';
use aliased 'Acme::PsychoPass::Members::Works';
use aliased 'Acme::PsychoPass::Members::Age';
use aliased 'Acme::PsychoPass::Members::MemberName';
use aliased 'Acme::PsychoPass::Members::Member';
use aliased 'Acme::PsychoPass::Members::Members';

method create_work($class: HashRef $work_data) {
  Work->new(
    name => $work_data->{work_name},
    age  => Age->new($work_data->{age}),
    role => Role->new($work_data->{role}),
  );
}

method create_member($class: HashRef $member_data) {
  Member->new(
    name     => MemberName->new($member_data->{name}{name}, $member_data->{name}{pronunciation}),
    cv       => $member_data->{cv},
    works    => Works->new([ map { $class->create_work($_) } $member_data->{works}->@* ]),
    saying   => $member_data->{saying},
  );
}

method create_members($class: ArrayRef[HashRef] $members_data) {
  my @members = map { $class->create_member($_) } @$members_data;
  Members->new(\@members);
}

1;
