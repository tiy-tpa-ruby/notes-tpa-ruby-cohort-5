# Types of apps

- Types of apps we do:
  - CRUD
    - Create
    - Read
    - Update
    - Delete
  - TIY database homework
    - Create => add
    - Read => search (kinda)
    - Update => Didn't do
    - Delete => delete

# Generating dynamic output (in this case HTML)

- ERB
  - Like mail merge, but better
  - Allows us to evaluate Ruby code inside of a `template`
  - ERB allows for `loops`! (where string interpolation like `#{name}` does not)

Example:
```
require 'erb'
name = "Gavin"
favorite_color = "Blue"

template = ERB.new("Person <%= @name %> has a favorite color of <%= @favorite_color %>")
output = template.result(binding)
puts output
# =>  Person Gavin has a favorite color of Blue
```

```
require 'erb'
array = [1,7,42,"Gavin"]
template = ERB.new(%{the numbers are: <% array.each do |number| %> The number is <%= number %> <% end %> Thanks for playing})
output = template.result(binding)
puts output
# =>  the numbers are:  The number is 1  The number is 7  The number is 42  The number is Gavin  Thanks for playing"
```

Sample code:
- code.rb => Very simple, incomplete, TIY Database that uses string interpolation to generate HTML into files
- code_erb.rb => Same TIY Database but uses ERB template (read from a file `template.html.erb`)

ERB Templates:
- Usually in files
- Usually have an extension like `.html.erb` -- Tells Atom or a user that this is
  an HTML file, but with ERB superpowers.

# Basic Internet

- How does the internet work:
  - https://www.youtube.com/watch?v=7_LPdttKXPc
- Full details of what happens from the time you type in "google.com" until the google homepage is displayed (under constant improvement)
  - https://github.com/alex/what-happens-when
- Neat description of how DNS (turns google.com into 64.233.176.100 that the internet understands) from the domain and DNS provider: dnsimple.com
  - https://howdns.works/
- HTTP Status codes
  - http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html
  - Funny:
    - http://httpstatusdogs.com
    - http://http.cat
- telnet to server
  ```
  telnet gstark.com 80
  GET / HTTP/1.1
  Host: gstark.com

  ```

  This will show my super cool styled homepage!

# httpie
- brew install httpie
- http gstark.com
  - Shows what headers and body the web request sends back
  - great for debugging
- Try `http HOSTNAME` to some of your favorite sites and see what comes back!

# Webrick (Running our own web server
- Good introduction to `WEBrick`
  - https://www.igvita.com/2007/02/13/building-dynamic-webrick-servers-in-ruby/
- `web.rb` the simple people tracking app we built in class today
