module Dso.GlobalCalib exposing (..)

import Array exposing (Array)
import Dso.NumType
import Dso.Settings
import External.Eigen exposing (Matrix3f)


type alias GlobalCalib =
    -- attributes have one value per pyramid level
    { wG : Array Int
    , hG : Array Int
    , fxG : Array Float
    , fyG : Array Float
    , cxG : Array Float
    , cyG : Array Float
    , fxiG : Array Float
    , fyiG : Array Float
    , cxiG : Array Float
    , cyiG : Array Float
    , kG : Array Matrix3f
    , kiG : Array Matrix3f
    , wM3G : Float
    , hM3G : Float
    }


setGlobalCalib : Int -> Int -> Matrix3f -> GlobalCalib
setGlobalCalib w h k =
    Debug.crash "TODO"
