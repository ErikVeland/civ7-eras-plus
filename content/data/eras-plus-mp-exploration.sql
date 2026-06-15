-- MP Pace: Exploration should move along before players are deep into repeatables.

UPDATE AgeProgressions
SET MaxPoints_Abbreviated = 125,
    MaxPoints_Standard = 155,
    MaxPoints_Long = 190
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
SET Cost = ROUND(Cost * 1.60),
    RepeatableCostProgressionParam1 = CASE
      WHEN RepeatableCostProgressionParam1 > 0 THEN ROUND(RepeatableCostProgressionParam1 * 1.60)
      ELSE RepeatableCostProgressionParam1
    END
WHERE ProgressionTree LIKE 'TREE_CIVICS_EX%'
  AND Cost > 1;

UPDATE AgeGrowthBalances
SET Scalar = ROUND(Scalar * 1.05),
    Exponent = ROUND(Exponent * 1.15)
WHERE Age = 'AGE_EXPLORATION';

UPDATE Routes
SET MovementCost = 0.75
WHERE RouteType = 'ROUTE_ROAD';
