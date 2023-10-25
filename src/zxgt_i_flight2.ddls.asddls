@AbapCatalog.sqlViewName: 'ZXGT_IFLIGHT2'
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Flight'
@VDM.viewType: #BASIC
define view ZXGT_I_FLIGHT2
as select from sflight
association [0..1] to ZXGT_I_Airline as _Airline on $projection.Airline = _Airline.Airline
association [0..1] to ZXGT_I_FlightConnection as _FlightConnection
on $projection.Airline = _FlightConnection.Airline
and $projection.FlightConnection = _FlightConnection.FlightConnection
association [0..1] to ZXGT_I_AircraftType as _AircraftType
on $projection.AircraftType = _AircraftType.AircraftType
{
@ObjectModel.foreignKey.association: '_Airline'
key carrid as Airline,
@ObjectModel.foreignKey.association: '_FlightConnection'
key connid as FlightConnection,
key fldate as FlightDate,
@Semantics.amount.currencyCode: 'Currency'
@DefaultAggregation: #MIN
 price as FlightPrice,
@Semantics.currencyCode
 currency as Currency,
@ObjectModel.foreignKey.association: '_AircraftType'
 planetype as AircraftType,
@DefaultAggregation: #SUM
 seatsmax as MaximumNumberOfSeats,
@DefaultAggregation: #SUM
 seatsocc as NumberOfOccupiedSeats,
@Semantics.amount.currencyCode: 'Currency'
@DefaultAggregation: #SUM
paymentsum as CurrentBookingsTotalAmount,
 _Airline,
 _FlightConnection,
 _AircraftType
}
