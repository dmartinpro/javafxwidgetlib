/*
 * SwingMenuBar.fx
 *
 * Created on 16 déc. 2008, 16:04:37
 */

package javafxwidgets.menus;

import java.awt.Menu;
import javafx.ext.swing.SwingComponent;
import javax.swing.JMenuBar;

/**
 * @author David MARTIN
 */
public class SwingMenuBar extends SwingComponent {

    package var menuBar: JMenuBar;

    public var menus:SwingMenu[] on replace {
        for (m in menus) {
            menuBar.add(m.menu);
        }
    }

    public override function createJComponent() {
        menuBar = new JMenuBar();
        return menuBar;
    }

}
