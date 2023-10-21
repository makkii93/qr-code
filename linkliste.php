<?php include_once('header.php') ?>

    <?php 
        $dbcon = new mysqli('localhost', 'root', '', 'qrcode_generator');

        if(!$dbcon->connect_errno) {
            $select = "SELECT * from qrcode_links";
            $result = $dbcon->query($select);

            if($result->num_rows > 0) {

                include('phpqrcode/qrlib.php');

                echo '<table>';
                echo '<tr><th>URL</th><th>Beschreibung</th><th>Typ</th><th>Qrcode</th></tr>';

                while($row = $result->fetch_assoc()) {
                    QRcode::png($row['qrcode_link'], 'qrcode/qrcode'.$row['qrcode_index'].'.png');
                    echo '<tr>';
                        echo '<td>'.$row['qrcode_link'].'</td>';
                        echo '<td>'.$row['qrcode_desc'].'</td>';
                        echo '<td>'.$row['qrcode_type'].'</td>';
                        echo '<td><img src="qrcode/qrcode'.$row['qrcode_index'].'.png" height="50px" /></td>';
                    echo '</tr>';
                }

                echo '</table>';
            }else {
                echo '<h3>Es konnten leider keine Daten gefunden werden</h3>';
            }

        }
        $dbcon->close();
        
    ?>
    
</body>
</html>