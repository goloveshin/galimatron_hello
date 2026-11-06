<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0"
>
    <xsl:mode on-no-match="shallow-copy"/>

    <!-- counter = { "0" } becomes { "1" }, then { "2" }, and so on -->
    <xsl:template match="tag[@name='counter']/values/value/string/text()">
        <xsl:value-of select="xs:integer(.) + 1"/>
    </xsl:template>

    <!-- greetings starts empty. each run writes the same sentence -->
    <xsl:template match="tag[@name='greetings']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node() except values"/>
            <values>
                <value index="0">
                    <string delimiter="0">Hello world from Galimatron!</string>
                </value>
            </values>
        </xsl:copy>
    </xsl:template>
</xsl:transform>
