-- Eras+ extends Antiquity with the strongest stable database levers currently exposed by Civ VII.

UPDATE AgeProgressions
SET MaxPoints_Abbreviated = 240,
    MaxPoints_Standard = 300,
    MaxPoints_Long = 360
WHERE AgeProgressionType = 'AGE_PROGRESSION_ANTIQUITY_AGE_TIMER';

UPDATE AgeProgressionEvents
SET Points = CASE AgeProgressionEventType
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_1' THEN 2
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_2' THEN 3
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_3' THEN 5
    WHEN 'AGE_PROGRESSION_FUTURE_CIVIC' THEN 3
    WHEN 'AGE_PROGRESSION_FUTURE_TECH' THEN 3
    ELSE Points
  END
WHERE AgeProgressionType = 'AGE_PROGRESSION_ANTIQUITY_AGE_TIMER';

UPDATE ProgressionTreeNodes
SET Cost = ROUND(Cost * 1.75),
    RepeatableCostProgressionParam1 = CASE
      WHEN RepeatableCostProgressionParam1 > 0 THEN ROUND(RepeatableCostProgressionParam1 * 1.75)
      ELSE RepeatableCostProgressionParam1
    END
WHERE ProgressionTree LIKE 'TREE_TECHS_AQ%'
  AND Cost > 1;

UPDATE ProgressionTreeNodes
SET Cost = ROUND(Cost * 1.90),
    RepeatableCostProgressionParam1 = CASE
      WHEN RepeatableCostProgressionParam1 > 0 THEN ROUND(RepeatableCostProgressionParam1 * 1.90)
      ELSE RepeatableCostProgressionParam1
    END
WHERE ProgressionTree LIKE 'TREE_CIVICS_AQ%'
  AND Cost > 1;

UPDATE AgeGrowthBalances
SET Scalar = ROUND(Scalar * 1.10),
    Exponent = ROUND(Exponent * 1.30)
WHERE Age = 'AGE_ANTIQUITY';

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
