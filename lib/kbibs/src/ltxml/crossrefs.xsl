<?xml version="1.0" encoding="UTF-8"?>
<!-- pull back the crossrefs in LaTeXML-generated bib.XML -->
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:ltx="http://dlmf.nist.gov/LaTeXML">

  <!-- normally we just copy -->
  <xsl:template match="*|@*|text()">
    <xsl:copy>
      <xsl:apply-templates select="*|@*|text()"/>
    </xsl:copy>
  </xsl:template>

  
  <!-- for a cross-reference we just copy over what we need,
          proceedings and books need to be treated specially --> 
  <xsl:template match="ltx:bib-related[@role='host' and @bibrefs]">
    <xsl:variable name="bibref" select="@bibrefs"/>
    <xsl:variable name="target" select="//ltx:bibentry[@key=$bibref]"/>
    <xsl:choose>
      <xsl:when test="$target/@type='proceedings' or $target/@type='book' or $target/@type='collection'">
	<xsl:copy>
	  <xsl:copy-of select="@*[local-name()!='bibrefs']"/>
	  <xsl:attribute name="type"><xsl:value-of select="$target/@type"/></xsl:attribute>
	  <xsl:apply-templates select="$target/*"/>
	</xsl:copy>
      </xsl:when>
      <xsl:otherwise>
	<xsl:apply-templates select="*"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>

