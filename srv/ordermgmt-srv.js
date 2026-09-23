import cds from '@sap/cds'

export class OrderMgmtService extends cds.ApplicationService { init() {

  const { Orders, OrderItems, Products } = cds.entities('OrderMgmtService')

  


  return super.init()
}}
