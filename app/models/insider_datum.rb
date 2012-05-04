class InsiderDatum
  include MongoMapper::Document

  # Mandatory keys for fetching
  key :original_id, Integer
  key :data_type, String

  # Raw html
  key :html, String

  # Parsed values
  key :name, String

  # For invalidating
  timestamps!
  key :ravenloft_version, String

  # @param type [String or Symbol]
  # @param id [Integer]
  def self.fetch(type, id)
    fetch_existing(type, id) or fetch_from_ravenloft(type, id)
  end

  private

  def self.fetch_existing(type, id)
    self.where(data_type: type, original_id: id).first
  end

  def self.fetch_from_ravenloft(type, id)
    @raven = Ravenloft::Manager.new
    credentials = DnDoR::DND_INSIDER_CREDENTIALS
    @raven.login!(credentials["email"], credentials["password"])

    # Ravenloft version 0.0.2 returns a String containing the detail HTML
    detail = @raven.get(type, id)
    self.create html: detail,
                data_type: type,
                original_id: id,
                ravenloft_version: Ravenloft::VERSION
  end
end
