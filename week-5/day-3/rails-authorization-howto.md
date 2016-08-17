# Simple Authentication with Bcrypt

## Steps

1. Create a user model with `name`, `email` and `password_digest` with: `rails generate model user name email password_digest`

2. Run `rake db:migrate`

3. Add these routes below

    ```ruby
    # Path: config/routes.rb

    Something::Application.routes.draw do
      get '/signup' => 'users#new'
      post '/users' => 'users#create'
    end
    ```

4. Create a users controller with a new and create action:

    ```ruby
    # Path: app/controllers/users_controller.rb

    class UsersController < ApplicationController
      def new
        @user = User.new
      end

      def create
        user = User.new(user_params)
        if user.save
          session[:user_id] = user.id
          redirect_to root_path
        else
          redirect_to signup_path
        end
      end   

    private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
    end
    ```

5. Now create the view file where we put the signup form.

    ```HTML+ERB
    <!-- Path: app/views/users/new.html.erb -->

    <h1>Signup!</h1>

    <%= form_for(@user) do |f| %>
      Name: <%= f.text_field :name %>
      Email: <%= f.text_field :email %>
      Password: <%= f.password_field :password %>
      Password Confirmation: <%= f.password_field :password_confirmation %>
      <%= f.submit "Submit" %>
    <% end %>
    ```

6. Uncomment 'bcrypt' in the Gemfile

7. Add `has_secure_password` to add encryption of the user's password

    ```ruby

    # Path: app/models/user.rb

    class User < ActiveRecord::Base
      has_secure_password
    end
    ```

8. Run `bundle install`

9. Create a sessions controller to `create` (login) and `destroy` (logout) sessions.

    ```ruby
    # Path: app/controllers/session_controller.rb

    class SessionController < ApplicationController
      # logging in
      def new
      end

      # handle the post from the login page
      def create
        # Extract the email and password from the params
        email = params[:email]
        password = params[:password]

        # Find the user by their email
        user = User.find_by(email: email)

        # If we found a user and their password checks out
        if user && user.authenticate(password)
          # Save the user_id in the session cookie
          session[:user_id] = user.id

          # logged in!
          redirect_to root_path
        else
          # Nope, something went wrong
          redirect_to login_path
        end
      end

      # logout
      def destroy
        # Remove their user_id from the session
        session[:user_id] = nil
        redirect_to root_path
      end
    end
    ```

10. Create a form for user's to login with.

    ```HTML+ERB

    <!-- path: app/views/session/new.html.erb -->

    <h1>Login</h1>

    <%= form_tag login_path do %>
      Email: <%= text_field_tag :email %>
      Password: <%= password_field_tag :password %>
      <%= submit_tag "Submit" %>
    <% end %>
    ```

11. Update your routes file to include new routes for the session controller.

    ```ruby
    # Path: config/routes.rb

    Something::Application.routes.draw do
      get '/login' => 'session#new'
      post '/login' => 'session#create'
      get '/logout' => 'session#destroy'
    end
    ```

12. We will add a few methods to the ApplicationController to allow us to find the current user.

    ```ruby
    # Path: app/controllers/application_controller.rb

    class ApplicationController < ActionController::Base
      # Returns the current use if logged in
      def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end
      helper_method :current_user

      # Returns a boolean representing if the user is logged in
      def logged_in?
        !!current_user
      end
      helper_method :logged_in?

      # Method to use in a filter to ensure the user is logged in  
      def authorize!
        redirect_to login_path unless logged_in?
      end
    end
    ```

13. Now we can add a `before_filter` to ensure we authorize the user. We *could* add this to the ApplicationController but then we would have to *exclude* this from controllers that do *not* require login (e.g. user controller, session controller, homepage controller, etc.)

    ```ruby
    # path: app/controller/widgets_controller.rb

    # This is just an example controller, you would add this to your *own* controller files
    class WidgetsController < ApplicationController
      before_filter :authorize!
    end
    ```

14. We can use the `current_user` and `logged_in?` methods to customize pages, even the appliction layout file

    ```HTML+ERB

    <!-- Path: app/views/layouts/application_layout.html.erb -->
    <!DOCTYPE html>
    <html>
    <head>
      <title>Something</title>
      <%= csrf_meta_tags %>
      <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
      <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
      <%= csrf_meta_tags %>
    </head>
    <body>
    <% if logged_in? %>
      Logged in: <%= current_user.email %> | <%= link_to "Logout", logout_path %>
    <% else %>
      <%= link_to 'Login', login_path %> | <%= link_to 'Signup', signup_path %>
    <% end %>
      <%= yield %>
    </body>
    </html>
    ```
