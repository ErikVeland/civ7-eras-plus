-- Eras+ game-setup pacing preset.
-- The selected value is read by .modinfo action criteria before gameplay SQL loads.

INSERT OR REPLACE INTO DomainValues
  (Domain, Value, Name, Description, SortIndex)
VALUES
  ('ErasPlusPacingProfile', 'ERAS_PLUS_PROFILE_VANILLA', 'LOC_MOD_ERAS_PLUS_PROFILE_VANILLA', 'LOC_MOD_ERAS_PLUS_PROFILE_VANILLA_DESC', 10),
  ('ErasPlusPacingProfile', 'ERAS_PLUS_PROFILE_BALANCED', 'LOC_MOD_ERAS_PLUS_PROFILE_BALANCED', 'LOC_MOD_ERAS_PLUS_PROFILE_BALANCED_DESC', 20),
  ('ErasPlusPacingProfile', 'ERAS_PLUS_PROFILE_BALANCED_PLUS', 'LOC_MOD_ERAS_PLUS_PROFILE_BALANCED_PLUS', 'LOC_MOD_ERAS_PLUS_PROFILE_BALANCED_PLUS_DESC', 25),
  ('ErasPlusPacingProfile', 'ERAS_PLUS_PROFILE_BALANCED_PLUS_MODERN_STRETCH', 'LOC_MOD_ERAS_PLUS_PROFILE_BALANCED_PLUS_MODERN_STRETCH', 'LOC_MOD_ERAS_PLUS_PROFILE_BALANCED_PLUS_MODERN_STRETCH_DESC', 27),
  ('ErasPlusPacingProfile', 'ERAS_PLUS_PROFILE_MP_PACE', 'LOC_MOD_ERAS_PLUS_PROFILE_MP_PACE', 'LOC_MOD_ERAS_PLUS_PROFILE_MP_PACE_DESC', 30),
  ('ErasPlusPacingProfile', 'ERAS_PLUS_PROFILE_MODERN_STRETCH', 'LOC_MOD_ERAS_PLUS_PROFILE_MODERN_STRETCH', 'LOC_MOD_ERAS_PLUS_PROFILE_MODERN_STRETCH_DESC', 40),
  -- "Custom" hands per-age length control to the three ErasPlus*Length params below.
  ('ErasPlusPacingProfile', 'ERAS_PLUS_PROFILE_CUSTOM', 'LOC_MOD_ERAS_PLUS_PROFILE_CUSTOM', 'LOC_MOD_ERAS_PLUS_PROFILE_CUSTOM_DESC', 50);

-- Per-age length choices, only consulted when the profile is Custom. Each value
-- maps (via .modinfo criteria) to the same per-age pacing SQL the presets use,
-- so a player can mix, e.g., a Vanilla Antiquity with an Extended+ Modern.
-- Value names reuse the existing preset strings to avoid new length labels.
INSERT OR REPLACE INTO DomainValues
  (Domain, Value, Name, Description, SortIndex)
