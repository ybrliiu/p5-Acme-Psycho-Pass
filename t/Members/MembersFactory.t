use lib 't/lib';
use Test::Acme::PsychoPass::Base;
use aliased 'Acme::PsychoPass::Members::Members';
use aliased 'Acme::PsychoPass::Members::MembersFactory';

my $conf = do './t/conf/members.conf';
my $members;
ok lives {
  $members = MembersFactory->create_members($conf->{members});
};
isa_ok $members, Members;

done_testing;
