<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:gal="https://github.com/goloveshin/galimatron"
    xmlns:code="galimatron-code-generation"
    exclude-result-prefixes="xs map gal code"
    version="3.0"
>
    <xsl:include href="https://github.com/goloveshin/galimatron/xslt/gal-functions.xsl"/>
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:mode name="page" on-no-match="shallow-copy"/>

    <xsl:template match="/">
        <xsl:variable name="version" select="(//root-aggregate-version-definition)[1]"/>
        <xsl:result-document href="@@page@@hello.html@@" method="html" html-version="5">
            <xsl:apply-templates select="document('templates/page.xml')" mode="page">
                <xsl:with-param name="ctx" as="map(xs:string, xs:string)" tunnel="yes" select="map {
                    'counter': string(gal:tagvalue($version, 'counter')),
                    'greetings': string(gal:tagvalue($version, 'greetings'))
                }"/>
            </xsl:apply-templates>
        </xsl:result-document>
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="code:template" mode="page">
        <xsl:apply-templates mode="page"/>
    </xsl:template>

    <!-- drop the code namespace the template carries -->
    <xsl:template match="*" mode="page">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates mode="page"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="code:*" mode="page">
        <xsl:param name="ctx" as="map(xs:string, xs:string)" tunnel="yes"/>
        <xsl:value-of select="$ctx(local-name())"/>
    </xsl:template>
</xsl:transform>
