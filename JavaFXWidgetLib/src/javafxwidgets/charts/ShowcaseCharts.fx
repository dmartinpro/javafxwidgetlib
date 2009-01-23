/*
 * ShowcasePieChart.fx
 *
 * Created on 17 déc. 2008, 10:26:57
 */

package javafxwidgets.charts;

import java.awt.Color;
import java.awt.Dialog;
import java.awt.Dimension;
import java.awt.Paint;
import java.lang.Double;
import javafx.ext.swing.SwingButton;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import javafxwidgets.charts.AbstractChartFX.DatasetValue;
import javafxwidgets.charts.AbstractChartFX.ChartParameters;
import javafxwidgets.charts.BarChartFX;
import javafxwidgets.charts.PieChart3DFX;
import javafxwidgets.charts.PieChartFX;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

/**
 * @author David MARTIN
 */
var index : Integer = 0;
var dimension : Dimension = new Dimension(250, 250);
var values = [
    DatasetValue {
        rowKey: "Row1"
        columnKey: "Col1"
        value: new Double(1.2)
    },
    DatasetValue {
        rowKey: "Row2"
        columnKey: "Col2"
        value: new Double(1.8)
    }
];

var parameters = ChartParameters {
    legend:false;
    print:false;
    properties:false;
    save:false;
    tooltips:false;
    urls:false;
    zoom:false;
}

var title : String = "Nice (bound) title";

var pieDataSetTest1 : DefaultPieDataset = new DefaultPieDataset();
pieDataSetTest1.setValue("val1", new Double(10));
pieDataSetTest1.setValue("val2", new Double(10));
pieDataSetTest1.setValue("val3", new Double(5));
pieDataSetTest1.setValue("val4", new Double(30));
pieDataSetTest1.setValue("val5", new Double(20));

var barDatasetTest1 : DefaultCategoryDataset = new DefaultCategoryDataset();
barDatasetTest1.addValue(new Double(10), "key1", "key10");
barDatasetTest1.addValue(new Double(20), "key1", "key20");
barDatasetTest1.addValue(new Double(5),  "key1", "key30");
barDatasetTest1.addValue(new Double(25), "key1", "key40");

var spiderDataset : DefaultCategoryDataset = new DefaultCategoryDataset();
spiderDataset.addValue(35.0, "S1", "C1");
spiderDataset.addValue(45.0, "S1", "C2");
spiderDataset.addValue(55.0, "S1", "C3");
spiderDataset.addValue(15.0, "S1", "C4");
spiderDataset.addValue(25.0, "S1", "C5");
spiderDataset.addValue(35.0, "S2", "C1");
spiderDataset.addValue(23.0, "S2", "C2");
spiderDataset.addValue(30.0, "S2", "C3");
spiderDataset.addValue(17.0, "S2", "C4");
spiderDataset.addValue(20.0, "S2", "C5");

var backgroundPaint : Paint = Color.WHITE;
var noDataMessage : String = "Pas de données";

Stage {
    title: "When charts come to JavaFX"
    width: 800
    height: 800
    scene: Scene {
        content: Group {
            content: [
                Text {
                    content:"When charts come to JavaFX"
                    font:Font {
                        size:24
                    }
                },
                PieChartFX {
                    translateY:20
                    dataset: bind new DefaultPieDataset();
                    title: title
                    dimension: bind dimension
                    backgroundPaint:Color.WHITE
                    values: bind values
                },
                PieChart3DFX {
                    translateX:300
                    translateY:20
                    legend: bind parameters.legend
                    print: bind parameters.print
                    properties: bind parameters.properties
                    save: bind parameters.save
                    tooltips: bind parameters.tooltips
                    urls: bind parameters.urls
                    zoom: bind parameters.zoom
                    dataset: bind pieDataSetTest1
                    title: title
                    dimension:new Dimension(250, 250)
                    backgroundPaint:Color.WHITE
                    values: bind values
                },
                BarChartFX {
                    translateX:0
                    translateY:300
                    dataset: bind barDatasetTest1
                    title: bind title
                    dimension: bind dimension
                    backgroundPaint: bind backgroundPaint
                    noDataMessage: "Pas de donnees"
                    values: bind values
                },
                SpiderChartFX {
                    translateX:300
                    translateY:300
                    dataset: bind spiderDataset
                    title: bind title
                    dimension: bind dimension
                    backgroundPaint: bind backgroundPaint
                    noDataMessage: "Pas de donnees"
                    values: bind values
                },
                Group {
                    translateX:5
                    translateY:600
                    content: [
                        SwingButton {
                            text: "Add Value"
                            action: function(){
                                if (index < 10) {
                                   insert DatasetValue {
                                        rowKey:("FixedRow"),
                                        columnKey:("Column {index++}"),
                                        value:new Double(
                                            index * 0.5)} into values;
                                }
                            }
                        },
                        SwingButton {
                            translateX:100
                            text: "Alter bound titles"
                            action: function() {
                                title = "New Chart title";
                            }
                        }
                    ]
                }
            ]
        }
    }
}


