CREATE TABLE country(
	countrycode char(3) PRIMARY KEY,
	countryname varchar(200) NOT NULL,
	region varchar(200) CHECK (region='South Asia' or region='Europe and Central Asia' or region='Middle East and North Africa' 
	or region='Sub-Saharan Africa' or region='Latin America and Caribbean' or region='East Asia and Pacific' or region='North America'),
	incomegroup varchar(200) CHECK (incomegroup='Low income' or incomegroup='Upper middle income' 
	or incomegroup='Lower middle income' or incomegroup='High income')
);

CREATE TABLE university(
	iau_id1 varchar(200) PRIMARY KEY, 
	eng_name varchar(200) NOT NULL, 
	orig_name varchar(200) NOT NULL,
	foundedyr integer CHECK (foundedyr > 0),
	private01 boolean NOT NULL,
	divisions integer CHECK (divisions >= 0), 
	phd_granting boolean NOT NULL, 
	specialized boolean NOT NULL, 
	latitude numeric CHECK (latitude >= -90 and latitude <= 90), 
	longitude numeric CHECK (longitude >= -180 and longitude <= 180), 
	countrycode char(3),
	FOREIGN KEY(countrycode) REFERENCES country(countrycode)
);

CREATE TABLE closed(
	iau_id1 varchar(200) PRIMARY KEY, 
	yrclosed integer CHECK (yrclosed > 0),
	FOREIGN KEY(iau_id1) REFERENCES university(iau_id1)
);

CREATE TABLE acceptance_data(
	year integer CHECK (year > 0),
	student5_estimated integer CHECK (student5_estimated >= 0),
	iau_id1 varchar(200),
	PRIMARY KEY (year, iau_id1), 
	FOREIGN KEY(iau_id1) REFERENCES university(iau_id1)
);
