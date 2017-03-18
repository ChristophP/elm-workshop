-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/random.html


module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Random


{--
TODO import the Data module and expose everything
--}
{--
TODO We now use an Html.program instead of the beginner program. Read about it:
It allows you to handle side effects with commands and subscriptions.
https://guide.elm-lang.org/architecture/effects/
--}


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( Model 1, Cmd.none )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            {--
TODO Read about the random module here:
http://package.elm-lang.org/packages/elm-lang/core/latest/Random#generate
Then generate a commands that generates a random number between 1
and 6. It should fire the NewFace message afterwards. Replace the
Cmd.none in the following line.
--}
            ( model, Cmd.none )

        NewFace newFace ->
            ( Model newFace, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text (toString model.dieFace) ]
        , button [ onClick Roll ] [ text "Roll" ]
        ]
