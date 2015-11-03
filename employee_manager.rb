require 'byebug'

class Employee
  attr_reader :salary, :name
  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
  def bonus(multiplier)
    bonus = salary * multiplier
  end
  def boss=(manager)
    boss = manager
    boss.people_managed << self
  end

end

class Manager < Employee
  attr_accessor :people_managed
  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @people_managed = []
  end

  def bonus(multiplier)
    queue = self.people_managed
    salary_sum = 0
    until queue.empty?
      employee = queue.shift
      salary_sum = salary_sum + employee.salary
      # debugger
      queue.concat(employee.people_managed) if employee .is_a?(Manager)
    end
    salary_sum * multiplier
  end

end

ned = Manager.new('ned', 'founder', 1000000)
darren = Manager.new('daren', 'TA Manager', 78000)
shawna = Employee.new('shawna', 'ta', 12000)
david = Employee.new('david', 'ta', 10000)

darren.boss = ned
shawna.boss = darren
david.boss = darren

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
