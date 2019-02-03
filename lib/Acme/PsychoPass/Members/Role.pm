package Acme::PsychoPass::Members::Role;

use Acme::PsychoPass::Base 'Class';
use Type::Utils qw( enum );
use Types::Standard qw( Str );

use constant ROLES => [qw(
  監視官
  執行官
  潜在犯
  免罪体質者
)];

private role_name => my %role_name;

method new($class: (enum ROLES) $role_name) {
  my $self = register $class;
  my $addr = id $self;
  $$self = $addr;
  $role_name{$addr} = $role_name;
  $self;
}

method as_str() {
  $role_name{$$self};
}

1;
