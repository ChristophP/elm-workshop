module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Data exposing (..)
import View


main =
    Html.program
        { init = init
        , view = View.view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    let
        {- TODO
           Change the existing feedbacks to Just <feedback> and
           add a couple of merchants that don't have a feedback
           (Nothing).
        -}
        first =
            Merchant "Hairdresser" (Just Positive)

        merchants =
            [ first
            , Merchant "Car Shop" Negative
            , Merchant "Beauty Salon" (OtherFeedback "Soso")
            ]

        model =
            Model merchants first
    in
        ( model, Cmd.none )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SelectMerchant merchant ->
            ( { model | currentMerchant = merchant }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
