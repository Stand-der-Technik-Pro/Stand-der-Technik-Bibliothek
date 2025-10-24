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
				<th align="left">Practice</th>
				<th align="right">#Groups</th>
				<th align="right">#Controls</th>
			</tr>
			<xsl:for-each select="//oscal:catalog/oscal:group">
				<tr valign="top">
					<td><xsl:value-of select="concat(@id,': ',oscal:title)"/></td>
					<td align="right"><xsl:value-of select="count(oscal:group)"/></td>
					<td align="right"><xsl:value-of select="count(oscal:group//oscal:control)"/></td>
				</tr>
			</xsl:for-each>
			<tr valign="top">
				<td align="left">
					<xsl:text disable-output-escaping="yes">&amp;sum; = </xsl:text>
					<b><xsl:value-of select="count(//oscal:catalog/oscal:group)"/></b>
				</td>
				<td align="right">
					<b><xsl:value-of select="count(//oscal:catalog/oscal:group/oscal:group)"/></b>
				</td>
				<td align="right">
					<b><xsl:value-of select="count(//oscal:catalog/oscal:group/oscal:group//oscal:control)"/></b>
				</td>
			</tr>
		</table>

		<xsl:for-each select="//oscal:catalog/oscal:group">
			<h1><xsl:value-of select="concat(@id,': ',oscal:title)"/></h1>
			<xsl:for-each select="oscal:prop/oscal:remarks/oscal:p">
				<xsl:apply-templates select="."/>
			</xsl:for-each>

			<table border="1" rules="all" cellspacing="0" cellpadding="2" width="100%">
				<tr valign="top" bgcolor="#C0C0C0">
					<th align="left">Group</th>
					<th align="right">#Controls</th>
				</tr>
				<xsl:for-each select="oscal:group">
					<tr valign="top">
						<td><xsl:value-of select="concat(@id,': ',oscal:title)"/></td>
						<td align="right"><xsl:value-of select="count(.//oscal:control)"/></td>
					</tr>
				</xsl:for-each>
				<tr valign="top">
					<td align="left"><xsl:text disable-output-escaping="yes">&amp;sum;</xsl:text></td>
					<td align="right"><b><xsl:value-of select="count(oscal:group//oscal:control)"/></b></td>
				</tr>
			</table>

			<xsl:for-each select="oscal:group">
				<h2><xsl:value-of select="concat(@id,': ',oscal:title)"/></h2>

				<table border="1" rules="all" cellspacing="0" cellpadding="2" width="100%">
					<tr valign="top" bgcolor="#C0C0C0">
						<th>Control</th>
						<th>Statement</th>
						<th>Guidance</th>
					</tr>
					<xsl:for-each select=".//oscal:control">
						<tr valign="top">
							<td><xsl:value-of select="concat(@id,': ',oscal:title)"/></td>
							<td><xsl:apply-templates select="oscal:part[@name='statement']/oscal:p"/></td>
							<td><xsl:apply-templates select="oscal:part[@name='guidance']/oscal:p"/></td>
						</tr>
					</xsl:for-each>
				</table>
<!--
				<xsl:for-each select="oscal:control">
					<h3><xsl:value-of select="concat(@id,': ',oscal:title)"/></h3>
					<xsl:apply-templates select="oscal:part[@name='statement']/oscal:p"/>
					<xsl:apply-templates select="oscal:part[@name='guidance']/oscal:p"/>
				</xsl:for-each>
-->
			</xsl:for-each>
		</xsl:for-each>
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
						<xsl:value-of select="replace(.,' •','&lt;br/&gt;-')" disable-output-escaping="yes"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</p>
	</xsl:template>

	<xsl:template match="*" mode="Anforderungen">
		<xsl:variable name="Titel" select="x:trimTabLF(doc:title)"/>
		<xsl:variable name="Name" select="substring-before($Titel,' ')"/>
		<xsl:variable name="Bezeichnung" select="replace(replace(substring-after($Titel,' '),' +\([BSH]\)',''),' +\[.+\] *$','')"/>
		<xsl:variable name="Niveau" select="replace($Titel,'.+ \(([BSH])\).*','$1')"/>
		<xsl:variable name="Rollen" select="if (matches($Titel,'.+ \[.+\].*')) then replace($Titel,'[^\[]+ \[(.+)\][^\]]*','$1') else ''"/>
		<p><b><xsl:value-of select="concat($Name,' ',$Bezeichnung)"/></b></p>
		<xsl:apply-templates select="." mode="Text"/>
	</xsl:template>

	<xsl:template match="*" mode="Text">
		<xsl:for-each select="doc:para|doc:itemizedlist">
			<xsl:if test="local-name()='para'">
				<p><xsl:value-of select="x:trimTabLF(.)"/></p>
			</xsl:if>
			<xsl:if test="local-name()='itemizedlist'">
				<ul>
					<xsl:for-each select="doc:listitem">
						<li>
							<xsl:apply-templates select="." mode="Text"/>
						</li>
					</xsl:for-each>
				</ul>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<xsl:function name="x:trimTabLF" as="xs:string">
		<xsl:param name="s" as="xs:string"/> 
		<xsl:sequence select="replace(replace($s,concat('^[',$LF,$TAB,' ]+'),''),concat('[',$LF,$TAB,' ]+$'),'')"/>
	</xsl:function>

</xsl:stylesheet>