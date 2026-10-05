using PrdMgmtService as service from '../../srv/prd-srv';

annotate service.Products with @(
   UI.CreateHidden                           : {$edmJson: {$Not: {$Path: '/Configuration/isOwner'}}},
   UI.UpdateHidden                           : {$edmJson: {$Not: {$Path: '/Configuration/isOwner'}}},
   UI.DeleteHidden                           : {$edmJson: {$Not: {$Path: '/Configuration/isOwner'}}},

);    


annotate service.Products with @(
    UI.SelectionFields : [
        ID,
        name,
        price,
    ],
    UI.LineItem :{
        $value: [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Value : discount,
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Criticality : statusColor,
            CriticalityRepresentation : #WithIcon,
        },
            {
                $Type : 'UI.DataFieldForAction',
                Action : 'PrdMgmtService.ApplyDiscount',
                Label : 'Apply Discount',
            },
            {
                $Type : 'UI.DataFieldForAction',
                Action : 'PrdMgmtService.AddStock',
                Label : 'Add Stock',
            },
    ],
    @UI.Criticality : statusColor,
    } ,
    UI.HeaderInfo : {
        TypeName : 'Product',
        TypeNamePlural : 'Products',
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : description,
        },
        TypeImageUrl : 'sap-icon://product',
        ImageUrl : image,
    },
    UI.DataPoint #ID : {
        $Type : 'UI.DataPointType',
        Value : ID,
        Title : 'Product ID',
    },
    UI.DataPoint #Price : {
        $Type : 'UI.DataPointType',
        Value : price,
        Title : 'Price',
    },
    UI.DataPoint #Status : {
        $Type : 'UI.DataPointType',
        Value : status,
        Title : 'Status',
        Criticality : statusColor,
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ID',
            Target : '@UI.DataPoint#ID',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Price',
            Target : '@UI.DataPoint#Price',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Stock',
            Target : '@UI.DataPoint#Status',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Product Information',
            ID : 'ProductInformation',
            Target : '@UI.FieldGroup#ProductInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Product Image',
            ID : 'ProductImage',
            Target : '@UI.FieldGroup#ProductImage',
        },
    ],
    UI.FieldGroup #ProductInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : description,
               
            },
            {
                $Type : 'UI.DataField',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Value : discount,
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
            },
        ],
    },
    UI.FieldGroup #ProductImage : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : image,
            },
        ],
    },
);

annotate service.Products with {
    ID @Common.Label : 'Product ID';
    name @Common.Label : 'Product name';
    description @Common.Label : 'Description';
    price @Common.Label : 'Price';
    discount @Common.Label : 'Discount';
    stock @Common.Label: 'Stock';
    status @Common.Label: 'Status';
    image @Common.Label: 'Product Image'
};


