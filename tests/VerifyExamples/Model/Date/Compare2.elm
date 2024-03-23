module VerifyExamples.Model.Date.Compare2 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Test
import Expect

import Model.Date exposing (..)







spec2 : Test.Test
spec2 =
    Test.test "#compare: \n\n    Model.Date.compare (onlyYear 2020) (onlyYear 2021)\n    --> LT" <|
        \() ->
            Expect.equal
                (
                Model.Date.compare (onlyYear 2020) (onlyYear 2021)
                )
                (
                LT
                )