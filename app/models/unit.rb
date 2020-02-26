class Unit < ApplicationRecord
  validates :name, uniqueness: true

  private

    def self.update_or_create_by(args, attributes)
      obj = self.find_or_create_by(args)
      obj.update(attributes)
      return obj
    end
end
