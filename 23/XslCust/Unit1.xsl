<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
  <xsl:template match="/">
    <html>
    <body>
    <xsl:apply-templates/>
    </body>
    </html>
  </xsl:template>

  <xsl:template match="DATAPACKET">
    <table border="1">
    <xsl:apply-templates select="METADATA/FIELDS"/>
    <xsl:apply-templates select="ROWDATA/ROW"/>
    </table>
  </xsl:template>

  <xsl:template match="FIELDS">
    <tr>
    <xsl:apply-templates/>
    </tr>
  </xsl:template>

  <xsl:template match="FIELD">
    <th>
    <xsl:value-of select="@attrname"/>
    </th>
  </xsl:template>

  <xsl:template match="ROWDATA/ROW">
    <tr>
    <xsl:for-each select="@*">
      <td>
      <xsl:value-of/>
      </td>
    </xsl:for-each>
    </tr>
  </xsl:template>

</xsl:stylesheet>
 