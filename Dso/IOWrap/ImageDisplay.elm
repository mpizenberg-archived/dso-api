module Dso.IOWrap.ImageDisplay exposing (..)

import Array exposing (Array)
import Dso.MinimalImage exposing (MinimalImage)
import Dso.NumType


-- FUNCTIONS #########################################################


displayImage : String -> MinimalImage a -> Bool -> ()
displayImage windowName img autoSize =
    Debug.crash "TODO"


displayImageStitch : String -> Array (MinimalImage a) -> Int -> Int -> ()
displayImageStitch windowName images cc rc =
    Debug.crash "TODO"


waitKey : Int -> ()
waitKey milliseconds =
    Debug.crash "TODO"


closeAllWindows : ()
closeAllWindows =
    Debug.crash "TODO"
