class InsertUnits
  extend LightService::Action

  expects :result

  executed do |context|
    context.result.each do |clean_unit|
      attributes = Hash.new
      attributes = {
        price: clean_unit["price"],
        description: clean_unit["description"],
        area: clean_unit["area"],
        uom: clean_unit["uom"]
      }
      # I couldn't find a native way to do an update_or_create in Rails 5
      # so I created a class method in Unit.rb (borrowed from Stack overflow...)
      Unit.update_or_create_by({ name: clean_unit["name"] }, attributes: attributes)
    end
  end
end