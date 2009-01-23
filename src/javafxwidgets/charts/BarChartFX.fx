/*
 * PieChart3DFX.fx
 *
 * Created on 17 déc. 2008, 12:33:24
 */

package javafxwidgets.charts;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;

/**
 * @author David MARTIN
 */
public class BarChartFX extends AbstractChartFX {

    /** public (exposed) attributes... */
    public-init var xAxisLabel : String;
    public-init var yAxisLabel : String;
    public var orientation : PlotOrientation = PlotOrientation.VERTICAL;

    public override var values on replace {
        var dataset =
        getDataset() as DefaultCategoryDataset;
//        dataset.clear();
        for (value in values) {
            dataset.addValue(value.value, value.rowKey, value.columnKey);
        }
    }

    protected override function getDataset() {
        if (dataset == null) {
            dataset = new DefaultCategoryDataset();
        }
        return dataset;
    }

    protected override function postChartInstanciation() {
        super.postChartInstanciation();
    }

    protected override function createChart() {
        this.chart = ChartFactory.createBarChart(
            title,
            xAxisLabel,
            yAxisLabel,
            getDataset() as CategoryDataset,
            orientation,
            legend,
            tooltips,
            urls
        );
    }

}
