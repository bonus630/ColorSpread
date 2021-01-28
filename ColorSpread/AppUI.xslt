<?xml version="1.0"?>
<!--
Permission is hereby granted, free of charge, to any person or organization obtaining a copy of the software and accompanying 
documentation covered by this license (the "Software") to use, reproduce, display, distribute, execute, and transmit the Software, 
and to prepare derivative works of the Software, and to permit third-parties to whom the Software is furnished to do so, all subject 
to the following:

The copyright notices in the Software and this entire statement, including the above license grant, the original location it was 
downloaded from, this restriction and the following disclaimer, must be included in all copies of the Software, in whole or in part, 
and all derivative works of the Software, unless such copies or derivative works are solely in the form of machine-executable object
code generated by a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. THE SOFTWARE MAY CONTAIN BUGS, ERRORS AND OTHER
PROBLEMS THAT COULD CAUSE SYSTEM FAILURES AND THE USE OF SUCH SOFTWARE IS ENTIRELY AT THE USER'S RISK. IN NO EVENT SHALL THE COPYRIGHT
HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE, 
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

************************************************************************************************************************************
This file defines new UI elements that all workspaces will contain
************************************************************************************************************************************
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:frmwrk="Corel Framework Data">
  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

  <!-- Use these elements for the framework to move the container from the app config file to the user config file -->
  <!-- Since these elements use the frmwrk name space, they will not be executed when the XSLT is applied to the user config file -->
  <frmwrk:uiconfig>
    <!-- The Application Info should always be the topmost frmwrk element -->
    <frmwrk:applicationInfo userConfiguration="true" />
  </frmwrk:uiconfig>

  <!-- Copy everything -->
  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="uiConfig/items">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
  <!-- Define the button will contains menu is same in all projects -->
      <itemData guid="f1d3d1d0-cc8d-4f04-91cb-7112255b8af1" noBmpOnMenu="true"
                type="flyout"
                dynamicCategory="2cc24a3e-fe24-4708-9a74-9c75406eebcd"
                userCaption="Bonus630 Dockers"
                enable="true"
                flyoutBarRef="FB727225-CEA7-4D27-BB27-52C687B53029"
                />
		
		
      <!-- Define the button which shows the docker -->
      <itemData guid="10660851-fe6d-4604-8bc6-8e4865195cfe" noBmpOnMenu="true"
                type="checkButton"
                check="*Docker('b3447a4c-5d39-47bc-9772-ae6a3f0730c5')"
                dynamicCategory="2cc24a3e-fe24-4708-9a74-9c75406eebcd"
                userCaption="Color Spread"
                enable="true"/>

      <!-- Define the web control which will be placed on our docker -->
      <itemData guid="9e711e33-d557-4339-81cb-cee3783abd58"
                type="wpfhost"
                hostedType="Addons\ColorSpread\ColorSpread.dll,ColorSpread.DockerUI"
                enable="*Bind(DataSource=AppDS;Path=DocumentAvailable)"/>

    </xsl:copy>
  </xsl:template>
<!-- Define the new menu is same in all others project-->
	 <xsl:template match="uiConfig/commandBars">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>

      <commandBarData guid="FB727225-CEA7-4D27-BB27-52C687B53029"
                      type="menu"
                      nonLocalizableName="Bonus630 Dockers"
                      flyout="true">
        <menu>
			
			<!--Here change to new item-->
          <!--<item guidRef="10660851-fe6d-4604-8bc6-8e4865195cfe"/>-->
         
        </menu>
      </commandBarData>


    </xsl:copy>
  </xsl:template>
	<!--<xsl:template match="uiConfig/commandBars/commandBarData[guid='FB727225-CEA7-4D27-BB27-52C687B53029']/menu">
		<xsl:copy>
			<xsl:apply-templates select="node()|@*"/>

			--><!--Here change to new item--><!--
			<item guidRef="10660851-fe6d-4604-8bc6-8e4865195cfe"/>

		</xsl:copy>
	</xsl:template>-->
		
  <xsl:template match="uiConfig/dockers">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>

      <!-- Define the web docker -->
      <dockerData guid="b3447a4c-5d39-47bc-9772-ae6a3f0730c5"
                  userCaption="Color Spread"
                  wantReturn="true"
                  focusStyle="noThrow">
        <container>
          <!-- add the webpage control to the docker -->
          <item dock="fill" margin="0,0,0,0" guidRef="9e711e33-d557-4339-81cb-cee3783abd58"/>
        </container>
      </dockerData>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
