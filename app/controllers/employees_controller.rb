class EmployeesController < ApplicationController

  def show
    @employee = Employee.find(params[:id])
  end

  def index
    unirest_employees = Unirest.get("#{ENV['API_URL']}/employees.json").body
    @employees = []

    unirest_employees.each do |unirest_employee|
      employee = Employee.new(unirest_employee)
      @employees << employee
    end
  end

  def new
  end

  def create
    input_first_name = params[:first_name]
    input_last_name = params[:last_name]
    input_email = params[:email]

    @employee = Unirest.post("#{ENV['API_URL']}/employees", 
              parameters: {first_name: input_first_name, last_name: input_last_name, email: input_email},
              headers: {"Accept" => "application/json"}).body

    # redirect_to "/employees/#{@employee['id']}"
    redirect_to employee_path(@employee["id"])
  end

end
