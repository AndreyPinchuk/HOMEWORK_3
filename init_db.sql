--worker
CREATE TABLE worker (
	ID IDENTITY PRIMARY KEY,
	NAME VARCHAR(1000),
	BIRTHDAY DATE,
	LEVEL VARCHAR(10),
	SALARY INT
);

ALTER TABLE worker ADD CONSTRAINT level_enum_values CHECK (LEVEL IN ('Trainee', 'Junior', 'Middle', 'Senior'));

ALTER TABLE worker ALTER COLUMN NAME SET NOT NULL;

ALTER TABLE worker ALTER COLUMN LEVEL SET NOT NULL;

--client
CREATE TABLE client (
	ID IDENTITY PRIMARY KEY,
	NAME VARCHAR(1000)
);

ALTER TABLE client ALTER COLUMN NAME SET NOT NULL;

--project
CREATE TABLE project (
	ID IDENTITY PRIMARY KEY,
	CLIENT_ID BIGINT,
	START_DATE DATE,
	FINISH_DATE DATE,
	FOREIGN KEY (CLIENT_ID) REFERENCES client(ID)
);

--project_worker
CREATE TABLE project_worker (
	PROJECT_ID BIGINT NOT NULL,
	WORKER_ID BIGINT NOT NULL,
	PRIMARY KEY (PROJECT_ID, WORKER_ID),
	FOREIGN KEY (PROJECT_ID) REFERENCES project(ID),
	FOREIGN KEY (WORKER_ID) REFERENCES worker(ID)
);