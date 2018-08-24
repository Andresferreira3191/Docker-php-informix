<?php
	try{
        $db = new PDO("informix:host=".getenv('HOSTNAME')."; service=9088;database=sysmaster; server=informix; protocol=onsoctcp; EnableScrollableCursors=1;", "informix", "in4mix");

        print "Connection Established!</br></br>";

        $stmt = $db->query("select * from systables");
        $res = $stmt->fetch( PDO::FETCH_BOTH );
        $rows = $res[0];
        echo "Table contents: $rows.</br>";
    } catch (Exception $e) {
        echo 'Excepción capturada: ',  $e->getMessage(), "\n";
    }
?>