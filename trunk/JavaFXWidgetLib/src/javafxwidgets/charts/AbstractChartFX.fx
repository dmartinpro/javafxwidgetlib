/*
 * PieChartFX.fx
 *
 * Created on 17 déc. 2008, 10:15:54
 */

package javafxwidgets.charts;

import java.awt.Dimension;
import java.awt.Paint;
import javafx.ext.swing.SwingComponent;
import javafx.scene.CustomNode;
import javafx.scene.Node;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.Plot;
import org.jfree.data.general.Dataset;

/**
 * @author David MARTIN
 */
public class DatasetValue {
    public var rowKey : java.lang.Comparable;
    public var columnKey : java.lang.Comparable;
    public var value : Number;
}

public class ChartParameters {
    public var properties : Boolean = true;
    public var save : Boolean = true;
    public var print : Boolean = true;
    public var zoom : Boolean = true;
    public var tooltips : Boolean = true;
    public var legend : Boolean = true;
    public var urls : Boolean = true;
}

public abstract class AbstractChartFX extends CustomNode {

    var chartPanel : ChartPanel;
    var swingComponent : SwingComponent;

    protected var chart : JFreeChart;

    /** public (exposed) attributes... */
    public var properties : Boolean = true;
    public var save : Boolean = true;
    public var print : Boolean = true;
    public var zoom : Boolean = true;
    public var tooltips : Boolean = true;
    public var legend : Boolean = true;
    public var urls : Boolean = true;

    public var dataset : Dataset;

    public var title : String on replace {
        chart.setTitle(title)}

    public var backgroundPaint : Paint on replace {
        chart.getPlot().setBackgroundPaint(backgroundPaint)}

    public var dimension : Dimension; // how the hell can i resize once built ?

    public var noDataMessage : String on replace {
        chart.getPlot().setNoDataMessage(noDataMessage)}

    public var values : DatasetValue[]; // to be overridden in subclasses


    /** functions... */
    protected abstract function getDataset() : Dataset;

    protected abstract function createChart();

    protected function postChartInstanciation() {
        var plot : Plot = chart.getPlot();
        plot.setNoDataMessage(noDataMessage);
    }

    public override function create() : Node {
        createChart();
        postChartInstanciation();
        chartPanel = new ChartPanel(chart,
                  this.dimension.width,
                  this.dimension.height,
                  this.dimension.width,
                  this.dimension.height,
                  this.dimension.width,
                  this.dimension.height,
            true,//boolean useBuffer
            properties,
            save,
            print,
            zoom,
            tooltips,
        );
        swingComponent = SwingComponent.wrap(chartPanel);
        return swingComponent;
    }

}


