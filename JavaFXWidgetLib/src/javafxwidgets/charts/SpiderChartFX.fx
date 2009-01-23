/*
 * SpiderChartFX.fx
 *
 * Created on 18 déc. 2008, 13:46:48
 */

package javafxwidgets.charts;

import javafxwidgets.charts.AbstractChartFX;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.Plot;
import org.jfree.chart.plot.SpiderWebPlot;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;

/**
 * @author David MARTIN
 */
public class SpiderChartFX extends AbstractChartFX {

    var spiderPlot : SpiderWebPlot;

    public override var values on replace {
        var dataset = getDataset() as DefaultCategoryDataset;
//        dataset.clear();
        for (value in values) {
            dataset.addValue(value.value, value.rowKey, value.columnKey);
        }
    }

    protected function getPlot() : Plot {
        if (spiderPlot == null) {
            spiderPlot = new SpiderWebPlot(getDataset() as CategoryDataset);
        }
        return spiderPlot;
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
        this.chart = new JFreeChart(getPlot());
        this.chart.setTitle(this.title);
        return this.chart;
    }

}
