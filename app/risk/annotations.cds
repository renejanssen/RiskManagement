using RiskService as service from '../../srv/risk-service';
annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Title}',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Owner}',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Priocode}',
                Value : prio_code,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Descr}',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Impact}',
                Value : impact,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Criticality}',
                Value : criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Priocriticality}',
                Value : PrioCriticality,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Risk Overview',
            ID : 'RiskOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Risk Details',
                    ID : 'RiskDetails',
                    Target : '@UI.FieldGroup#RiskDetails',
                },
            ],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Mitigation Details',
            ID : 'MitigationDetails',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Mitigation Details',
                    ID : 'MitigationDetails1',
                    Target : '@UI.FieldGroup#MitigationDetails',
                },
            ],
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Title}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Owner}',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Priocode}',
            Value : prio_code,
            Criticality : PrioCriticality,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Descr}',
            Value : descr,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Impact}',
            Value : impact,
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : miti.descr,
            Label : '{i18n>Descr}',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : 'bp/@Communication.Contact#contact',
            Label : '{i18n>ContactName}',
        },
    ],
    UI.SelectionFields : [
        prio_code,
        title,
        owner,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : descr,
        },
        TypeImageUrl : 'sap-icon://alert',
    },
    UI.FieldGroup #RiskDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Value : prio_code,
                Criticality : PrioCriticality,
            },
            {
                $Type : 'UI.DataField',
                Value : impact,
                Label : 'impact',
                Criticality : criticality,
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : 'bp/@Communication.Contact#contact1',
                Label : '{i18n>ContactName}',
            },
        ],
    },
    UI.FieldGroup #MitigationDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti_ID,
                Label : '{i18n>Mitiid}',
            },
            {
                $Type : 'UI.DataField',
                Value : miti.owner,
                Label : '{i18n>Owner1}',
            },
            {
                $Type : 'UI.DataField',
                Value : miti.timeline,
                Label : '{i18n>Timeline}',
            },
        ],
    },
);

annotate service.Risks with {
    miti @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Mitigations',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : miti_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'descr',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'owner',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'timeline',
                },
            ],
        Label : 'Mitigation',
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : miti.descr,
        )
};

annotate service.Risks with {
    prio @(
        Common.Label : '{i18n>Priocode}',
        Common.Text : {
            $value : prio.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
    )
};

annotate service.Risks with {
    title @Common.Label : '{i18n>Title}'
};

annotate service.Risks with {
    owner @Common.Label : '{i18n>Owner}'
};

annotate service.Mitigations with {
    ID @Common.Text : descr
};

annotate service.Mitigations with {
    owner @Common.FieldControl : #ReadOnly
};

annotate service.Mitigations with {
    timeline @Common.FieldControl : #ReadOnly
};

annotate service.BusinessPartners with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    },
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    },
);

