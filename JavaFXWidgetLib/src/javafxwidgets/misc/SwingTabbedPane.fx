/*
 * SwingTabbedPane.fx
 *
 * Created on 16 déc. 2008, 14:40:03
 */

package javafxwidgets.misc;

/**
 * @author David MARTIN
 */
import javafx.ext.swing.*;
import javax.swing.JComponent;
import javax.swing.JTabbedPane;

public class SwingTab {
    public var title: String;
    public var content: SwingComponent;
}

public class SwingTabbedPane extends SwingComponent {

    var tabbedPane: JTabbedPane;

    var updateComponentFlag: Boolean = false;

    public var selectedIndex: Integer = -1 on replace {
        if (not updateComponentFlag) {
            if ((-1 < selectedIndex) and ( selectedIndex  < tabbedPane.getTabCount())) {
                tabbedPane.setSelectedIndex(selectedIndex);
            }
        }
    };

    public var tabs: SwingTab[] on replace oldValue[lo..hi] = newVals {
        for (tab in oldValue[lo..hi]){
            tabbedPane.remove(tab.content.getJComponent().getParent());
        }
        for (tab in newVals){
            tabbedPane.addTab(tab.title,tab.content.getJComponent());
        }
    };

    override function createJComponent(): JComponent {
        tabbedPane = new JTabbedPane();

        tabbedPane.addChangeListener(
            javax.swing.event.ChangeListener{
                override function stateChanged(e: javax.swing.event.ChangeEvent) {
                    updateComponentFlag = true;
                    selectedIndex = tabbedPane.getSelectedIndex();
                    updateComponentFlag = false;
                }
            }
        );

        return tabbedPane;
    }

}
