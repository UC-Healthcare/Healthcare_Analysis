CREATE TABLE statestable (
     id_ bigint  NOT NULL,
     state_ VARCHAR NOT NULL,
	latitude decimal NOT NULL,
	longitude decimal NOT NULL,
	name_ VARCHAR,
    FOREIGN KEY(id_) REFERENCES dash_data_cleaned (STATE),
	PRIMARY KEY (id_)
);

SELECT *
INTO Dash_Data_Joint
FROM dash_data_cleaned as dd
LEFT JOIN states as st
ON dd.STATE = st.id_;
