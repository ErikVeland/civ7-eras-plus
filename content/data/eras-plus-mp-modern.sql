-- MP Pace: Modern remains longer than Standard but should not outlast the match.

UPDATE AgeProgressions
SET MaxPoints_Abbreviated = 150,
    MaxPoints_Standard = 190,
    MaxPoints_Long = 235
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
SET Cost = ROUND(Cost * 1.75),
    RepeatableCostProgressionParam1 = CASE
      WHEN RepeatableCostProgressionParam1 > 0 THEN ROUND(RepeatableCostProgressionParam1 * 1.75)
      ELSE RepeatableCostProgressionParam1
    END
WHERE ProgressionTree LIKE 'TREE_TECHS_MO%'
  AND Cost > 1;

UPDATE ProgressionTreeNodes
SET Cost = ROUND(Cost * 1.85),
    RepeatableCostProgressionParam1 = CASE
      WHEN RepeatableCostProgressionParam1 > 0 THEN ROUND(RepeatableCostProgressionParam1 * 1.85)
      ELSE RepeatableCostProgressionParam1
    END
WHERE ProgressionTree LIKE 'TREE_CIVICS_MO%'
  AND Cost > 1;

UPDATE Projects
SET Cost = ROUND(Cost * 1.20)
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
