use Test::Acme::PsychoPass::Base;
use aliased 'Acme::PsychoPass::Members::Members';
use aliased 'Acme::PsychoPass::Members::MembersFactory';

my $conf = do './t/conf/members.conf';
my $members = MembersFactory->create_members($conf->{members});

subtest get_members_by_work_name => sub {
  my $m1 = $members->get_members_by_work_name('アニメ1期');
  is @$m1, 1;
  my $m2 = $members->get_members_by_work_name('アニメ3期');
  is @$m2, 0;
};

subtest get_all_members => sub {
  my $all = $members->all_members;
  is @$all, 1;
};

done_testing;
