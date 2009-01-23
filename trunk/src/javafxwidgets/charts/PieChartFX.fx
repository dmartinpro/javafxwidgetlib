/*
 * PieChart3DFX.fx
 *
 * Created on 17 déc. 2008, 12:33:24
 */

package javafxwidgets.charts;

import java.lang.System;
import org.jfree.chart.ChartFactory;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

/**
 * @author David MARTIN
 */
public class PieChartFX extends AbstractPieChartFX {

    protected override function createChart() {
        this.chart = ChartFactory.createPieChart(
            title,
            getDataset() as PieDataset,
            legend,
            tooltips,
            urls
        );
    }

}
