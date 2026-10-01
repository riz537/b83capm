sap.ui.define(['sap/ui/core/mvc/ControllerExtension'], function (ControllerExtension) {
	'use strict';

	return ControllerExtension.extend('com.demo.ordermgmtui.ext.controller.ObjectPageController', {
		// this section allows to extend lifecycle hooks or hooks provided by Fiori elements
		override: {
			/**
			 * Called when a controller is instantiated and its View controls (if available) are already created.
			 * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
			 * @memberOf com.demo.ordermgmtui.ext.controller.ObjectPageController
			 */
			onInit: function () {
				// you can access the Fiori elements extensionAPI via this.base.getExtensionAPI
				// var oModel = this.base.getExtensionAPI().getModel();
				// var extAPI=this.base.getExtensionAPI();
				// extAPI.watchProperty("country_code",function(value){
				//      console.log("value");console.log(value);
				// 	 this.base.getView().getBindingContext().setProperty("state_code",null);
				// 	 this.base.getView().getBindingContext().setProperty("district_code",null);
				// }.bind(this));
				// extAPI.watchProperty("state_code",function(value){
				//      console.log("value");console.log(value);
				// 	 this.base.getView().getBindingContext().setProperty("district_code",null);
				// }.bind(this));

			}

		},
		showOrderInfo: async function () {

			const oOrderContext = this.base
				.getExtensionAPI()
				.getBindingContext();

			// Current Order
			const oOrder = oOrderContext.getObject();

			console.log("Order:", oOrder);

			// Current Order path
			const sOrderPath = oOrderContext.getPath();

			console.log("Order Path:", sOrderPath);

			// Get OData V4 model
			const oModel = oOrderContext.getModel();

			// Bind the items collection
			const oItemsBinding = oModel.bindList(
				sOrderPath + "/items"
			);

			// Request item contexts
			const aItemContexts = await oItemsBinding.requestContexts();

			// Get actual item objects
			const aItems = aItemContexts.map(
				oContext => oContext.getObject()
			);

			console.log("Items:", aItems);
		}
	});
});
