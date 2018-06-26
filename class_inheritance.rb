class Employee
attr_reader :name, :boss, :title, :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    salary * multiplier
  end

end

class Manager < Employee
  attr_reader :direct_reports

  def initialize(name, title, salary, boss, direct_reports)
    super(name, title, salary, boss)
    @direct_reports = direct_reports
  end

  def bonus(multiplier)
    total_salary = 0
    direct_reports.each do |emp|
      total_salary  += emp.salary
    end
    total_salary * multiplier
  end
end
