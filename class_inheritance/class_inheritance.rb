require 'byebug'

class Employee 
  attr_reader :salary, :name
  
  def initialize(name, title, salary, boss = nil) 
    @name = name
    @title = title 
    @salary = salary
    boss.add_employee(self) unless boss.nil?
    @boss = boss
  end 
  
  def bonus(multiplier)
    @salary * multiplier
  end 
end 

class Manager < Employee
  attr_reader :employees
  
  def initialize(name, title, salary, boss = nil) 
    super(name, title, salary, boss) 
    @employees = []
  end 
  
  def bonus(multiplier)
    total_salary * multiplier
  end
  
  def total_salary
    return self.salary unless self.is_a?(Manager)
    byebug
    self.employees.reduce(0) do |total, employee|
      total += employee.salary
      total += employee.total_salary unless employee.is_a?(Employee)
    end 
  end 
  
  def add_employee(employee)
    @employees << employee
  end 
end 

ned = Manager.new("Ned", "Founder", 1_000_000)
# byebug
darren = Manager.new("Darren", "TA Manager", 78_000, ned)
shawna = Employee.new("Shawna", "TA", 12_000, darren)
david = Employee.new("David", "TA", 10_000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000