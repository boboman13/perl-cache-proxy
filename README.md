# perl-cache-proxy

> A caching proxy, written in Perl. It is designed to proxy multiple assets from *multiple* hosts from one single host. Its intended use is for SSL -> non-secure assets, while allowing for heavy restrictions against using non-approved assets / hosts.

### Install
```bash
$ curl get.mojolicio.us | sh

$ git clone https://github.com/boboman13/perl-cache-proxy && cd perl-cache-proxy

$ morbo app.pl
```

### Usage
For this example, we'll be using the image provided by [Placekitten](http://placekitten.com).

The image we want to proxy to is by the url of `http://placekitten.com/200/300`.
![placed kitten](http://placekitten.com/200/300)

The URLs taken by the proxy are in the format of `/r/[base64 of URL]`. Since the base64 encoded version of that URL is `aHR0cDovL3BsYWNla2l0dGVuLmNvbS9nLzIwMC8zMDA=`, our URL is `/r/aHR0cDovL3BsYWNla2l0dGVuLmNvbS9nLzIwMC8zMDA=`.

On a default installation, we would access this image by going to `localhost:3000/r/aHR0cDovL3BsYWNla2l0dGVuLmNvbS9nLzIwMC8zMDA=`.

### Configuration
No configuration at the moment is present, but is planned.