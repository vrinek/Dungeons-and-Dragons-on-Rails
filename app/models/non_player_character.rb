class NonPlayerCharacter < Character
  key :character_role, String

  key :xp_value, Integer

  ROLES = %w[Brute Minion Skirmisher]
end
