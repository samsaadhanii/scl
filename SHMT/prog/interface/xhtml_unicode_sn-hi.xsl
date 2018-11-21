<?xml version="1.0" encoding="ISO-8859-1"?>

<!--
Copyright (C) 2005 Sunil Mohan Adapa <sunil at atc tcs co in>

This program is free software; you can redistribute it and/or 
modify it under the terms of the GNU General Public License 
as published by the Free Software Foundation; either 
version 2 of the License, or (at your option) any later 
version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--<xsl:output method="xml" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"/> -->

<xsl:variable name="chunker_row">h7</xsl:variable>

<xsl:template match="/rt">
  <div id="navigation">
  <form action="" onsubmit="goto_section(); return false;">
    <p>
      <center>
      <a id="about" href="/scl/SHMT/about.html" target="_new">About</a>
      <a id="help" href="/scl/SHMT/anu_help.html" target="_new">Help</a>
      <xsl:variable name="no_of_rows" select="@rows" />
      <input type="hidden" name="no_of_rows" value="{$no_of_rows}" />
      <input type="button" value="Show/Hide Rows..." onclick="window.open('/scl/SHMT/rows.html','ShowHideRowsWindow','top=200,left=200,height=500,width=300,location=no,menubar=no,toolbar=no,directories=no,statusbar=no');" />
      <input type="checkbox" name="border_value" onchange="toggle_borders()" />Borders
      <xsl:text disable-output-escaping="yes"> &lt;a href="/scl/SHMT/DEMO/tmp_anu_dir/table.csv"&gt;Save Annotation&lt;/a&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes"> &lt;a href="/cgi-bin/scl/skt_gen/Sentence/gen.cgi?filename=tmp_dir_gen/table.csv"&gt;Generate&lt;/a&gt;</xsl:text>
      </center>
    </p>
  </form>
  </div>
  <xsl:apply-templates select="title" />
  <div class="float_clear"> </div>
  <!-- <xsl:for-each select="p"> -->
    <xsl:for-each select="nextline">
          <xsl:for-each select="nextsolution">
            <xsl:call-template name="nextsolution" />
          </xsl:for-each>
    </xsl:for-each>
    <div class="float_clear"> </div>
  <!-- </xsl:for-each> -->
  <!-- TODO: this does not seem to be the proper way-->
</xsl:template>

<xsl:template match="title">
  <!-- Number of words in this line -->
  <xsl:variable name="no_of_words" select="@words" />

  <!-- Number of rows in this line -->
  <!-- TODO: shouldn't we be taking it from rt/@rows? -->
  <xsl:variable name="no_of_rows" select="count(*) div $no_of_words" />


  <!-- for each item in the table -->
  <xsl:for-each select="*">

    <!-- Obtain the row number -->
    <xsl:variable name="row_no" select="((position()-1) mod $no_of_rows) + 1" />
    <!-- Obtain the column number -->
    <xsl:variable name="column_no" select="ceiling(position() div $no_of_rows)" />

	<!-- Start the table if we have to -->
	<xsl:if test="$row_no = 1">
	  <xsl:text disable-output-escaping="yes">&lt;table cellspacing="0" border="0"&gt;
	  </xsl:text>
	</xsl:if>

    <!-- Open a TR -->
    <xsl:text disable-output-escaping="yes">
&lt;tr class="row</xsl:text>
    <xsl:value-of select="$row_no" />
    <xsl:text disable-output-escaping="yes">"&gt;
  </xsl:text>
 
	<xsl:variable name="sentence_name">
	  <xsl:number level="multiple" count="p|title" format="1.1" from="rt"/>
        </xsl:variable>
    <!-- Print the number column -->
    <xsl:if test="$column_no = 1">
      <td class="number">
	    <xsl:value-of select="$sentence_name"/>
	    <xsl:number level="single" count="*" format=".A"/>
	    <!-- Print the sentence anchor -->
	    <xsl:if test="$row_no=1">
	      <a name="sentence_{$sentence_name}" />
	    </xsl:if>
      </td>
    </xsl:if>

    <!-- Print the other columns -->
    <!-- Obtain the column type -->
    <!-- TODO remove hardcoded h7 -->
    <xsl:variable name="column_type_raw" select="../h7[$column_no]" />
    <!-- Remove the trailing '.' -->
    <xsl:variable name="column_type_trim" select="normalize-space(translate($column_type_raw,'.',''))" />
    <!-- Seperate the prefix and the actual type -->
	<xsl:variable name="column_type" select="substring($column_type_trim, (2*contains($column_type_trim, '-')) + 1)" />
    <td class="{$column_type}">
      <xsl:copy-of select="node()" />
      <xsl:call-template name="handle_whitespace">
        <xsl:with-param name="word" select="." />
      </xsl:call-template>
      <!--<xsl:if test=". = ''">-</xsl:if>-->
    </td>

    <!-- End the tr -->
    <xsl:text disable-output-escaping="yes">
