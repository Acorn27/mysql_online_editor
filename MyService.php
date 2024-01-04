<?php

require './Database.php';
require './Item.php';


class Service {
    function fetchAllItems() {
        $dbObject = new Database();
        $dbConnection = $dbObject->getDatabaseConnection();
        
        $sql = "SELECT * FROM item";

        $stmt = $dbConnection->prepare($sql);
		$stmt->setFetchMode(PDO::FETCH_CLASS, 'Item');

		if ($stmt->execute()){
			return $stmt->fetchAll();
		} else{
			return 'Failed';
		}
    }

    function findById() {
        
        $iId = $_POST['iId'];
        $dbObject = new Database();
		$dbConnection = $dbObject->getDatabaseConnection();

        $sql = "SELECT * FROM item WHERE (`iId` = ?)";
        $stmt = $dbConnection->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Item');

        if ($stmt->execute([$iId])) {
            return $stmt->fetchAll();
        } else {
            return 'Failed';  
        }
    }

    function findByName() {
    
        $Iname = "%".$_POST['Iname']."%";
        $dbObject = new Database();
        $dbConnection = $dbObject->getDatabaseConnection();

        $sql = "SELECT * FROM item WHERE (`Iname` LIKE ?)";
        $stmt = $dbConnection->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Item');

        if ($stmt->execute([$Iname])) {
            return $stmt->fetchAll();
        } else {
            return 'Failed';  
        }
    }

    function insertItem() {
    
        $iName = $_POST['iName'];
        $iSprice = $_POST['iSprice'];

        $dbObject = new Database();
        $dbConnection = $dbObject->getDatabaseConnection();

        $sql = "INSERT INTO item (`Iname`, `Sprice`) VALUES (?,?)";
        $stmt = $dbConnection->prepare($sql);

        if ($stmt->execute([$iName, $iSprice])) {
        } else {
            return 'Failed';  
        }
    }

    function updateItem() {
        $iId = $_POST['iId'];
        $iName = $_POST['iName'];
        $iSprice = $_POST['iSprice'];
    
        $dbObject = new Database();
        $dbConnection = $dbObject->getDatabaseConnection();
    
        // Use a prepared statement to prevent SQL injection
        $sql = "UPDATE item SET `Iname` = ?, `Sprice` = ? WHERE `iId` = ?";
        $stmt = $dbConnection->prepare($sql);
    
        // Bind the variables to the prepared statement
        $stmt->bindValue(1, $iName);
        $stmt->bindValue(2, $iSprice);
        $stmt->bindValue(3, $iId);
    
        if ($stmt->execute()) {
        } else {
            return 'Failed';
        }
    }

    function deleteItem() {

        $iId = $_POST['iId'];
    
        $dbObject = new Database();
        $dbConnection = $dbObject->getDatabaseConnection();
    
        // Use a prepared statement to prevent SQL injection
        $sql = "DELETE FROM item WHERE `iId` = ?";
        $stmt = $dbConnection->prepare($sql);
    
        // Bind the variables to the prepared statement
        $stmt->bindValue(1, $iId);
    
        if ($stmt->execute()) {
        } else {
            return 'Failed';
        }
    }
}
?>