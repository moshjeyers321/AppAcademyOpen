class Employee

  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    self.boss = boss
  end

  def boss=(boss)
    @boss = boss
    boss.add_employee(self) unless boss.nil?
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

end

class Manager < Employee
  attr_reader :employees

  def initialize(name, salary, title, boss = nil)
    super(name, salary, title, boss)
    @employees = []
  end

  def add_employee(subordinate)
    employees << subordinate

    subordinate
  end

  def bonus(multiplier)
    self.total_salaries * multiplier
  end

  def total_salaries
    total_salaries = 0
    self.employees.each do |employee|
      if employee.is_a?(Manager)
        total_salaries += employee.salary + employee.total_salaries
      else
        total_salaries += employee.salary
      end
    end

    total_salaries
  end


end