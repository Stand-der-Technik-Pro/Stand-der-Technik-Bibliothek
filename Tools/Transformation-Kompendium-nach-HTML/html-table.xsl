<?xml version="1.0" encoding="UTF-8"?>
<!-- 
Urheber des Skripts ist Ingo Henkel. ingo.henkel@secunet.com / secunet Security Networks AG / Dreizehnmorgenweg 6 / 53175 Bonn / Deutschland
-->
<xsl:stylesheet version="1.0"
	xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:x="http://example.com/namespace"
	xmlns:doc="http://docbook.org/ns/docbook"
	xmlns:scroll="http://www.k15t.com/scroll-docbook/extensions"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	exclude-result-prefixes="oscal x xs ss doc scroll xlink xsi"
>
	<xsl:decimal-format name="de" grouping-separator="." decimal-separator=","/>
	<xsl:output method="xml" omit-xml-declaration="yes" indent="no" encoding="UTF-8"/>

	<xsl:variable name="LF" select="'&#10;'"/>
	<xsl:variable name="TAB" select="'&#9;'"/>

	<xsl:variable name="title" select="//oscal:catalog/oscal:metadata/oscal:title"/>

	<xsl:template match="/*">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;meta http-equiv=Content-Type content="text/html; charset=utf-8"&gt;</xsl:text>
		<html>
		<head><title><xsl:value-of select="$title"/></title></head>
		<body>
		<h1><em><xsl:value-of select="$title"/></em></h1>
		<table border="1" rules="all" cellspacing="0" cellpadding="2" width="100%">
			<tr valign="top" bgcolor="#C0C0C0">
				<th>Practice</th>
				<th>Group</th>
				<th>ID</th>
				<th>Control</th>
				<th>Statement</th>
				<th>Modus</th>
				<th>Guidance</th>
			</tr>
			<xsl:for-each select="//oscal:catalog/oscal:group">
				<xsl:variable name="practice" select="oscal:title"/>
				<xsl:for-each select="oscal:group">
					<xsl:variable name="group" select="oscal:title"/>
					<xsl:for-each select=".//oscal:control">
						<tr valign="top">
							<td><xsl:value-of select="$practice"/></td>
							<td><xsl:value-of select="$group"/></td>
							<td><xsl:value-of select="@id"/></td>
							<td><xsl:value-of select="oscal:title"/></td>
							<td><xsl:apply-templates select="oscal:part[@name='statement']/oscal:p"/></td>
							<td><xsl:apply-templates select="oscal:part[@name='statement']/oscal:prop[@name='modalverb']/@value"/></td>
							<td><xsl:apply-templates select="oscal:part[@name='guidance']/oscal:p"/></td>
						</tr>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:for-each>
		</table>
		</body>
		</html>
	</xsl:template>

	<xsl:template match="oscal:p">
		<p>
			<xsl:for-each select="node()">
				<xsl:choose>
					<xsl:when test="local-name()='insert'">
						<xsl:variable name="idRef" select="@id-ref"/>
						<i><xsl:value-of select="//oscal:param[@id=$idRef]/oscal:label"/></i>
					</xsl:when>
					<xsl:when test="local-name()='q'">
						<b>„<xsl:value-of select="."/>“</b>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="."/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</p>
	</xsl:template>

</xsl:stylesheet>