package Acme::PsychoPass::Base;

use 5.024000;
use strict;
use warnings;
use utf8;

use parent 'Import::Base';

our @IMPORT_MODULES = (
  'strict',
  'warnings',
  'utf8',
  'feature' => [qw( :5.24 )],
  'Function::Parameters' => [qw( :std :modifiers )],
  'namespace::autoclean',
);

our %IMPORT_BUNDLES = (
  Class => [
    'Class::InsideOut' => [qw( id register private public readonly )],
    'Class::Method::Modifiers',
    'Role::Tiny::With',
  ],
  Role => [
    'Class::InsideOut' => [qw( public readonly )],
    'Role::Tiny',
    'Role::Tiny::With',
  ],
);

1;
