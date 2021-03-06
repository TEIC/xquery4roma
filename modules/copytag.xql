xquery version "1.0";
declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace rng="http://relaxng.org/ns/structure/1.0";
declare namespace html="http://www.w3.org/1999/xhtml";
declare namespace request="http://exist-db.org/xquery/request";
import module namespace config="http://xquery.tei-c.org/modules/config" at "config.xqm";

<TEI xmlns="http://www.tei-c.org/ns/1.0" 
     xmlns:xi="http://www.w3.org/2001/XInclude"> 
{
let $name := request:get-parameter("name", "")
for $c in $config:p5subset//(tei:elementSpec|tei:classSpec|tei:macroSpec)[@ident=$name]
return $c
}
</TEI> 