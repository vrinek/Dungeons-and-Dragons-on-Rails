class Power
  include MongoMapper::Document

  key :name, String, required: true

  key :description, String

  key :requirement, String
  key :trigger, String

  key :attack, String
  key :hit, String
  key :miss, String

  key :effect, String

end
