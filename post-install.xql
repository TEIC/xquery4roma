xquery version "3.0";

import module namespace xdb="http://exist-db.org/xquery/xmldb";

(: The following external variables are set by the repo:deploy function :)

(: file path pointing to the exist installation directory :)
declare variable $home external;
(: path to the directory containing the unpacked .xar package :)
declare variable $dir external;
(: the target collection into which the app is deployed :)
declare variable $target external;

let $p5subset.version := environment-variable('P5SUBSET_VERSION')
let $p5subset.url := concat('http://www.tei-c.org/Vault/P5/', $p5subset.version, '/xml/tei/odd/p5subset.xml')
let $p5subset := doc($p5subset.url)

return
    try{ xdb:store(xdb:create-collection($target, 'data'),'p5subset.xml',$p5subset) }
    catch * {'failed to retrieve/store the p5subset.xml'}