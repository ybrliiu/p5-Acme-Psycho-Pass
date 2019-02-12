use lib 't/lib';
use Test::Acme::PsychoPass::Base;
use Test::Perl::Critic ( -profile => 't/perlcriticrc' );

all_critic_ok();
