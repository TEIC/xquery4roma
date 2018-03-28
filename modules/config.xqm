xquery version "1.0";

(:~
 : A set of helper functions to access the application context from
 : within a module.
 :)
module namespace config="http://xquery.tei-c.org/modules/config";

(:declare namespace repo="http://exist-db.org/xquery/repo";:)
(:declare namespace expath="http://expath.org/ns/pkg";:)
declare namespace tei="http://www.tei-c.org/ns/1.0";
(:declare namespace mei="http://www.music-encoding.org/ns/mei";:)

(: 
    Determine the application root collection from the current module load path.
:)
declare variable $config:app-root as xs:string := 
    let $rawPath := replace(system:get-module-load-path(), '/null/', '//')
    let $modulePath :=
        (: strip the xmldb: part :)
        if (starts-with($rawPath, "xmldb:exist://")) then
            if (starts-with($rawPath, "xmldb:exist://embedded-eXist-server")) then
                substring($rawPath, 36)
            else
                substring($rawPath, 15)
        else
            $rawPath
    return
        substring-before($modulePath, "/modules")
;


declare variable $config:p5subset := doc(concat($config:app-root, '/data/p5subset.xml'));
