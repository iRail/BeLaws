package be.iRail.BeLaws.page;

import java.util.ArrayList;
import org.apache.lucene.document.Document;

/**
 *
 * @author pieterc
 */
public class ResultBuilder extends Builder{

    @Override
    protected String buildBody(Object o) {
        ArrayList<Document> docs = (ArrayList<Document>)o;
        String out = "<table width=100% align=center><tr><td>result</td><td>date</td><td>link</td></tr>\n";
        for(int i = 0; i<docs.size(); i++){
            out += "<tr><td>" + i + "</td><td>" + docs.get(i).getFields().get(1).stringValue() + "</td><td><a href=\"file://" + docs.get(i).getFields().get(0).stringValue() + "\">content</a></td></tr>\n";
        }
        out += "</table>";
       // out += docs.get(0).getFields().get(1).stringValue();
        return out;
    }

}
