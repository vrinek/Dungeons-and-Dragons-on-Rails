class AbilityScore
  def initialize(value)
    @value = value
  end

  def modifier
    (@value-10)/2
  end

  # needed for MongoMapper to load the appropriate class
  def self.from_mongo(value)
    self.new(value)
  end

  # delegate the rest of the functions to the @value
  def method_missing(method_name, *args, &block)
    if block_given?
      @value.send(method_name, *args, &block)
    else
      @value.send(method_name, *args)
    end
  end

  def to_s
    @value.to_s
  end
end
