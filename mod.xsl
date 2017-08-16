<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.hotnews">
        <xsl:param name="top">30</xsl:param>
        <xsl:param name="url_img">img</xsl:param>
        <xsl:param name="url_article">detail</xsl:param>
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-hotnews" ox-mod="hotnews" data-imgurl="{$url_img}" data-articleurl="{$url_article}">
            <h3 class="headline">
                <span>热评新闻 Top <em class="J_topcount"><xsl:value-of select="$top"/></em></span>
                <sub>数据来源:news.ifeng.com</sub>
            </h3>
            <table cellspacing="0" cellpadding="0" class="J_list">
            </table>
            <br/>
            <div class="J_time datatime"></div>
            <script type="text/tpl" class="J_tpl"><![CDATA[
            <thead>
                <td><big>标题</big></td>
                <td>发布时间<br/>评论数</td>
            </thead>
            <tbody>
                {{#.}}
                <tr>
                    <td class="title"><a href="{{{href}}}">{{title}}</a></td>
                    <td>
                        <nobr class="time">{{time}}</nobr><br/>
                        <nobr class="cmt">{{cmt}}</nobr>
                    </td>
                </tr>{{/.}}</tbody>
            ]]></script>
        </div>
    </xsl:template>
</xsl:stylesheet>
