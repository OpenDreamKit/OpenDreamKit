<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:ltx="http://dlmf.nist.gov/LaTeXML"
		xmlns="http://www.w3.org/1999/xhtml"
		xmlns:x="http://www.w3.org/1999/xhtml">
  <xsl:param name="id"/>
  <xsl:variable name="name">
    <xsl:choose>
      <xsl:when test="$id='mkohlhase'"><xsl:text>Michael Kohlhase</xsl:text></xsl:when>
      <xsl:when test="$id='akohlhase'"><xsl:text>Andrea Kohlhase</xsl:text></xsl:when>
    </xsl:choose>
  </xsl:variable>
  
  <xsl:template match="/">
    <html>
      <head>
	<title><xsl:value-of select="$name"/>: Selected Publications</title>
	<link rel="stylesheet" href="bib.css" type="text/css"/>
      </head>
      <body>
	<h1><xsl:value-of select="$name"/>: Selected Publications</h1>
	<p>(please respect any copyrights when downloading)</p>
	<h2>Articles in Journals</h2>
	<ul class="ltx_biblist">
	  <xsl:copy-of  select="document(concat($id,'-article.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	</ul>
	<h2>Articles in Collections</h2>
	<ul class="ltx_biblist">
	  <xsl:copy-of select="document(concat($id,'-incollection.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	</ul>
	<h2>Conference and Workshop Contributions</h2>
	<ul class="ltx_biblist">
	  <xsl:copy-of select="document(concat($id,'-inproceedings.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	</ul>
	<h2>Monographs and Proceedings</h2>
	<ul class="ltx_biblist">
	</ul>
	<xsl:copy-of select="document(concat($id,'-proceedings.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	<h2>Theses</h2>
	<ul class="ltx_biblist">
	  <xsl:copy-of select="document(concat($id,'-thesis.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	</ul>
	<h2>Technical Reports</h2>
	<ul class="ltx_biblist">
	  <xsl:copy-of select="document(concat($id,'-report.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	</ul>
	<h2>Unpublished</h2>
	<ul class="ltx_biblist">
	  <xsl:copy-of select="document(concat($id,'-unpublished.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	</ul>
	<h2>Miscellaneous</h2>
	<ul class="ltx_biblist">
	  <xsl:copy-of select="document(concat($id,'-misc.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	</ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

