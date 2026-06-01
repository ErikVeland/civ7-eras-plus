-- Eras+ extends Exploration while preserving standard-speed production.

UPDATE AgeProgressions
SET MaxPoints_Abbreviated = 240,
    MaxPoints_Standard = 300,
    MaxPoints_Long = 360
WHERE AgeProgressionType = 'AGE_PROGRESSION_EXPLORATION_AGE_TIMER';

UPDATE AgeProgressionEvents
SET Points = CASE AgeProgressionEventType
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_1' THEN 2
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_2' THEN 4
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_3' THEN 8
    WHEN 'AGE_PROGRESSION_FUTURE_CIVIC' THEN 3
    WHEN 'AGE_PROGRESSION_FUTURE_TECH' THEN 3
    ELSE Points
  END
WHERE AgeProgressionType = 'AGE_PROGRESSION_EXPLORATION_AGE_TIMER';

UPDATE ProgressionTreeNodes
SET Cost = ROUND(Cost * 2.10),
    RepeatableCostProgressionParam1 = CASE
      WHEN RepeatableCostProgressionParam1 > 0 THEN ROUND(RepeatableCostProgressionParam1 * 2.10)
      ELSE RepeatableCostProgressionParam1
    END
WHERE ProgressionTree LIKE 'TREE_TECHS_EX%'
  AND Cost > 1;

UPDATE ProgressionTreeNodes
SET Cost = ROUND(Cost * 2.30),
    RepeatableCostProgressionParam1 = CASE
      WHEN RepeatableCostProgressionParam1 > 0 THEN ROUND(RepeatableCostProgressionParam1 * 2.30)
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
