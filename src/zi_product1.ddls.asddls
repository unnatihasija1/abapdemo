@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
@Search.searchable: true
@Analytics.dataCategory: #DIMENSION

define view entity ZI_PRODUCT1 as select from mara 
  association [0..*] to ZI_PRODUCTTEXT as _Text on $projection.Product = _Text.Product

{

      

      @Search.defaultSearchElement: true

      @Search.fuzzinessThreshold: 0.7

  key matnr            as Product,

      @Search.defaultSearchElement: true

      @Search.fuzzinessThreshold: 0.7

      mtart       as ProductType,

      created_at_time as CreationDateTime,
      _Text

}
