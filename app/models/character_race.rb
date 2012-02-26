class CharacterRace
  include MongoMapper::Document

  key :name, String

  # TODO should probably move this to a separate decorator soon
  def self.for_select
    all.map{|r| [r.name, r.id]}
  end
end
