-- CREATE TABLE "Users" ----------------------------------------
CREATE TABLE `Users` ( 
	`ID` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`FirstName` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`LastName` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`Username` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`Password` Text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`Active` Bit NOT NULL,
	`DateCreated` DateTime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( `ID` ),
	CONSTRAINT `unique_ID` UNIQUE( `ID` ),
	CONSTRAINT `unique_Username` UNIQUE( `Username` ) )
ENGINE = InnoDB;
CREATE INDEX `IX_USERNAME` ON `Users`( `Username` );
-- -------------------------------------------------------------