&lt;/tr&gt;</xsl:text>
 
	<!-- End the table if we have to -->
	<xsl:if test="$row_no = $no_of_rows">
	  <tr class="row{$no_of_rows+1}">
	  <xsl:if test="$column_no = 1">
	    <td class="number"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
	  </xsl:if>
</tr>
	  <xsl:text disable-output-escaping="yes">
	    &lt;/table&gt;</xsl:text>
	</xsl:if>

  </xsl:for-each>
</xsl:template>

<xsl:template name="handle_whitespace">
	<xsl:param name="word"/>
	<xsl:if test="$word = ''">-</xsl:if>
	<xsl:if test="not($word = '')">
		<xsl:variable name="first_char" select="substring($word,1,1)"/>
		<xsl:if test="$first_char = ' '">
			<xsl:call-template name="handle_whitespace">
				<xsl:with-param name="word" select="substring($word,2)"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:if>
</xsl:template>

<xsl:template name="nextsolution">
  <xsl:variable name="solution">
   <xsl:number level="multiple" count="nextsolution" format="1" from="nextline"/>
   </xsl:variable>
  <!-- Number of words in this line -->
  <xsl:variable name="no_of_words" select="@words" />

  <!-- Number of rows in this line -->
  <!-- TODO: shouldn't we be taking it from rt/@rows? -->
  <xsl:variable name="no_of_rows" select="count(*) div $no_of_words" />


  <!-- for each item in the table -->
  <xsl:for-each select="*">

    <!-- Obtain the row number -->
    <xsl:variable name="row_no" select="((position()-1) mod $no_of_rows) + 1" />
    <!-- Obtain the column number -->
    <xsl:variable name="column_no" select="ceiling(position() div $no_of_rows)" />

	<!-- Start the table if we have to -->
	<xsl:if test="$row_no = 1">
	  <xsl:text disable-output-escaping="yes">&lt;table cellspacing="0" border="0"&gt;
	  </xsl:text>
	</xsl:if>

    <!-- Open a TR -->
    <xsl:text disable-output-escaping="yes">
&lt;tr class="row</xsl:text>
    <xsl:value-of select="$row_no" />
    <xsl:text disable-output-escaping="yes">"&gt;
  </xsl:text>
 
	<xsl:variable name="sentence_name">
	  <xsl:number level="multiple" count="p|title|nextline" format="1.1" from="rt"/>
        </xsl:variable>
	<xsl:variable name="fig_parasent_name">
	  <xsl:number level="multiple" count="p|title|nextline" format="1." from="rt"/>
        </xsl:variable>
	<xsl:variable name="fig_sent_name">
	  <xsl:number level="single" count="p|title|nextline" format="1" from="rt"/>
        </xsl:variable>
	<xsl:variable name="fig_ana_name">
	  <xsl:number level="multiple" count="nextsolution" format="1" from="nextline"/>
        </xsl:variable>
    <!-- Print the number column -->
    <xsl:if test="$column_no = 1">
      <td class="number"> 
            <xsl:if test="$row_no=3">
