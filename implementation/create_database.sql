--Creo tablespace para la base de datos

CREATE TABLESPACE openmind
  OWNER postgres
  LOCATION 'D:\openmind';

ALTER TABLESPACE openmind
  OWNER TO postgres;


--Creo la base de datos

CREATE DATABASE openmind
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    TABLESPACE = openmind
    CONNECTION LIMIT = -1;


--Creo schema

CREATE SCHEMA openmind
    AUTHORIZATION postgres;


--Creo usuario para la base de datos
CREATE ROLE openmind WITH
	LOGIN
	NOSUPERUSER
	NOCREATEDB
	CREATEROLE
	INHERIT
	REPLICATION
	CONNECTION LIMIT -1
	PASSWORD 'xxxxxx';

----------------------------------------------------------------------------------------

--Empiezo la creacion de la base

----------------------------------------------------------------------------------------

--Creacion de tablas

----------------------------------------------------------------------------------------


CREATE TABLE IF NOT EXISTS openmind."TypeLink"
(
    "IDTypeLink" character varying(255) NOT NULL,
    "nameTypeLink" character varying(255) NOT NULL,
    PRIMARY KEY ("IDTypeLink"),
    UNIQUE ("nameTypeLink")
    USING INDEX TABLESPACE openmind
)

TABLESPACE openmind;

ALTER TABLE openmind."TypeLink"
    OWNER to openmind;

--------------------------------------------------------

CREATE TABLE IF NOT EXISTS openmind."TypeContract"
(
    "IDTypeContract" character varying(255) NOT NULL,
    "nameTypeContract" character varying(255) NOT NULL,
    PRIMARY KEY ("IDTypeContract"),
    UNIQUE ("nameTypeContract")
    USING INDEX TABLESPACE openmind
)

TABLESPACE openmind;

ALTER TABLE openmind."TypeContract"
    OWNER to openmind;

--------------------------------------------------------

CREATE TABLE IF NOT EXISTS openmind."PrivateInformation"
(
    "IDPrivateInformation" character varying NOT NULL,
    "coment" character varying NOT NULL,
    "fk_Publication" character varying NOT NULL,
    PRIMARY KEY ("IDPrivateInformation")
    USING INDEX TABLESPACE openmind
)

TABLESPACE openmind;

ALTER TABLE openmind."PrivateInformation"
    OWNER to openmind;

--------------------------------------------------------

CREATE TABLE IF NOT EXISTS openmind."Link"
(
    "IDLink" character varying NOT NULL,
    "linkUp" character varying NOT NULL,
    "orderLink" integer NOT NULL,
    "fk_Publication" character varying,
    "fk_TypeLink" character varying NOT NULL,
    "fk_PrivateInformation" character varying,
    PRIMARY KEY ("IDLink"),
    UNIQUE ("linkUp")
    USING INDEX TABLESPACE openmind
)

TABLESPACE openmind;

ALTER TABLE openmind."Link"
    OWNER to openmind;

--------------------------------------------------------

CREATE TABLE IF NOT EXISTS openmind."TypePropierty"
(
    "IDTypePropierty" character varying NOT NULL,
    "nameTypePropierty" character varying NOT NULL,
    PRIMARY KEY ("IDTypePropierty"),
    UNIQUE ("nameTypePropierty")
    USING INDEX TABLESPACE openmind
)

TABLESPACE openmind;

ALTER TABLE openmind."TypePropierty"
    OWNER to openmind;

--------------------------------------------------------

CREATE TABLE IF NOT EXISTS openmind."TypeGarage"
(
    "IDTypeGarage" character varying NOT NULL,
    "nameTypeGarage" character varying NOT NULL,
    PRIMARY KEY ("IDTypeGarage"),
    UNIQUE ("nameTypeGarage")
    USING INDEX TABLESPACE openmind
)

TABLESPACE openmind;

ALTER TABLE openmind."TypeGarage"
    OWNER to openmind;

--------------------------------------------------------

CREATE TABLE IF NOT EXISTS openmind."Garage"
(
    "IDGarage" character varying NOT NULL,
    "quantityGarage" integer NOT NULL,
    "fk_Publication" character varying NOT NULL,
    "fk_TypeGarage" character varying NOT NULL,
    PRIMARY KEY ("IDGarage")
    USING INDEX TABLESPACE openmind
)

TABLESPACE openmind;

ALTER TABLE openmind."Garage"
    OWNER to openmind;

--------------------------------------------------------

CREATE TABLE IF NOT EXISTS openmind."StatusPublication"
(
    "IDStatusPublication" character varying NOT NULL,
    "nameStatusPublication" character varying NOT NULL,
    PRIMARY KEY ("IDStatusPublication"),
    UNIQUE ("nameStatusPublication")
    USING INDEX TABLESPACE openmind
)

TABLESPACE openmind;

ALTER TABLE openmind."StatusPublication"
    OWNER to openmind;

--------------------------------------------------------


CREATE TABLE IF NOT EXISTS openmind."AmentiesPublication"
(
    "IDAmentiesPublication" character varying NOT NULL,
    "quantityAmentiesPublication" character varying NOT NULL,
    "fk_Publication" character varying NOT NULL,
    "fk_Amenties" character varying NOT NULL,
    PRIMARY KEY ("IDAmentiesPublication"),
    UNIQUE ("quantityAmentiesPublication")
    USING INDEX TABLESPACE openmind
)

TABLESPACE openmind;

ALTER TABLE openmind."AmentiesPublication"
    OWNER to openmind;

--------------------------------------------------------

