module Model.PersonalDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, id, href)


type alias DetailWithName =
    { name : String
    , detail : String
    }


type alias PersonalDetails =
    { name : String
    , contacts : List DetailWithName
    , intro : String
    , socials : List DetailWithName
    }


view : PersonalDetails -> Html msg
view details =
    div [] 
        [ h1 [id "name"] [text details.name]
        , div [] (List.map viewDetailWithName details.contacts)
        , em [id "intro"] [text details.intro]
        , div [] (List.map viewSocialLink details.socials)
        ]


viewDetailWithName : DetailWithName -> Html msg
viewDetailWithName detailWithName =
    div [class "contact-detail"]
        [ h1 [] [text detailWithName.name]
        , p [] [text detailWithName.detail]
        ]


viewSocialLink : DetailWithName -> Html msg
viewSocialLink detailWithName =
    div [class "social-link"]
        [ a [href detailWithName.detail] [text detailWithName.name] ]