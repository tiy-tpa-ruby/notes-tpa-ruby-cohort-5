Things to cover from homework
 - Implement update
 - Names of params
   - Sinatra is going to add it's own
   - We need to nest the parameters of the *thing* we are editing
     in a nested hash. See the tiysports.rb `team` update page as
     an example.
 - Edit form should have existing data pre-populated

Making an app
- Identify the `resources` we are going to work with
  - From our current TIY sports app:
    - teams
    - players
    - memberships?
- Create a URL structure to match
- Convention over configuration!

| Verb   | Path            | Action   | Used for                                                |
|--------|-----------------|----------|---------------------------------------------------------|
| GET    | /teams          | index    | Showing list of teams                                   |
| GET    | /teams/new      | new      | Showing HTML form for creating a new team               |
| POST   | /teams          | create   | Creating a new team and redirecting to listing (/teams) |
| GET    | /teams/:id      | show     | Show a specific team                                    |
| GET    | /teams/:id/edit | edit     | Show an edit page for a team                            |
| PUT    | /teams/:id      | update   | update a specific team (redirect to show                |
| DELETE | /teams/:id      | delete   | delete a specific team (redirect to listing)            |

- We have only mentioned `GET` and `POST` - how do we do `PUT` and `DELETE`
  - `use Rack::MethodOverride`
  - For non GET/POST, use `<input type="hidden" name="_method" value="delete">` style fields to allow MethodOverride to work
- Where does search belong?
  - could be an index
  - could be it's own new path
- In class lecture: convert homework to use standard paths/actions

- Flash
  - Enable flash/cookies
    - Install gem: `gem install rack-flash3`
    - Update app:
      ```
      enable :sessions
      set :session_secret, "The crow flies at midnight"

      use Rack::Flash
      ```
  - In class lecture: refactor homework to make `not found` pages and give visual feedback for delete/create

- Review activerecord
  - Add `sponsors` (name, address, phone, email)
  - Add `sponsor_id` to `teams`

# Layouts
- We can use `layouts` to reduce duplication in our templates
- We didn't cover this in class, but I'm happy to review this if you are interested
- We will cover it next week

# ActiveRecord resources

- [http://guides.rubyonrails.org/active_record_basics.html](Active Record Basics)
  - Sections 1, 2, 3, 5
- [http://guides.rubyonrails.org/active_record_querying.html](Active Record Querying)
  - Sections 1, 2, 3, 4, 5
- [http://guides.rubyonrails.org/association_basics.html](Active Record Associations)
  - Sections 1, 2

# Implement a "glossary of terms" app for TIY

## Explorer Mode
- Terms have a "name", a "definition", and an "author"
- Terms have a web link as a resource
- Terms are organized into categories
- The home page should show the "most recent 5 terms added" with links
- The home page should have a link to a list of terms sorted by name
  - Each term should be a link to a page showing the details of the term
- We should be able to see terms, make new terms, change terms, remove them, and search them
  - Figure out what pages these features should be on and how you will navigate them
- Searches should match against the name or the definition
- Categories have a name and one subject area that can be "Back End Engineering" or "Front End Engineering"
  - We should have a link from the home page to a list of categories
  - We should be able to make new categories, but not change them, delete them, or search them
- Give the app a nice design!

## Adventure Mode
- Make the terms index page _paginate_ the terms, showing only 20 terms per page
- Update terms to allow many web links
  - The term page should have a form to add a new web link
- Terms can have many comments
  - The term page should have a form to add a new comment
  - Comments have a timestamp when created (Hint: See if ActiveRecord can help)
  - Comments have a body
  - Comments have an author name

## Epic Mode
- Add a link to the homepage to show a list of categories
- Each category should be a link to a page that shows the terms for that category
  - The terms should be links to the page showing the term
  - These items should be paginated as well
- Add a link to a page showing all the terms in a format for _printing_
 - Investigate setting a special stylesheet for printing