CREATE TABLE IF NOT EXISTS openmind."Amenties"
(
    "IDAmenties" character varying NOT NULL,
    "nameAmenties" character varying NOT NULL,
    PRIMARY KEY ("IDAmenties"),
    UNIQUE ("nameAmenties")
    USING INDEX TABLESPACE openmind
)

TABLESPACE openmind;

ALTER TABLE openmind."Amenties"
    OWNER to openmind;

--------------------------------------------------------

CREATE TABLE IF NOT EXISTS openmind."User"
(
    "IDUser" character varying NOT NULL,
    "nameUser" character varying NOT NULL,
    "numberUser" character varying NOT NULL,
    "mailUser" character varying NOT NULL,
	"photoUser" character varying NOT NULL,
    PRIMARY KEY ("IDUser"),
    UNIQUE ("nameUser"),
	UNIQUE ("numberUser"),
	UNIQUE ("mailUser")
    USING INDEX TABLESPACE openmind
)

TABLESPACE openmind;

ALTER TABLE openmind."User"
    OWNER to openmind;

--------------------------------------------------------

CREATE TABLE IF NOT EXISTS openmind."Publication"
(
    "IDPublication" character varying NOT NULL,
    "directionPublication" character varying NOT NULL,
    "mapLinkPublication" character varying NOT NULL,
    "coveredAreaPublication" integer NOT NULL,
	"uncoveredAreaPublication" integer,
	"terrainAreaPublication" integer NOT NULL,
	"bathroomPublication" integer NOT NULL,
	"bedroomPublication" integer NOT NULL,
	"ambiencePublication" integer NOT NULL,
	"descriptionPublication" character varying NOT NULL,
	"featured" date NOT NULL,
	"fk_TypePropierty" character varying NOT NULL,
	"fk_User" character varying NOT NULL,
	"fk_TypeContract" character varying NOT NULL,
	"fk_StatusPublication" character varying NOT NULL,
    PRIMARY KEY ("IDPublication"),
    UNIQUE ("directionPublication"),
	UNIQUE ("mapLinkPublication")
    USING INDEX TABLESPACE openmind
)

TABLESPACE openmind;

ALTER TABLE openmind."Publication"
    OWNER to openmind;

----------------------------------------------------------------------------------------

--Creacion de foreign keys

----------------------------------------------------------------------------------------

ALTER TABLE openmind."PrivateInformation"
    ADD CONSTRAINT fk_Publication_PrivateInformation 
	FOREIGN KEY ("fk_Publication") 
	REFERENCES openmind."Publication"("IDPublication");

--------------------------------------------------------

ALTER TABLE openmind."Link"
    ADD CONSTRAINT fk_Publication_Link 
	FOREIGN KEY ("fk_Publication") 
	REFERENCES openmind."Publication"("IDPublication");

--------------------------------------------------------

ALTER TABLE openmind."Link"
    ADD CONSTRAINT fk_TypeLink_Link 
	FOREIGN KEY ("fk_TypeLink") 
	REFERENCES openmind."TypeLink"("IDTypeLink");

--------------------------------------------------------

ALTER TABLE openmind."Link"
    ADD CONSTRAINT fk_PrivateInformation_Link 
	FOREIGN KEY ("fk_PrivateInformation") 
	REFERENCES openmind."PrivateInformation"("IDPrivateInformation");

--------------------------------------------------------

ALTER TABLE openmind."AmentiesPublication"
    ADD CONSTRAINT fk_Publication_AmentiesPublication 
	FOREIGN KEY ("fk_Publication") 
	REFERENCES openmind."Publication"("IDPublication");

--------------------------------------------------------

ALTER TABLE openmind."AmentiesPublication"
    ADD CONSTRAINT fk_Amenties_AmentiesPublication 
	FOREIGN KEY ("fk_Amenties") 
	REFERENCES openmind."Amenties"("IDAmenties");

--------------------------------------------------------

ALTER TABLE openmind."Garage"
    ADD CONSTRAINT fk_Publication_Garage
	FOREIGN KEY ("fk_Publication") 
	REFERENCES openmind."Publication"("IDPublication");

--------------------------------------------------------

ALTER TABLE openmind."Garage"
    ADD CONSTRAINT fk_TypeGarage_Garage
	FOREIGN KEY ("fk_TypeGarage") 
	REFERENCES openmind."TypeGarage"("IDTypeGarage");

--------------------------------------------------------

ALTER TABLE openmind."Publication"
    ADD CONSTRAINT fk_TypePropierty_Publication
	FOREIGN KEY ("fk_TypePropierty") 
	REFERENCES openmind."TypePropierty"("IDTypePropierty");

--------------------------------------------------------

ALTER TABLE openmind."Publication"
    ADD CONSTRAINT fk_TypeContract_Publication
	FOREIGN KEY ("fk_TypeContract") 
	REFERENCES openmind."TypeContract"("IDTypeContract");

--------------------------------------------------------

ALTER TABLE openmind."Publication"
    ADD CONSTRAINT fk_User_Publication
	FOREIGN KEY ("fk_User") 
	REFERENCES openmind."User"("IDUser");

--------------------------------------------------------

ALTER TABLE openmind."Publication"
    ADD CONSTRAINT fk_StatusPublication_Publication
	FOREIGN KEY ("fk_StatusPublication") 
	REFERENCES openmind."StatusPublication"("IDStatusPublication");

--------------------------------------------------------


--------------------------------------------------------

--------------------------------------------------------

--------------------------------------------------------

--------------------------------------------------------

--------------------------------------------------------

--------------------------------------------------------

--------------------------------------------------------

--------------------------------------------------------

--------------------------------------------------------

--------------------------------------------------------

--------------------------------------------------------

--------------------------------------------------------

--------------------------------------------------------

