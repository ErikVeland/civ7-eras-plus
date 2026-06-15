-- Modern Stretch: leaves earlier Ages alone and gives Modern more time and heavier tech costs.

UPDATE AgeProgressions
SET MaxPoints_Abbreviated = 320,
    MaxPoints_Standard = 420,
    MaxPoints_Long = 520
WHERE AgeProgressionType = 'AGE_PROGRESSION_MODERN_AGE_TIMER';

UPDATE AgeProgressionEvents
SET Points = CASE AgeProgressionEventType
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_1' THEN 2
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_2' THEN 3
    WHEN 'AGE_PROGRESSION_PLAYER_MILESTONE_3' THEN 0
    WHEN 'AGE_PROGRESSION_FUTURE_CIVIC' THEN 3
    WHEN 'AGE_PROGRESSION_FUTURE_TECH' THEN 3
    ELSE Points
  END
WHERE AgeProgressionType = 'AGE_PROGRESSION_MODERN_AGE_TIMER';

UPDATE ProgressionTreeNodes
SET Cost = ROUND(Cost * 3.25),
    RepeatableCostProgressionParam1 = CASE
      WHEN RepeatableCostProgressionParam1 > 0 THEN ROUND(RepeatableCostProgressionParam1 * 3.25)
      ELSE RepeatableCostProgressionParam1
    END
WHERE ProgressionTree LIKE 'TREE_TECHS_MO%'
  AND Cost > 1;

UPDATE ProgressionTreeNodes
SET Cost = ROUND(Cost * 2.75),
    RepeatableCostProgressionParam1 = CASE
      WHEN RepeatableCostProgressionParam1 > 0 THEN ROUND(RepeatableCostProgressionParam1 * 2.75)
      ELSE RepeatableCostProgressionParam1
    END
WHERE ProgressionTree LIKE 'TREE_CIVICS_MO%'
  AND Cost > 1;

UPDATE Projects
SET Cost = ROUND(Cost * 1.60)
WHERE Cost IS NOT NULL
  AND (
    RequireCompletedLegacyPathType IS NOT NULL
    OR ProjectVictoryCinematicLocation <> 'NO_PROJECT_VICTORY_CINEMATIC_LOCATION'
    OR ProjectType IN (
      'PROJECT_TRANS_OCEANIC_FLIGHT',
      'PROJECT_BREAK_SOUND_BARRIER',
      'PROJECT_LAUNCH_SATELLITE',
      'PROJECT_CREWED_SPACE_FLIGHT_RESEARCH',
      'PROJECT_CREWED_SPACE_FLIGHT_PREP'
    )
  );

UPDATE Routes
SET MovementCost = 0.75
WHERE RouteType = 'ROUTE_ROAD';

UPDATE Routes
SET MovementCost = 0.50
WHERE RouteType IN ('ROUTE_RAILROAD', 'ROUTE_STAATSEISENBAHN');
