<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:ltx="http://dlmf.nist.gov/LaTeXML"
		xmlns="http://www.w3.org/1999/xhtml"
		xmlns:x="http://www.w3.org/1999/xhtml">
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
  <xsl:param name="id"/>
  <xsl:variable name="name">
    <xsl:choose>
      <xsl:when test="$id='mkohlhase'"><xsl:text>Michael Kohlhase</xsl:text></xsl:when>
      <xsl:when test="$id='akohlhase'"><xsl:text>Andrea Kohlhase</xsl:text></xsl:when>
      <xsl:when test="$id='miancu'"><xsl:text>Mihnea Iancu</xsl:text></xsl:when>
      <xsl:when test="$id='dginev'"><xsl:text>Deyan Ginev</xsl:text></xsl:when>
      <xsl:when test="$id='cjucovschi'"><xsl:text>Constantin Jucovschi</xsl:text></xsl:when>
      <xsl:when test="$id='twiesing'"><xsl:text>Tom Wiesing</xsl:text></xsl:when>
      <xsl:when test="$id='dmueller'"><xsl:text>Dennis Müller</xsl:text></xsl:when>
      <xsl:when test="$id='frabe'"><xsl:text>Florian Rabe</xsl:text></xsl:when>
      <xsl:when test="$id='cprodescu'"><xsl:text>Corneliu Prodescu</xsl:text></xsl:when>
      <xsl:when test="$id='clange'"><xsl:text>Christoph Lange</xsl:text></xsl:when>
      <xsl:when test="$id='cdavid'"><xsl:text>Catalin David</xsl:text></xsl:when>
      <xsl:when test="$id='vzholudev'"><xsl:text>Vyacheslav Zholudev</xsl:text></xsl:when>
      <xsl:when test="$id='cmueller'"><xsl:text>Christine Müller</xsl:text></xsl:when>
      <xsl:when test="$id='nmueller'"><xsl:text>Normen Müuller</xsl:text></xsl:when>
      <xsl:when test="$id='fhorozal'"><xsl:text>Fulya Horozal</xsl:text></xsl:when>
    </xsl:choose>
  </xsl:variable>
  
  <xsl:template match="/">
    <html>
      <head>
	<title><xsl:value-of select="$name"/>: Selected Publications</title>
	<link rel="stylesheet" href="publist.css" type="text/css"/>
	<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=UTF-8"/>
      </head>
      <body>
	<h1><xsl:value-of select="$name"/>: Selected Publications</h1>
	<p>(please respect any copyrights when downloading)</p>
	<!-- the important stuff -->
	<h2>Archival Literature</h2>
	<h3>Articles in Journals</h3>
	<ol class="ltx_biblist">
	  <xsl:copy-of  select="document(concat($id,'-article.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	</ol>
	<h3>Articles in Collections</h3>
	<ol class="ltx_biblist">
	  <xsl:copy-of select="document(concat($id,'-incollection.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	</ol>
	<h3>Papers at International, Peer-Reviewed Conferences</h3>
	<ol class="ltx_biblist">
	  <xsl:copy-of select="document(concat($id,'-conference.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	</ol>
	<h3>Monographs</h3>
	<ol class="ltx_biblist">
	  <xsl:copy-of select="document(concat($id,'-book.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	  <xsl:copy-of select="document(concat($id,'-cbook.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	</ol>
	<h3>Proceedings Edited</h3>
	<ol class="ltx_biblist">
	  <xsl:copy-of select="document(concat($id,'-cproceedings.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	</ol>
	<xsl:copy-of select="document(concat($id,'-proceedings.html'))//x:ul[@class='ltx_biblist']/x:li"/>

        <!-- important, but not archival -->
	<h2>Theses</h2>
	<ol class="ltx_biblist">
	  <xsl:copy-of select="document(concat($id,'-thesis.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	</ol>

	<!-- the rest -->
	<h2>Gray Literature</h2>
	<h3>Worskhop Proceedings Edited</h3>
	<ol class="ltx_biblist">
	  <xsl:copy-of select="document(concat($id,'-wproceedings.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	</ol>
	<h3>Papers at Peer-Reviewed Workshops</h3>
	<ol class="ltx_biblist">
	  <xsl:copy-of select="document(concat($id,'-workshop.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	</ol>
	<h3>Technical Reports</h3>
	<ol class="ltx_biblist">
	  <xsl:copy-of select="document(concat($id,'-report.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	</ol>

	<!-- not even published -->
	<h2>Unpublished</h2>
	<ol class="ltx_biblist">
	  <xsl:copy-of select="document(concat($id,'-unpublished.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	</ol>
	<h2>Miscellaneous</h2>
	<ol class="ltx_biblist">
	  <xsl:copy-of select="document(concat($id,'-misc.html'))//x:ul[@class='ltx_biblist']/x:li"/>
	</ol>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

