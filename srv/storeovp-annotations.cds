using { StoreOVPService } from './storeovp-srv';

annotate StoreOVPService.OrderItems with @(

  UI.SelectionFields:[
    ID,
    productName,
    customerName,
    storeName
  ],
  UI.LineItem #TableCard:[
    {
        $Type : 'UI.DataField',
        Value : ID,
    },
    {
        $Type : 'UI.DataField',
        Value : orderID,
    },
    {
        $Type : 'UI.DataField',
        Value : productName,
    },
    {
        $Type : 'UI.DataField',
        Value : customerName,
    },
    {
        $Type : 'UI.DataField',
        Value : storeName,
    },
    {
        $Type : 'UI.DataField',
        Value : unitPrice,
    },
     {
        $Type : 'UI.DataField',
        Value : quantity,
    },
    {
        $Type : 'UI.DataField',
        Value : totalPrice,
    },
  ],
  //store wise sales
  UI.Chart #StoreWiseSales:{
     Title : 'Store Wise Sales',
     ChartType: #Bar,
     Dimensions: [storeName],
     DynamicMeasures:[@Analytics.AggregatedProperty#totalPrice],
     DimensionAttributes:[{
        Dimension : storeName,
        Role: #Category
     }],
     MeasureAttributes:[{
        DynamicMeasure : @Analytics.AggregatedProperty#totalPrice,
        Role:#Axis1
     }]
  },
  UI.PresentationVariant #PVStoreWiseSales:{
      $Type : 'UI.PresentationVariantType',
      Visualizations : [
          '@UI.Chart#StoreWiseSales',
      ],
  },
  //product wise sales
  UI.Chart #ProductWiseSales:{
     Title : 'Product Wise Sales',
     ChartType: #Column,
     Dimensions: [productName],
    DynamicMeasures:[@Analytics.AggregatedProperty#totalPrice],
     DimensionAttributes:[{
        Dimension : productName,
        Role: #Category
     }],
     MeasureAttributes:[{
        DynamicMeasure : @Analytics.AggregatedProperty#totalPrice,
        Role:#Axis1
     }]
  },
  UI.PresentationVariant #PVProductWiseSales:{
      $Type : 'UI.PresentationVariantType',
      Visualizations : [
          '@UI.Chart#ProductWiseSales',
      ],
  },
  //Customer wise sales
  UI.Chart #CustomerWiseSales:{
     Title : 'Customer Wise Sales',
     ChartType: #Column,
     Dimensions: [customerName],
     DynamicMeasures:[@Analytics.AggregatedProperty#totalPrice],
     DimensionAttributes:[{
        Dimension : customerName,
        Role: #Category
     }],
     MeasureAttributes:[{
        DynamicMeasure : @Analytics.AggregatedProperty#totalPrice,
        Role:#Axis1
     }]
  },
  UI.PresentationVariant #PVCustomerWiseSales:{
      $Type : 'UI.PresentationVariantType',
      Visualizations : [
          '@UI.Chart#CustomerWiseSales',
      ],
  },
  //Product Wise Quantity
  UI.Chart #ProductWiseQuantity:{
     Title : 'Product Wise Quantity',
     ChartType: #Column,
     Dimensions: [productName],
     DynamicMeasures:[@Analytics.AggregatedProperty#quantity],
     DimensionAttributes:[{
        Dimension : productName,
        Role: #Category
     }],
     MeasureAttributes:[{
        DynamicMeasure : @Analytics.AggregatedProperty#quantity,
        Role:#Axis1
     }]
  },
  UI.PresentationVariant #PVProductWiseQuantity:{
      $Type : 'UI.PresentationVariantType',
      Visualizations : [
          '@UI.Chart#ProductWiseQuantity',
      ],
  },
  
  Analytics.AggregatedProperty #totalPrice:{
    $Type : 'Analytics.AggregatedPropertyType',
    AggregatableProperty : totalPrice,
    AggregationMethod : 'sum',
    Name : 'totalPrice',
    @Common.Label : 'Total Price',
  },
  Analytics.AggregatedProperty #quantity:{
    $Type : 'Analytics.AggregatedPropertyType',
    AggregatableProperty : quantity,
    AggregationMethod : 'sum',
    Name : 'quantity',
    @Common.Label : 'Total Quantity',
  }

){
    totalPrice @Analytics.Measure:true;
    quantity @Analytics.Measure:true;
}    

annotate StoreOVPService.OrderItems with @(
    Aggregation.ApplySupported:{
        Transformations:[
            'aggregate',
            'groupby',
            'filter'
        ],
        GroupableProperties:[
            storeName,customerName,productName
        ],
        AggregatableProperties:[
            {
                $Type : 'Aggregation.AggregatablePropertyType',
                Property : totalPrice,
                SupportedAggregationMethods : ['sum','average','min','max']
            },
            {
                $Type : 'Aggregation.AggregatablePropertyType',
                Property : quantity,
                SupportedAggregationMethods : ['sum','average','min','max']
            }
        ]

    }
);




annotate StoreOVPService.OrderItems with {
    ID @Common.Label:'Item ID';
    orderID @Common.Label:'Order ID';
      customerName @Common.Label:'Customer Name';
       storeName @Common.Label:'Store Name';
        productName @Common.Label:'Product Name';
         quantity @Common.Label:'Quantity';
          unitPrice @Common.Label:'Unit Price';
           totalPrice @Common.Label:'Total Price';

}

