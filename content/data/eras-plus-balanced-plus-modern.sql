-- Balanced Extended+: Epic-style tech/civic pacing with Standard-style production.
-- Modern has enough room to use late systems while still allowing victories to conclude.
-- Civ VII Epic uses a 150% cost multiplier; applying it directly keeps Standard production intact.

UPDATE AgeProgressions
SET MaxPoints_Abbreviated = 180,
    MaxPoints_Standard = 230,
    MaxPoints_Long = 285
WHERE AgeProgressionType = 'AGE_PROGRESSION_MODERN_AGE_TIMER';

UPDATE AgeProgressionEvents
SET Points = CASE AgeProgressionEventType
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_1' THEN 4
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_2' THEN 8
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_3' THEN 0
    WHEN 'AGE_PROGRESSION_FUTURE_CIVIC' THEN 7
    WHEN 'AGE_PROGRESSION_FUTURE_TECH' THEN 7
    ELSE Points
  END
WHERE AgeProgressionType = 'AGE_PROGRESSION_MODERN_AGE_TIMER';

UPDATE ProgressionTreeNodes
SET Cost = ROUND(Cost * 1.50),
    RepeatableCostProgressionParam1 = CASE
      WHEN RepeatableCostProgressionParam1 > 0 THEN ROUND(RepeatableCostProgressionParam1 * 1.50)
      ELSE RepeatableCostProgressionParam1
    END
WHERE ProgressionTree LIKE 'TREE_TECHS_MO%'
  AND Cost > 1;

UPDATE ProgressionTreeNodes
SET Cost = ROUND(Cost * 1.50),
    RepeatableCostProgressionParam1 = CASE
      WHEN RepeatableCostProgressionParam1 > 0 THEN ROUND(RepeatableCostProgressionParam1 * 1.50)
      ELSE RepeatableCostProgressionParam1
    END
WHERE ProgressionTree LIKE 'TREE_CIVICS_MO%'
  AND Cost > 1;
