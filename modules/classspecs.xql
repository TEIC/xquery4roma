xquery version "1.0";
declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace rng="http://relaxng.org/ns/structure/1.0";
import module namespace config="http://xquery.tei-c.org/modules/config" at "config.xqm";

<List>
{
for $t in
$config:p5subset//tei:classSpec[(@type='atts' or @type='both')]
order by $t/@ident
return $t
}
</List>