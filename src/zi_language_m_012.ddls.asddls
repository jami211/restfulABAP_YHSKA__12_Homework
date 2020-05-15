@AbapCatalog.sqlViewName: 'ZVI_LANG_M_012'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Data model for language'
define root view ZI_LANGUAGE_M_012
  as select from zlanguage_012 as Language
{
  key mykey,
      language_id,
      name,
      publishing_year,
      developed_by,
      documentation_url,
      hello_world,
      status,
      rating,
      /*-- Admin data --*/
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at

}
