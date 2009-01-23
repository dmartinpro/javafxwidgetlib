/*
 * ShowcaseSwingSimpleGrid.fx
 *
 * Created on 16 déc. 2008, 15:23:59
 */

package javafxwidgets.grids;

import java.lang.Math;
import javafx.ext.swing.SwingButton;
import javafx.scene.CustomNode;
import javafx.scene.effect.PerspectiveTransform;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafxwidgets.grids.SwingSimpleGrid;

class Contact{
    var firstName: String;
    var lastName: String;
    var eMailAddress: String;
}

class ContactEditor extends CustomNode {
    public var contacts: Contact[];
    public var selection: Integer;


    public override function create() {
        Group{
            content: [ SwingSimpleGrid {
                    width: 500
                    height: 160
                    autoResizeMode: javax.swing.JTable.AUTO_RESIZE_LAST_COLUMN
                    columns: [
                        SwingSimpleGrid.TableColumn {
                            text: "First Name"
                        },
                        SwingSimpleGrid.TableColumn {
                            text: "Last Name"
                        },
                        SwingSimpleGrid.TableColumn {
                            text: "EMailAddress"
                        }
                    ]

                    rows: bind
                        for(p in contacts)
                        SwingSimpleGrid.TableRow {
                            cells: [
                                SwingSimpleGrid.TableCell {
                                    text: bind p.firstName
                                },
                                SwingSimpleGrid.TableCell {
                                    text: bind p.lastName
                                },
                                SwingSimpleGrid.TableCell {
                                    text: bind p.eMailAddress
                                }
                            ]

                        }

                    selection: bind selection with inverse

                },
                SwingButton{
                    translateY: 200
                    text: "Add Contact"
                    action: function(){
                    insert Contact{} into contacts;
                    }
                },
                SwingButton{
                    translateX: 100
                    translateY: 200
                    text: "Remove Contact"
                    action: function(){
                        delete contacts[selection];
                    }
                }
            ]

        }
    }
}

var contacts =  [
    Contact {
        firstName: "Mike"
        lastName: "Wazowski"
        eMailAddress: "Mike.Wazowski@monster.com"
    },
    Contact {
        firstName: "Adrien"
        lastName: "Wazowski"
        eMailAddress: "Mike.Wazowski@monster.com"
    },
    Contact {
        firstName: "David"
        lastName: "Wazowski"
        eMailAddress: "Mike.Wazowski@monster.com"
    },
    Contact {
        firstName: "Bernard"
        lastName: "Wazowski"
        eMailAddress: "Mike.Wazowski@monster.com"
    },
    Contact {
        firstName: "Jean"
        lastName: "Wazowski"
        eMailAddress: "Mike.Wazowski@monster.com"
    },
    Contact {
        firstName: "Stéphane"
        lastName: "Wazowski"
        eMailAddress: "Mike.Wazowski@monster.com"
    },
    Contact {
        firstName: "Thierry"
        lastName: "Wazowski"
        eMailAddress: "Mike.Wazowski@monster.com"
    },
    Contact {
        firstName: "Sulley"
        lastName: "Monster"
        eMailAddress: "Sulley.Monster@monster.com"
    }
];


Stage {
    title: "MyApp"
    scene: Scene {
        width: 600
        height: 400
        content: ContactEditor{
            contacts: bind contacts with inverse
        }
    }
}
