use Test::Acme::PsychoPass::Base;

use aliased 'Acme::PsychoPass::Members::Role';
use aliased 'Acme::PsychoPass::Members::Work';
use aliased 'Acme::PsychoPass::Members::Works';
use aliased 'Acme::PsychoPass::Members::Age';
use aliased 'Acme::PsychoPass::Members::MemberName';
use aliased 'Acme::PsychoPass::Members::Member';

my $member = Member->new(
  name     => MemberName->new( '狡噛慎也', 'こうがみしんや' ),
  cv       => '関智一',
  works    => Works->new([
    Work->new(
      name => 'アニメ1期',
      age  => Age->new(28),
      role => Role->new('執行官'),
    ),
    Work->new(
      name => '劇場版',
      age  => Age->new(32),
      role => Role->new('潜在犯'),
    ),
  ]),
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

subtest role => sub {

  subtest '登場作品における役割' => sub {
    my $role;
    ok lives { $role = $member->role('アニメ1期') };
    isa_ok $role, Role;
    is $role->as_str, '執行官';
  };

  subtest '登場していない作品での役割' => sub {
    ok(my $e = dies { $member->role('アニメ2期') });
    like $e, qr/^work'アニメ2期' does not exists/;
  };

};

done_testing;
