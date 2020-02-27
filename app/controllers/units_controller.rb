class UnitsController < ApplicationController
  before_action :set_unit, only: [:show]

  def index
    # Extract
    @stream = JSON.parse(unit_api_call)
    # Transform
    @clean_units = clean_units_from_api(@stream)
    # # Load
    insert_units(@clean_units)
    # Display
    @units = Unit.all
  end

  def show
  end

  private

  def set_unit
    @unit = Unit.find(params[:id])
  end

  def unit_api_call
    begin
      result = RestClient.get("#{ENV['API_SERVER']}/units.json", {accept: :json})
    rescue
      logger.info "***>>> Error calling the unit API @: #{ENV['API_SERVER']}/index.json"
      result = nil
    end
  end

  def clean_units_from_api(stream)
    unless stream.blank?
      stream.each do |line|
        line["area"] = (line["area"] * 3.28).round(2)
        line["uom"] = "feet"
      end
    end
    stream
  end

  def insert_units(clean_units)
    clean_units.each do |clean_unit|

      attributes = Hash.new
      attributes = {
        price: clean_unit["price"],
        description: clean_unit["description"],
        area: clean_unit["area"],
        uom: clean_unit["uom"]
      }

      Unit.update_or_create_by({ name: clean_unit["name"] }, attributes: attributes)
    end
  end
end
