/*
 * SwingSimpleGrid.fx
 *
 * Created on 16 déc. 2008, 15:21:17
 */

package javafxwidgets.grids;

import javafx.ext.swing.SwingComponent;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 * @author David MARTIN
 */
public class TableColumn{
    public var text: String;
}

public class TableCell{
    public var text: String;
}

public class TableRow {
    public var cells: SwingSimpleGrid.TableCell[];
}

public class SwingSimpleGrid extends SwingComponent {

    var table: JTable;
    var innerModel: DefaultTableModel;
    var model: TableSorter;

    public var autoResizeMode : Integer on replace {
        table.setAutoResizeMode(autoResizeMode);
    }

    public var selection: Integer;

    public var columns: TableColumn[] on replace {
        innerModel = new DefaultTableModel(for (column in columns) column.text, 0);
        model = new TableSorter(innerModel);
        table.setModel(model);
    };

    public var rows: TableRow[] on replace oldValue[lo..hi] = newVals {
        for(index in [hi..lo step -1]) {
            innerModel.removeRow(index);
        }

        for(row in newVals){
            innerModel.addRow(
                for(cell in row.cells) cell.text
            );
        }
    };

    public override function createJComponent() {
        table = new JTable();
        innerModel = table.getModel() as DefaultTableModel;

        var selectionModel = table.getSelectionModel();
        selectionModel.addListSelectionListener(
            ListSelectionListener {
                public override function valueChanged(e: ListSelectionEvent) {
                    selection = table.getSelectedRow();
                }
            }
        );
        var scrollPane : JScrollPane = new JScrollPane(table);
        return scrollPane;
    }

}

