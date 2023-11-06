import csv
from io import TextIOWrapper
from zipfile import ZipFile

RELATIONS = ["country", "university", "closed", "acceptance_data"]

# opens file.
country_file = open(f"{RELATIONS[0]}.csv", 'w', encoding='UTF8')
country_writer = csv.writer(country_file, delimiter=",", quoting=csv.QUOTE_MINIMAL)

university_file = open(f"{RELATIONS[1]}.csv", 'w', encoding='UTF8')
university_writer = csv.writer(university_file, delimiter=",", quoting=csv.QUOTE_MINIMAL)

closed_file = open(f"{RELATIONS[2]}.csv", 'w', encoding='UTF8')
closed_writer = csv.writer(closed_file, delimiter=",", quoting=csv.QUOTE_MINIMAL)

acceptance_file = open(f"{RELATIONS[3]}.csv", 'w', encoding='UTF8')
acceptance_writer = csv.writer(acceptance_file, delimiter=",", quoting=csv.QUOTE_MINIMAL)


# process_file goes over all rows in original csv file, and sends each row to process_row()
def process_file():
    with ZipFile('enrollment.zip') as zf:
        with zf.open('enrollment.csv', 'r') as infile:
            countries = set()
            reader = csv.reader(TextIOWrapper(infile, 'utf-8'))
            cur_row = next(reader)
            while cur_row:
                try:
                    next_row = next(reader)
                    is_last_row = True if (cur_row[4] != next_row[4]) else False
                    process_row(cur_row, is_last_row, countries)
                    cur_row = next_row
                except StopIteration:
                    process_row(cur_row, True, countries)
                    break
    country_file.close()
    university_file.close()
    closed_file.close()
    acceptance_file.close()

# processes a single row
def process_row(row, is_last_row, countries):
    country_name = row[0]
    country_code = row[1]
    region = row[2]
    income_group = row[3]
    iau_id1 = row[4]
    eng_name = row[5]
    orig_name = row[6]
    founded_yr = row[7]
    yr_closed = row[8]
    private01 = row[9]
    latitude = row[10]
    longitude = row[11]
    phd_granting = row[12]
    divisions = row[13]
    specialized = row[14]
    year = row[15]
    students5_estimated = row[16]

    acceptance_writer.writerow([year, students5_estimated, iau_id1])
    if is_last_row:
        university_writer.writerow([iau_id1, eng_name, orig_name, founded_yr, private01, divisions,
                                    phd_granting, specialized, latitude, longitude, country_code])
        if yr_closed != "":
            closed_writer.writerow([iau_id1, yr_closed])
        if country_code not in countries:
            country_writer.writerow([country_code, country_name, region, income_group])
            countries.add(country_code)


# return the list of all tables
def get_names():
    return RELATIONS


if __name__ == "__main__":
    process_file()
