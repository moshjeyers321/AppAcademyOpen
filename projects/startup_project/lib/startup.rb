require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

        def initialize(name, funding, salaries)
            @name = name            #string
            @funding = funding      #int
            @salaries = salaries    #hash {"title" => salary}
            @employees = []         
        end

        def valid_title?(title)
            @salaries.each.any? { |k, v| k == title}
        end

        def >(other_startup)
            return true if self.funding > other_startup.funding
            false
        end

        def hire(name, title)
            if self.valid_title?(title)
                @employees << Employee.new(name, title)
            else
                raise "INVALID TITLE"
            end
        end

        def size
            @employees.length
        end

        def pay_employee(employee)
            if @funding > @salaries[employee.title]
                employee.pay(@salaries[employee.title])
                @funding -= @salaries[employee.title]
            else
                raise "NOT ENOUGH MONEY TO PAY #{employee.name}"
            end
        end

        def payday
            @employees.each { |employee| pay_employee(employee) }
        end

        def average_salary
            sum = 0
            @employees.each do |employee|
                sum += @salaries[employee.title]
            end
            sum / @employees.length
        end

        def close
            @employees = []
            @funding = 0
        end

        def acquire(new_startup)
            @funding += new_startup.funding
            
            new_startup.salaries.each do |k, v|
                if !valid_title?(k)
                    @salaries[k] = v
                end
            end

            @employees += new_startup.employees
            new_startup.close
        end



end
