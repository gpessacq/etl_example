class UnitsController < ApplicationController
  before_action :set_unit, only: [:show]

  def index

    organizer_call = Etl.call(api_server: ENV['API_SERVER'])
    if organizer_call.failure?
      logger.info "**** There was a problem in the ETL process"
      render :index, notice: "There was a problem in the ETL process"
    else
      @units = Unit.all
      render :index, notice: "ETL process executed correctly"
    end  
  end

  def show
  end

  private

  def set_unit
    @unit = Unit.find(params[:id])
  end

end
