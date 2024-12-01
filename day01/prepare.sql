CREATE SCHEMA day01;
CREATE TABLE day01.sample(row text);

COPY day01.sample FROM STDIN;
3   4
4   3
2   5
1   3
3   9
3   3
\.

CREATE TABLE day01.input(row text);

\copy day01.input FROM input.txt 

