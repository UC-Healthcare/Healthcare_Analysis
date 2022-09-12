-- Create new table with the coordinates for each state
CREATE TABLE statestable (
     id_ bigint  NOT NULL,
     state_ VARCHAR NOT NULL,
	latitude decimal NOT NULL,
	longitude decimal NOT NULL,
	name_ VARCHAR,
    FOREIGN KEY(id_) REFERENCES dash_data_cleaned (STATE),
	PRIMARY KEY (id_)
);

-- Perform a left join between the state table and the survey dash data on the state id column
SELECT st.state_, st.latitude, st.longitude, dd.*
INTO dash_data_final
FROM states as st
LEFT JOIN survey_dash_data as dd
ON st.id_ = dd.state ;

-- Check join by selecting all rows from joined table where the state is Alabama (ID=1)
SELECT * FROM dash_data_final as dd
WHERE dd.id = 1
