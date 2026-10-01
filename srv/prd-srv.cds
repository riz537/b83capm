using {b83capm.db as db} from '../db/schema';


service PrdMgmtService {
    @odata.draft.enabled
    entity Products   as projection on db.Products{
        *,
        case 
          when stock = 0 then 'Out of stock' 
          when stock < 10 then 'Low Stock' 
          else 'Available'
          end as status : String(30),
        case 
          when stock = 0 then 1
          when stock < 10 then 2 
          else 3
          end as statusColor : Integer

    }actions{
      @Common.SideEffects:{TargetProperties:['discount']}
      action ApplyDiscount(discount:Int16 @Common.Label: 'Apply Discount') returns String;
     @Common.SideEffects:{TargetProperties:['stock','status','statusColor']}
    @Core.OperationAvailable:(:in.stock<10)
      action AddStock(in: $self, stock:Int16 @Common.Label: 'Add Stock') returns String;
    }


     
}
