package Acme::PsychoPass::Base;

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
  'Function::Parameters',
  'namespace::autoclean',
);

our %IMPORT_BUNDLES = (
  Class => [
    'Class::InsideOut' => [qw( register id private )],
  ],
  Role => [qw( Role::Tiny )],
);

1;
