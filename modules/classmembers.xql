xquery version "1.0";
declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace rng="http://relaxng.org/ns/structure/1.0";
declare namespace request="http://exist-db.org/xquery/request";
import module namespace config="http://xquery.tei-c.org/modules/config" at "config.xqm";

<list>
{
let $class := request:get-parameter("class", "")
for $e in
$config:p5subset//(tei:elementSpec|tei:classSpec)[tei:classes/tei:memberOf[@key=$class]]
order by $e/@ident
	return
	<item>{data($e/@ident)}</item>
}

</list>
