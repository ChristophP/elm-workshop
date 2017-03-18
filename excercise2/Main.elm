module Main exposing (..)

{--TODO expose the ul and li functions of html --}

import Html exposing (beginnerProgram, div, button, text, Html, Attribute)


{--TODO expose the style function of the attributes --}

import Html.Attributes
import Html.Events exposing (onClick)


{--
TODO The Model is now a record type  with a count property(Int). Now add a
history property(List Int) which saves the previous states.
--}


type alias Model =
    { count : Int
    }


type Msg
    = Increment
    | Decrement



{--
TODO Add the history to the inital model (empty list)
--}


model =
    Model 0


main =
    beginnerProgram { model = model, view = view, update = update }



{--
TODO add an html list which displays the history of the previous states.
Add (inline) style to style the list grey and with small font to be different from the rest.
Also remove the bullet points from the list.
--}


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (toString model.count) ]
        , button [ onClick Increment ] [ text "+" ]
        , div []
            [{--TODO
            add history list here.
            Use List.map over the history to create the list items
            http://package.elm-lang.org/packages/elm-lang/core/5.1.1/List#map
            --}
            ]
        ]



{--
TODO put your style in this constant. use in the view function to attach it to the
list items
Check out the docs for the style function:
http://package.elm-lang.org/packages/elm-lang/html/2.0.0/Html-Attributes#style
--}


myStyle : Attribute Msg
myStyle =
    style []



{--
TODO Compete the update of the model by add the previous model state to the
history in each branch. You can use List.concat for that:
http://package.elm-lang.org/packages/elm-lang/core/5.1.1/List#concat
Also use List.take to restrict the history to 10 entries
--}


update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 }

        Decrement ->
            { model | count = model.count - 1 }
