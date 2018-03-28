xquery version "1.0";
declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace rng="http://relaxng.org/ns/structure/1.0";
import module namespace config="http://xquery.tei-c.org/modules/config" at "config.xqm";

<macroList>
{
for $t in $config:p5subset//tei:macroSpec[starts-with(@ident,'macro')]
order by $t/@ident
return
<macro><macroName>{data($t/@ident)}</macroName><macroDesc>{$t/tei:desc}</macroDesc></macro>
}
</macroList>
