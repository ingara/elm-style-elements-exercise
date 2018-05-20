module Main exposing (..)

import Html exposing (Html)
import Element exposing (..)
import Element.Attributes exposing (..)
import Style exposing (..)


main : Html msg
main =
    Element.viewport
        styleSheet
        mainElement


type Styles
    = None


styleSheet : StyleSheet Styles variation
styleSheet =
    Style.styleSheet
        [ Style.style None []
        ]


mainElement : Element style variation msg
mainElement =
    Element.text "Hello, world!"
