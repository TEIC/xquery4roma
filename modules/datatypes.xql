xquery version "1.0";
declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace rng="http://relaxng.org/ns/structure/1.0";
import module namespace config="http://xquery.tei-c.org/modules/config" at "config.xqm";
<dataList>
{
for $t in $config:p5subset//tei:macroSpec[@type='dt']
order by $t/@ident
return
 <dataType>
  <dataName>{data($t/@ident)}</dataName>
  <dataDesc>{$t/tei:desc}</dataDesc>
 </dataType>
}
</dataList>

