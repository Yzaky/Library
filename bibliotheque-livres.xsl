<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <!-- to produce legal and validable XHTML ... -->
    <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"
        encoding="UTF-8"/>

    <xsl:param name="nomLivre" select="''"/>





    <xsl:template match="/bibliotheque">
        <html>
            <head>
                <link>
                    <xsl:attribute name="rel">stylesheet</xsl:attribute>
                    <xsl:attribute name="href">style.css</xsl:attribute>
                </link>
                <title>bibliotheque tp1</title>
            </head>
            <body>
                <h1 class="ribbon"> bibliotheque : vue livre(s) </h1>
                <a href="auteurs.html">
                    <h2 align="center">Les Auteurs</h2>
                </a>
                <table align="center">
                    <tr>
                        <th>Titre</th>
                        <th>Auteur</th>
                        <th>Langue</th>
                        <th>Annee</th>
                        <th>Prix</th>
                        <th>Monnaie</th>
                        <th>Couverture</th>
                        <th>Commentaire</th>
                        <th>Personnage(s)</th>
                        <th>Photo</th>
                    </tr>
                    <xsl:for-each select="livre">



                        <xsl:choose>
                            <xsl:when test="$nomLivre = ''">
                                <tr>

                                    <td class="titre">
                                        <xsl:value-of select="titre"/>

                                    </td>
                                    <td class="auteur">
                                        <xsl:variable name="idauteur">
                                            <xsl:value-of select="@auteur"/>
                                        </xsl:variable>

                                        <xsl:for-each select="./parent::bibliotheque/auteur">
                                            <xsl:variable name="lid">
                                                <xsl:value-of select="@ident"/>
                                            </xsl:variable>



                                            <xsl:if test="$idauteur = $lid">
                                                <xsl:for-each select="./parent::bibliotheque/auteur">
                                                  <xsl:if test="$idauteur = @ident">

                                                  <xsl:value-of select="prenom"/>
                                                  <br/>
                                                  <xsl:value-of select="nom"/>
                                
                                                  </xsl:if>
                                                    
                                                </xsl:for-each>

                                            </xsl:if>

                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@language"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="annee"/>
                                    </td>
                                    <td text-align="right">
                                        <xsl:value-of select="prix/valeur"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="prix/@monnaie"/>
                                    </td>
                                    <td>
                                        <xsl:variable name="couv">
                                            <xsl:value-of select="couverture"/>
                                        </xsl:variable>
                                        <xsl:choose>

                                            <xsl:when test="$couv != ''">
                                                <xsl:variable name="hyperlink">
                                                  <xsl:value-of select="couverture"/>
                                                </xsl:variable>

                                                <img src="{$hyperlink}" alt="Couverture " width="50"
                                                  height="50"/>
                                            </xsl:when>
                                            <xsl:otherwise> not available </xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:variable name="lefilm">
                                            <xsl:value-of select="film"/>
                                        </xsl:variable>
                                        <xsl:choose>

                                            <xsl:when test="$lefilm != ''">
                                                <xsl:variable name="hyperlink">
                                                  <xsl:value-of select="film"/>
                                                </xsl:variable>
                                                <br/>
                                                <a href="{$hyperlink}" alt="film ">Cliquer ici pour
                                                  voir le film</a>
                                            </xsl:when>
                                            <xsl:otherwise> Film not available </xsl:otherwise>
                                        </xsl:choose>

                                    </td>

                                    <td class="commentaire">
                                        <xsl:value-of select="commentaire"/>
                                    </td>
                                    <td class="perso">
                                        <p>
                                            <b>Nom:</b>
                                        </p>
                                        <div id="name">
                                            <xsl:value-of select="personnage/nom"/>
                                        </div>
                                        <br/>
                                        <p>
                                            <b>Prenom:</b>
                                        </p>
                                        <p float="right">
                                            <xsl:value-of select="personnage/prenom"/>
                                        </p>

                                        <p>
                                            <b>Pays:</b>
                                        </p>
                                        <div id="name">
                                            <xsl:value-of select="personnage/pays"/>
                                        </div>

                                        <br/>
                                        <p>
                                            <b>Commentaire:</b>
                                        </p>
                                        <div class="percom">
                                            <xsl:value-of select="personnage/commentaire"/>
                                        </div>
                                    </td>
                                    <td>
                                        <xsl:variable name="photo">
                                            <xsl:value-of select="personnage/photo"/>
                                        </xsl:variable>
                                        <xsl:choose>

                                            <xsl:when test="$photo != ''">
                                                <xsl:variable name="hyperlink">
                                                  <xsl:value-of select="personnage/photo"/>
                                                </xsl:variable>

                                                <img src="{$hyperlink}" alt="Photo"/>
                                            </xsl:when>
                                            <xsl:otherwise> Not available </xsl:otherwise>
                                        </xsl:choose>
                                    </td>

                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:if test="titre = $nomLivre">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="titre"/>
                                        </td>
                                        <td>
                                            <xsl:variable name="idauteur">
                                                <xsl:value-of select="@auteur"/>
                                            </xsl:variable>

                                            <xsl:for-each select="./parent::bibliotheque/auteur">
                                                <xsl:variable name="lid">
                                                  <xsl:value-of select="@ident"/>
                                                </xsl:variable>



                                                <xsl:if test="$idauteur = $lid">
                                                  <xsl:for-each
                                                  select="./parent::bibliotheque/auteur">
                                                  <xsl:if test="$idauteur = @ident">


                                                  <xsl:value-of select="nom"/>
                                                  </xsl:if>
                                                  </xsl:for-each>

                                                </xsl:if>

                                            </xsl:for-each>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@language"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="annee"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="prix"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="prix/@monnaie"/>
                                        </td>
                                        <td>
                                            <xsl:variable name="couv">
                                                <xsl:value-of select="couverture"/>
                                            </xsl:variable>
                                            <xsl:choose>

                                                <xsl:when test="$couv != ''">
                                                  <xsl:variable name="hyperlink">
                                                  <xsl:value-of select="couverture"/>
                                                  </xsl:variable>

                                                  <img src="{$hyperlink}" alt="Couverture "
                                                  width="50" height="50"/>
                                                </xsl:when>
                                                <xsl:otherwise> no </xsl:otherwise>
                                            </xsl:choose>

                                        </td>
                                        <td>
                                            <xsl:variable name="lefilm">
                                                <xsl:value-of select="film"/>
                                            </xsl:variable>
                                            <xsl:choose>

                                                <xsl:when test="$lefilm != ''">
                                                  <xsl:variable name="hyperlink">
                                                  <xsl:value-of select="film"/>
                                                  </xsl:variable>

                                                  <a href="{$hyperlink}" alt="film " width="50"
                                                  height="50">ici</a>
                                                </xsl:when>
                                                <xsl:otherwise> no </xsl:otherwise>
                                            </xsl:choose>

                                        </td>
                                        <td>
                                            <xsl:value-of select="commentaire"/>
                                        </td>
                                        <td class="perso">
                                            <p>
                                                <b>Nom:</b>
                                            </p>
                                            <div id="name">
                                                <xsl:value-of select="personnage/nom"/>
                                            </div>
                                            <br/>
                                            <p>
                                                <b>Prenom:</b>
                                            </p>
                                            <p float="right">
                                                <xsl:value-of select="personnage/prenom"/>
                                            </p>

                                            <p>
                                                <b>Pays:</b>
                                            </p>
                                            <div id="name">
                                                <xsl:value-of select="personnage/pays"/>
                                            </div>
                                            <div class="pic">
                                                <xsl:variable name="photo">
                                                  <xsl:value-of select="personnage/photo"/>
                                                </xsl:variable>
                                                <xsl:choose>

                                                  <xsl:when test="$photo != ''">
                                                  <xsl:variable name="hyperlink">
                                                  <xsl:value-of select="personnage/photo"/>
                                                  </xsl:variable>

                                                  <img src="{$hyperlink}" alt="Photo"/>
                                                  </xsl:when>
                                                  <xsl:otherwise> Not available </xsl:otherwise>
                                                </xsl:choose>
                                            </div>
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
