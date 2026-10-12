sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/demo/storealp/test/integration/pages/OrderItemsList.gen",
	"com/demo/storealp/test/integration/pages/OrderItemsObjectPage.gen"
], function (JourneyRunner, OrderItemsListGenerated, OrderItemsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/demo/storealp') + '/test/flp.html#app-preview',
        pages: {
			onTheOrderItemsListGenerated: OrderItemsListGenerated,
			onTheOrderItemsObjectPageGenerated: OrderItemsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

