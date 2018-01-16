<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output
method="text"
encoding="UTF-8"
standalone="no"
indent="yes"
media-type="text/csv"/>
<xsl:template match="/log">
revision;author;date;
<xsl:for-each select="logentry/paths">
 <xsl:value-of select="../@revision"/>
 <xsl:value-of select="../author"/>
 <xsl:value-of select="../date"/>
 <xsl:value-of select="@action"/>
 <xsl:value-of select="@kind"/>
 <xsl:value-of select="../msg"/>

</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
<!-- 
cat svn.log | sed -E 's#(^r[0-9]+);([A-Z]{2,3}-[0-9]+)[ -:]*(.+);.*trunk/(.*)$#\1     \2     \3   \4#g'
-->
