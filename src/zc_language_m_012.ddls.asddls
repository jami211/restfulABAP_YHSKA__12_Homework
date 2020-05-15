@EndUserText.label: 'Language projection view - Processor'
@AccessControl.authorizationCheck: #CHECK
@UI: {
 headerInfo: { typeName: 'Programming Language', typeNamePlural: 'Programming Languages', title: { type: #STANDARD, value: 'Name' } } }
@Search.searchable: true

define root view entity ZC_LANGUAGE_M_012
  as projection on ZI_LANGUAGE_M_012
{
      @UI.facet: [ { id:              'Language',
                     purpose:         #STANDARD,
                     type:            #IDENTIFICATION_REFERENCE,
                     label:           'Programmiersprache',
                     position:        10 },
                   { id:'idHeader',
                     type:  #DATAPOINT_REFERENCE,
                     position: 10,
                     label: 'Header',
                     purpose: #HEADER,
                     targetQualifier: 'Rating'
                    } ]

      @UI.hidden: true
      key mykey         as LanguageUUID,

      @UI.hidden: true
      language_id       as LanguageID,


      @UI: {
          lineItem:       [ { position: 20, importance: #HIGH, label: 'Name'  } ],
          identification: [ { position: 20, label: 'Name'  } ] }
      @Search.defaultSearchElement: true
      name              as Name,

      @UI: {
          lineItem:       [ { position: 30, importance: #HIGH , label: 'Publishing year'} ],
          identification: [ { position: 30, label: 'Publishing year' } ] }
      publishing_year   as Publishing_Year,

      @UI: {
          lineItem:       [ { position: 40, importance: #HIGH, label: 'Developed by' } ],
          identification: [ { position: 40, label: 'Developed by' } ] }
      developed_by      as Developed_By,

      @UI: {
          lineItem:       [ { position: 50, importance: #HIGH, type: #WITH_URL, url: 'Documentation_URL', label: 'Documentation URL'  } ],
          identification: [ { position: 50, type: #WITH_URL, url: 'Documentation_URL', label: 'Documentation URL' } ] }
      documentation_url as Documentation_URL,

      @UI: {
          lineItem:       [ { position: 60, importance: #HIGH, label: 'How to "Hello World!"' } ],
          identification: [ { position: 60, label: 'How to "Hello World!"' } ] }
      hello_world       as Hello_World, 
      
      @UI: {
        lineItem:       [ { position: 70, importance: #HIGH, type: #AS_DATAPOINT, label: 'Rating' } ],
        identification: [ { position: 70, label: 'Rating [0-5]' } ], 
        dataPoint: { title: 'Programming Language Rating', visualization: #RATING, targetValue: 5 } }
      rating            as Rating,

      @UI: {
        lineItem:       [ { position: 80, importance: #HIGH, label: 'My Status' },
        { type: #FOR_ACTION,  dataAction: 'setStatus', label: 'Status "Learning"' },
        { type: #FOR_ACTION, dataAction: 'setStatusDone', label: 'Status "Learned"' },
        { type: #FOR_ACTION,  dataAction: 'deleteStatus', label: 'Reset Status' } ],
        identification: [ { position: 80, label: 'My Status' } ] }
      status            as Status,

      @UI.hidden: true
      last_changed_at   as LastChangedAt

}
