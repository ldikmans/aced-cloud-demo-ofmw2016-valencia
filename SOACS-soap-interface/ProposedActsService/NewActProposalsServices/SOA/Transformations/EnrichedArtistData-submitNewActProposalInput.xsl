<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/sp/submitNewActProposal"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ns1="aced.cloud.demo" xmlns:ns0="ArtistAPI"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns1 ns0 tns xp20 oraxsl mhdr oraext dvm xref socket"
                xmlns:ns2="http://xmlns.oracle.com/ProposedActsService/NewActProposalsServices/ArtistAPIReference"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns3="http://xmlns.oracle.com/pcbpel/adapter/db/ProposedActsService/NewActProposalsServices/submitNewActProposal"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/ArtistAPIReference.wsdl"/>
        <oracle-xsl-mapper:rootElement name="Artist" namespace="ArtistAPI"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/NewActProposalsService.wsdl"/>
        <oracle-xsl-mapper:rootElement name="submitActProposalRequestMessage" namespace="aced.cloud.demo"/>
        <oracle-xsl-mapper:param name="inputVariable.part1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/submitNewActProposal.wsdl"/>
        <oracle-xsl-mapper:rootElement name="InputParameters"
                                       namespace="http://xmlns.oracle.com/pcbpel/adapter/db/sp/submitNewActProposal"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [SUN FEB 21 15:06:40 CET 2016].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="inputVariable.part1"/>
  <xsl:template match="/">
    <tns:InputParameters>
      <tns:P_DESCRIPTION>
        <xsl:value-of select="$inputVariable.part1/ns1:submitActProposalRequestMessage/ns1:description"/>
      </tns:P_DESCRIPTION>
      <tns:P_NUMBER_OF_VOTES>
        <xsl:value-of select="$inputVariable.part1/ns1:submitActProposalRequestMessage/ns1:numberOfVotes"/>
      </tns:P_NUMBER_OF_VOTES>
      <xsl:if test="$inputVariable.part1/ns1:submitActProposalRequestMessage/ns1:image">
        <tns:P_IMAGE>
          <xsl:value-of select="$inputVariable.part1/ns1:submitActProposalRequestMessage/ns1:image"/>
        </tns:P_IMAGE>
      </xsl:if>
      <tns:P_ARTIST>
        <tns:NAME>
           <xsl:value-of select="/ns0:Artist/name"/>
        </tns:NAME>
        <tns:GENRES>
          <xsl:value-of select="/ns0:Artist/genres"/>
        </tns:GENRES>
        <tns:BIOGRAPHY>
          <xsl:value-of select="substring(/ns0:Artist/biography,1,2000)"/>
        </tns:BIOGRAPHY>
        <tns:IMAGE_URL>
        <xsl:choose>
          <xsl:when test="$inputVariable.part1/ns1:submitActProposalRequestMessage/ns1:imageURL and $inputVariable.part1/ns1:submitActProposalRequestMessage/ns1:imageURL!=''">
            <xsl:value-of select="$inputVariable.part1/ns1:submitActProposalRequestMessage/ns1:imageURL"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="/ns0:Artist/imageURL"/>
          </xsl:otherwise>
        </xsl:choose>
          
        </tns:IMAGE_URL>
        <tns:ALBUMS>
          <xsl:for-each select="/ns0:Artist/albums">
            <tns:ALBUMS_ITEM>
              <tns:TITLE>
                <xsl:value-of select="title"/>
              </tns:TITLE>
              <tns:COVER_IMAGE_URL>
                <xsl:value-of select="imageURL"/>
              </tns:COVER_IMAGE_URL>
            </tns:ALBUMS_ITEM>
          </xsl:for-each>
        </tns:ALBUMS>
      </tns:P_ARTIST>
    </tns:InputParameters>
  </xsl:template>
</xsl:stylesheet>
