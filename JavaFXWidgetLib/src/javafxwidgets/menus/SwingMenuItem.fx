/*
 * SwingMenuItem.fx
 *
 * Created on 16 déc. 2008, 16:04:46
 */

package javafxwidgets.menus;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javafx.ext.swing.SwingComponent;
import javax.swing.JMenuItem;

/**
 * @author David MARTIN
 */
public class SwingMenuItem extends SwingComponent {

    package var menuItem: JMenuItem;

    public var text: String on replace {
        menuItem.setText(text);
    }

    public var action: function();

    public override function createJComponent() {
        menuItem = new JMenuItem();
        menuItem.addActionListener(
        ActionListener{
            public override function actionPerformed(e: ActionEvent) {
                println("menus: action");
                action();
            }
        }
        );
        return menuItem;
    }

}
