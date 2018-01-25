module Dso.MinimalImage exposing (..)

import Dso.NumType exposing (Vec3f)


-- MODEL #############################################################


type Uint8
    = Uint8


type Uint16
    = Uint16


type Vec3b
    = Vec3b


type alias MinimalImage a =
    { w : Int
    , h : Int
    , data : a
    }


type alias MinimalImageF =
    MinimalImage Float


type alias MinimalImageF3 =
    MinimalImage Vec3f


type alias MinimalImageB =
    MinimalImage Uint8


type alias MinimalImageB3 =
    MinimalImage Vec3b


type alias MinimalImageB16 =
    MinimalImage Uint16



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
