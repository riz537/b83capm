sap.ui.define(["sap/ui/model/Filter", "sap/ui/model/FilterOperator"], function(Filter, FilterOperator) {
    "use strict";
    return {
        filterItems: function(sValue) {
            switch (sValue) {
                case "0":
                        return new Filter({ path: "homeDelivery", operator: FilterOperator.EQ, value1: true });
                case "1":
                       return new Filter({ path: "homeDelivery", operator: FilterOperator.EQ, value1: false });
                
            }
        }
    };
});
