<?php
require './MyService.php';
$service = new Service();
$items = [];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["submit"])) {
        $Iname = isset($_POST["Iname"]) ? $_POST["Iname"] : "";
        $items = $service->findByName($Iname);
    } elseif (isset($_POST["exit"])) {
        header("Location: http://localhost/submission/menu.php");
    }
}
?>

<!DOCTYPE html>
<html>

<head>
    <title>Find Item By Name</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Add a link to your CSS file for styling -->
</head>

<body>
    <div class="container">
        <form method="post">
            <fieldset>
                <legend>Find Item by Name</legend>

                <div class="input-group">
                    <label for="Iname">Enter item's name:</label>
                    <input type="text" name="Iname" id="Iname" placeholder="E.g., Product Name">
                </div>

                <div class="button-group">
                    <input type="submit" name="submit" value="Find" class="btn-find">
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
