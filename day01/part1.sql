WITH source(a,rn_a, b, rn_b) AS (
    SELECT fields[1]::int
         , row_number() OVER (ORDER BY fields[1]::int)
         , fields[2]::int
         , row_number() OVER (ORDER BY fields[2]::int)
      FROM day01.input
         , regexp_split_to_array(row, '\W+') AS fields
)
SELECT sum(abs(sa.a-sb.b))
  FROM source AS sa
  JOIN source AS sb ON sa.rn_a = sb.rn_b
;
/*
┌─────────┐
│   sum   │
├─────────┤
│ 1110981 │
└─────────┘
(1 row)

Time: 5.503 ms
*/
