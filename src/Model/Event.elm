module Model.Event exposing (..)

import Html exposing (Html, div, h2, p, span, text, a)
import Html.Attributes exposing (class, classList, href)
import Model.Event.Category exposing (EventCategory(..))
import Model.Interval as Interval exposing (Interval)
import Debug exposing (toString)
import Model.Date exposing (..)

type alias Event =
    { title : String
    , interval : Interval
    , description : Html Never
    , category : EventCategory
    , url : Maybe String
    , tags : List String
    , important : Bool
    }


categoryView : EventCategory -> Html Never
categoryView category =
    case category of
        Academic ->
            span [class "event-category academic"] [text "Academic"]

        Work ->
            span [class "event-category work"] [text "Work"]

        Project ->
            span [class "event-category project"] [text "Project"]

        Award ->
            span [class "event-category award"] [text "Award"]


sortByInterval : List Event -> List Event
sortByInterval events =
    events





view : Event -> Html Never
view event =
    div [classList [("event", True), ("event-important", event.important)]]
        [ h2 [class "event-title"] [text event.title]
        , p [] [text (Debug.toString event.interval)]
        , categoryView event.category
        , div [class "event-description"] [event.description]
        , case event.url of
            Just url ->
                p [class "event-url"] [a [href url] [text "Link"]]

            Nothing ->
                text ""
        , div [class "tags"]
            (List.map (\tag -> span [class "tag"] [text tag]) event.tags)
        ]
