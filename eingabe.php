<?php include_once('header.php') ?>

    <?php if(empty($_POST['type'])) { // isset($_POST['type'])   
    ?> 
        <form action="eingabe.php" method="POST">
            <input type="text" name="url" placeholder="URL" required />
            <textarea name="desc">Kurzbeschreibung...</textarea>
            
            <?php
                $dbcon = new mysqli('localhost', 'root', '', 'qrcode_generator');

                if(!$dbcon->connect_errno) {
                    $select = "SELECT * from qrcode_types";
                    $result = $dbcon->query($select);

                    if($result->num_rows > 0) {
                        echo '<select name="type">';
                        
                        while($row = $result->fetch_assoc()) {

                            echo '<option value="'.$row['type_index'].'">'.$row['type_name'].'</option>';
                        }

                        echo '</select>';
                    }
                    
                }

                $dbcon->close();

            ?>

            <button type="submit">Link speichern</button>
            <!--<input type="submit" value="Link speichern"/>-->
        </form>
    <?php } else {
      
      $dbcon = new mysqli('localhost', 'root', '', 'qrcode_generator');

      if(!$dbcon->connect_errno) {
        $insert = $dbcon->prepare("INSERT INTO qrcode_links (qrcode_link, qrcode_desc, qrcode_type) 
                    VALUES (?,?,?)");
        $insert->bind_param("sss", $_POST["url"], $_POST["desc"], $_POST["type"]);

        if($insert->execute()) {
            echo '<h3>Link wurde erfolgreich gespeichert</h3>';
        }else {
            echo '<h3>Link konnte nicht gespeichert werden</h3>';
        }
        $insert->close();
      }
      $dbcon->close();
        
    } ?>
</body>
</html>