using OrderMgmtService as service from '../../srv/ordermgmt-srv';

annotate service.Orders with @(
    UI.SelectionFields             : [
        ID,
        storeName,
        netPrice,
        customerName,
    ],
    UI.LineItem                    : [
        {
            $Type: 'UI.DataField',
            Value: ID,
        },
        {
            $Type: 'UI.DataField',
            Value: createdBy,
        },
        {
            $Type: 'UI.DataField',
            Value: storeName,
        },
        {
            $Type: 'UI.DataField',
            Value: customerName,
        },
        {
            $Type: 'UI.DataField',
            Value: netPrice,
        },
    ],
    UI.HeaderInfo                  : {
        TypeName      : 'Order',
        TypeNamePlural: 'Orders',
        Title         : {
            $Type: 'UI.DataField',
            Value: ID,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: netPrice,
        },
        TypeImageUrl  : 'sap-icon://sales-order',
    },
    UI.DataPoint #createdBy        : {
        $Type: 'UI.DataPointType',
        Value: createdBy,
        Title: 'createdBy',
    },
    UI.DataPoint #storeName        : {
        $Type: 'UI.DataPointType',
        Value: storeName,
        Title: 'Store Name',
    },
    UI.DataPoint #customerName     : {
        $Type: 'UI.DataPointType',
        Value: customerName,
        Title: 'Customer Name',
    },
    UI.HeaderFacets                : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'createdBy',
            Target: '@UI.DataPoint#createdBy',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'createdBy',
            Target: '@UI.DataPoint#storeName',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'createdBy',
            Target: '@UI.DataPoint#customerName',
        },
    ],
    UI.Facets                      : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Order Information',
            ID    : 'OrderInformation',
            Target: '@UI.FieldGroup#OrderInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Item Details',
            ID    : 'ItemDetails',
            Target: 'items/@UI.LineItem#ItemDetails',
        },
    ],
    UI.FieldGroup #OrderInformation: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: ID,
            },
            {
                $Type: 'UI.DataField',
                Value: storeName,
            },
            {
                $Type: 'UI.DataField',
                Value: customerName,
            },
            {
                $Type: 'UI.DataField',
                Value: customerMobile,
            },
            {
                $Type: 'UI.DataField',
                Value: netPrice,
            },
            {
                $Type : 'UI.DataField',
                Value : homeDelivery,
               
            },
            {
                $Type : 'UI.DataField',
                Value : address,
               
            },
            {
                $Type : 'UI.DataField',
                Value : country_code,
                Label : 'Country',
            },
            {
                $Type : 'UI.DataField',
                Value : state_code,
                Label : 'State',
            },
            {
                $Type : 'UI.DataField',
                Value : district_code,
                Label : 'District',
            },
            
        ],
    },
    UI.FieldGroup #formMacro : {
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : customerName,
            },
            {
                $Type : 'UI.DataField',
                Value : customerMobile,
            },
            {
                $Type : 'UI.DataField',
                Value : homeDelivery,
            },
            {
                $Type : 'UI.DataField',
                Value : netPrice,
            },
        ],
    },
);
annotate service.Orders with{
    address @UI.MultiLineText;
    address @Common.FieldControl: ( homeDelivery = true? #Mandatory : #ReadOnly );
    address @UI.Hidden: ( homeDelivery = false );
}

annotate service.Orders with {
    ID             @Common.Label: 'Order ID';
    storeName      @Common.Label: 'Store Name';
    netPrice       @Common.Label: 'Net Price';
    customerName   @Common.Label: 'Customer Name';
    customerMobile @Common.Label: 'Customer Mobile';
    homeDelivery @Common.Label: 'Home Delivery';
    address @Common.Label: 'Address';
};

annotate service.OrderItems with @(UI.LineItem #ItemDetails: [
    {
        $Type: 'UI.DataField',
        Value: ID,
        Label: 'ID',
    },
    {
        $Type: 'UI.DataField',
        Value: order_ID,
        Label: 'order_ID',
    },
    {
        $Type: 'UI.DataField',
        Value: product_ID,
        Label: 'product_ID',
    },
    {
        $Type: 'UI.DataField',
        Value: unitPrice,
        Label: 'unitPrice',
    },
    {
        $Type: 'UI.DataField',
        Value: quantity,
        Label: 'quantity',
    },
    {
        $Type: 'UI.DataField',
        Value: discount,
        Label: 'discount',
    },
    {
        $Type: 'UI.DataField',
        Value: totalPrice,
        Label: 'totalPrice',
    },
]);

annotate service.OrderItems with {
    product @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Products',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: product_ID,
                    ValueListProperty: 'ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name',
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    ValueListProperty: 'price',
                    LocalDataProperty: unitPrice,
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    ValueListProperty: 'discount',
                    LocalDataProperty: discount,
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'stock',
                },
            ],
            Label         : 'Select Product',
        },
        Common.ValueListWithFixedValues: false,
    )
};
annotate service.Orders with {
    country @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Countries',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : country_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
            ],
            Label : 'Select Country',
        },
        Common.ValueListWithFixedValues : false,
)};

annotate service.Orders with {
    state @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'States',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : state_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterIn',
                    ValueListProperty : 'country_code',
                    LocalDataProperty : country_code,
                },
            ],
            Label : 'Select State',
        },
        Common.ValueListWithFixedValues : false,
)};

annotate service.Orders with {
    district @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Districts',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : district_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterIn',
                    ValueListProperty : 'state_code',
                    LocalDataProperty : state_code,
                },
            ],
            Label : 'Select District',
        },
        Common.ValueListWithFixedValues : false,
)};

