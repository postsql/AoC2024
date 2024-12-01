/*
 * check with sample data
 */
WITH source(a, b) AS (
    SELECT fields[1]::int
         , fields[2]::int
      FROM day01.sample
         , regexp_split_to_array(row, '\W+') AS fields
),
similarities AS (
SELECT sa.a * count(sb.b) AS similarity
  FROM source AS sa
  JOIN source AS sb ON sa.a = sb.b
  GROUP BY sa.a
)
SELECT sum(similarity)
  FROM similarities
;
/*
┌─────┐
│ sum │
├─────┤
│  31 │
└─────┘
(1 row)
Time: 1.508 ms
*/

/*
 * real data
 */

WITH source(a, b) AS (
    SELECT fields[1]::int
         , fields[2]::int
      FROM day01.input
         , regexp_split_to_array(row, '\W+') AS fields
),
similarities AS (
SELECT sa.a * count(sb.b) AS similarity
  FROM source AS sa
  JOIN source AS sb ON sa.a = sb.b
  GROUP BY sa.a
)
SELECT sum(similarity)
  FROM similarities
;
/*
┌──────────┐
│   sum    │
├──────────┤
│ 24869388 │
└──────────┘
(1 row)

Time: 6.301 ms
*/
