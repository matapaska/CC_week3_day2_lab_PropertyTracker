DROP TABLE IF EXISTS property_tracker;

CREATE TABLE property_tracker(
  id SERIAL4 PRIMARY KEY,
  address VARCHAR(255),
  value INT2,
  num_of_bedrooms INT2,
  year_built INT2


);
