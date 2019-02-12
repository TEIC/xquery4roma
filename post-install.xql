xquery version "3.0";

import module namespace xdb="http://exist-db.org/xquery/xmldb";

(: The following external variables are set by the repo:deploy function :)

(: file path pointing to the exist installation directory :)
declare variable $home external;
(: path to the directory containing the unpacked .xar package :)
declare variable $dir external;
(: the target collection into which the app is deployed :)
declare variable $target external;

let $p5subset.url.env := environment-variable('P5SUBSET_URL')
let $p5subset.url := 
    if($p5subset.url.env castable as xs:anyURI)
    then $p5subset.url.env
    else 'http://www.tei-c.org/Vault/P5/current/xml/tei/odd/p5subset.xml'

return
    try{ xdb:store(xdb:create-collection($target, 'data'),'p5subset.xml',doc($p5subset.url)) }
    catch * {'failed to retrieve/store the p5subset.xml'}