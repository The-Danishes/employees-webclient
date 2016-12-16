class Employee

  attr_accessor :id, :full_name, :email, :birthday

  def initialize(input)
    @id = input["id"]
    @full_name = input["full_name"]
    @email = input["email"]
    @birthday = input["birthday"]
  end

  def age
    birthday = DateTime.parse(@birthday)
    current_time = Time.now
    age = (current_time - birthday)/1.year
  end

  # employee = Employee.new
  # employee.something => instance method
  # Employee.something => class method

  def self.find(id)
    unirest_employee = Unirest.get("#{ENV['API_URL']}/employees/#{id}.json", headers: {"Accept" => "application/json", "Authorization" => "Token abc123", "X-User-Email" => "test@test.com"}).body
    employee = Employee.new(unirest_employee)
    return employee
  end

  def self.all
    unirest_employees = Unirest.get("#{ENV['API_URL']}/employees.json", headers: {"Accept" => "application/json", "Authorization" => "Token #{ENV['API_KEY']}", "X-User-Email" => "#{ENV['API_USER_EMAIL']}"}).body
    employees = []

    unirest_employees.each do |unirest_employee|
      employee = Employee.new(unirest_employee)
      employees << employee
    end
    return employees
  end

  def destroy
    employee = Unirest.delete("#{ENV['API_URL']}/employees/#{id}.json", headers: {"Accept" => "application/json", "Authorization" => "Token #{ENV['API_KEY']}", "X-User-Email" => "#{ENV['API_USER_EMAIL']}"})
  end

end