<!-- corresponding to morph analysis shown in row 3, we get all possible relations -->
           <xsl:text disable-output-escaping="yes"> &lt;a href="/cgi-bin/scl/SHMT/prog/interface/show_graph.cgi?filename=tmp_anu_dir/&amp;sentnum=</xsl:text>
	    <xsl:value-of select="$fig_sent_name"/>
            <xsl:text disable-output-escaping="yes">" </xsl:text>
            <xsl:text disable-output-escaping="yes"> onmouseover="Tip('&lt;img src=/scl/SHMT/DEMO/tmp_anu_dir/</xsl:text>
	    <xsl:value-of select="$fig_sent_name"/> 
            <xsl:text disable-output-escaping="yes">.svg &gt;' ,FONTSIZE,'18pt',HEIGHT,400,STICKY,true,CLOSEBTN,true)" onmouseout="UnTip()"&gt;</xsl:text>
	    </xsl:if>
            <xsl:if test="$row_no=1">
            <xsl:text disable-output-escaping="yes"> &lt;a href="/cgi-bin/scl/SHMT/prog/interface/call_parser_summary.cgi?filename=tmp_dir_scrpt&amp;rel=''&amp;sentnum=</xsl:text>
	    <!-- <xsl:value-of select="$fig_parasent_name"/>  -->
	    <xsl:value-of select="$fig_sent_name"/>
            <!-- <xsl:text disable-output-escaping="yes">.</xsl:text> 
	    <xsl:value-of select="$fig_ana_name"/> -->
            <!-- <xsl:text disable-output-escaping="yes">.</xsl:text> -->
            <xsl:text disable-output-escaping="yes">&amp;save=no&amp;translate=no</xsl:text>
	    <!-- <xsl:value-of select="$fig_ana_name"/> -->
           <xsl:text disable-output-escaping="yes">" </xsl:text>
            <xsl:text disable-output-escaping="yes"> onmouseover="Tip('&lt;img src=/scl/SHMT/DEMO/tmp_anu_dir/</xsl:text>
	    <xsl:value-of select="$fig_parasent_name"/>
	    <xsl:value-of select="$fig_ana_name"/>
           <xsl:text disable-output-escaping="yes">.svg &gt;' ,FONTSIZE,'18pt',HEIGHT,400,STICKY,true,CLOSEBTN,true)" onmouseout="UnTip()"&gt;</xsl:text>
	    </xsl:if>
            <span Onclick="toggle();">
	    <xsl:value-of select="$fig_sent_name" />
            <xsl:text disable-output-escaping="yes">.</xsl:text>
	    <xsl:value-of select="$fig_ana_name" />
 	    <xsl:number level="single" count="*" format=".A"/> 
<!--	    <xsl:value-of select="$sentence_name"/>
 	    <xsl:number level="single" count="*" format=".A"/> -->
            </span>
	    <!-- Print the sentence anchor -->
	    <xsl:if test="$row_no=1">
	    <a name="{$fig_sent_name}.{$fig_ana_name}"/>
<!--	      <a name="sentence_{$sentence_name}" /> -->
	    </xsl:if>
      </td>
    </xsl:if>

    <!-- Print the other columns -->
    <!-- Obtain the column type -->
    <!-- TODO remove hardcoded h7 -->
    <xsl:variable name="column_type_raw" select="../h7[$column_no]" />
    <!-- Remove the trailing '.' -->
    <xsl:variable name="column_type_trim" select="normalize-space(translate($column_type_raw,'.',''))" />
    <!-- Seperate the prefix and the actual type -->
	<xsl:variable name="column_type" select="substring($column_type_trim, (2*contains($column_type_trim, '-')) + 1)" />
    <td class="{$column_type}">
      <xsl:copy-of select="node()" />
      <xsl:call-template name="handle_whitespace">
        <xsl:with-param name="word" select="." />
      </xsl:call-template>
      <!--<xsl:if test=". = ''">-</xsl:if>-->
    </td>

    <!-- End the tr -->
 
	<!-- End the table if we have to -->
	<xsl:if test="$row_no = $no_of_rows">
	  <!--<tr class="row{$no_of_rows+1}">
	  <xsl:if test="$column_no = 1">
	    <td class="number"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
	  </xsl:if>
          </tr> -->
	  <xsl:text disable-output-escaping="yes">
	    &lt;/table&gt;</xsl:text>
	</xsl:if>

  </xsl:for-each>
<!--  <xsl:text disable-output-escaping="yes">&lt;td&gt; &lt;tr&gt; &lt;/table&gt;</xsl:text> -->
</xsl:template>

</xsl:stylesheet>
