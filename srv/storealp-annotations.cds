using { StoreALPService } from './storealp-srv';

annotate StoreALPService.OrderItems with @(

  UI.SelectionFields:[
    ID,
    productName,
    customerName,
    storeName
  ],
  UI.LineItem:[
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
  UI.Chart:{
     Title : 'Store Wise Sales',
     ChartType: #Column,
     Dimensions: [storeName],
     DynamicMeasures:[@Analytics.AggregatedProperty#totalPrice,@Analytics.AggregatedProperty#quantity],
     DimensionAttributes:[{
        Dimension : storeName,
        Role: #Category
     }],
     MeasureAttributes:[{
        Measure : totalPrice,
        Role:#Axis1
     }]
  },
  UI.PresentationVariant:{
      $Type : 'UI.PresentationVariantType',
      Visualizations : [
          '@UI.Chart',
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

annotate StoreALPService.OrderItems with @(
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




annotate StoreALPService.OrderItems with {
    ID @Common.Label:'Item ID';
    orderID @Common.Label:'Order ID';
      customerName @Common.Label:'Customer Name';
       storeName @Common.Label:'Store Name';
        productName @Common.Label:'Product Name';
         quantity @Common.Label:'Quantity';
          unitPrice @Common.Label:'Unit Price';
           totalPrice @Common.Label:'Total Price';

}

