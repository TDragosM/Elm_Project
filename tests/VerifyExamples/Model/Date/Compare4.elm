module VerifyExamples.Model.Date.Compare4 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Test
import Expect

import Model.Date exposing (..)







spec4 : Test.Test
spec4 =
    Test.test "#compare: \n\n    Model.Date.compare (full 2021 Dec) (full 2021 Jan)\n    --> GT" <|
        \() ->
            Expect.equal
                (
                Model.Date.compare (full 2021 Dec) (full 2021 Jan)
                )
                (
                GT
                )