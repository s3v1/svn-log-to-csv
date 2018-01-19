<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output
method="text"
encoding="UTF-8"
standalone="no"
indent="no"
media-type="text/csv"/>
<xsl:template match="/log">revision;author;date;action;kind;file;message
<xsl:for-each select="logentry/paths/path">
<xsl:value-of select="../../@revision"/>;<xsl:value-of select="../../author"/>;<xsl:value-of select="../../date"/>;<xsl:value-of select="@action"/>;<xsl:value-of select="@kind"/>;<xsl:value-of select="."/>;<xsl:value-of select="translate(../../msg,'&#9;&#10;', '')"/>
<xsl:text>&#xa;</xsl:text>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
