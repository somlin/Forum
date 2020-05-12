package App::Library::Forum;

use strict;
use warnings;

use App::Library::Base;

sub get_permission{
	my $self = shift;

	my $user_id = $self->{user_id};
	my $dbh = $self->{dbh};
    #my $data = App::Library::Base->get_permission($user_id);
    
    #SQL execute
	my $sth = $dbh->prepare('SELECT * FROM contact_info WHERE user_id = ?'); 
	
	my $user_permission;
	$sth->execute($user_id);
	 
    while (my $data = $sth->fetchrow_hashref()) {
        $user_permission = $data->{permission};
    }
    $sth->finish;

    return $user_permission;
}

sub set_permission{
	my $self = shift;

	my $user_id = $self->{user_id};
	my $permission = $self->{permission};
	my $dbh = $self->{dbh};
    #my $data = App::Library::Base->get_permission($user_id);
    
    #SQL execute
	my $sth = $dbh->prepare('UPDATE contact_info SET permission = ? WHERE user_id = ?'); 
	
	my $user_permission;
	$sth->execute($permission, $user_id);
	 
    $sth->finish;

    return;
}

sub get_topics{
	## Here we are going to retrive all the topics from Topics table 
}

sub set_topics{
	## Here we are going to insert a new topic in Topics table 
}

sub get_messages{
	# Retrive all the messages from the Message table
	 

}
sub save_message{
	#Save the message
}
