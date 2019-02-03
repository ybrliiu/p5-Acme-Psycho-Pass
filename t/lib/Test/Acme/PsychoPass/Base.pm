package Test::Acme::PsychoPass::Base;

use 5.024004;
use strict;
use warnings;
use utf8;

use parent 'Import::Base';

our @IMPORT_MODULES = (
  'strict',
  'warnings',
  'utf8',
  'feature' => [qw( :5.24 )],
  'Test2::V0',
);

1;
