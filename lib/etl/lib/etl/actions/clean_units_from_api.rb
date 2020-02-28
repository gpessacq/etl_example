class CleanUnitsFromApi
  extend LightService::Action

  expects :result
  promises :result

  executed do |context|
    unless context.result.blank?
      # Just an example change of the received data to account for the eTl
      context.result.each do |line|
        line["area"] = (line["area"] * 3.28).round(2)
        line["uom"] = "feet"
      end
    end
  end
end