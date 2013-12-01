<cfscript>

</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">

    <table border="1">
        <tr>
            <th>CGI Variable</th>
            <th>Displays</th>
            <th>ColdFusion / Java Servlet Alternative Method</th>
            <th>Displays</th>
        </tr>
        <tr>
            <td>CGI.AUTH_TYPE</td>
            <td>#CGI.AUTH_TYPE#</td>
            <td>getPageContext().getRequest().getAuthType()</td>
            <td>#getPageContext().getRequest().getAuthType()#</td>
        </tr>
        <tr>
            <td>CGI.CONTENT_LENGTH</td>
            <td>#CGI.CONTENT_LENGTH#</td>
            <td>getPageContext().getRequest().getContentLength()</td>
            <td>#getPageContext().getRequest().getContentLength()#</td>
        </tr>
        <tr>
            <td>CGI.CONTEXT_PATH</td>
            <td>#CGI.CONTEXT_PATH#</td>
            <td>getPageContext().getRequest().getContextPath()</td>
            <td>#getPageContext().getRequest().getContextPath()#</td>
        </tr>
        <tr>
            <td>CGI.CONTENT_TYPE</td>
            <td>#CGI.CONTENT_TYPE#</td>
            <td>getPageContext().getRequest().getContentType()</td>
            <td>#getPageContext().getRequest().getContentType()#</td>
        </tr>
        <tr>
            <td>CGI.PATH_INFO</td>
            <td>#CGI.PATH_INFO#</td>
            <td>getPageContext().getRequest().getPathInfo()</td>
            <td>#getPageContext().getRequest().getPathInfo()#</td>
        </tr>
        <tr>
            <td>CGI.PATH_TRANSLATED</td>
            <td>#CGI.PATH_TRANSLATED#</td>
            <td>getPageContext().getRequest().getPathTranslated() </td>
            <td>#getPageContext().getRequest().getPathTranslated()#</td>
        </tr>
        <tr>
            <td>CGI.QUERY_STRING</td>
            <td>#CGI.QUERY_STRING#</td>
            <td>getPageContext().getRequest().getQueryString()</td>
            <td>#getPageContext().getRequest().getQueryString()#</td>
        </tr>
        <tr>
            <td>CGI.REMOTE_ADDR</td>
            <td>#CGI.REMOTE_ADDR#</td>
            <td>getPageContext().getRequest().getRemoteAddr()</td>
            <td>#getPageContext().getRequest().getRemoteAddr()#</td>
        </tr>
        <tr>
            <td>CGI.REMOTE_HOST</td>
            <td>#CGI.REMOTE_HOST#</td>
            <td>getPageContext().getRequest().getRemoteHost()</td>
            <td>#getPageContext().getRequest().getRemoteHost()#</td>
        </tr>
        <tr>
            <td>CGI.REMOTE_USER</td>
            <td>#CGI.REMOTE_USER#</td>
            <td>getPageContext().getRequest().getRemoteUser()</td>
            <td>#getPageContext().getRequest().getRemoteUser()#</td>
        </tr>
        <tr>
            <td>CGI.REQUEST_METHOD</td>
            <td>#CGI.REQUEST_METHOD#</td>
            <td>getPageContext().getRequest().getMethod()</td>
            <td>#getPageContext().getRequest().getMethod()#</td>
        </tr>
        <tr>
            <td>CGI.SCRIPT_NAME</td>
            <td>#CGI.SCRIPT_NAME#</td>
            <td>getPageContext().getRequest().getServletPath()</td>
            <td>#getPageContext().getRequest().getServletPath()#</td>
        </tr>
        <tr>
            <td>CGI.SERVER_NAME</td>
            <td>#CGI.SERVER_NAME#</td>
            <td>getPageContext().getRequest().getServerName()</td>
            <td>#getPageContext().getRequest().getServerName()#</td>
        </tr>
        <tr>
            <td>CGI.SERVER_PORT</td>
            <td>#CGI.SERVER_PORT#</td>
            <td>getPageContext().getRequest().getServerPort()</td>
            <td>#getPageContext().getRequest().getServerPort()#</td>
        </tr>
        <tr>
            <td>CGI.SERVER_PORT_SECURE</td>
            <td>#CGI.SERVER_PORT_SECURE#</td>
            <td>getPageContext().getRequest().isSecure()</td>
            <td>#getPageContext().getRequest().isSecure()#</td>
        </tr>
        <tr>
            <td>CGI.SERVER_PROTOCOL</td>
            <td>#CGI.SERVER_PROTOCOL#</td>
            <td>getPageContext().getRequest().getProtocol()</td>
            <td>#getPageContext().getRequest().getProtocol()#</td>
        </tr>
        <tr>
            <td>CGI.SERVER_SOFTWARE</td>
            <td>#CGI.SERVER_SOFTWARE#</td>
            <td>getPageContext().getRequest().getHeader("Server-Software")</td>
            <td>#getPageContext().getRequest().getHeader("Server-Software")#</td>
        </tr>
        <tr>
            <td>CGI.HTTP_ACCEPT</td>
            <td>#CGI.HTTP_ACCEPT#</td>
            <td>getPageContext().getRequest().getHeader("Accept")</td>
            <td>#getPageContext().getRequest().getHeader("Accept")#</td>
        </tr>
        <tr>
            <td>CGI.HTTP_ACCEPT_CHARSET</td>
            <td>#CGI.HTTP_ACCEPT_CHARSET#</td>
            <td>getPageContext().getRequest().getHeader("Accept-Charset")</td>
            <td>#getPageContext().getRequest().getHeader("Accept-Charset")#</td>
        </tr>
        <tr>
            <td>CGI.HTTP_ACCEPT_ENCODING</td>
            <td>#CGI.HTTP_ACCEPT_ENCODING#</td>
            <td>getPageContext().getRequest().getHeader("Accept-Encoding")</td>
            <td>#getPageContext().getRequest().getHeader("Accept-Encoding")#</td>
        </tr>
        <tr>
            <td>CGI.HTTP_ACCEPT_LANGUAGE</td>
            <td>#CGI.HTTP_ACCEPT_LANGUAGE#</td>
            <td>getPageContext().getRequest().getHeader("Accept-Language")</td>
            <td>#getPageContext().getRequest().getHeader("Accept-Language")#</td>
        </tr>
        <tr>
            <td>CGI.HTTP_CONNECTION</td>
            <td>#CGI.HTTP_CONNECTION#</td>
            <td>getPageContext().getRequest().getHeader("Connection")</td>
            <td>#getPageContext().getRequest().getHeader("Connection")#</td>
        </tr>
        <tr>
            <td>CGI.HTTP_COOKIE</td>
            <td>#CGI.HTTP_COOKIE#</td>
            <td>getPageContext().getRequest().getHeader("Cookie")</td>
            <td>#getPageContext().getRequest().getHeader("Cookie")#</td>
        </tr>
        <tr>
            <td>CGI.HTTP_HOST</td>
            <td>#CGI.HTTP_HOST#</td>
            <td>getPageContext().getRequest().getHeader("Host")</td>
            <td>#getPageContext().getRequest().getHeader("Host")#</td>
        </tr>
        <tr>
            <td>CGI.HTTP_REFERER</td>
            <td>#CGI.HTTP_REFERER#</td>
            <td>getPageContext().getRequest().getHeader("Referer")</td>
            <td>#getPageContext().getRequest().getHeader("Referer")#</td>
        </tr>
        <tr>
            <td>CGI.HTTP_USER_AGENT</td>
            <td>#CGI.HTTP_USER_AGENT#</td>
            <td>getPageContext().getRequest().getHeader("User-Agent")</td>
            <td>#getPageContext().getRequest().getHeader("User-Agent")#</td>
        </tr>
        <tr>
            <td colspan="4"> </td>
        </tr>
        <tr>
            <td><em><strong>Other Useful Java Servlets</strong></em></td>
            <td> </td>
            <td> </td>
            <td> </td>
        </tr>
        <tr>
            <td>Reconstructs the URL the client used to make the request. The returned URL contains a protocol, server name, port number, and server path, but it <em>does not include</em> query string parameters. </td>
            <td> </td>
            <td>getPageContext().getRequest().getRequestURL()</td>
            <td>#getPageContext().getRequest().getRequestURL()#</td>
        </tr>
        <tr>
            <td>The URL string corresponding to the current client request. The string returned does not include the server name or query arguments.</td>
            <td> </td>
            <td>getPageContext().getRequest().getRequestURI()</td>
            <td>#getPageContext().getRequest().getRequestURI()#</td>
        </tr>
        <tr>
            <td>Returns the name of the scheme used to make this request (http, https, or ftp)</td>
            <td> </td>
            <td>getPageContext().getRequest().getScheme()</td>
            <td>#getPageContext().getRequest().getScheme()#</td>
        </tr>
    </table>

<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>