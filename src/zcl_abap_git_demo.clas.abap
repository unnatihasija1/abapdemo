CLASS zcl_abap_git_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ABAP_GIT_DEMO IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
out->write( 'Hello world!' ).
out->write( 'BTP ABAP Env').
ENDMETHOD.
ENDCLASS.
