- WEBrick
  - mount proc

- Sinatra
  - http://www.sinatrarb.com/intro.html
  - converted web.rb to web_sinatra.rb
    - removed webrick library
    - changed `mount` and `mount_proc` to `get '/' do` (etc)
    - Moved code from `do_GET` into the `do / end` blocks
    - Moved HTML code into `views` directory and named `home.erb` etc
    - Used Sinatra's `erb :template_name_goes_here` to automatically render templates
    - Converted `request.query["color"]` to `params["color"]`
    - Converted local variables to instance variables so sinatra works
  - `gem install sinatra-contrib` gives us automatic ruby code reloading via
    ```
    if development?
      require 'sinatra/reloader'
    end
    ```
  - `require` vs `require_relative`

- Enumerable
  - [practice](https://github.com/tiy-tpa-rails-q2-2015/green_eggs_and_ham)


- Data formats
  - JSON
  - YAML
  - XML
