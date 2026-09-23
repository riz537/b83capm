namespace b83capm.db;
using { cuid,managed } from '@sap/cds/common';



entity Products:cuid,managed{
    name: String(50) @mandatory @assert.format : '^[A-Za-z0-9 ]+$'  @assert.format.message: 'Name should contain only alphabets and numbers';
    description: String(50);
    price: Decimal(9,2)  @mandatory;
    discount: Integer @assert.range:[0,90];
    stock: Integer  @mandatory;
    image: LargeBinary @Core.MediaType: imageType;
    imageType: String(20)   @Core.IsMediaType    @assert.format: '^image/(jpeg|png|gif)$' @assert.format.message: 'Only jpeg,png and gif are allowed';
}

entity Orders : cuid,managed {
    customerName: String(30);
    customerMobile: String(10);
    storeName: String(20);
    netPrice: Decimal(9,2);
    items: Composition of many OrderItems on items.order=$self;
    
}

entity OrderItems : cuid,managed {
    order: Association to Orders;
    product: Association to Products;
    quantity: Integer;
    unitPrice: Decimal(9,2);
    discount: Integer;
    totalPrice: Decimal(9,2);
   
}

