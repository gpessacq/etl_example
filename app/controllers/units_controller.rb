require 'etl'
class UnitsController < ApplicationController
  before_action :set_unit, only: [:show]

  def index
    organizer_call = EtlService.call(base_url: ENV['BASE_URL'])
    if organizer_call.failure?
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
