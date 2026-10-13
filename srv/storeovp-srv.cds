using { b83capm.db as db } from '../db/schema';


service StoreOVPService {

    @readonly
    entity OrderItems as projection on db.OrderItems{
         ID,
         order.ID as orderID,
         order.customerName as customerName,
         order.storeName as storeName,
         product.name as productName,
         product.ID as productID,
         quantity,
         unitPrice,
         totalPrice
    }


}
