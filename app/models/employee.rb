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
  # Employee.something = class method

  def self.find(id)
    unirest_employee = Unirest.get("#{ENV['API_URL']}/employees/#{id}.json").body
    employee = Employee.new(unirest_employee)
    return employee
  end

end
