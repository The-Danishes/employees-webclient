class EmployeesController < ApplicationController

  def show
    @employee = Unirest.get("http://localhost:3001/api/v1/employees/#{params[:id]}.json").body
  end


end
