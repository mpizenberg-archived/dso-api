module Dso.IOWrap.ImageRW exposing (..)

import Array exposing (Array)
import Dso.MinimalImage exposing (MinimalImage, MinimalImageB, MinimalImageB3, MinimalImageF, MinimalImageF3, Uint16)


-- FUNCTIONS #########################################################


readImageBW_8U : String -> MinimalImageB
readImageBW_8U filename =
    Debug.crash "TODO"


readImageRGB_8U : String -> MinimalImageB3
readImageRGB_8U filename =
    Debug.crash "TODO"


readImageBW_16U : String -> MinimalImage Uint16
readImageBW_16U filename =
    Debug.crash "TODO"


readStreamBW_8U : Array Char -> Int -> MinimalImageB
readStreamBW_8U data numBytes =
    Debug.crash "TODO"



-- write


writeImage : String -> MinimalImage a -> ()
writeImage filename img =
    Debug.crash "TODO"
