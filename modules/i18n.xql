xquery version "1.0";
declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace rng="http://relaxng.org/ns/structure/1.0";
declare namespace html="http://www.w3.org/1999/xhtml";
import module namespace config="http://xquery.tei-c.org/modules/config" at "config.xqm";

<i18n>
{
for $c in $config:p5subset/i18n/*
return $c
}
</i18n>
