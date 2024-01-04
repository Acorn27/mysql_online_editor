<?php

class Database {

	public function getDatabaseConnection(){

		$dbHost = "db";
		$dbName = "shop";
		$dbUser = "customer";
		$dbPassword = "password";

		try {
			// PDO in PHP (PHP Data Objects)
			$dbConnection = new PDO('mysql:host='.$dbHost.';dbname='.$dbName, $dbUser, $dbPassword);
			$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			return $dbConnection;
		} catch (PDOException $e) {
			echo $e->getMessage();
		}
	}
}