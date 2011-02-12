package be.iRail.BeLaws.page;

/**
 *
 * @author pieterc
 */
public class IndexedBuilder extends Builder{

    @Override
    protected String buildBody(Object o) {
        return "Reindexed!";
    }

}
