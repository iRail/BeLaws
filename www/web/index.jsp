<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <meta charset="UTF-8"/>
        <title>BeLaws - an iRail.be project</title>
    </head>
    <body>
        <form action="/search" method="GET">
            <div class="header">&nbsp;</div>
            <!-- TODO: create front-end -->
            <div class="body" align="center">
                <h1>BeLaws.iRail.be</h1>
                <input type="text" value="" name="query" size="20"/><br/>
                <input type="submit" value="search!"/>&nbsp;<input type="button" value="I'm feeling lucky" onclick=""/>
            </div>
            <div class="footer">&copy; 2011 iRail vzw/asbl - Some rights reserved - <a href="about.html">moreinformation</a></div>
        </form>
    </body>
</html>
