sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/demo/ordermgmtui/test/integration/pages/OrdersList.gen",
	"com/demo/ordermgmtui/test/integration/pages/OrdersObjectPage.gen",
	"com/demo/ordermgmtui/test/integration/pages/OrderItemsObjectPage.gen"
], function (JourneyRunner, OrdersListGenerated, OrdersObjectPageGenerated, OrderItemsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/demo/ordermgmtui') + '/test/flp.html#app-preview',
        pages: {
			onTheOrdersListGenerated: OrdersListGenerated,
			onTheOrdersObjectPageGenerated: OrdersObjectPageGenerated,
			onTheOrderItemsObjectPageGenerated: OrderItemsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

