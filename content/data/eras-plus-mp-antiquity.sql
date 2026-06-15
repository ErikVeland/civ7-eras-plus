-- MP Pace: targets shorter Ages while keeping tech/civic progress meaningfully slower than Standard.

UPDATE AgeProgressions
SET MaxPoints_Abbreviated = 115,
    MaxPoints_Standard = 140,
    MaxPoints_Long = 170
WHERE AgeProgressionType = 'AGE_PROGRESSION_ANTIQUITY_AGE_TIMER';

UPDATE AgeProgressionEvents
SET Points = CASE AgeProgressionEventType
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_1' THEN 4
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_2' THEN 7
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_3' THEN 11
    WHEN 'AGE_PROGRESSION_FUTURE_CIVIC' THEN 8
    WHEN 'AGE_PROGRESSION_FUTURE_TECH' THEN 8
    ELSE Points
  END
WHERE AgeProgressionType = 'AGE_PROGRESSION_ANTIQUITY_AGE_TIMER';

UPDATE ProgressionTreeNodes
SET Cost = ROUND(Cost * 1.35),
    RepeatableCostProgressionParam1 = CASE
      WHEN RepeatableCostProgressionParam1 > 0 THEN ROUND(RepeatableCostProgressionParam1 * 1.35)
      ELSE RepeatableCostProgressionParam1
    END
WHERE ProgressionTree LIKE 'TREE_TECHS_AQ%'
  AND Cost > 1;

UPDATE ProgressionTreeNodes
SET Cost = ROUND(Cost * 1.45),
    RepeatableCostProgressionParam1 = CASE
      WHEN RepeatableCostProgressionParam1 > 0 THEN ROUND(RepeatableCostProgressionParam1 * 1.45)
      ELSE RepeatableCostProgressionParam1
    END
WHERE ProgressionTree LIKE 'TREE_CIVICS_AQ%'
  AND Cost > 1;

UPDATE AgeGrowthBalances
SET Scalar = ROUND(Scalar * 1.05),
    Exponent = ROUND(Exponent * 1.15)
WHERE Age = 'AGE_ANTIQUITY';

UPDATE Routes
SET MovementCost = 0.75
WHERE RouteType = 'ROUTE_ROAD';
