xquery version "1.0";
declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace rng="http://relaxng.org/ns/structure/1.0";
declare namespace request="http://exist-db.org/xquery/request";
import module namespace config="http://xquery.tei-c.org/modules/config" at "config.xqm";

let $name := request:get-parameter("name", "")
let $lang := request:get-parameter("lang", "en")
for $c in $config:p5subset//tei:elementSpec[@ident=$name]
let $Desc:=
    if ($c/tei:desc[@xml:lang=$lang]) then
        $c/tei:desc[@xml:lang=$lang]
    else
        $c/tei:desc[not(@xml:lang)]
let $Gloss:=
    if ($c/tei:gloss[@xml:lang=$lang]) then
        $c/tei:gloss[@xml:lang=$lang]
    else
        $c/tei:gloss[not(@xml:lang)]
return
<Element>
  <elementName>{data($c/@ident)}</elementName>
  <elementDesc>{data($Desc)}</elementDesc>
  <elementGloss>{data($Gloss)}</elementGloss>
  <elementContent>{$c/tei:content/*}</elementContent>
  <elementClasses>
  {
for $class in $c/tei:classes/tei:memberOf
return
    <class>{data($class/@key)}</class>
  }
  </elementClasses>
</Element>
