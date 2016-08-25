Testing
Image upload


Homework

Team project!
- You are all on a team working to implement this homework.
- You will create a name for this application
- You will _evenly_ divide the work associated with implementing all the features
- You will present to me before Iron Pints on Friday the following:
  - Database design including your migrations and schema so far
  - Mockup/wireframes of your design, including how the application flows (Use a tool like balsamiq for mockups if you want, or old fasioned pen-and-paper is good)
- You will work in the *same* github repository as the rest of your team.
  - This will require coordination and care when pushing code
  - You *will* push code *often* as I will not accept a project that just has a large commit/push on Sunday night
  - I want to see commits landing on github throughout the weekend!
- You will push this assignment to Heroku
  - Someone on the team will be responsible for setting up the Heroku environment
  - Same person will be responsible for pushing to Heroku and ensuring that the app works in Heroku
    - This person may also be responsible for getting OAuth keys, etc.
- On Monday you will present the application to me and walk me through all the implemented features
  - You may elect a single presenter or you may present as a group (with multiple presenters)

Requirements:
- Build a house shopping app to compete with Zillow/etc.
- Use bootstrap to your advantage
  - Do use bootstrap generators if you desire.
  - However:
    - Cannot look like default bootstrap
    - Cannot look like bootstra-generators
- Should be able to register as an agent
  - Picture
  - Phone
  - Address
  - email
- Should be able to post a home for sale
  - Address
  - # of bedrooms
  - # of baths
  - square footage
  - Price
  - Description
  - Parking (None, Street Parking, Garage: attached or detached, square footage)
  - Image of house
  - Facts & Features (multiple)
  - Links (e.g. schools, etc.) (multiple)
  - Associated Agent (OPTIONAL, should support having an agent and *not* having an agent)
- Should be able to browse homes on the main page
  - Should be paginated (see kaminari gem)
  - Should be searchable
    - range of square feet (allow a min but no max, a max but no min, a min AND a max)
    - # of bedrooms (min/max)
    - # of bathrooms (min/max)
    - Price (min/max)
    - Allow a combination of all of these
- Should have to register as a user to see a home detail
  - Choose: `has_secure_password` vs. Omniauth vs. Devise
  - If Omniauth:
    - Must support *both* Facebook auth and Github auth
  - If Devise
    - Must customize (Bootstrap) all of the Devise views
- Home Details should show:
  - Picture of home
  - All details above
  - Details about the associated agent (if present)
    - Name, phone, address, email, and picture
- No home editing/deleting is required in this mode

Adventure mode:
- Users can add comments on a home's show page
  - The user who created the posting can delete comments
- Add an *edit* and *delete* home posting feature such that only the user that created the posting can access
- The posting should show the number of times the details have been edited.

Epic mode:
- Allow for multiple pictures to be associated with the home
  - Use some form of gallery/carrousel to display the images.


