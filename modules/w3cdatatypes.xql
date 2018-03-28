xquery version "1.0";
declare namespace xs="http://www.w3.org/2001/XMLSchema";
import module namespace config="http://xquery.tei-c.org/modules/config" at "config.xqm";

<w3cdataList>
{
for $t in $config:p5subset//xs:schema//xs:simpleType[@name]
order by $t/@name
return
<w3cdataType>{data($t/@name)}</w3cdataType>
}
</w3cdataList>
