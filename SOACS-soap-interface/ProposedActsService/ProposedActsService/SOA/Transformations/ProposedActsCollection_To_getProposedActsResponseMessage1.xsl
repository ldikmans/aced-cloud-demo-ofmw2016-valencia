<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/top/retrieveProposedActs"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tns="aced.cloud.demo"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns0 tns oraxsl xp20 xref mhdr oraext dvm socket"
                xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/db/ProposedActsService/ProposedActsService/retrieveProposedActs"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/retrieveProposedActs.wsdl"/>
        <oracle-xsl-mapper:rootElement name="ProposedActsCollection"
                                       namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/retrieveProposedActs"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/ProposedActsService.wsdl"/>
        <oracle-xsl-mapper:rootElement name="getProposedActsResponseMessage" namespace="aced.cloud.demo"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [SAT FEB 20 12:21:50 CET 2016].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:getProposedActsResponseMessage>
      <tns:proposedActs>
        <xsl:for-each select="/ns0:ProposedActsCollection/ns0:ProposedActs">
          <tns:ProposedActSummary>
            <tns:id>
              <xsl:value-of select="ns0:id"/>
            </tns:id>
            <tns:name>
              <xsl:value-of select="ns0:name"/>
            </tns:name>
            <tns:numberOfVotes>
              <xsl:value-of select="ns0:numberOfVotes"/>
            </tns:numberOfVotes>
            <tns:registrationDate>
              <xsl:value-of select="ns0:proposalTimestamp"/>
            </tns:registrationDate>
          </tns:ProposedActSummary>
        </xsl:for-each>
      </tns:proposedActs>
    </tns:getProposedActsResponseMessage>
  </xsl:template>
</xsl:stylesheet>
