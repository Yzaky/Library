<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <!-- to produce legal and validable XHTML ... -->
    <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"
        encoding="UTF-8"/>

    <xsl:param name="nomAuteur" select="''"/>

    <xsl:template match="/bibliotheque">
        <html>
            <head>
                <title>auteurs tp1</title>
                <link>
                    <xsl:attribute name="rel">stylesheet</xsl:attribute>
                    <xsl:attribute name="href">style.css</xsl:attribute>
                </link>
            </head>
            <body>
                <h1 class="ribbon"> bibliotheque : vue auteur(s) </h1>
                <a href="bibliotheque.html">
                    <h2 align="center">La Bibliotheque</h2>
                </a>
                <table align="center">
                    <tr>
                        <th>Nom</th>
                        <th>Prenom</th>
                        <th>Pays</th>

                        <th>Photo</th>
                        <th>Commentaire</th>
                    </tr>
                    <xsl:for-each select="auteur">



                        <xsl:choose>
                            <xsl:when test="$nomAuteur = ''">
                                <tr>
                                    <td>
                                        <xsl:value-of select="nom"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="prenom"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="pays"/>
                                    </td>

                                    <td>
                                        <xsl:variable name="photo">
                                            <xsl:value-of select="photo"/>
                                        </xsl:variable>
                                        <xsl:choose>

                                            <xsl:when test="$photo != ''">
                                                <xsl:variable name="hyperlink">
                                                  <xsl:value-of select="photo"/>
                                                </xsl:variable>

                                                <img src="{$hyperlink}" alt="Photo"/>
                                            </xsl:when>
                                            <xsl:otherwise> no </xsl:otherwise>
                                        </xsl:choose>

                                    </td>

                                    <td class="commentaire">
                                        <xsl:value-of select="commentaire[1]"/>
                                        <br/>
                                        <xsl:value-of select="commentaire[2]"/>
                                    </td>



                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:if test="nom = $nomAuteur">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="nom"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="prenom"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="pays"/>
                                        </td>

                                        <td>
                                            <xsl:variable name="photo">
                                                <xsl:value-of select="photo"/>
                                            </xsl:variable>
                                            <xsl:choose>

                                                <xsl:when test="$photo != ''">
                                                  <xsl:variable name="hyperlink">
                                                  <xsl:value-of select="photo"/>
                                                  </xsl:variable>

                                                  <img src="{$hyperlink}" alt="Photo" width="50"
                                                  height="50"/>
                                                </xsl:when>
                                                <xsl:otherwise> no </xsl:otherwise>
                                            </xsl:choose>

                                        </td>

                                        <td>
                                            <xsl:value-of select="commentaire[1]"/>
                                            <br/>
                                            <xsl:value-of select="commentaire[2]"/>
                                        </td>



                                    </tr>

                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>



                    </xsl:for-each>
                </table>
            </body>
        </html>


    </xsl:template>

</xsl:stylesheet>
