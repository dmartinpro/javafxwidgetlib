/*
 * AbstractPieChartFX.fx
 *
 * Created on 17 déc. 2008, 12:54:52
 */

package javafxwidgets.charts;

import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

/**
 * @author David MARTIN
 */
public abstract class AbstractPieChartFX extends AbstractChartFX {

    /** public (exposed) attributes... */
    public var plotCircular : Boolean = true;
    public var plotSectionOutlinesVisible : Boolean = true;

    public override var values on replace {
        var dataset = getDataset() as DefaultPieDataset;
//        dataset.clear();
        for (value in values) {
            dataset.setValue(value.rowKey, value.value);
        }
    }

    protected override function getDataset() {
        if (dataset == null) {
            dataset = new DefaultPieDataset();
        }
        return dataset;
    }

    protected override function postChartInstanciation() {
        super.postChartInstanciation();
        var plot : PiePlot = chart.getPlot() as PiePlot;
        plot.setCircular(plotCircular);
        plot.setSectionOutlinesVisible(plotSectionOutlinesVisible);
    }

}
