module Dso.MinimalImage exposing (..)

-- MODEL #############################################################


type alias MinimalImage a =
    { w : Int
    , h : Int
    , data : a
    }


type Vec3b
    = Vec3b



-- FUNCTIONS #########################################################


at : Int -> Int -> MinimalImage a -> a
at x y model =
    Debug.crash "TODO"


atIndex : Int -> MinimalImage a -> a
atIndex i model =
    Debug.crash "TODO"


setBlack : MinimalImage a -> MinimalImage a
setBlack model =
    Debug.crash "TODO"


setConst : a -> MinimalImage a -> MinimalImage a
setConst val model =
    Debug.crash "TODO"


{-| why floats instead of int for 1 and 4, and then int for 9 and circ?
-}
setPixel1 : Float -> Float -> a -> MinimalImage a -> MinimalImage a
setPixel1 u v val model =
    Debug.crash "TODO"


setPixel4 : Float -> Float -> a -> MinimalImage a -> MinimalImage a
setPixel4 u v val model =
    Debug.crash "TODO"


setPixel9 : Int -> Int -> a -> MinimalImage a -> MinimalImage a
setPixel9 u v val model =
    Debug.crash "TODO"


setPixelCirc : Int -> Int -> a -> MinimalImage a -> MinimalImage a
setPixelCirc u v val model =
    Debug.crash "TODO"
