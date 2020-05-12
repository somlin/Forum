package App::Library::Base;

use strict;
use warnings;

use DBI;
use XML::Simple; 

#our $config;

Constant $FILENAME = '../Config.xml';

sub read_config{
	#my $self = shift;
	my $config = XMLin($FILENAME, ForceArray => 1); 
	return $config;
}

sub db_connect {
	my $config;
	my $dsn = "DBI:mysql:database=$config->{dbname};host=$config->{dbhost}";
	
	#Connect
	my $dbh = DBI->connect($dsn, $config->{dbuser}, $config->{dbpass});
	
#	die "failed to connect to MySQL database:DBI->errstr()" unless($dbh);

	return $dbh;
}

