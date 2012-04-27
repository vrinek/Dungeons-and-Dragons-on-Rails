class InsiderDatum
  include MongoMapper::Document

  key :original_id, Integer
  key :name, String
  key :html, String
  key :data_type, String

end
