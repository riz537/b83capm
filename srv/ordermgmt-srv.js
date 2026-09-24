import cds from '@sap/cds'



export class OrderMgmtService extends cds.ApplicationService {
  init() {

    const { Orders, OrderItems, Products } = cds.entities('OrderMgmtService')

    this.after("PATCH",OrderItems.drafts, async(result,req)=>{
      console.log("printing result and req");
      console.log(result);
      console.log(req.data);
      const ID = req.data.ID;

      const draftItem = await SELECT.one.from(OrderItems.drafts).where({ID:ID});
      if(draftItem){
        var totalPrice = (draftItem.quantity || 0) * (draftItem.unitPrice || 0) ;
        if(draftItem.discount>0){
           totalPrice = totalPrice - (totalPrice * draftItem.discount/100);
        }
        await UPDATE(OrderItems.drafts).set({totalPrice:totalPrice}).where({ID:ID});
      }

    });
   
   

    return super.init()
  }
}
