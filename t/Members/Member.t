use Test::Acme::PsychoPass::Base;

use aliased 'Acme::PsychoPass::Members::Role';
use aliased 'Acme::PsychoPass::Members::Work';
use aliased 'Acme::PsychoPass::Members::Works';
use aliased 'Acme::PsychoPass::Members::Age';
use aliased 'Acme::PsychoPass::Members::AgeList';
use aliased 'Acme::PsychoPass::Members::MemberName';
use aliased 'Acme::PsychoPass::Members::Member';

sub work { Work->new(@_) }

sub age {
  my ($work_name, $age_num) = @_;
  Age->new( work($work_name), $age_num );
}

my $member = Member->new(
  name     => MemberName->new( '狡噛慎也', 'こうがみしんや' ),
  role     => Role->new('執行官'),
  cv       => '関智一',
  works    => Works->new([ work('アニメ1期'), work('劇場版') ]),
  age_list => AgeList->new([ age('アニメ1期', 28), age('劇場版', 32) ]),
  saying   => 'いや…、二度とゴメンだね',
);
isa_ok $member, Member;

subtest age => sub {

  subtest '登場作品の年齢' => sub {
    my $age;
    ok lives { $age = $member->age('アニメ1期') };
    isa_ok $age, Age;
    is $age->as_number, 28;
  };

  subtest '登場していない作品の年齢' => sub {
    ok(my $e = dies { $member->age('アニメ2期') });
    like $e, qr/^work'アニメ2期' does not exists/;
  };

};

done_testing;
