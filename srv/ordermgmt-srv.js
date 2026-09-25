import cds from '@sap/cds'
export class OrderMgmtService extends cds.ApplicationService {
  init() {

    const { Orders, OrderItems, Products } = cds.entities('OrderMgmtService')
    

    this.after("DELETE",OrderItems.drafts,async(result, req)=>{
      const allDraftItems = await SELECT.from(OrderItems.drafts).where({ order_ID: req.data.order_ID });
       let netPrice = calculateNetPrice(allDraftItems);
      await UPDATE(Orders.drafts).set({ netPrice: netPrice }).where({ ID:req.data.order_ID  });
    });

    this.after("PATCH", OrderItems.drafts, async (result, req) => {
      console.log("printing result and req");
      console.log(result);
      console.log(req.data);
      const ID = req.data.ID;
      const draftItem = await SELECT.one.from(OrderItems.drafts).where({ ID: ID });

      let totalPrice = calculateItemTotalPrice(draftItem);
      await UPDATE(OrderItems.drafts).set({ totalPrice: totalPrice }).where({ ID: ID });
      //calculate the net price
      const allDraftItems = await SELECT.from(OrderItems.drafts).where({ order_ID: draftItem.order_ID });
      let netPrice = calculateNetPrice(allDraftItems);
      await UPDATE(Orders.drafts).set({ netPrice: netPrice }).where({ ID: draftItem.order_ID });
    });
    function calculateItemTotalPrice(draftItem) {
      if (draftItem) {
        var totalPrice = (draftItem.quantity || 0) * (draftItem.unitPrice || 0);
        if (draftItem.discount > 0) {
          totalPrice = totalPrice - (totalPrice * draftItem.discount / 100);
        }
        return totalPrice;
      }
    }
    function calculateNetPrice(allDraftItems) {
      var netPrice = 0;
      for (let i = 0; i < allDraftItems.length; i++) {
        netPrice = netPrice + Number(allDraftItems[i].totalPrice);
      }
      return netPrice;
    }



    return super.init()
  }
}
