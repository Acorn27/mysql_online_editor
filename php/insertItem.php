<?php
require './MyService.php';
$service = new Service();
$items = [];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["submit"])) {
        //$iId = isset($_POST["iId"]) ? $_POST["iId"] : "";
        $iName = isset($_POST["iName"]) ? $_POST["iName"] : "";
        $iSprice = isset($_POST["iSprice"]) ? $_POST["iSprice"] : "";
        
        // Validate and process the form data
        if ($iName && $iSprice) {
            $service->insertItem();
            $items = $service->fetchAllItems();
        }
    } elseif (isset($_POST["exit"])) {
        header("Location: http://localhost/submission/menu.php");
    }
} else {
    $items = $service->fetchAllItems();
}
?>

<!DOCTYPE html>
<html>

<head>
    <title>Insert New Item</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Add a link to your CSS file for styling -->
</head>

<body>
    <div class="container">
        <form method="post">
            <fieldset>
                <legend>Insert New Item</legend>
                <div class="input-group">
                    <label for="iName">Item Name:</label>
                    <input type="text" name="iName" id="iName" placeholder="E.g., Product Name">
                </div>
                <div class="input-group">
                    <label for="iSprice">Item Price:</label>
                    <input type="text" name="iSprice" id="iSprice" placeholder="E.g., 29.99">
                </div>

                <div class="button-group">
                    <input type="submit" name="submit" value="Insert" class="btn-insert">
                    <input type="submit" name="exit" value="Exit" class="btn-exit">
                </div>
            </fieldset>
        </form>

        <table class="item-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if (!empty($items)) {
                    foreach ($items as $item) :
                    ?>
                        <tr>
                            <td><?= htmlspecialchars($item->iId); ?></td>
                            <td><?= htmlspecialchars($item->Iname); ?></td>
                            <td><?= htmlspecialchars($item->Sprice); ?></td>
                        </tr>
                    <?php endforeach;
                } else {
                    echo "<tr><td colspan='3'>No items found.</td></tr>";
                }
                ?>
            </tbody>
        </table>
    </div>
</body>

</html>
