module Dso.Undistort
    exposing
        ( PhotometricUndistorter
        )

{-| whatever

@docs PhotometricUndistorter

-}

import Array exposing (Array)
import Dso.NumType exposing (Mat33, VecX)
import External.Eigen exposing (Vector2i)


-- UNKNOWN ###########################################################


type ImageAndExposure
    = ImageAndExposure


type MinimalImage
    = MinimalImage



-- MODEL #############################################################


{-| whatever
-}
type alias PhotometricUndistorter =
    { output : ImageAndExposure
    , g : Array Float
    , gDepth : Int
    , vignetteMap : Array Float
    , vignetteMapInv : Array Float
    , w : Int
    , h : Int
    , valid : Bool
    }


type alias Undistort =
    -- type_ is my personal touch, in cpp code there are subclasses
    { type_ : UndistortModel
    , photometricUndist : PhotometricUndistorter
    , w : Int
    , h : Int
    , wOrg : Int
    , hOrg : Int
    , wUp : Int
    , hUp : Int
    , upsampleUndistFactor : Int
    , k : Mat33
    , parsOrg : VecX
    , valid : Bool
    , passthrough : Bool
    , remapX : Array Float
    , remapY : Array Float
    }


type UndistortModel
    = Default
    | Pinhole
    | KB
    | Equidistant
    | RadTan
    | FOV



-- FUNCTIONS #########################################################


processFrame : a -> Float -> Float -> PhotometricUndistorter -> PhotometricUndistorter
processFrame image_in exposure_time factor model =
    Debug.crash "TODO"


unMapFloatImage : Array Float -> PhotometricUndistorter -> Array Float
unMapFloatImage image model =
    Debug.crash "TODO"


getG : PhotometricUndistorter -> Array Float
getG model =
    Debug.crash "TODO"



-- Undistort methods


distortCoordinates : Array Float -> Array Float -> Int -> Undistort -> ( Array Float, Array Float )
distortCoordinates in_x in_y n model =
    Debug.crash "TODO"


getK : Undistort -> Mat33
getK model =
    model.k


getSize : Undistort -> Vector2i
getSize model =
    Debug.crash "TODO"


getOriginalParameter : Undistort -> VecX
getOriginalParameter model =
    model.parsOrg


getOriginalSize : Undistort -> Vector2i
getOriginalSize model =
    Debug.crash "TODO"


isValid : Undistort -> Bool
isValid model =
    model.valid


undistort : MinimalImage a -> Float -> Float -> Float -> Undistort -> ImageAndExposure
undistort image_raw exposure timestamp factor model =
    Debug.crash "TODO"


getUndistorterForFile : String -> String -> String -> Undistort
getUndistorterForFile configFilename gammaFilename vignetteFilename =
    Debug.crash "TODO"


loadPhotometricCalibration : String -> String -> String -> Undistort -> Undistort
loadPhotometricCalibration file noiseImage vignetteImage model =
    Debug.crash "TODO"


applyBlurNoise : Array Float -> Undistort -> Array Float
applyBlurNoise img model =
    Debug.crash "TODO"


makeOptimalK_crop : Undistort -> Undistort
makeOptimalK_crop model =
    Debug.crash "TODO"


makeOptimalK_full : Undistort -> Undistort
makeOptimalK_full model =
    Debug.crash "TODO"


readFromFile : String -> Int -> String -> Undistort -> Undistort
readFromFile configFileName nPars prefix model =
    Debug.crash "TODO"
