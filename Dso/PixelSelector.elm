module Dso.PixelSelector exposing (minUseGrad_pixsel)

{-| module ...

@docs minUseGrad_pixsel

-}

import Array exposing (Array)
import External.Eigen as Eigen


-- UNKNOWN ###########################################################
-- MODEL #############################################################


{-| whatever
-}
minUseGrad_pixsel : Float
minUseGrad_pixsel =
    10



-- FUNCTIONS #########################################################


gridMaxSelection : Eigen.Vector3f -> Int -> Int -> Float -> ( Array Bool, Int )
gridMaxSelection grads w h thFac =
    Debug.crash "TODO"


makePixelStatus : Eigen.Vector3f -> Int -> Int -> Float -> Int -> Float -> ( Array Bool, Int )
makePixelStatus grads w h desiredDensity recsLeft thFac =
    Debug.crash "TODO"
