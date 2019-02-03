package Acme::PsychoPass::Members::MembersFactory;

use Acme::PsychoPass::Base 'Class';
use Types::Standard qw( ArrayRef HashRef );
use aliased 'Acme::PsychoPass::Members::Role';
use aliased 'Acme::PsychoPass::Members::Work';
use aliased 'Acme::PsychoPass::Members::Works';
use aliased 'Acme::PsychoPass::Members::Age';
use aliased 'Acme::PsychoPass::Members::AgeList';
use aliased 'Acme::PsychoPass::Members::MemberName';
use aliased 'Acme::PsychoPass::Members::Member';
use aliased 'Acme::PsychoPass::Members::Members';

fun age($data) {
  Age->new( Work->new($data->{work_name}), $data->{age} );
}

method create_member($class: HashRef $member_data) {
  Member->new(
    name     => MemberName->new($member_data->{name}{name}, $member_data->{name}{pronunciation}),
    role     => Role->new($member_data->{role}),
    cv       => $member_data->{cv},
    works    => Works->new([ map { Work->new($_) } $member_data->{works}->@* ]),
    age_list => AgeList->new([ map { age($_) } $member_data->{age_list}->@* ] ),
    saying   => $member_data->{saying},
  );
}

method create_members($class: ArrayRef[HashRef] $members_data) {
  my @members = map { $class->create_member($_) } @$members_data;
  Members->new(\@members);
}

1;
