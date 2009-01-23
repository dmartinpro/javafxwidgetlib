/*
 * PieChart3DFX.fx
 *
 * Created on 17 déc. 2008, 12:33:24
 */

package javafxwidgets.charts;

import org.jfree.chart.ChartFactory;
import org.jfree.data.general.PieDataset;

/**
 * @author David MARTIN
 */
public class PieChart3DFX extends AbstractPieChartFX {

    protected override function createChart() {
        this.chart = ChartFactory.createPieChart3D(
            title,
            getDataset() as PieDataset,
            legend,
            tooltips,
            urls
        );
    }

}
