# perl cache proxy

use strict;
use warnings;

use Mojolicious::Lite;
use MIME::Base64;
use WWW::Curl::Easy;

# /r for resource
# /r/:url
#   http://placekitten.com/200/300
#   /r/aHR0cDovL3BsYWNla2l0dGVuLmNvbS9nLzIwMC8zMDA=
get '/r/:url' => sub {
	my $c = shift;
	# url is encoded with base64
	my $encoded_url = $c->stash('url');

	my $url = decode_base64($encoded_url);

	# retrieve asset
	my $curl = WWW::Curl::Easy->new;
	$curl->setopt(CURLOPT_HEADER, 0);
	$curl->setopt(CURLOPT_URL, $url);

	# log
	print("Accessing $url\n");

	# go
	my $response_body;
	$curl->setopt(CURLOPT_WRITEDATA, \$response_body);

	my $response_code = $curl->perform;

	# check response code, render text / print error
	if ($response_code == 0) {
		# content type
		my $content_type = $curl->getinfo(CURLINFO_CONTENT_TYPE);

		$c->res->headers->content_type($content_type);
		$c->res->body($response_body);
		$c->rendered(200);
	} else {
		$c->render(text => 'Issue loading asset.');
	}
};

app->start;
