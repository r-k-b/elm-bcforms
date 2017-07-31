module Main exposing (..)

import Html exposing (text)


main =
    text "Hello, World!"


type alias FieldType =
    { typeID : Int
    , typeDesc : String
    , typeClass : String
    , renderIDTag : Bool
    }


type FieldTypes
    = FieldTypeText
    | FieldTypeNumber
    | FieldTypeBool
    | FieldTypeDateTime
    | FieldTypeDropdown
    | FieldTypeCheckbox
    | FieldTypeRadio
    | FieldTypeMedia
    | FieldTypeMultiline
    | FieldTypeListbox
    | FieldTypeHyperlink
    | FieldTypeDataSource


foo : FieldTypes
foo =
    FieldTypeText


getFieldTypeProps : FieldTypes -> FieldType
getFieldTypeProps fType =
    case fType of
        FieldTypeText ->
            FieldType 1 "Text (String)" "text" False

        FieldTypeNumber ->
            FieldType 2 "Number" "number" False

        FieldTypeBool ->
            FieldType 3 "True/False (Boolean)" "boolean-checkbox" False

        FieldTypeDateTime ->
            FieldType 4 "DateTime" "datetime" False

        FieldTypeDropdown ->
            FieldType 5 "List (Dropdown List)" "select" False

        FieldTypeCheckbox ->
            FieldType 6 "List (Checkbox List)" "checkbox" False

        FieldTypeRadio ->
            FieldType 7 "List (Radio List)" "radio" False

        FieldTypeMedia ->
            FieldType 8 "Media" "media" False

        FieldTypeMultiline ->
            FieldType 9 "Text (Multiline)" "text" False

        FieldTypeListbox ->
            FieldType 10 "List (Listbox List)" "listbox" False

        FieldTypeHyperlink ->
            FieldType 11 "Text (Hyperlink)" "text" False

        FieldTypeDataSource ->
            FieldType 12 "Data Source" "select" True


type alias CustomFormField =
    {- All start with `CAT_Custom_`. -}
    { numericID : Int
    , longName : String
    , fieldType : FieldTypes
    , mandatory : Bool
    , dataSourceID : Maybe Int
    , useWYSIWYG : Bool
    , unknownProperty : Int
    }


type alias SystemFormField =
    {- Do not start with `CAT_Custom_`. -}
    { systemName : String
    , longName : String
    , fieldType : FieldTypes
    , mandatory : Bool
    , useWYSIWYG : Bool
    , unknownProperty : Int
    }


type FormFields
    = CustomFF CustomFormField
    | SystemFF SystemFormField


someFields : List FormFields
someFields =
    [ CustomFF
        { numericID = 12345
        , longName = "Wef Erg"
        , fieldType = FieldTypeText
        , mandatory = False
        , dataSourceID = Nothing
        , useWYSIWYG = False
        , unknownProperty = 0
        }
    , SystemFF
        { systemName = "EmailAddress"
        , longName = "Email"
        , fieldType = FieldTypeText
        , mandatory = True
        , useWYSIWYG = False
        , unknownProperty = 0
        }
    ]
