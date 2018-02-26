module Main exposing (..)

import DatasetReader
import Dso.FullSystem
import Dso.GlobalCalib
import Dso.GlobalFuncs
import Dso.IOWrap.ImageDisplay
import Dso.IOWrap.Output3DWrapper
import Dso.MatrixAccumulators
import Dso.NumType
import Dso.PixelSelector2
import Dso.Settings
import External.Boost


-- UNKNOWN ###########################################################
-- MODEL #############################################################
-- FUNCTIONS #########################################################


mainDso : Int -> List String -> ()
mainDso argc argv =
    ()
