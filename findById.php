<!-- Author: Mai Tran - 1002092849. Co-Author: Samuel Horn - 1001883723 -->
<?php
require './MyService.php';
$service = new Service();
$items = [];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["submit"])) {
        $iId = isset($_POST["iId"]) ? $_POST["iId"] : "";
        $items = $service->findById($iId);
    } elseif (isset($_POST["exit"])) {
        header("Location: http://localhost/Mine/submission/menu.php");
    }
}
?>

<!DOCTYPE html>
<html>

<head>
    <title>Find Item By ID</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Add a link to your CSS file for styling -->
</head>

<body>
    <div class="container">
        <form method="post">
            <fieldset>
                <legend>Find Item by ID</legend>

                <div class="input-group">
                    <label for="iId">Enter item's ID:</label>
                    <input type="text" name="iId" id="iId" placeholder="E.g., 123">
                </div>

                <div class="button-group">
                    <input type="submit" name="submit" value="Find" class="btn-find">
                    <input type="submit" name="exit" value="Exit" class="btn-exit">
                </div>
            </fieldset>
        </form>

        <table>
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
