- Ruby style guide (https://github.com/bbatsov/ruby-style-guide)
- Ruby linter
  - https://github.com/tiy-tpa/rubocop-config
  - gem install rubocop
  - install linter and linter-rubocop

- `attr_accessor`
  - use methods instead of `@instance_var_name`
  - concept of `self` in Ruby
    - There is always a `self`, the current object
    - When a method is being called, ruby changes
      `self` to the object for the duration of the
      execution of the method, then restores it to
      the calling object when complete.
- class methods
  - Example?
  - ```
    class Dog
      def self.play_fight(dog1, dog2)
        # ...
      end
    end
    ```
- Array of objects (make some employee objects)
- case statements

- Other types of loops
  - while
  - ```
    names = ["Gavin", "Jason", "Toni"]
    i = 0
    while i < names.length do
      puts names[i]
      i += 1
    end
    ```

  - ```
    names = ["Gavin", "Jason", "Toni"]
    for name in names do
      puts name
    end

    details = { "name" => "Gavin", "score" => 100 }
    for key, value in details do
      puts "The key is #{key} and the value is #{value}"
    end
    ```
- %w(Gavin Jason Toni)
- Reading / writing files
  - gets / puts
  - STDIN/STDOUT
  - File.read("filename")
  - File.readlines("filename")

