sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/demo/prdmgmtui/test/integration/pages/ProductsList.gen",
	"com/demo/prdmgmtui/test/integration/pages/ProductsObjectPage.gen"
], function (JourneyRunner, ProductsListGenerated, ProductsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/demo/prdmgmtui') + '/test/flp.html#app-preview',
        pages: {
			onTheProductsListGenerated: ProductsListGenerated,
			onTheProductsObjectPageGenerated: ProductsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

