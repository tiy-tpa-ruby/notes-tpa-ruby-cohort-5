# Why do we use classes?

# To combine data and behavior together

# Compare this class to having to pass variables (data) to methods (behavior) below

class Employee
  attr_accessor :name, :title, :salary

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
  end

  def greeting
    "#{@name} is a #{@title} who is paid #{@salary}"
  end

  def monthly_check
    @salary/12
  end
end

employee_1 = Employee.new("Gavin", "Instructor", 1_000_000)
employee_2 = Employee.new("Jason", "Instructor", 2_000_000)

puts employee_1.monthly_check


# Data and behavior separate
employee_1_name = "Gavin"
employee_1_title = "Instructor"
employee_1_salary = 1_000_000

employee_2_name = "Jason"
employee_2_title = "Instructor"
employee_2_salary = 2_000_000

def greeting(name, title, salary)
  puts "#{name} is a #{title} and is paid #{salary}"
end

def monthly_check(salary)
  return salary/12
end
