import cds from '@sap/cds'

export class PrdMgmtService extends cds.ApplicationService { init() {

  const { Products } = cds.entities('PrdMgmtService')

   //   this.on("CREATE",Products,async (req)=>{
   //      console.log(req.data);
   //      await INSERT.into(Products).entries(req.data);
   //   });

     this.before("CREATE",Products,async (req)=>{
         if(req.data.discount === null){
            req.data.discount = 0;
         }
     });
     this.after("READ",Products,async(result)=>{
      console.log("After read of products ");
        for(let i=0;i<result.length;i++){
           let finalPrice = result[i].price - result[i].price * (result[i].discount/100);
           console.log(finalPrice);
           result[i].description = result[i].description +"("+finalPrice+")";
        }
     });


  return super.init()
}}
