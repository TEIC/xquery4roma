xquery version "1.0";
declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace rng="http://relaxng.org/ns/structure/1.0";
declare namespace request="http://exist-db.org/xquery/request";
import module namespace config="http://xquery.tei-c.org/modules/config" at "config.xqm";

<List>
{
let $module := request:get-parameter("module", "")
for $c in $config:p5subset//(tei:elementSpec|tei:classSpec)[@module=$module]
return
<Object>
  <Type>{name($c)}</Type>
  <Name>{data($c/@ident)}</Name>
  <Attributes>
  {
for $att in $c/tei:attList//tei:attDef
return
    <attribute>{data($att/@ident)}</attribute>
  }
  </Attributes>
</Object>
}
</List>
