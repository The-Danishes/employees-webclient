class Employee

  attr_accessor :id, :full_name, :email, :birthday

  def initialize(input)
    @id = input["id"]
    @full_name = input["full_name"]
    @email = input["email"]
    @birthday = input["birthday"]
  end

end
