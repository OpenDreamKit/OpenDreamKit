<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:ltx="http://dlmf.nist.gov/LaTeXML"
		xmlns="http://www.w3.org/1999/xhtml"
		xmlns:x="http://www.w3.org/1999/xhtml">
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

  <xsl:variable name="here" select="."/>

  <xsl:variable name="article">
    <xsl:for-each select="document('article.html')//x:ul[@class='ltx_biblist']/x:li">
      <xsl:sort order="descending" select="x:span/x:span[contains(@class,'ltx_bib_year')]"/>
      <xsl:copy-of select="."/>
    </xsl:for-each>
  </xsl:variable>

  <xsl:variable name="incollection">
    <xsl:for-each select="document('incollection.html')//x:ul[@class='ltx_biblist']/x:li">
      <xsl:sort order="descending" select="x:span/x:span[contains(@class,'ltx_bib_year')]"/>
      <xsl:copy-of select="."/>
    </xsl:for-each>
  </xsl:variable>

  <xsl:variable name="conference">
    <xsl:for-each select="document('conference.html')//x:ul[@class='ltx_biblist']/x:li">
      <xsl:sort order="descending" select="x:span/x:span[contains(@class,'ltx_bib_year')]"/>
      <xsl:copy-of select="."/>
    </xsl:for-each>
  </xsl:variable>

  <xsl:variable name="workshop">
    <xsl:for-each select="document('workshop.html')//x:ul[@class='ltx_biblist']/x:li">
      <xsl:sort order="descending" select="x:span/x:span[contains(@class,'ltx_bib_year')]"/>
      <xsl:copy-of select="."/>
    </xsl:for-each>
  </xsl:variable>

  <xsl:variable name="book">
    <xsl:for-each select="document('book.html')//x:ul[@class='ltx_biblist']/x:li|
				                           document('cbook.html')//x:ul[@class='ltx_biblist']/x:li">
      <xsl:sort order="descending" select="x:span/x:span[contains(@class,'ltx_bib_year')]"/>
      <xsl:copy-of select="."/>
    </xsl:for-each>
  </xsl:variable>

  <xsl:variable name="cproceedings">
    <xsl:for-each select="document('cproceedings.html')//x:ul[@class='ltx_biblist']/x:li">
      <xsl:sort order="descending" select="x:span/x:span[contains(@class,'ltx_bib_year')]"/>
      <xsl:copy-of select="."/>
    </xsl:for-each>
  </xsl:variable>

  <xsl:variable name="wproceedings">
    <xsl:for-each select="document('wproceedings.html')//x:ul[@class='ltx_biblist']/x:li">
      <xsl:sort order="descending" select="x:span/x:span[contains(@class,'ltx_bib_year')]"/>
      <xsl:copy-of select="."/>
    </xsl:for-each>
  </xsl:variable>

  <xsl:variable name="thesis">
    <xsl:for-each select="document('thesis.html')//x:ul[@class='ltx_biblist']/x:li">
      <xsl:sort order="descending" select="x:span/x:span[contains(@class,'ltx_bib_year')]"/>
      <xsl:copy-of select="."/>
    </xsl:for-each>
  </xsl:variable>

  <xsl:variable name="report">
    <xsl:for-each select="document('report.html')//x:ul[@class='ltx_biblist']/x:li">
      <xsl:sort order="descending" select="x:span/x:span[contains(@class,'ltx_bib_year')]"/>
      <xsl:copy-of select="."/>
    </xsl:for-each>
  </xsl:variable>

  <xsl:variable name="unpublished">
    <xsl:for-each select="document('unpublished.html')//x:ul[@class='ltx_biblist']/x:li">
      <xsl:sort order="descending" select="x:span/x:span[contains(@class,'ltx_bib_year')]"/>
      <xsl:copy-of select="."/>
    </xsl:for-each>
  </xsl:variable>

  <xsl:variable name="misc">
    <xsl:for-each select="document('misc.html')//x:ul[@class='ltx_biblist']/x:li">
      <xsl:sort order="descending" select="x:span/x:span[contains(@class,'ltx_bib_year')]"/>
      <xsl:copy-of select="."/>
    </xsl:for-each>
  </xsl:variable>

  <xsl:template match="/">
    <html>
      <head>
	<title>KWARC Group: Selected Publications</title>
	<style type="text/css">
	  .ltx_bib_cited {display:none}
	  .ltx_bib_key {display:none}

	  /* lifted from LaTeXML.css */
	  .ltx_bib_title { font-style:italic; }
	  .ltx_bib_article .bib-title { font-style:normal !important; }
	  .ltx_bib_journal  { font-style:italic; }
	  .ltx_bib_volume { font-weight:bold; }
	</style>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css" />
	<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=UTF-8"/>
      </head>
      <body>
				<div class="container">

					<!-- Header -->
					<div class="row">
			      <div class="col s12">
							<h1>KWARC Group: Selected Publications</h1>

							<blockquote>
								This website represents the joint bibliography of the <a href="https://kwarc.info">KWARC group</a> and is generated automatically. <br />
								For more details, please see the <a href="https://github.com/KWARC/bibs">Github Repository</a>. <br />
					      Please respect any copyrights when downloading 
							</blockquote>

							<ol>
								<xsl:if test="$article!='' or $incollection!='' or $conference!='' or $book!='' or $proceedings!=''">
									<li>
										<a href="#archival">Archival Literature</a>
										<ol>
											<xsl:if test="$article!=''"><li><a href="#article">Articles in Journals</a></li></xsl:if>
											<xsl:if test="$incollection!=''"><li><a href="#incollection">Articles in Collections</a></li></xsl:if>
											<xsl:if test="$conference!=''"><li><a href="#conference">Papers at International, Peer-Reviewed Conferences</a></li></xsl:if>
											<xsl:if test="$book!=''"><li><a href="#book">Monographs</a></li></xsl:if>
											<xsl:if test="$cproceedings!=''"><li><a href="#cproceedings">Conference Proceedings Edited</a></li></xsl:if>
										</ol>
									</li>
								</xsl:if>
								<xsl:if test="$thesis!=''">
									<li><a href="#thesis">Theses</a></li>
								</xsl:if>
								<xsl:if test="$wproceedings!='' or $workshop!='' or $report!=''">
									<li>
											<a href="#gray">Gray Literature</a>
											<ol>
												<xsl:if test="$wproceedings!=''"><li><a href="#wproceedings">Worskhop Proceedings Edited</a></li></xsl:if>
												<xsl:if test="$workshop!=''"><li><a href="#workshop">Papers at Peer-Reviewed Workshops</a></li></xsl:if>
												<xsl:if test="$report!=''"><li><a href="#report">Technical Reports</a></li></xsl:if>
											</ol>
									</li>
								</xsl:if>
								<xsl:if test="$unpublished!=''"><li><a href="#unpublished">Unpublished</a></li></xsl:if>
								<xsl:if test="$misc!=''"><li><a href="#misc">Miscellaneous</a></li></xsl:if>
							</ol>
						</div>
					</div>

					<div class="row">
						<div class="col s12">

							<!-- important -->
							<xsl:if test="$article!='' or $incollection!='' or $conference!='' or $book!='' or $cproceedings!=''">
								<h2 id="archival">Archival Literature</h2>

							  <xsl:if test="$article!=''">
									<h3 id="article">Articles in Journals</h3>
					    		<ol class="ltx_biblist"><xsl:copy-of select="$article"/></ol>
							  </xsl:if>

								<xsl:if test="$incollection!=''">
									<h3 id="incollection">Articles in Collections</h3>
									<ol class="ltx_biblist"><xsl:copy-of select="$incollection"/></ol>
							  </xsl:if>

								<xsl:if test="$conference!=''">
									<h3 id="conference">Papers at International, Peer-Reviewed Conferences</h3>
									<ol class="ltx_biblist"><xsl:copy-of select="$conference"/></ol>
							  </xsl:if>

								<xsl:if test="$book!=''">
							  	<h3 id="book">Monographs</h3>
									<ol class="ltx_biblist"><xsl:copy-of select="$book"/></ol>
							  </xsl:if>

								<xsl:if test="$cproceedings!=''">
									<h3 id="cproceedings">Conference Proceedings Edited</h3>
									<ol class="ltx_biblist"><xsl:copy-of select="$cproceedings"/></ol>
							  </xsl:if>
							</xsl:if>

							<!-- important, but not archival -->
							<xsl:if test="$thesis!=''">
								<h2 id="thesis">Theses</h2>
								<ol class="ltx_biblist"><xsl:copy-of select="$thesis"/></ol>
							</xsl:if>

							<!-- the gray literature -->
							<xsl:if test="$wproceedings!='' or $workshop!='' or $report!=''">
								<h2 id="gray">Gray Literature</h2>

								<xsl:if test="$wproceedings!=''">
									<h3 id="wproceedings">Worskhop Proceedings Edited</h3>
									<ol class="ltx_biblist"><xsl:copy-of select="$wproceedings"/></ol>
								</xsl:if>

								<xsl:if test="$workshop!=''">
									<h3 id="workshop">Papers at Peer-Reviewed Workshops</h3>
									<ol class="ltx_biblist"><xsl:copy-of select="$workshop"/></ol>
								</xsl:if>

								<xsl:if test="$report!=''">
									<h3 id="report">Technical Reports</h3>
									<ol class="ltx_biblist"><xsl:copy-of select="$report"/></ol>
								</xsl:if>
							</xsl:if>

							<!-- not even published -->
							<xsl:if test="$unpublished!=''">
								<h2 id="unpublished">Unpublished</h2>
								<ol class="ltx_biblist"><xsl:copy-of select="$unpublished"/></ol>
							</xsl:if>

							<xsl:if test="$misc!=''">
								<h2 id="misc">Miscellaneous</h2>
								<ol class="ltx_biblist"><xsl:copy-of select="$misc"/></ol>
							</xsl:if>
						</div>
					</div>
				</div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
