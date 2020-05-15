CLASS lhc_Language DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    TYPES tt_language_update TYPE TABLE FOR UPDATE zi_language_m_012.

    METHODS CalculateLanguageKey FOR DETERMINATION Language~CalculateLanguageKey
      IMPORTING keys FOR Language.

    METHODS validateYear FOR VALIDATION Language~validateYear
      IMPORTING keys FOR Language.

    METHODS setStatus FOR MODIFY
      IMPORTING keys FOR ACTION Language~setStatus RESULT result.

    METHODS setStatusDone FOR MODIFY
      IMPORTING keys FOR ACTION Language~setStatusDone RESULT result.

    METHODS deleteStatus FOR MODIFY
      IMPORTING keys FOR ACTION Language~deleteStatus RESULT result.

    METHODS get_features FOR FEATURES
      IMPORTING keys REQUEST requested_features FOR Language RESULT result.

    METHODS validatemandatoryfields FOR VALIDATION Language~validateMandatoryFields
      IMPORTING keys FOR Language.


ENDCLASS.

CLASS lhc_Language IMPLEMENTATION.

  METHOD CalculateLanguageKey.
    SELECT FROM zlanguage_012
        FIELDS MAX( language_id ) INTO @DATA(lv_max_language_id).

    LOOP AT keys INTO DATA(ls_key).
      lv_max_language_id = lv_max_language_id + 1.
      MODIFY ENTITIES OF zi_language_m_012  IN LOCAL MODE
        ENTITY Language
          UPDATE SET FIELDS WITH VALUE #( ( mykey     = ls_key-mykey
                                            language_id = lv_max_language_id ) )
          REPORTED DATA(ls_reported).
      APPEND LINES OF ls_reported-language TO reported-language.
    ENDLOOP.
  ENDMETHOD.


  METHOD validateYear.
    READ ENTITY zi_language_m_012\\language FROM VALUE #(
         FOR <root_key> IN keys ( %key     = <root_key>
                                  %control = VALUE #( publishing_year = if_abap_behv=>mk-on
                                                  ) ) )
         RESULT DATA(lt_language_result).

    LOOP AT lt_language_result INTO DATA(ls_language_result).
      IF ls_language_result-publishing_year > cl_abap_context_info=>get_system_date( ).

        APPEND VALUE #( %key        = ls_language_result-%key
                        mykey   = ls_language_result-mykey ) TO failed.

        APPEND VALUE #( %key = ls_language_result-%key
                        %msg = new_message( id       = 'YHSKA_VALIDATEMSG'
                                            number   = '001'
                                            severity = if_abap_behv_message=>severity-error )
                        %element-publishing_year = if_abap_behv=>mk-on ) TO reported.

      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD setStatus.
    " Modify in local mode: BO-related updates that are not relevant for authorization checks
    MODIFY ENTITIES OF zi_language_m_012 IN LOCAL MODE
           ENTITY language
              UPDATE FROM VALUE #( FOR key IN keys ( mykey = key-mykey
                                                     status = 'Learning' " Accepted
                                                     %control-status = if_abap_behv=>mk-on ) )
           FAILED   failed
           REPORTED reported.

    " Read changed data for action result
    READ ENTITIES OF zi_language_m_012 IN LOCAL MODE
         ENTITY language
         FROM VALUE #( FOR key IN keys (  mykey = key-mykey
                                          %control = VALUE #(
                                            mykey           = if_abap_behv=>mk-on
                                            name            = if_abap_behv=>mk-on
                                            publishing_year = if_abap_behv=>mk-on
                                            developed_by    = if_abap_behv=>mk-on
                                            rating          = if_abap_behv=>mk-on
                                            status          = if_abap_behv=>mk-on
                                            documentation_url = if_abap_behv=>mk-on
                                            created_by      = if_abap_behv=>mk-on
                                            created_at      = if_abap_behv=>mk-on
                                            last_changed_by = if_abap_behv=>mk-on
                                            last_changed_at = if_abap_behv=>mk-on
                                          ) ) )
         RESULT DATA(lt_language).

    result = VALUE #( FOR language IN lt_language ( mykey = language-mykey
                                                %param    = language ) ).
  ENDMETHOD.

  METHOD get_features.
      "%control-<fieldname> specifies which fields are read from the entities

    READ ENTITY zi_language_m_012 FROM VALUE #( FOR keyval IN keys
                                                      (  %key                    = keyval-%key
                                                       "  %control-travel_id      = if_abap_behv=>mk-on
                                                         %control-status = if_abap_behv=>mk-on
                                                        ) )
                                RESULT DATA(lt_language).


    result = VALUE #( FOR ls_language IN lt_language
                       ( %key                           = ls_language-%key
                         %features-%action-setStatus = COND #( WHEN ls_language-status = 'Learning'
                                                                    THEN if_abap_behv=>fc-o-disabled
                                                               WHEN ls_language-status = 'Learned'
                                                                    THEN if_abap_behv=>fc-o-disabled
                                                                    ELSE if_abap_behv=>fc-o-enabled  )
                         %features-%action-setStatusDone = COND #( WHEN ls_language-status = 'Learned'
                                                                    THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled   )
                         %features-%action-deleteStatus = COND #( WHEN ls_language-status = 'Learning'
                                                                    THEN if_abap_behv=>fc-o-enabled
                                                               WHEN ls_language-status = 'Learned'
                                                                    THEN if_abap_behv=>fc-o-enabled
                                                                    ELSE if_abap_behv=>fc-o-disabled  )
                      ) ).
  ENDMETHOD.

  METHOD deleteStatus.
      " Modify in local mode: BO-related updates that are not relevant for authorization checks
    MODIFY ENTITIES OF zi_language_m_012 IN LOCAL MODE
           ENTITY language
              UPDATE FROM VALUE #( FOR key IN keys ( mykey = key-mykey
                                                     status = '' " Accepted
                                                     %control-status = if_abap_behv=>mk-on ) )
           FAILED   failed
           REPORTED reported.

    " Read changed data for action result
    READ ENTITIES OF zi_language_m_012 IN LOCAL MODE
         ENTITY language
         FROM VALUE #( FOR key IN keys (  mykey = key-mykey
                                          %control = VALUE #(
                                            mykey           = if_abap_behv=>mk-on
                                            name            = if_abap_behv=>mk-on
                                            publishing_year = if_abap_behv=>mk-on
                                            developed_by    = if_abap_behv=>mk-on
                                            rating          = if_abap_behv=>mk-on
                                            status          = if_abap_behv=>mk-on
                                            documentation_url = if_abap_behv=>mk-on
                                            created_by      = if_abap_behv=>mk-on
                                            created_at      = if_abap_behv=>mk-on
                                            last_changed_by = if_abap_behv=>mk-on
                                            last_changed_at = if_abap_behv=>mk-on
                                          ) ) )
         RESULT DATA(lt_language).

    result = VALUE #( FOR language IN lt_language ( mykey = language-mykey
                                                %param    = language ) ).

  ENDMETHOD.

  METHOD setStatusDone.
      " Modify in local mode: BO-related updates that are not relevant for authorization checks
    MODIFY ENTITIES OF zi_language_m_012 IN LOCAL MODE
           ENTITY language
              UPDATE FROM VALUE #( FOR key IN keys ( mykey = key-mykey
                                                     status = 'Learned' " Accepted
                                                     %control-status = if_abap_behv=>mk-on ) )
           FAILED   failed
           REPORTED reported.

    " Read changed data for action result
    READ ENTITIES OF zi_language_m_012 IN LOCAL MODE
         ENTITY language
         FROM VALUE #( FOR key IN keys (  mykey = key-mykey
                                          %control = VALUE #(
                                            mykey           = if_abap_behv=>mk-on
                                            name            = if_abap_behv=>mk-on
                                            publishing_year = if_abap_behv=>mk-on
                                            developed_by    = if_abap_behv=>mk-on
                                            rating          = if_abap_behv=>mk-on
                                            status          = if_abap_behv=>mk-on
                                            documentation_url = if_abap_behv=>mk-on
                                            created_by      = if_abap_behv=>mk-on
                                            created_at      = if_abap_behv=>mk-on
                                            last_changed_by = if_abap_behv=>mk-on
                                            last_changed_at = if_abap_behv=>mk-on
                                          ) ) )
         RESULT DATA(lt_language).

    result = VALUE #( FOR language IN lt_language ( mykey = language-mykey
                                                %param    = language ) ).

  ENDMETHOD.

  METHOD validatemandatoryfields.

    READ ENTITY zi_language_m_012\\language FROM VALUE #(
        FOR <root_key> IN keys ( %key = <root_key>
                                %control = VALUE #( name = if_abap_behv=>mk-on ) ) )
        RESULT DATA(lt_language).

   "Check if mandatory fields are empty, if so, write error message
    LOOP AT lt_language INTO DATA(ls_language).
      IF ls_language-publishing_year IS INITIAL.
        APPEND VALUE #(  %key = ls_language-%key
                            mykey = ls_language-mykey ) TO failed.
        APPEND VALUE #( %key = ls_language-%key
                  %msg  = new_message(
                    id   = 'YHSKA_VALIDATEMSG'
                    number = '002'
                    severity = if_abap_behv_message=>severity-error )
                  %element-mykey = if_abap_behv=>mk-on ) TO reported.
      ENDIF.
       IF ls_language-developed_by IS INITIAL.
        APPEND VALUE #(  %key = ls_language-%key
                            mykey = ls_language-mykey ) TO failed.
        APPEND VALUE #( %key = ls_language-%key
                  %msg  = new_message(
                    id   = 'YHSKA_VALIDATEMSG'
                    number = '003'
                    severity = if_abap_behv_message=>severity-error )
                  %element-mykey = if_abap_behv=>mk-on ) TO reported.
      ENDIF.
       IF ls_language-rating IS INITIAL.
        APPEND VALUE #(  %key = ls_language-%key
                            mykey = ls_language-mykey ) TO failed.
        APPEND VALUE #( %key = ls_language-%key
                  %msg  = new_message(
                    id   = 'YHSKA_VALIDATEMSG'
                    number = '004'
                    severity = if_abap_behv_message=>severity-error )
                  %element-mykey = if_abap_behv=>mk-on ) TO reported.
      ENDIF.
       IF ls_language-name IS INITIAL.
        APPEND VALUE #(  %key = ls_language-%key
                            mykey = ls_language-mykey ) TO failed.
        APPEND VALUE #( %key = ls_language-%key
                  %msg  = new_message(
                    id   = 'YHSKA_VALIDATEMSG'
                    number = '005'
                    severity = if_abap_behv_message=>severity-error )
                  %element-mykey = if_abap_behv=>mk-on ) TO reported.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
