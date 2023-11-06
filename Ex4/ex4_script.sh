python3 ex1.py
psql -h dbcourse public -c "\i create.sql"
cat enrollment.csv | psql -h dbcourse public -c "copy enrollment from STDIN DELIMITER ',' CSV HEADER"
psql -h dbcourse public -c "\i improved.sql"

psql -h dbcourse public -c "CREATE INDEX ind_year_students5 ON enrollment(year, students5_estimated)"
psql -h dbcourse public -c "\i original.sql"
psql -h dbcourse public -c "DROP INDEX ind_year_students5"

psql -h dbcourse public -c "\i drop.sql"
