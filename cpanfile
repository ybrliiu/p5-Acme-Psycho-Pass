requires 'perl', '5.024000';
requires 'Import::Base', '1.004';
requires 'namespace::autoclean', '0.28';
requires 'Class::InsideOut', '1.14';
requires 'Role::Tiny', '2.000006';
requires 'Function::Parameters', '2.001003';
requires 'Type::Tiny', '1.004002';

on 'test' => sub {
  requires 'Test2::Suite', '0.000118';
  requires 'Test::LoadAllModules', '0.022';
  requires 'Test::Perl::Critic', '1.04';
};

on 'develop' => sub {
  requires 'Perl::Critic', '1.132';
};
