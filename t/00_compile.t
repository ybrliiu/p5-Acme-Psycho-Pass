use lib 't/lib';
use Test::Acme::PsychoPass::Base;
use Test::LoadAllModules;

all_uses_ok(search_path => 'Acme::PsychoPass');

done_testing;

