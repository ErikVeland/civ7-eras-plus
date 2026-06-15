-- Balanced Extended+: Epic-style tech/civic pacing with Standard-style production.
-- Exploration gets a little more room than Antiquity without becoming an age stop.
-- Civ VII Epic uses a 150% cost multiplier; applying it directly keeps Standard production intact.

UPDATE AgeProgressions
SET MaxPoints_Abbreviated = 155,
    MaxPoints_Standard = 195,
    MaxPoints_Long = 240
WHERE AgeProgressionType = 'AGE_PROGRESSION_EXPLORATION_AGE_TIMER';

UPDATE AgeProgressionEvents
SET Points = CASE AgeProgressionEventType
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_1' THEN 4
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_2' THEN 8
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_3' THEN 12
    WHEN 'AGE_PROGRESSION_FUTURE_CIVIC' THEN 8
    WHEN 'AGE_PROGRESSION_FUTURE_TECH' THEN 8
    ELSE Points
  END
WHERE AgeProgressionType = 'AGE_PROGRESSION_EXPLORATION_AGE_TIMER';

UPDATE ProgressionTreeNodes
SET Cost = ROUND(Cost * 1.50),
    RepeatableCostProgressionParam1 = CASE
      WHEN RepeatableCostProgressionParam1 > 0 THEN ROUND(RepeatableCostProgressionParam1 * 1.50)
      ELSE RepeatableCostProgressionParam1
    END
WHERE ProgressionTree LIKE 'TREE_TECHS_EX%'
  AND Cost > 1;

UPDATE ProgressionTreeNodes
SET Cost = ROUND(Cost * 1.50),
    RepeatableCostProgressionParam1 = CASE
      WHEN RepeatableCostProgressionParam1 > 0 THEN ROUND(RepeatableCostProgressionParam1 * 1.50)
      ELSE RepeatableCostProgressionParam1
    END
WHERE ProgressionTree LIKE 'TREE_CIVICS_EX%'
  AND Cost > 1;
