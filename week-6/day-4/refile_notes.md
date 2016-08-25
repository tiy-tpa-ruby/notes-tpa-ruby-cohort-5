- Follow the [guide](https://github.com/refile/refile)
  - Add the gem to Gemfile:
    `gem "refile", require: "refile/rails"`
  - NOTE: We would also add:
    `gem "refile-mini_magick"`
    But we can't since there is a version mismatch issue
  - Add an `attachment` call to our model (in class this was `player.rb`)
    `attachment :profile_image`
  - Generate a migration (NOTE, `profile_image_id` is a string, *NOT* an integer)
    NOTE: in this case we are adding to `players` but this would be whatever model
    you are using
    `rails generate migration add_profile_image_to_players profile_image_id:string`
    `rails db:migrate`
  - Add an attachment field to your form:
    `<%= f.attachment_field :profile_image %>`
  - Add `profile_image` to the strong parameters in the controller
  - Uploading works!
  - Add something to the `show` view to see the image:
    `<%= image_tag attachment_url(@player, :profile_image)`
  - If we had `refile-mini_magick` working we could do:
    `<%= image_tag attachment_url(@player, :profile_image, :fill, 300, 300)`
