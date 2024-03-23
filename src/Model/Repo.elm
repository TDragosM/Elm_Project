module Model.Repo exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class, href)
import Json.Decode as De exposing (Decoder, int, string, maybe, field, fail)


type alias Repo =
    { name : String
    , description : Maybe String
    , url : String
    , pushedAt : String
    , stars : Int
    }


view : Repo -> Html msg
view repo =
    div []
        [ div [] [ text repo.name ]
        , div [] [ text <| "Description: " ++ Maybe.withDefault "" repo.description ]
        , div [] [ text <| "URL: " ++ repo.url ]
        , div [] [ text <| "Pushed At: " ++ repo.pushedAt ]
        , div [] [ text <| "Stars: " ++ String.fromInt repo.stars ]
        ]


sortByStars : List Repo -> List Repo
sortByStars repos =
    List.sortBy (\repo -> repo.stars) repos


{-| Deserializes a JSON object to a `Repo`.
Field mapping (JSON -> Elm):

  - name -> name
  - description -> description
  - html_url -> url
  - pushed_at -> pushedAt
  - stargazers_count -> stars

-}
decodeRepo : De.Decoder Repo
decodeRepo =
    De.map5 Repo
        (De.field "name" De.string)
        (De.field "description" (De.maybe De.string))
        (De.field "html_url" De.string)
        (De.field "pushed_at" De.string)
        (De.field "stargazers_count" De.int)


repoListDecoder : Decoder (List Repo)
repoListDecoder =
    De.list decodeRepo