using {b83capm.db as db} from '../db/schema';

service OrderMgmtService {
    @odata.draft.enabled
    @Common.SideEffects: {
        SourceEntities  : ['items'],
        TargetProperties: ['netPrice']
    }

    

    @restrict:[
        {
           grant:['*'],
           to:'Owner' 
        },
        {
           grant:['WRITE'],
           to:'Employee' 
        },
        {
           grant:['READ'],
           to:'Employee' , where:(storeName = $user.storeName)
        }
    ]
    
    entity Orders     as projection on db.Orders;

    @Common.SideEffects: {
        SourceProperties: [
            'quantity',
            'unitPrice'
        ],
        TargetProperties: ['totalPrice']
    }
    @requires:['Employee','Owner']
    entity OrderItems as projection on db.OrderItems;

    entity Products   as projection on db.Products;
    entity Countries  as projection on db.Countries;
    entity States     as projection on db.States;
    entity Districts  as projection on db.Districts;

}
