#
# This is an example VCL file for Varnish.
#
# It does not do anything by default, delegating control to the
# builtin VCL. The builtin VCL is called when there is no explicit
# return statement.
#
# See the VCL chapters in the Users Guide at https://www.varnish-cache.org/docs/
# and http://varnish-cache.org/trac/wiki/VCLExamples for more examples.

# Marker to tell the VCL compiler that this VCL has been adapted to the
# new 4.0 format.
vcl 4.0;

import std;

# Default backend definition. Set this to point to your content server.
backend default {
    .host = "127.0.0.1";
    .port = "8080";
}

sub vcl_recv {
	# Happens before we check if we have this in cache already.
	#
	# Typically you clean up the request here, removing cookies you don't need,
	# rewriting the request, etc.

	return (hash);
}

sub vcl_hash {
        hash_data(req.url);
        hash_data(req.http.host);

        return(lookup);
}

sub vcl_backend_response {
    	# Happens after we have read the response headers from the backend.
    	#
    	# Here you clean the response headers, removing silly Set-Cookie headers
	# and other mistakes your backend does.
	if (beresp.http.Cache-Control ~ "max-age=" ) {
		set beresp.http.Expires = "" + (now + std.duration(regsub(beresp.http.Cache-Control,"max-age=([0-9]+).*$","\1")+"s", 0s));
	}

	if (beresp.status >= 400) {
		set beresp.ttl = 0s;
	}
}

sub vcl_deliver {
    	# Happens when we have all the pieces we need, and are about to send the
    	# response to the client.
    	#
    	# You can do accounting or modifying the final object here.
	if (resp.http.Cache-Control ~ "max-age=" ) {
		set resp.http.X-Max-Age = std.integer(regsub(resp.http.Cache-Control,"max-age=([0-9]+).*$","\1"), 0)/2;
		set resp.http.Cache-Control = regsub(resp.http.Cache-Control,"max-age=([0-9]+).*$","max-age="+resp.http.X-Max-Age);
		set resp.http.Expires = "" + (now + std.duration(regsub(resp.http.Cache-Control,"max-age=([0-9]+).*$","\1")+"s", 0s));
		unset resp.http.X-Max-Age;
	}
	if (resp.http.Age) {
		set resp.http.Age-Low = resp.http.Age;
		unset resp.http.Age;
	}

	# header pour hit/miss
	if (obj.hits > 0) {
		set resp.http.X-Cache-Low = "HIT "+ obj.hits;
	} else {
		set resp.http.X-Cache-Low = "MISS";
	}
	return(deliver);
}
