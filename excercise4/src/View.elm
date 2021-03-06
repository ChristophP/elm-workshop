-- VIEW


module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick)
import Data exposing (..)


view : Model -> Html Msg
view model =
    let
        mapper =
            viewListItem model.currentMerchant
    in
        div []
            [ h1 [ class "header" ] [ text "Click on a merchant" ]
            , ul [] (List.map mapper model.merchants)
            , viewCurrentMerchant model.currentMerchant
            ]


viewListItem : Merchant -> Merchant -> Html Msg
viewListItem currentMerchant merchant =
    let
        className =
            classList
                [ ( "listItem", True )
                , ( "currentItem", merchant == currentMerchant )
                ]
    in
        li [ className, onClick (SelectMerchant merchant) ]
            [ text merchant.name, viewFeedback merchant.feedback ]


viewFeedbackText : Feedback -> String
viewFeedbackText feedback =
    case feedback of
        Positive ->
            "Great"

        Negative ->
            "Sucks"

        OtherFeedback comment ->
            "(Other) " ++ comment



{- TODO
   Change the type signature to accept a Maybe Feedback intead of Feedback
   Then use pattern matching in a case statement to check if there is
   Just <feedback> or nothing. If is is Nothing set the `feedbackText`
   to "Not available"
-}


viewFeedback : Feedback -> Html Msg
viewFeedback feedback =
    let
        feedbackText =
            viewFeedbackText feedback
    in
        span [ class "feedback" ] [ text ("Feedback: " ++ feedbackText) ]


viewCurrentMerchant : Merchant -> Html Msg
viewCurrentMerchant merchant =
    div [ class "currentMerchant" ]
        [ text ("=> Current merchant: " ++ merchant.name)
        ]
