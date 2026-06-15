-- Balanced Extended: keeps Exploration longer, but avoids very late age progress in MP.

UPDATE AgeProgressions
SET MaxPoints_Abbreviated = 205,
    MaxPoints_Standard = 255,
    MaxPoints_Long = 320
WHERE AgeProgressionType = 'AGE_PROGRESSION_EXPLORATION_AGE_TIMER';

UPDATE AgeProgressionEvents
SET Points = CASE AgeProgressionEventType
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_1' THEN 3
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_2' THEN 6
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_3' THEN 10
    WHEN 'AGE_PROGRESSION_FUTURE_CIVIC' THEN 6
    WHEN 'AGE_PROGRESSION_FUTURE_TECH' THEN 6
    ELSE Points
  END
WHERE AgeProgressionType = 'AGE_PROGRESSION_EXPLORATION_AGE_TIMER';

UPDATE ProgressionTreeNodes
SET Cost = ROUND(Cost * 2.05),
    RepeatableCostProgressionParam1 = CASE
      WHEN RepeatableCostProgressionParam1 > 0 THEN ROUND(RepeatableCostProgressionParam1 * 2.05)
      ELSE RepeatableCostProgressionParam1
    END
WHERE ProgressionTree LIKE 'TREE_TECHS_EX%'
  AND Cost > 1;

UPDATE ProgressionTreeNodes
SET Cost = ROUND(Cost * 2.20),
    RepeatableCostProgressionParam1 = CASE
      WHEN RepeatableCostProgressionParam1 > 0 THEN ROUND(RepeatableCostProgressionParam1 * 2.20)
      ELSE RepeatableCostProgressionParam1
    END
WHERE ProgressionTree LIKE 'TREE_CIVICS_EX%'
  AND Cost > 1;

UPDATE AgeGrowthBalances
SET Scalar = ROUND(Scalar * 1.10),
    Exponent = ROUND(Exponent * 1.30)
WHERE Age = 'AGE_EXPLORATION';

UPDATE Unit_Costs
SET Cost = ROUND(Cost * 1.10)
WHERE YieldType = 'YIELD_PRODUCTION'
  AND UnitType IN (
    SELECT UnitType
    FROM Units
    WHERE CoreClass = 'CORE_CLASS_MILITARY'
      AND CanTrain = 1
  );

UPDATE Units
SET Maintenance = Maintenance + 1
WHERE CoreClass = 'CORE_CLASS_MILITARY'
  AND CanTrain = 1
  AND FormationClass IN ('FORMATION_CLASS_LAND_COMBAT', 'FORMATION_CLASS_NAVAL');

UPDATE Routes
SET MovementCost = 0.75
WHERE RouteType = 'ROUTE_ROAD';
