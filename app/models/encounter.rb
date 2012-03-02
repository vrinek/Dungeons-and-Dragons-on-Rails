class Encounter
  include MongoMapper::Document

  key :name, String
  key :npcs, Hash

end
