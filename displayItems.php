<?php
require './MyService.php';
$service = new Service();
$items = $service->fetchAllItems();
?>

<!DOCTYPE html>
<html>

<head>
    <title>Beautiful Item List</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Add a link to your CSS file for styling -->
</head>

<body>
    <div class="container">
        <h1>Item List</h1>

        <table class="item-table">
            <thead>
                <tr>
                    <th>Item's ID</th>
                    <th>Item's Name</th>
                    <th>Item's Price</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($items as $item) : ?>
                    <tr>
                        <td><?= htmlspecialchars($item->iId); ?></td>
                        <td><?= htmlspecialchars($item->Iname); ?></td>
                        <td><?= htmlspecialchars($item->Sprice); ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</body>

</html>
