use strict;
use warnings;

use Test::More tests => 10;
use Test::NoWarnings 1.04 ':early';
use overload ();

use lib 't/lib';

BEGIN { use_ok('SomeClass') }

ok(SomeClass->meta->does_role('Role'));

ok(overload::Overloaded('Role'));
ok(overload::Overloaded('SomeClass'));
ok(overload::Method('Role', q{""}));
ok(overload::Method('SomeClass', q{""}));

my $foo = SomeClass->new({ message => 'foo' });
isa_ok($foo, 'SomeClass');
is($foo->message, 'foo');

my $str = "${foo}";
is($str, 'foo');

