import cds from '@sap/cds'

export class PrdMgmtService extends cds.ApplicationService { init() {

  const { Products } = cds.entities('PrdMgmtService')

     this.before("CREATE",Products,async (req)=>{
         if(req.data.discount === null){
            req.data.discount = 0;
         }
     });
    


  return super.init()
}}
