class Unit < ApplicationRecord
  validates :name, uniqueness: true

  private

    # Method borrowed from stack overflow to work around the lack of this helper in 
    # Rails 5
    def self.update_or_create_by(args, attributes)
      obj = self.find_or_create_by(args)
      obj.update(attributes)
      return obj
    end
end