VALUES
  ('ErasPlusAntiquityLength', 'ERAS_PLUS_LENGTH_VANILLA', 'LOC_MOD_ERAS_PLUS_PROFILE_VANILLA', 'LOC_MOD_ERAS_PLUS_PROFILE_VANILLA_DESC', 10),
  ('ErasPlusAntiquityLength', 'ERAS_PLUS_LENGTH_EXTENDED', 'LOC_MOD_ERAS_PLUS_PROFILE_BALANCED', 'LOC_MOD_ERAS_PLUS_PROFILE_BALANCED_DESC', 20),
  ('ErasPlusAntiquityLength', 'ERAS_PLUS_LENGTH_EXTENDED_PLUS', 'LOC_MOD_ERAS_PLUS_PROFILE_BALANCED_PLUS', 'LOC_MOD_ERAS_PLUS_PROFILE_BALANCED_PLUS_DESC', 30),
  ('ErasPlusExplorationLength', 'ERAS_PLUS_LENGTH_VANILLA', 'LOC_MOD_ERAS_PLUS_PROFILE_VANILLA', 'LOC_MOD_ERAS_PLUS_PROFILE_VANILLA_DESC', 10),
  ('ErasPlusExplorationLength', 'ERAS_PLUS_LENGTH_EXTENDED', 'LOC_MOD_ERAS_PLUS_PROFILE_BALANCED', 'LOC_MOD_ERAS_PLUS_PROFILE_BALANCED_DESC', 20),
  ('ErasPlusExplorationLength', 'ERAS_PLUS_LENGTH_EXTENDED_PLUS', 'LOC_MOD_ERAS_PLUS_PROFILE_BALANCED_PLUS', 'LOC_MOD_ERAS_PLUS_PROFILE_BALANCED_PLUS_DESC', 30),
  ('ErasPlusModernLength', 'ERAS_PLUS_LENGTH_VANILLA', 'LOC_MOD_ERAS_PLUS_PROFILE_VANILLA', 'LOC_MOD_ERAS_PLUS_PROFILE_VANILLA_DESC', 10),
  ('ErasPlusModernLength', 'ERAS_PLUS_LENGTH_EXTENDED', 'LOC_MOD_ERAS_PLUS_PROFILE_BALANCED', 'LOC_MOD_ERAS_PLUS_PROFILE_BALANCED_DESC', 20),
  ('ErasPlusModernLength', 'ERAS_PLUS_LENGTH_EXTENDED_PLUS', 'LOC_MOD_ERAS_PLUS_PROFILE_BALANCED_PLUS', 'LOC_MOD_ERAS_PLUS_PROFILE_BALANCED_PLUS_DESC', 30),
  ('ErasPlusModernLength', 'ERAS_PLUS_LENGTH_STRETCH', 'LOC_MOD_ERAS_PLUS_PROFILE_MODERN_STRETCH', 'LOC_MOD_ERAS_PLUS_PROFILE_MODERN_STRETCH_DESC', 40);

INSERT OR REPLACE INTO Parameters
  (ParameterId, Name, Description, Domain, DefaultValue, Hash, ConfigurationGroup, ConfigurationKey, GroupId, GroupIDMultiplayerOverride, ChangeableAfterGameStart, ChangeableAfterAgeTransition, SortIndex)
VALUES
  ('ErasPlusPacingProfile', 'LOC_MOD_ERAS_PLUS_PROFILE_NAME', 'LOC_MOD_ERAS_PLUS_PROFILE_DESC', 'ErasPlusPacingProfile', 'ERAS_PLUS_PROFILE_BALANCED_PLUS', 0, 'Game', 'ErasPlusPacingProfile', 'GameOptions', 'MPAdvancedGameOptions', 0, 0, 148),
  ('ErasPlusAntiquityLength', 'LOC_MOD_ERAS_PLUS_ANTIQUITY_LENGTH_NAME', 'LOC_MOD_ERAS_PLUS_ANTIQUITY_LENGTH_DESC', 'ErasPlusAntiquityLength', 'ERAS_PLUS_LENGTH_EXTENDED', 0, 'Game', 'ErasPlusAntiquityLength', 'GameOptions', 'MPAdvancedGameOptions', 0, 0, 149),
  ('ErasPlusExplorationLength', 'LOC_MOD_ERAS_PLUS_EXPLORATION_LENGTH_NAME', 'LOC_MOD_ERAS_PLUS_EXPLORATION_LENGTH_DESC', 'ErasPlusExplorationLength', 'ERAS_PLUS_LENGTH_EXTENDED', 0, 'Game', 'ErasPlusExplorationLength', 'GameOptions', 'MPAdvancedGameOptions', 0, 0, 150),
  ('ErasPlusModernLength', 'LOC_MOD_ERAS_PLUS_MODERN_LENGTH_NAME', 'LOC_MOD_ERAS_PLUS_MODERN_LENGTH_DESC', 'ErasPlusModernLength', 'ERAS_PLUS_LENGTH_EXTENDED', 0, 'Game', 'ErasPlusModernLength', 'GameOptions', 'MPAdvancedGameOptions', 0, 0, 151);
