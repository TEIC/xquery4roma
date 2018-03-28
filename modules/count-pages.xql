xquery version "1.0";

for $t in //TEI.2
let $n := $t//pb
order by count($n) descending
return  <count>
{$t/text/@id} 
{count($n)}
</count>