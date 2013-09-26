<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="templatexml.xml" -->
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
	<!ENTITY copy "&#169;">
	<!ENTITY reg "&#174;">
	<!ENTITY trade "&#8482;">
	<!ENTITY mdash "&#8212;">
	<!ENTITY ldquo "&#8220;">
	<!ENTITY rdquo "&#8221;">
	<!ENTITY pound "&#163;">
	<!ENTITY yen "&#165;">
	<!ENTITY euro "&#8364;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://aquarius/document/v2">
	<xsl:output method="html" encoding="utf-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
				<title>
					<xsl:value-of select="deployment"/>
				</title>
			</head>
			<style type="text/css">
.informationStyle, .crossStyle, #title , pre{
	font-family:"Arial";
	font-size:14px;
}
#title{
	font-weight:bold; 
}
.crossStyle{
	text-decoration:line-through;
	color:#FF0000;
}
.headingStyle{
	font:Arial;
	font-size:18px;
	font-weight:bold;
	text-decoration:underline;
	color:#000099;
}
.moduleStyle{
	border:#C2CFF1;
	border-style:ridge;
}
table{
	width:100%;
}
td{
	border:none;
}
a:link {
	color: #000000;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #000000;
}
a:hover {
	text-decoration: none;
	color: #01159E;
}
a:active {
	text-decoration: none;
	color: #000000;
}
</style>
			<body>
				<div class="informationStyle">
					<table border="1" class="moduleStyle">
						<tr>
							<td>
								<img src="http://www.cargosmart.com/inc/images/logo_cs.gif" name="logo" width="120" height="52" id="logo"/>
							</td>
							<td colspan="5" style="vertical-align:bottom">
								<div style="text-align:right; height:auto;">
									<span id="title">RI ID: </span>
									<xsl:value-of select="deployment/info[1]/riid[1]"/>&nbsp;</div>
							</td>
						</tr>
						<tr>
							<td colspan="6">&nbsp;</td>
						</tr>
						<tr>
							<td id="title">Project Number: </td>
							<td colspan="5">
								<xsl:value-of select="deployment/info/projectno"/>
							</td>
						</tr>
						<tr>
							<td id="title" width="130">Preparation Date:</td>
							<td>
								<xsl:value-of select="deployment/info/create-day"/>
							</td>
							<td id="title" width="130">Release Date: </td>
							<td>
								<xsl:value-of select="deployment/info/release-day"/>
							</td>
							<td id="title" width="130">Author: </td>
							<td>
								<xsl:value-of select="deployment/info/developer"/>
							</td>
						</tr>
						<tr>
							<td id="title">Message Type: </td>
							<td>
								<xsl:value-of select="deployment/info/message-type"/>
							</td>
							<td id="title">Message Format: </td>
							<td>
								<xsl:value-of select="deployment/info/message-format"/>
							</td>
							<td id="title">Schema Version: </td>
							<td>
								<xsl:value-of select="deployment/info/message-schema"/>
							</td>
						</tr>
						<tr>
							<td id="title">Direction: </td>
							<td>
								<xsl:value-of select="deployment/info/direction"/>
							</td>
							<td id="title">Update TS: </td>
							<td colspan="3">
								<xsl:value-of select="deployment/info/updatedTs"/>
							</td>
						</tr>
						<tr>
							<td id="title" style="vertical-align:super">TP(s)</td>
							<td colspan="5">
								<xsl:for-each select="deployment/info/partners/partner">
									<xsl:value-of select="current()"/> ,
    </xsl:for-each>
							</td>
						</tr>
						<tr>
							<td id="title" style="vertical-align:super">Remark:</td>
							<td colspan="5">
								<xsl:value-of select="deployment/info/remark"/>
							</td>
						</tr>
					</table>
				</div>
				<!-- Dependencies -->
				<br/>
				<br/>
				<div class="informationStyle">
					<table border="1" class="moduleStyle">
						<tr>
							<td colspan="2" class="headingStyle">Dependencies</td>
						</tr>
						<xsl:for-each select="deployment/dependencies">
							<tr>
								<td id="title" style="width:15%;vertical-align:text-top;">
									<xsl:value-of select="current()/dependent-key"/>
								</td>
								<xsl:choose>
									<xsl:when test="current()/dependent-value=&quot;&quot;">
										<td width="713">&nbsp;&nbsp;-</td>
									</xsl:when>
									<xsl:when test="starts-with(current()/dependent-value, &quot;http&quot;)">
										<td width="713">
											<a href="{current()/dependent-value}" target="_blank">
												<pre>
													<xsl:value-of select="current()/dependent-value"/>
												</pre>
											</a>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td>
											<pre>
												<xsl:value-of select="current()/dependent-value "/>
											</pre>
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
						</xsl:for-each>
					</table>
				</div>
				<br/>
				<!-- Each Category Resources-->
				<xsl:for-each select="deployment/category">
				    <xsl:sort select="categoryid" order="ascending"/>
					<br/>
					<div class="informationStyle">
						<table border="1" class="moduleStyle">
							<tr>
								<td colspan="1" class="headingStyle">
									<xsl:value-of select="categoryid"/>
								</td>
							</tr>
							<tr>
								<td style="width:100%;">
									<xsl:for-each select="item">
										<br/>
										<xsl:if test='src !="" '>
										<div class="informationStyle">
											<table border="1" class="moduleStyle">
												<tr>
													<td>
														<xsl:value-of select="sequence"/>
														- <xsl:value-of select="project-num"/>
													</td>
												</tr>
												<tr>
													<td style="width:90%;">
														<xsl:for-each select="src">
															<xsl:choose>
																<xsl:when test="isActive=&quot;F&quot;">
																	<div class="crossStyle">
																		<a href="{filepath}">
																			<xsl:value-of select="filepath"/>
																		</a>
																	</div>
																</xsl:when>
																<xsl:otherwise>
																	<div>
																		<a href="{filepath}">
																			<xsl:value-of select="filepath"/>
																		</a>
																	</div>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:for-each>
													</td>
													<td>
														<xsl:for-each select="src">
															<div>
																<xsl:value-of select="environment-mask"/>
															</div>
														</xsl:for-each>
													</td>
												</tr>
											</table>
										</div>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</div>
				</xsl:for-each>
				<!-- Verification -->
				<br/>
				<br/>
				<div class="informationStyle">
					<table border="1" class="moduleStyle">
						<tr>
							<td colspan="2" class="headingStyle">Verification</td>
						</tr>
						<xsl:for-each select="deployment/verification">
							<tr style="background-color:#E7ECFA; font-weight:bold;">
								<td colspan="2">
									<xsl:value-of select="tp"/>
								</td>
							</tr>
							<xsl:if test='resultfolder !="" '>
								<tr style="background-color:#E7ECFA;">
									<td id="title" style="width:15%;">Input File(s):</td>
									<td>
										<xsl:value-of select="resultfolder"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test='targetfolder !="" '>
								<tr style="background-color:#E7ECFA;">
									<td id="title" style="width:15%">Target Folder:</td>
									<td>
										<xsl:value-of select="targetfolder"/>
									</td>
							</tr>
							</xsl:if>
							<xsl:if test='filename !="" '>
								<tr style="background-color:#E7ECFA;">
									<td id="title" style="width:15%">Filename:</td>
									<td>
										<xsl:value-of select="filename"/>
									</td>
							</tr>
							</xsl:if>
							<xsl:if test='fullpath !="" '>
								<tr style="background-color:#E7ECFA;">
									<td id="title" style="width:15%">Testcase folder:</td>
									<td>
										<xsl:value-of select="fullpath"/>
									</td>
							</tr>
							</xsl:if>
							<xsl:if test='channel/in-path !="" '>
								<tr style="background-color:#E7ECFA;">
									<td id="title" style="width:15%">Input Path:</td>
									<td>
										<xsl:value-of select="channel/in-path"/>
									</td>
							</tr>
							</xsl:if>	
							<xsl:if test='channel/protocol !="" '>
								<tr style="background-color:#E7ECFA;">
									<td id="title" style="width:15%">Protocol:</td>
									<td>
										<xsl:value-of select="channel/protocol"/>
									</td>
							</tr>
							</xsl:if>		
							<xsl:if test='channel/proxy !="" '>
								<tr style="background-color:#E7ECFA;">
									<td id="title" style="width:15%">Via:</td>
									<td>
										<xsl:value-of select="channel/proxy"/>
									</td>
							</tr>
							</xsl:if>																			
							<xsl:if test='test-result-status !="" '>
								<tr style="background-color:#E7ECFA;">
									<td id="title" style="width:15%">Expect result:</td>
									<td>
										<xsl:value-of select="test-result-status"/>
									</td>
							</tr>
							</xsl:if>													
							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>
						</xsl:for-each>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
