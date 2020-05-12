
package Forum;

use strict;
use warnings;

use App::Library::Base;
use App::Library::Forum;

# Method to get permission of the user
# User with admin rights can only create a topic

sub get_permission{
	my $self = shift;
	my $user_id = $self->{user_id};
	$self->{config} =App::Library::Base->read_config() unless $self->{config};
    
	$self->{dbh} = App::Library::Base->db_connect($self->{config}) unless $self->{dbh};

    my $user_permission;
    eval {
	    $user_permission = APP::Library::Forum->get_permission($self);
	};
    if($@){
    	return $@;
    }
	return $user_permission;
}

sub set_permission{
	my $self = shift;
	my $user_id = $self->{user_id};
	$self->{config} =App::Library::Base->read_config() unless $self->{config};

	$self->{dbh} = App::Library::Base->db_connect($self->{config}) unless $self->{dbh};

    eval {
	    APP::Library::Forum->set_permission($self);
	};
	if($@){
		return $@;
	}

	return;
}

sub get_topics{
	## Here we are going to retrive all the topics from Topics table 
}

sub set_topics{
	## Here we are going to create a new topic in Topics table 
}

sub get_messages{
	# Retrive all the messages from the Message table
	# The messages will be in a  nested form.
	#$msgs = [$msg->{msg_id=>-,subject->'', topic_id->'', root_id->''}, 
	#          ------
	#        ]

	# The UI has to render data by nesting the messages under topic_id and then under root_id. 

}
sub save_message{
	#Save the messages
}