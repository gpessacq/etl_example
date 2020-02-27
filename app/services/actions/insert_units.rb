class Actions::InsertUnits
  extend LightService::Action

  expects :result
  # promises :result

  executed do |context|
    context.result.each do |clean_unit|
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