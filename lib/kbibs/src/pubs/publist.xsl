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

  <xsl:variable name="article"
		select="document(concat($id,'-article.html'))//x:ul[@class='ltx_biblist']/x:li"/>

  <xsl:variable name="incollection" select="document(concat($id,'-incollection.html'))//x:ul[@class='ltx_biblist']/x:li"/>
  <xsl:variable name="conference" select="document(concat($id,'-conference.html'))//x:ul[@class='ltx_biblist']/x:li"/>
  <xsl:variable name="book" select="document(concat($id,'-book.html'))//x:ul[@class='ltx_biblist']/x:li|
				                           document(concat($id,'-cbook.html'))//x:ul[@class='ltx_biblist']/x:li"/>
  <xsl:variable name="proceedings" select="document(concat($id,'-cproceedings.html'))//x:ul[@class='ltx_biblist']/x:li|
					                              document(concat($id,'-proceedings.html'))//x:ul[@class='ltx_biblist']/x:li"/>
  <xsl:variable name="thesis" select="document(concat($id,'-thesis.html'))//x:ul[@class='ltx_biblist']/x:li"/>
  <xsl:variable name="wproceedings" select="document(concat($id,'-wproceedings.html'))//x:ul[@class='ltx_biblist']/x:li"/>
  <xsl:variable name="workshop" select="document(concat($id,'-workshop.html'))//x:ul[@class='ltx_biblist']/x:li"/>
  <xsl:variable name="report" select="document(concat($id,'-report.html'))//x:ul[@class='ltx_biblist']/x:li"/>
  <xsl:variable name="unpublished" select="document(concat($id,'-unpublished.html'))//x:ul[@class='ltx_biblist']/x:li"/>
  <xsl:variable name="misc" select="document(concat($id,'-misc.html'))//x:ul[@class='ltx_biblist']/x:li"/>

  <xsl:template match="/">
    <html>
      <head>
	<title><xsl:value-of select="$name"/>: Selected Publications</title>
	<link rel="stylesheet" href="../publist.css" type="text/css"/>
	<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=UTF-8"/>
      </head>
      <body>
	<h1><xsl:value-of select="$name"/>: Selected Publications</h1>
	<p>(please respect any copyrights when downloading)</p>
        <ol>
	  <xsl:if test="$article or $incollection or $conference or $book or $proceedings">
	      <li>
	      <a href="#archival">Archival Literature</a>
	      <ol>
		<xsl:if test="$article"><li><a href="#article">Articles in Journals</a></li></xsl:if>
		<xsl:if test="$incollection"><li><a href="#incollection">Articles in Collections</a></li></xsl:if>
		<xsl:if test="$conference"><li><a href="#conference">Papers at International, Peer-Reviewed Conferences</a></li></xsl:if>
		<xsl:if test="$book"><li><a href="#book">Monographs</a></li></xsl:if>
		<xsl:if test="$proceedings"><li><a href="#proceedings">Proceedings Edited</a></li></xsl:if>
	      </ol>
	      </li>
	    </xsl:if>
	    <xsl:if test="$thesis">
	      <li><a href="#thesis">Theses</a></li>
	    </xsl:if>
 	    <xsl:if test="$wproceedings or $workshop or $report">
	      <li>
		<a href="#gray">Gray Literature</a>
		<ol>
		  <xsl:if test="$wproceedings"><li><a href="#wproceedings">Worskhop Proceedings Edited</a></li></xsl:if>
		  <xsl:if test="$workshop"><li><a href="#workshop">Papers at Peer-Reviewed Workshops</a></li></xsl:if>
		  <xsl:if test="$report"><li><a href="#report">Technical Reports</a></li></xsl:if>
		</ol>
	      </li>
	    </xsl:if>
	    <xsl:if test="$unpublished"><li><a href="#unpublished">Unpublished</a></li></xsl:if>
	  <xsl:if test="$misc"><li><a href="#misc">Miscellaneous</a></li></xsl:if>
	</ol>

	<!-- the important stuff -->

	<xsl:if test="$article or $incollection or $conference or $book or $proceedings">
	  <h2 id="archival">Archival Literature</h2>
	  <xsl:if test="$article">
	    <h3 id="article">Articles in Journals</h3>
	    <ol class="ltx_biblist"><xsl:copy-of  select="$article"/></ol>
	  </xsl:if>

	  <xsl:if test="$incollection">
	    <h3 id="incollection">Articles in Collections</h3>
	    <ol class="ltx_biblist"><xsl:copy-of select="$incollection"/></ol>
	  </xsl:if>

	  <xsl:if test="$conference">
	    <h3 id="conference">Papers at International, Peer-Reviewed Conferences</h3>
	    <ol class="ltx_biblist"><xsl:copy-of select="$conference"/></ol>
	  </xsl:if>
	  
	  <xsl:if test="$book">
	    <h3 id="book">Monographs</h3>
	    <ol class="ltx_biblist"><xsl:copy-of select="$book"/></ol>
	  </xsl:if>
	  
	  <xsl:if test="$proceedings">
	    <h3 id="proceedings">Proceedings Edited</h3>
	    <ol class="ltx_biblist"><xsl:copy-of select="$proceedings"/></ol>
	  </xsl:if>
	</xsl:if>
	
        <!-- important, but not archival -->
	<xsl:if test="$thesis">
	  <h2 id="thesis">Theses</h2>
	  <ol class="ltx_biblist"><xsl:copy-of select="$thesis"/></ol>
	</xsl:if>

	<!-- the gray literature -->
	<xsl:if test="$wproceedings or $workshop or $report">
	  <h2 id="gray">Gray Literature</h2>

	  <xsl:if test="$wproceedings">
	    <h3 id="wproceedings">Worskhop Proceedings Edited</h3>
	    <ol class="ltx_biblist"><xsl:copy-of select="$wproceedings"/></ol>
	  </xsl:if>

	  <xsl:if test="$workshop">
	    <h3 id="workshop">Papers at Peer-Reviewed Workshops</h3>
	    <ol class="ltx_biblist"><xsl:copy-of select="$workshop"/></ol>
	  </xsl:if>
	  
	  <xsl:if test="$report">
	    <h3 id="report">Technical Reports</h3>
	    <ol class="ltx_biblist"><xsl:copy-of select="$report"/></ol>
	  </xsl:if>
	</xsl:if>

	<!-- not even published -->
	<xsl:if test="$unpublished">
	  <h2 id="unpublished">Unpublished</h2>
	  <ol class="ltx_biblist"><xsl:copy-of select="$unpublished"/></ol>
	</xsl:if>

	<xsl:if test="$misc">
	  <h2 id="misc">Miscellaneous</h2>
	  <ol class="ltx_biblist"><xsl:copy-of select="$misc"/></ol>
	</xsl:if>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

