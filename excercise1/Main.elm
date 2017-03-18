module Main exposing (..)

import Html exposing (Html, beginnerProgram, div, button, text)
import Html.Events exposing (onClick)


type alias Model =
    Int



{--
TODO add two messages, one that doubles the current value
and one that halves it
--}
{--
TODO Bonus: When you're done with the rest try to refactor the code so that you
only have an (Add Int) and a (Multiply Float) message. Using messages with
arguments allows you to reduce the number of messages you need to declare.
--}


type Msg
    = Increment
    | Decrement


main =
    beginnerProgram { model = 0, view = view, update = update }



{--
TODO add buttons that fire the messages that you added above.
--}


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (toString model) ]
        , button [ onClick Increment ] [ text "+" ]
        ]



{--
TODO add a type annotation to the update function.
Also implement the handling for the Double and halve method above
--}


update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1
