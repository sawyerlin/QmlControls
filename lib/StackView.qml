import QtQuick 2.5

FocusScope {
    id: self
    property var initialItem
    property var currentItem 
    property int depth: 0
    property bool busy: false
    property var pushJobs: []

    property var items: []
    Component.onCompleted: {
        if (self.initialItem) {
            self.currentItem = self.initialItem.createObject(self, {});
        }
    }
    onBusyChanged: {
        if (!self.busy) {
            var pushJob = self.pushJobs.pop();
            if (pushJob) {
                self.deferredPush(pushJob.item, pushJob.params, pushJob.replace);
            }
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
    function pop(name) {
        if (!name) {
            if (self.items.length > 0) {
                self.currentItem.destroy();
                self.currentItem = self.items.pop();
                self.currentItem.focus = true;
                self.currentItem.visible = true;
            }
        } else {
            for (var index = self.items.length - 1; index >= 0; index--) {
                if (self.currentItem.name !== name) {
                    self.currentItem.destroy();
                    self.currentItem = self.items.pop();
                } else {
                    break;
                }
            }
            self.currentItem.focus = true;
            self.currentItem.visible = true;
        }
    }
    function push(item, params, replace) {
        if (self.busy) {
            self.pushJobs.push({
                item: item,
                params: params,
                replace: replace
            });
        } else {
            self.deferredPush(item, params, replace);
        }
    }
    function deferredPush(item, params, replace) {
        self.busy = true;
        replace = replace || false;
        if (item) {
            if (self.currentItem) {
                if (replace) {
                    self.currentItem.destroy();
                } else {
                    self.currentItem.visible = false;
                    self.items.push(self.currentItem);
                }
            }
            var lastDepth = self.currentItem ? self.currentItem.depth : 0;
            self.currentItem = item.createObject(self, params);
            self.currentItem.depth = lastDepth + 1;
            self.currentItem.focus = true;
        }
        self.busy = false;
    }
}
