xquery version "1.0";
declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace request="http://exist-db.org/xquery/request";
import module namespace config="http://xquery.tei-c.org/modules/config" at "config.xqm";

for $c in $config:p5subset/tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt
return
$c/tei:edition

