class NonPlayerCharacter < Character
  key :character_roles, Array

  key :xp_value, Integer

  key :custom_fortitude,   Integer
  key :custom_reflex,      Integer
  key :custom_will,        Integer

  key :custom_initiative,  Integer

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

  def check(ability_or_skill)
    return custom_initiative if ability_or_skill == :initiative && custom_initiative

    super(ability_or_skill)
  end

  def character_role
    primary = ROLES & character_roles
    secondary = SUB_ROLES & character_roles

    role = primary.to_a * ' '
    role << " (#{secondary.to_a * ' '})" if secondary.any?

    role
  end
end
