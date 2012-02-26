class NonPlayerCharacter < Character
  key :character_role, String
  ROLES = %w[Brute Minion Skirmisher Controller]

  key :xp_value, Integer

end
