using {b83capm.db as db} from '../db/schema';

service OrderMgmtService {
@odata.draft.enabled

    entity Orders     as projection on db.Orders;
    @Common.SideEffects:{
        SourceProperties:['quantity','unitPrice'], TargetProperties:['totalPrice']
    }
    entity OrderItems as projection on db.OrderItems;
    entity Products   as projection on db.Products;

}
