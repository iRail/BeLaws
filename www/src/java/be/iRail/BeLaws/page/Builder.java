/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package be.iRail.BeLaws.page;

/**
 *
 * @author pieterc
 */
public class Builder {

    protected String title;
    protected Object o;

    public Builder() {
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Builder(String title) {
        this.title = title;
    }

    public void setBodyObject(Object o) {
        this.o = o;
    }

    public String build() {
        String out = "";
        out += buildHeader();
        out += buildBody(o);
        out += buildFooter();
        return out;
    }

    protected String buildHeader() {
        String out = "";
        out += "<!DOCTYPE HTML>";
        out += "<html>";
        out += "  <head>";
        out += "    <link rel=\"stylesheet\" href=\"style.css\" type=\"text/css\"/>";
        out += "    <title>BeLaws Search</title>";
        out += "    <meta charset=\"UTF-8\">";
        out += "  </head>";
        out += "  <body>";
        out += "      <div class=\"header\"></div>";
        out += "      <div class=\"body\">";
        return out;
    }

    protected String buildBody(Object o) {
        return "";
    }

    protected String buildFooter() {
        String out = "";
        out += "      </div>";
        out += "      <div class=\"footer\">";
        out += "        &copy; 2011 iRail vzw/asbl - Some rights reserved";
        out += "      </div>";
        out += "  </body>";
        out += "</html>";
        return out;
    }
}
