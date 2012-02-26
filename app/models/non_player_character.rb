class NonPlayerCharacter < Character
  key :character_role, String
  ROLES = %w[Brute Minion Skirmisher Controller]

  key :xp_value, Integer

  key :custom_fortitude, Integer
  key :custom_reflex,    Integer
  key :custom_will,      Integer

  def fortitude
    custom_fortitude ? custom_fortitude : super
  end

  def fortitude=(integer)
    self.custom_fortitude = integer
  end

  def reflex
    custom_reflex ? custom_reflex : super
  end

  def reflex=(integer)
    self.custom_reflex = integer
  end

  def will
    custom_will ? custom_will : super
  end

  def will=(integer)
    self.custom_will = integer
  end
end
