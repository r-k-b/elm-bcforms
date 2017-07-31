module Main exposing (..)

import Date exposing (Date)
import Html exposing (text)


main =
    text "Hello, World!"


type alias FieldType =
    { typeID : Int
    , typeDesc : String
    , typeClass : String
    , renderIDTag : Bool
    }

type alias Selectable =
  { option : String
  , selected : Bool
  }

type FieldTypes
    = FieldTypeText (Maybe String)
    | FieldTypeNumber (Maybe Float)
    | FieldTypeBool (Maybe Bool)
    | FieldTypeDateTime (Maybe Date)
    | FieldTypeDropdown (List Selectable)
    | FieldTypeCheckbox (List Selectable)
    | FieldTypeRadio (List Selectable)
    | FieldTypeMedia (Maybe String)
    | FieldTypeMultiline (Maybe String)
    | FieldTypeListbox (List Selectable)
    | FieldTypeHyperlink (Maybe String)
    | FieldTypeDataSource (Maybe Int)


getFieldTypeProps : FieldTypes -> FieldType
getFieldTypeProps fType =
    case fType of
        FieldTypeText _ ->
            FieldType 1 "Text (String)" "text" False

        FieldTypeNumber _ ->
            FieldType 2 "Number" "number" False

        FieldTypeBool _ ->
            FieldType 3 "True/False (Boolean)" "boolean-checkbox" False

        FieldTypeDateTime _ ->
            FieldType 4 "DateTime" "datetime" False

        FieldTypeDropdown _ ->
            FieldType 5 "List (Dropdown List)" "select" False

        FieldTypeCheckbox _ ->
            FieldType 6 "List (Checkbox List)" "checkbox" False

        FieldTypeRadio _ ->
            FieldType 7 "List (Radio List)" "radio" False

        FieldTypeMedia _ ->
            FieldType 8 "Media" "media" False

        FieldTypeMultiline _ ->
            FieldType 9 "Text (Multiline)" "text" False

        FieldTypeListbox _ ->
            FieldType 10 "List (Listbox List)" "listbox" False

        FieldTypeHyperlink _ ->
            FieldType 11 "Text (Hyperlink)" "text" False

        FieldTypeDataSource _ ->
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
        , fieldType = FieldTypeText Nothing
        , mandatory = False
        , dataSourceID = Nothing
        , useWYSIWYG = False
        , unknownProperty = 0
        }
    , SystemFF
        { systemName = "EmailAddress"
        , longName = "Email"
        , fieldType = FieldTypeText Nothing
        , mandatory = True
        , useWYSIWYG = False
        , unknownProperty = 0
        }
    ]
