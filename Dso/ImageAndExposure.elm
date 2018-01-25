module Dso.ImageAndExposure exposing (..)

import Array exposing (Array)


type alias ImageAndExposure =
    -- irradiance, between 0 and 256
    { image : Array Float
    , w : Int
    , h : Int
    , timestamp : Float

    -- exposure time in ms
    , exposure_time : Float
    }
