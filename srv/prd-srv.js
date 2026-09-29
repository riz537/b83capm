import cds from '@sap/cds'


export class PrdMgmtService extends cds.ApplicationService { init() {

  const { Products } = cds.entities('PrdMgmtService')

     this.before("CREATE",Products,async (req)=>{
         if(req.data.discount === null){
            req.data.discount = 0;
         }
     });

     this.on("ApplyDiscount", async (req)=>{
       console.log("Inside ApplyDiscount");
        console.log(req.data);
        console.log(req.params);
        let newDiscount = req.data.discount;
        let productID = req.params[0].ID;
        console.log("newDiscount ----->"+newDiscount);
        console.log("productID ----->"+productID);
        let recUpdated =   await UPDATE(Products).set({discount:newDiscount}).where({ID:productID});
        if(recUpdated >0){
         req.info("Discount - "+ newDiscount + "updated successfully");
        }
    });
     this.on("AddStock", async (req)=>{
       console.log("Inside AddStock");
        console.log(req.data);
        console.log(req.params);
        let newStock = req.data.stock;
        let productID = req.params[0].ID;
        let recUpdated =   await UPDATE(Products).set({stock:{'+=':newStock}}).where({ID:productID});
        if(recUpdated >0){
         req.info("Stock - "+ newStock + "updated successfully");
        }
    });
    


  return super.init()
}}
