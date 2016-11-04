import QtQuick 2.5

FocusScope {
    id: self
    property var initialItem: undefined
    property var currentItem: undefined
    property int depth: 0
    property bool busy: false

    property var items: []
    Component.onCompleted: {
        if (self.initialItem) {
            self.currentItem = self.initialItem.createObject(self, {});
        }
    }
    function clear() {
        self.items = [];
    }
    function completeTransition() {}
    function find(func, onlySearchLoadedItems) {
        onlySearchLoadedItems = onlySearchLoadedItems || false;
    }
    function get(index, dontLoad) {
        dontLoad = dontLoad || false;
    }
    function pop(item) {
        if (!item) {
            if (self.items.length > 0) {
                self.currentItem.destroy();
                self.currentItem = self.items.pop();
                self.currentItem.focus = true;
                self.currentItem.visible = true;
            }
        } else {
            for(var i = 1; i < self.items.length; i++) {
                self.currentItem.destroy();
                self.currentItem = self.items.pop();
                if (item.id === self.items[index].id) {
                    break;
                }
            }
            self.currentItem.focus = true;
            self.currentItem.visible = true;
        }
    }
    function push(item, params, replace) {
        replace = replace || false;
        var lastDepth = self.currentItem ? self.currentItem.depth : 0;
        if (item) {
            if (replace) {
                if (self.currentItem) {
                    self.currentItem.destroy();
                }
            } else {
                self.currentItem.visible = false;
                self.items.push(self.currentItem);
            }
            self.currentItem = item.createObject(self, params);
            self.currentItem.depth = lastDepth + 1;
            self.currentItem.focus = true;
        }
    }
}
