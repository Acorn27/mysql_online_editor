<?php
if (isset($_POST['choice'])) {
    $option = $_POST['choice'];
    switch ($option) {
        case 1:
            $redirectUrl = "displayItems.php";
            break;
        case 2:
            $redirectUrl = "findById.php";
            break;
        case 3:
            $redirectUrl = "findByName.php";
            break;
        case 4:
            $redirectUrl = "insertItem.php";
            break;
        case 5:
            $redirectUrl = "updateItemByName.php";
            break;
        case 6:
            $redirectUrl = "deleteItemByName.php";
            break;
        case 7:
            exit;
    }
    
    if (isset($redirectUrl)) {
        header("Location: http://localhost/submission/$redirectUrl");
    }
} else {
    echo <<<END
    <h1>Choose an Action</h1>
    <ol>
        <li><a href="displayItems.php">Display all items</a></li>
        <li><a href="findById.php">Find item by ID</a></li>
        <li><a href="findByName.php">Find item by Name</a></li>
        <li><a href="insertItem.php">Insert new item</a></li>
        <li><a href="updateItemByName.php">Update item</a></li>
        <li><a href="deleteItemByName.php">Delete item</a></li>
        <li><a href="#">Exit</a></li>
    </ol>
    <form method="post">
        Enter your choice: <input type="number" name="choice" min="1" max="7">
        <br>
        <input type="submit" value="Submit">
    </form>
END;
}
?>
