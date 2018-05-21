module Main exposing (..)

import Color
import Html exposing (Html)
import Element exposing (..)
import Element.Attributes exposing (..)
import Style exposing (..)
import Style.Background as Background
import Style.Border as Border
import Style.Color as Color
import Style.Font as Font
import Style.Shadow as Shadow
import Style.Transition as Transition


main : Html msg
main =
    Element.viewport
        styleSheet
        mainElement


type Variation
    = Normal
    | Cta
    | NavLink


type Styles
    = None
    | Main
    | Nav
    | Logo
    | Link
    | Body
    | Heading


styleSheet : StyleSheet Styles Variation
styleSheet =
    let
        transparent =
            Color.rgba 0 0 0 0
    in
        Style.styleSheet
            [ style None []
            , style Main
                [ Background.coverImage "bg.jpg"
                , Color.text Color.white
                ]
            , style Nav
                []
            , style Logo
                [ Font.typeface [ Font.cursive ]
                , Font.size 24
                , Font.light
                , Font.capitalize
                ]
            , style Link
                [ Transition.all
                , Border.rounded 1000
                , Border.solid
                , Border.all 1
                , Color.background transparent
                , hover
                    [ Color.background Color.white
                    , Color.text Color.darkCharcoal
                    , Color.border Color.white
                    ]
                , variation NavLink
                    [ Font.uppercase ]
                , variation Cta
                    [ Color.background <| Color.rgb 28 204 171
                    , Color.text Color.white
                    , Color.border <| Color.rgb 28 204 171
                    , hover
                        [ Shadow.glow Color.red 25
                        ]
                    ]
                ]
            , style Body
                [ Font.alignLeft
                ]
            , style Heading
                [ Font.size 48
                , Font.weight 600
                ]
            ]


mainElement : Element Styles Variation msg
mainElement =
    Element.column Main
        [ inlineStyle
            [ ( "width", "100vw" )
            , ( "height", "100vh" )
            ]
        , paddingLeft 300
        , paddingRight 150
        ]
        [ navBar
        , body
        ]


navBar : Element Styles Variation msg
navBar =
    let
        link_ txt =
            link "#" <|
                el Link [ paddingXY 16 8, vary NavLink True ] <|
                    text txt
    in
        row Nav
            [ width fill
            , paddingXY 0 15
            , verticalCenter
            ]
            [ row Logo [ width fill, alignLeft ] [ text "Extra Loaded Millenials" ]
            , navigation None
                [ spacing 15 ]
                { name = "Navigation"
                , options =
                    [ link_ "Sign up"
                    , link_ "Log in"
                    , link_ "Menu"
                    ]
                }
            ]


body : Element Styles Variation msg
body =
    row Body
        [ paddingTop 50
        , height fill
        ]
        [ column None
            [ paddingRight 50
            , spacing 40
            , width (percent 70)
            ]
            [ el Heading [] <|
                text "* Business * Solutions *"
            , textLayout None
                [ spacing 15 ]
                [ paragraph None [ alignLeft ] <|
                    [ text "Standards-compliant deliver folksonomies webservices visionary. Mission-critical e-markets; bricks-and-clicks incubate target leverage beta-test open-source, extensible tagclouds engage best-of-breed generate e-business, capture value-added communities mindshare."
                    ]
                , paragraph None [] <|
                    [ text "Facilitate next-generation e-markets for tomorrow. Today."
                    ]
                ]
            , row None
                [ spacing 15 ]
                [ link "#" <|
                    el Link [ paddingXY 16 8, vary Cta True ] (text "Create solution")
                , link "#" <|
                    el Link [ paddingXY 16 8 ] (text "Ignore problems")
                ]
            ]
        , el None
            [ alignBottom ]
            (image None
                []
                { src = "screenshot.png", caption = "image" }
            )
        ]
